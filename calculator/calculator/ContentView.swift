//
//  ContentView.swift
//  calculator
//
//  Created by Minne Sandstra on 30/11/2021.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "+/-"
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    
    let buttons: [CalcButton] = [
        .clear, .negative, .percent, .divide, .seven, .eight, .nine, .multiply,
        .four, .five, .six, .subtract,
        .one, .two, .three, .add,
        .zero, .decimal, .equal
    ]
    
    @State var value = "0"
    @State var first_number: Float = 0
    @State var runningValue: Float = 0
    @State var currentValue: Float = 0
    @State var currentOperation: Operation = .none
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            
            VStack(alignment: .leading) {
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack {
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack(spacing: 0.0) {
                    Button(action: {
                        self.didTap(button: buttons[0])
                    }) {
                        Text("AC")
                            .padding(.all, 5.0)
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[1])
                    }) {
                        Text("+/-")
                            .padding(.bottom, 5.0)
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[2])
                    }) {
                        Text("%")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[3])
                    }) {
                        Text("÷")
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5.0)
                    }
                    .buttonStyle(OperatorStyle())
                }
                .padding([.top, .leading, .trailing])
                .frame(minWidth: 0, maxWidth: .infinity)
                
                HStack(spacing: 0.0) {
                    Button(action: {
                        self.didTap(button: buttons[4])
                    }) {
                        Text("7")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[5])
                    }) {
                        Text("8")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[6])
                    }) {
                        Text("9")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[7])
                    }) {
                        Text("×")
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                            
                    }
                    .buttonStyle(OperatorStyle())
                }
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
                HStack(spacing: 0.0) {
                    Button(action: {
                        self.didTap(button: buttons[8])
                    }) {
                        Text("4")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[9])
                    }) {
                        Text("5")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[10])
                    }) {
                        Text("6")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[11])
                    }) {
                        Text("-")
                            .padding(.bottom, 5.0)
                    }
                    .buttonStyle(OperatorStyle())
                }
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                HStack(spacing: 0.0) {
                    Button(action: {
                        self.didTap(button: buttons[12])
                    }) {
                        Text("1")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[13])
                    }) {
                        Text("2")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[14])
                    }) {
                        Text("3")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[15])
                    }) {
                        Text("+")
                            .padding(.bottom, 5.0)
                    }
                    .buttonStyle(OperatorStyle())
                }
                .padding(.horizontal)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                HStack(spacing: 0.0) {
                    Button(action: {
                        self.didTap(button: buttons[16])
                    }) {
                        Text("0")
                    }
                    .buttonStyle(ZeroStyle())
                    Button(action: {
                        self.didTap(button: buttons[17])
                    }) {
                        Text(".")
                    }
                    .buttonStyle(NumberStyle())
                    Button(action: {
                        self.didTap(button: buttons[18])
                    }) {
                        Text("=")
                            .padding(.bottom, 5.0)
                    }
                    .buttonStyle(OperatorStyle())
                }
                .padding([.leading, .bottom, .trailing])
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .negative, .decimal, .percent, .equal:
            if button == .add {
                self.currentOperation = .add
                self.first_number += Float(self.value) ?? 0
            }
            else if button == .subtract {
                self.currentOperation = .subtract
                self.first_number += Float(self.value) ?? 0
            }
            else if button == .multiply {
                self.currentOperation = .multiply
                self.first_number += Float(self.value) ?? 0
            }
            else if button == .divide {
                self.currentOperation = .divide
                self.first_number += Float(self.value) ?? 0
            }
            else if button == .negative {
                if self.value.contains("-") {
                    self.value = String(self.value.dropFirst())
                }
                else {
                    self.value = "\("-")\(self.value)"
                }
            }
            else if button == .decimal {
                if self.value.contains(".") {
                    break
                }
                self.value = "\(self.value)\(".")"
            }
            else if button == .percent {
                self.runningValue = (Float(self.value)! / 100)
                self.value = "\(runningValue)"
            }
            else if button == .equal {
                self.runningValue = self.first_number
                self.currentValue = Float(self.value) ?? 0
                switch self.currentOperation {
                case .add: self.value = "\(runningValue + currentValue)"
                    self.first_number = 0
                case .subtract: self.value = "\(runningValue - currentValue)"
                    self.first_number = 0
                case .multiply: self.value = "\(runningValue * currentValue)"
                    self.first_number = 0
                case .divide: self.value = "\(runningValue / currentValue)"
                    self.first_number = 0
                    
                case .none:
                    break
                }
            }
            
            if button != .equal && button != .negative && button != .percent && button != .decimal {
                self.value = "0"
            }
        
            // first = 7
            // value = 0
            // value = 3.5
            
        case .clear:
            self.value = "0"

        default:
            let number = button.rawValue
            if self.value == "0" {
                value = number
            }
            else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NumberStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.gray)
            .clipShape(Circle())
            .font(.system(size: 50))
    }
}

struct OperatorStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.orange)
            .clipShape(Circle())
            .font(.system(size: 50, design: .default))
    }
}

struct ZeroStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 150, maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            .font(.system(size: 50, design: .default))
            .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
    }
}
