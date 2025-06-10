import SwiftUI

struct SettingsView: View {
    @State private var Nugegt = true
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $Nugget) {
                    Text("Nugget")
                }
            }
            .navigationTitle("Settings")
        }
    }
}