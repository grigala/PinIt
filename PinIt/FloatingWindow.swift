
// From: https://gist.github.com/elislade/303447b6327536779e618ee7c60cbd41
struct FloatingWindow<ButtonWindow:View, ContentView:View>: View {
    @Binding var isOpen:Bool

    @State var offset: CGSize = .zero
    @State var tempOffset: CGSize = .zero

    var title: String?
    let button: ButtonView
    let content: ContentView

    let animation: Animation = Animation.spring().speed(1.5)

    func toggle() {
        withAnimation(self.animation) {
            self.isOpen.toggle()
        }
    }

    var body: some View {
        VStack(spacing: 0) {

        }
    }
    
    // Allows short hand for adding two CGSizes together

    func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}