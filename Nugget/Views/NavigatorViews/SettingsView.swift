import SwiftUI

struct SettingsView: View {
    @State private var Nugget = true
    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $Nugget) {
                    Text("Nugget")
                }
                }
            }
            .navigationTitle("Settings")
        }
    }
}