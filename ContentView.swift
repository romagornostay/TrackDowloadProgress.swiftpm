import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    @State var isHidden = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Image(uiImage: viewModel.image)
                .resizable()
                .scaledToFit()
        }
        .onLongPressGesture { isHidden.toggle() }
        .overlay(progressStatus.hidden(isHidden))
        .ignoresSafeArea()
    }
    
    private var progressStatus: some View  {
        VStack {
            
            ProgressBar(barTotal: viewModel.bytesExpectedToWrite,barValue: viewModel.totalBytesWritten)
                .padding(.horizontal)
            
            Button {
                viewModel.downloadPicture()
            } label: {
                Image(systemName: "dock.arrow.down.rectangle")
                Text("Dowload")
            }
            .buttonStyle(.borderedProminent).opacity(0.8)
        }
    }
    
}
