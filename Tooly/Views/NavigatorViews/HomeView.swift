//
//  HomeView.swift
//  Nugget
//
//  Created by lemin on 9/9/24.
//

import SwiftUI

struct AppOption: Identifiable {
    let id = UUID()
    let title: String
    let view: AnyView
    let imageName: String
}

struct HomeView: View {
    @State var apps: [AppOption] = [
        .init(title: "Nugget", view: AnyView(ToolsView()), imageName: "hammer.fill"),
        .init(title: "DirtyZero", view: AnyView(DirtyZeroView()), imageName: "eraser.fill"),
    ]
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(apps) { option in
                        NavigationLink(destination: option.view) {
                            HStack {
                                Image(systemName: option.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.blue)
                                Text(option.title)
                                    .padding(.horizontal, 8)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Apps")
        }
    }
}