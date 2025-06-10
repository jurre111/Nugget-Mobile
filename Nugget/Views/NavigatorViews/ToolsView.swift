//
//  ToolsView.swift
//  Nugget
//
//  Created by lemin on 9/9/24.
//

import SwiftUI

struct ToolsView: View {
    private let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
    
    @State var showRevertPage = false
    @State var showPairingFileImporter = false
    @State var showErrorAlert = false
    @State var lastError: String?
    @State var path = NavigationPath()
    
    // Prefs
    @AppStorage("AutoReboot") var autoReboot: Bool = true
    @AppStorage("PairingFile") var pairingFile: String?
    @AppStorage("SkipSetup") var skipSetup: Bool = true
    
    @StateObject var applyHandler = ApplyHandler.shared
    
    struct GeneralOption: Identifiable {
        var id = UUID()
        var page: TweakPage
        var view: AnyView
        var title: String
        var imageName: String
        var minVersion: Version = Version(string: "1.0")
    }
    
    struct ToolCategory: Identifiable {
        var id = UUID()
        var title: String
        var pages: [GeneralOption]
    }
    
    @State var tools: [ToolCategory] = [
        .init(title: "Sparserestore Tweaks", pages: [
            .init(page: .MobileGestalt, view: AnyView(GestaltView()), title: NSLocalizedString("Mobile Gestalt", comment: "Title of tool"), imageName: "platter.filled.top.and.arrow.up.iphone"),
            .init(page: .FeatureFlags, view: AnyView(FeatureFlagsView()), title: NSLocalizedString("Feature Flags", comment: "Title of tool"), imageName: "flag", minVersion: Version(string: "18.0")),
            .init(page: .Eligibility, view: AnyView(EligibilityView()), title: NSLocalizedString("Eligibility", comment: "Title of tool"), imageName: "mappin", minVersion: Version(string: "18.1")/*Version(string: "17.4")*/),
            .init(page: .SpringBoard, view: AnyView(SpringboardTweaksView()), title: NSLocalizedString("SpringBoard", comment: "Title of tool"), imageName: "app.badge"),
            .init(page: .Internal, view: AnyView(InternalOptionsView()), title: NSLocalizedString("Internal Options", comment: "Title of tool"), imageName: "internaldrive")
        ]),
        .init(title: "Domain Restore Tweaks (requires Skip Setup)", pages: [
            .init(page: .StatusBar, view: AnyView(StatusBarView()), title: NSLocalizedString("Status Bar", comment: "Title of tool"), imageName: "wifi")
        ])
        
    ]
    
    let userVersion = Version(string: UIDevice.current.systemVersion)
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack {
                        // apply all tweaks button
                        HStack {
                            Button("Apply Tweaks") {
                                applyChanges(reverting: false)
                            }
                            .buttonStyle(TintedButton(color: .blue, fullwidth: true))
                            Button {
                                UIApplication.shared.alert(title: NSLocalizedString("Info", comment: "info header"), body: NSLocalizedString("Applies all selected tweaks.", comment: "apply tweaks info"))
                            } label: {
                                Image(systemName: "info")
                            }
                            .buttonStyle(TintedButton(material: .systemMaterial, fullwidth: false))
                        }
                        // remove all tweaks button
                        HStack {
                            Button("Remove All Tweaks") {
                                showRevertPage.toggle()
                            }
                            .buttonStyle(TintedButton(color: .red, fullwidth: true))
                            .sheet(isPresented: $showRevertPage, content: {
                                RevertTweaksPopoverView(revertFunction: applyChanges(reverting:))
                            })
                            Button {
                                UIApplication.shared.alert(title: NSLocalizedString("Info", comment: "info header"), body: NSLocalizedString("Removes and reverts all tweaks, including mobilegestalt.", comment: "remove tweaks info"))
                            } label: {
                                Image(systemName: "info")
                            }
                            .buttonStyle(TintedButton(material: .systemMaterial, fullwidth: false))
                        }
                        // select pairing file button
                        if !ApplyHandler.shared.trollstore {
                                if pairingFile == nil {
                                HStack {
                                    Button("Select Pairing File") {
                                        showPairingFileImporter.toggle()
                                    }
                                    .buttonStyle(TintedButton(color: .green, fullwidth: true))
                                    Button {
                                        UIApplication.shared.helpAlert(title: NSLocalizedString("Info", comment: "info header"), body: NSLocalizedString("Select a pairing file in order to restore the device. One can be gotten from apps like AltStore or SideStore. Tap \"Help\" for more info.", comment: "pairing file selector info"), link: "https://docs.sidestore.io/docs/getting-started/pairing-file")
                                    } label: {
                                        Image(systemName: "info")
                                    }
                                    .buttonStyle(TintedButton(material: .systemMaterial, fullwidth: false))
                                }
                            } else {
                                Button("Reset pairing file") {
                                    pairingFile = nil
                                }
                                .buttonStyle(TintedButton(color: .green, fullwidth: true))
                            }
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    // auto reboot option
                    HStack {
                        Toggle(isOn: $autoReboot) {
                            Text("Auto reboot after apply")
                                .minimumScaleFactor(0.5)
                        }
                    }
                    // skip setup
                    Toggle(isOn: $skipSetup) {
                        HStack {
                            Text("Traditional Skip Setup")
                                .minimumScaleFactor(0.5)
                            Spacer()
                            Button {
                                UIApplication.shared.alert(title: NSLocalizedString("Info", comment: "info header"), body: NSLocalizedString("Applies Cowabunga Lite's Skip Setup method to skip the setup for non-exploit files.\n\nThis may cause issues for some people, so turn it off if you use configuration profiles.\n\nThis will not be applied if you are only applying exploit files, as it will use the SparseRestore method to skip setup.", comment: "skip setup info"))
                            } label: {
                                Image(systemName: "info.circle")
                            }
                            .padding(.horizontal)
                        }
                    }
                } header: {
                    Label("Tweak Options", systemImage: "hammer")
                }
                ForEach($tools) { category in
                    Section {
                        ForEach(category.pages) { option in
                            if option.minVersion.wrappedValue <= userVersion {
                                NavigationLink(destination: option.view.wrappedValue) {
                                    HStack {
                                        Image(systemName: option.imageName.wrappedValue)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.blue)
                                        Text(option.title.wrappedValue)
                                            .padding(.horizontal, 8)
                                        if applyHandler.isTweakEnabled(option.page.wrappedValue) {
                                            // show that it is enabled
                                            Spacer()
                                            Image(systemName: "checkmark.seal")
                                                .foregroundStyle(Color(.green))
                                        }
                                    }
                                }
                            }
                        }
                    } header: {
                        Text(category.title.wrappedValue)
                    }
                }
            }
            .navigationTitle("Tools")
        }
    }
}
