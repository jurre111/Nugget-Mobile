import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Nugget", destination: ToolsView())
                NavigationLink("dirtyZero", destination: Toolsview())
            }
        }
    }
}