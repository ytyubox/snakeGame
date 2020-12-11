//
// Created by 游宗諭 in 2020/12/11
//
//
// Using Swift 5.0
//
// Running on macOS 10.15


import SwiftUI

struct ContentView: View {
    @State var command: String = ""

    var gameOver = false
    let ct = 16
    var body: some View {
        ZStack {
            Color.black
            CustomTextField("123", text: $command, isFirstResponder: true)
                .offset(x: 0, y: -1000)
            List {
                Snakeboard(rows: ct, columns: ct, spacing: 3)
                    .fill(Color.red)
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
            }
        }
        
        if self.gameOver {
            Text("Game Over")
        }
    }
}
struct Snakeboard: Shape {
    internal init(rows: Int, columns: Int, spacing: Int = 0) {
        self.rows = rows
        self.columns = columns
        self.spacing = spacing
    }
    
    let rows: Int
    let columns: Int
    let spacing: Int
    private var _spacing: CGFloat {CGFloat(spacing)}
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0 ..< rows {
            for column in 0 ..< columns {
                let startX = columnSize * CGFloat(column)
                let startY = rowSize * CGFloat(row)
                
                let rect = CGRect(
                    x: startX, y: startY,
                    width: columnSize - _spacing,
                    height: rowSize - _spacing)
                path.addRect(rect)
                
            }
        }

        return path
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTextField: UIViewRepresentable {
    init(_ placeholder: String, text: Binding<String>, isFirstResponder: Bool = false) {
        self.placeholder = placeholder
        self.isFirstResponder = isFirstResponder
        _text = text
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        var didBecomeFirstResponder = false

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

    }
    let placeholder: String
    @Binding var text: String
    var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        textField.keyboardType = .numberPad
        return textField
    }

    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text)
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
