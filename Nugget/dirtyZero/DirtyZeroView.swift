//
//  ContentView.swift
//  dirtyZero
//
//  Created by Skadz on 5/8/25.
//

import SwiftUI
import MobileCoreServices
import UIKit

struct ZeroTweak: Identifiable, Codable {
    var id: String { name }
    var icon: String
    var name: String
    var paths: [String]
    
    enum CodingKeys: String, CodingKey {
        case icon, name, paths
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

var springBoard: [ZeroTweak] = [
    ZeroTweak(icon: "dock.rectangle", name: "Hide Dock", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/dockDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/dockLight.materialrecipe"]),
    ZeroTweak(icon: "folder", name: "Hide Folder Backgrounds", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderDark.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderLight.materialrecipe"]),
    ZeroTweak(icon: "folder", name: "Hide Folder Blur", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderExpandedBackgroundHome.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/folderExpandedBackgroundHomeSimplified.materialrecipe"]),
    ZeroTweak(icon: "list.bullet.rectangle", name: "Hide Alert & Touch Backgrounds", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platformContentLight.materialrecipe"]),
    ZeroTweak(icon: "magnifyingglass", name: "Hide Spotlight Background", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundDarkZoomed.descendantrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/knowledgeBackgroundZoomed.descendantrecipe"]),
    ZeroTweak(icon: "square.text.square", name: "Hide Widget Config BG", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationBackground.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoardHome.framework/stackConfigurationForeground.materialrecipe"]),
    ZeroTweak(icon: "square.dashed", name: "Hide App Library BG", paths: ["/System/Library/PrivateFrameworks/SpringBoardHome.framework/coplanarLeadingTrailingBackgroundBlur.materialrecipe"]),
    ZeroTweak(icon: "square.dashed", name: "Hide App Switcher Blur", paths: ["/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-application.materialrecipe", "/System/Library/PrivateFrameworks/SpringBoard.framework/homeScreenBackdrop-switcher.materialrecipe"]),
    ZeroTweak(icon: "arrow.counterclockwise.circle", name: "Temporarily Disable respring logo", paths: ["/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/Info.plist", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear15@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear12@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear2@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear19@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear9@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear20@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear13@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear17@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear6@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear11@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear7@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear18@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear23@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear4@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear3@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear1@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear14@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear5@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear21@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear8@2x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear0@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear22@3x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear10@1x.png", "/System/Library/PrivateFrameworks/BackBoardServices.framework/gear16@1x.png"])
]

var lockScreen: [ZeroTweak] = [
    ZeroTweak(icon: "ellipsis.rectangle", name: "Hide Passcode Background", paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/dashBoardPasscodeBackground.materialrecipe"]),
    ZeroTweak(icon: "lock", name: "Hide Lock Icon", paths: ["/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@2x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-812h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-896h.ca/main.caml", "/System/Library/PrivateFrameworks/SpringBoardUIServices.framework/lock@3x-d73.ca/main.caml"]),
    ZeroTweak(icon: "bolt", name: "Hide Large Battery Icon", paths: ["/System/Library/PrivateFrameworks/CoverSheet.framework/Assets.car"])
]

var systemWideCustomization: [ZeroTweak] = [
    ZeroTweak(icon: "bell", name: "Hide Notification & Widget BGs", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeLight.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platterStrokeDark.visualstyleset", "/System/Library/PrivateFrameworks/CoreMaterial.framework/plattersDark.materialrecipe", "/System/Library/PrivateFrameworks/CoreMaterial.framework/platters.materialrecipe"]),
    ZeroTweak(icon: "line.3.horizontal", name: "Hide Home Bar", paths: ["/System/Library/PrivateFrameworks/MaterialKit.framework/Assets.car"]),
    ZeroTweak(icon: "character.cursor.ibeam", name: "Helvetica Font", paths: ["/System/Library/Fonts/Core/SFUI.ttf"]),
    ZeroTweak(icon: "circle.slash", name: "Remove Emojis", paths: ["/System/Library/Fonts/CoreAddition/AppleColorEmoji-160px.ttc"])
]

var soundEffects: [ZeroTweak] = [
    ZeroTweak(icon: "dot.radiowaves.left.and.right", name: "Disable AirDrop Ping", paths: ["/System/Library/Audio/UISounds/Modern/airdrop_invite.cat"]),
    ZeroTweak(icon: "bolt", name: "Disable Charge Sound", paths: ["/System/Library/Audio/UISounds/connect_power.caf"]),
    ZeroTweak(icon: "battery.25", name: "Disable Low Battery Sound", paths: ["/System/Library/Audio/UISounds/low_power.caf"]),
    ZeroTweak(icon: "creditcard", name: "Disable Payment Sounds", paths: ["/System/Library/Audio/UISounds/payment_success.caf", "/System/Library/Audio/UISounds/payment_failure.caf"])
]

var controlCenter: [ZeroTweak] = [
    ZeroTweak(icon: "square", name: "Disable CC Background", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesBackground.materialrecipe"]),
    ZeroTweak(icon: "circle.grid.2x2", name: "Disable CC Module Background", paths: ["/System/Library/PrivateFrameworks/CoreMaterial.framework/modulesSheer.descendantrecipe"]),
    ZeroTweak(icon: "sun.max", name: "Disable Brightness Icon", paths: ["/System/Library/ControlCenter/Bundles/DisplayModule.bundle/Brightness.ca/main.caml"]),
    ZeroTweak(icon: "moon", name: "Disable DND Icon", paths: ["/System/Library/PrivateFrameworks/FocusUI.framework/dnd_cg_02.ca/main.caml"])
]

struct DirtyZeroView: View {
    let device = Device.current
    @AppStorage("enabledTweaks") private var enabledTweakIds: [String] = []
    
    @State private var hasShownWelcome = false
    @State private var customZeroPath: String = ""
    @State private var addedCustomPaths: [String] = []
    
    private var tweaks: [ZeroTweak] {
        springBoard + lockScreen + systemWideCustomization + soundEffects + controlCenter
    }
    
    private var enabledTweaks: [ZeroTweak] {
        tweaks.filter { tweak in enabledTweakIds.contains(tweak.id) }
    }
    
    private func isTweakEnabled(_ tweak: ZeroTweak) -> Bool {
        enabledTweakIds.contains(tweak.id)
    }
    
    private func toggleTweak(_ tweak: ZeroTweak) {
        if isTweakEnabled(tweak) {
            enabledTweakIds.removeAll { $0 == tweak.id }
        } else {
            enabledTweakIds.append(tweak.id)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                VStack {
                    List {
                        Section(header: HStack {
                            Image(systemName: "terminal")
                            Text("Logs")
                        }, footer: VStack(alignment: .leading) {
                            Text("All tweaks are done in memory, so if something goes wrong, you can force reboot to revert changes.")
                            Text("[Join the jailbreak.party Discord!](https://discord.gg/XPj66zZ4gT)")
                                .foregroundStyle(Color.accentColor)
                            Text("[Install the newest version of dirtyZero!](itms-services://?action=download-manifest&url=https://github.com/jurre111/dirtyZero/raw/refs/heads/main/downloads/manifest.plist)")
                        }) {
                            LoggerView()
                                .frame(width: 340, height: 260)
                                .onAppear(perform: {
                                    if !hasShownWelcome {
                                        print("[*] Welcome to dirtyZero!\n[*] Running on \(device.systemName!) \(device.systemVersion!), \(device.description)")
                                        hasShownWelcome = true
                                    }
                                })
                                .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "house")
                            Text("SpringBoard")
                        }) {
                            VStack {
                                ForEach(springBoard) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: Color.accentColor, fullwidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "lock")
                            Text("Lock Screen")
                        }) {
                            VStack {
                                ForEach(lockScreen) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: Color.accentColor, fullwidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "gear")
                            Text("Systemwide Customization")
                        }) {
                            VStack {
                                ForEach(systemWideCustomization) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: Color.accentColor, fullwidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "speaker.wave.2")
                            Text("Sound Effects")
                        }) {
                            VStack {
                                ForEach(soundEffects) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: Color.accentColor, fullwidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "square.grid.2x2")
                            Text("Control Center")
                        }) {
                            VStack {
                                ForEach(controlCenter) { tweak in
                                    Button(action: {
                                        Haptic.shared.play(.soft)
                                        toggleTweak(tweak)
                                    }) {
                                        HStack {
                                            Image(systemName: tweak.icon)
                                                .frame(width: 24, alignment: .center)
                                            Text(tweak.name)
                                                .lineLimit(1)
                                                .scaledToFit()
                                            Spacer()
                                            if isTweakEnabled(tweak) {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            } else {
                                                Image(systemName: "circle")
                                                    .foregroundStyle(Color.accentColor)
                                                    .imageScale(.medium)
                                            }
                                        }
                                    }
                                    .buttonStyle(TintedButton(color: Color.accentColor, fullwidth: false))
                                }
                            }
                            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        }
                        
                        
                         Section(header: HStack {
                         Image(systemName: "gear")
                         Text("Custom Tweaks")
                         }) {
                         VStack {
                         TextField("File Path", text: $customZeroPath)
                         .padding(.bottom, 10)
                         Button(action: {
                         dirtyZeroHide(path: customZeroPath)
                         }) {
                         HStack {
                         Image(systemName: "plus.circle")
                         Text("Apply Custom Tweak")
                         }
                         }
                         .padding(.vertical, 15)
                         .frame(maxWidth: .infinity)
                         .background(customZeroPath.isEmpty ? Color.accentColor.opacity(0.06) : Color.accentColor.opacity(0.2))
                         .background(.ultraThinMaterial)
                         .cornerRadius(14)
                         .foregroundStyle(customZeroPath.isEmpty ? Color.accentColor.opacity(0.7) : Color.accentColor)
                         .disabled(customZeroPath.isEmpty)
                         }
                         .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                         }
                         
                    }
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .safeAreaInset(edge: .bottom) {
                        VStack {
                            HStack {
                                Button(action: {
                                    var applyingString = "[*] Applying the selected tweaks: "
                                    let tweakNames = enabledTweaks.map { $0.name }.joined(separator: ", ")
                                    applyingString += tweakNames
                                    
                                    print(applyingString)
                                    
                                    for tweak in enabledTweaks {
                                        for path in tweak.paths {
                                            dirtyZeroHide(path: path)
                                        }
                                    }
                                    
                                    print("[*] All tweaks applied successfully!")
                                    Alertinator.shared.alert(title: "Tweaks Applied", body: "Now, respring using your preferred method. If you have RespringApp installed, click the blue Respring button.")
                                }) {
                                    HStack {
                                        Image(systemName: "checkmark.circle")
                                        Text("Apply")
                                    }
                                }
                                .padding(.vertical, 13)
                                .frame(maxWidth: .infinity)
                                .background(enabledTweaks.isEmpty ? Color.accentColor.opacity(0.06) : Color.accentColor.opacity(0.2))
                                .background(.ultraThinMaterial)
                                .cornerRadius(14)
                                .foregroundStyle(enabledTweaks.isEmpty ? Color.accentColor.opacity(0.7) : Color.accentColor)
                                .disabled(enabledTweaks.isEmpty)
                                
                                Button(action: {
                                    Alertinator.shared.alert(title: "Device Will Reboot", body: "To revert all tweaks, your device will now reboot. Tap OK to continue.", action: {
                                        dirtyZeroHide(path: "/usr/lib/dyld")
                                    })
                                }) {
                                    HStack {
                                        Image(systemName: "arrow.counterclockwise.circle")
                                        Text("Revert")
                                    }
                                }
                                .padding(.vertical, 13)
                                .frame(maxWidth: .infinity)
                                .background(.red.opacity(0.2))
                                .background(.ultraThinMaterial)
                                .cornerRadius(14)
                                .foregroundStyle(.red)
                            }
                            .padding(.horizontal, 25)
                            .contextMenu {
                                Button {
                                    Alertinator.shared.prompt(title: "Custom Path", placeholder: "Path") { path in
                                        if let _ = path, !path!.isEmpty {
                                            dirtyZeroHide(path: path!)
                                        } else {
                                            Alertinator.shared.alert(title: "Invalid Path", body: "Enter a vaild path.")
                                        }
                                    }
                                } label: {
                                    Label("Custom Path", systemImage: "apple.terminal")
                                }
                                
                                Button {
                                    dirtyZeroHide(path: "/usr/lib/dyld")
                                } label: {
                                    Label("Panic", systemImage: "ant")
                                }
                            }
                            Button(action: {
                                let respringBundleID = "com.respring.app"
                                if isDatAppInstalled(respringBundleID) {
                                    LSApplicationWorkspace.default().openApplication(withBundleID: respringBundleID)
                                } else {
                                    Alertinator.shared.alert(title: "RespringApp Not Detected", body: "Make sure you have RespringApp installed, then try again.")
                                }
                            }) {
                                HStack {
                                    Image(systemName: "arrow.counterclockwise.circle")
                                    Text("Respring")
                                }
                            }
                            .padding(.vertical, 13)
                            .frame(maxWidth: .infinity)
                            .background(.blue.opacity(0.2))
                            .background(.ultraThinMaterial)
                            .cornerRadius(14)
                            .foregroundStyle(.blue)
                            .padding(.horizontal, 25)
                        }
                        .padding(.top, 70)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.clear,
                                    Color(.systemBackground).opacity(1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    }
                }
                .navigationTitle("dirtyZero")
            }
        }
    }
    
    func dirtyZeroHide(path: String) {
        do {
            try zeroPoC(path: path)
        } catch {
            Alertinator.shared.alert(title: "Exploit Failed", body: "There was an error while running the exploit: \(error).")
        }
    }
    
    func isDatAppInstalled(_ bundleID: String) -> Bool {
        typealias SBSLaunchFunction = @convention(c) (
            String,
            URL?,
            [String: Any]?,
            [String: Any]?,
            Bool
        ) -> Int32
        
        guard let sbsLib = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_NOW) else {
            print("[!] dlopen fail !!")
            return false
        }
        
        defer {
            dlclose(sbsLib)
        }
        
        guard let sbsAddr = dlsym(sbsLib, "SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions") else {
            print("[!] dlsym fail !!")
            return false
        }
        
        print("[*] here comes the super secret trollstore detector \"sandbox escape\" app store edition")
        let sbsFunction = unsafeBitCast(sbsAddr, to: SBSLaunchFunction.self)
        
        let result = sbsFunction(bundleID, nil, nil, nil, true)
        
        return result == 9
    }
}