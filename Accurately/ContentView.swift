//
//  ContentView.swift
//  Accurately
//
//  Created by Chang Song on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    enum ViewMode {
        case Calculator
        case Options
        case AmortizationSchedule
    }
    @State var decimalDigits = 2
    @State var displayNumber = "0.00"
    @State var viewMode = ViewMode.Calculator
    @State var operatorText = ""
    @State var storageText = ""
    @State var numberRawText = ""
    @State var operand = 0.0
    @State var cleared = false
    @State var tvm:[String:Double] = ["N":0.0, "I/Y":0.0, "PV":0.0, "PMT":0.0, "FV":0.0]
    @State var mem:[String:Double] = ["0":0.0, "1":0.0, "2":0.0, "3":0.0, "4":0.0, "5":0.0, "6":0.0, "7":0.0, "8":0.0, "9":0.0]
    @State var vpy = 12
    @State var amortizationSchedule = "Compute PMT to see the schedule"
    @State var clearTvm = false
    
    let yellowColor = Color(hue: 0.13, saturation: 0.3, brightness: 0.99)
    let lineColor = Color(hue: 1.0, saturation: 0.0, brightness: 0.8)
    let oliveColor = Color(hue: 0.4, saturation: 0.2, brightness: 0.6)
    let navyColor = Color(hue: 0.6, saturation: 0.4, brightness: 0.6)

    var body: some View {
        let brick = Rectangle().frame(minWidth: 0, idealWidth: 0, maxWidth: 5, minHeight: 0, idealHeight: 0, maxHeight: 5, alignment: .center).opacity(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        let mold = RoundedRectangle(cornerRadius: 10).stroke(lineColor, lineWidth: 2)
        return ZStack {
            Image("background").resizable(capInsets: /*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/, resizingMode: .tile)
            if viewMode == ViewMode.Calculator {
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        brick
                        ZStack {
                            Text(String(displayNumber)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 250, maxWidth: 280, minHeight: 50, idealHeight: 70, maxHeight: 70, alignment: .bottomTrailing)
                                .padding(10.0)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Text(operatorText)
                                .font(.system(size:14))
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 250, maxWidth: 280, minHeight: 50, idealHeight: 70, maxHeight: 70, alignment: .topLeading)
                                .padding(10.0)
                            Text(storageText)
                                .font(.system(size:14))
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 150, maxWidth: 200, minHeight: 50, idealHeight: 70, maxHeight: 70, alignment: .topTrailing)
                                .padding(10.0)

                        }
                        Button("C", action:{
                            processButton(buttonId: "c")
                        }).font(.headline).foregroundColor(.red).padding().overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        brick
                    }
                    brick
                    HStack(alignment: .bottom) {
                        Button("　CPT　", action:{
                            //textOperator = "Computed"
                            processButton(buttonId: "CPT")
                        }).font(.headline).foregroundColor(.orange)
                            .padding(.leading,29) .padding(.trailing,29).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("STO", action:{
                            processButton(buttonId: "STO")
                        }).font(.headline).foregroundColor(.orange).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("RCL", action:{
                            processButton(buttonId: "RCL")
                        }).font(.headline).foregroundColor(.orange).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("OPT", action:{
                            viewMode = ViewMode.Options
                        }).font(.headline).foregroundColor(oliveColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    }
                    HStack {
                        Spacer()
                        Button("N", action:{
                            processButton(buttonId: "N")
                        }).font(.headline).foregroundColor(navyColor)
                            .padding(.leading,23) .padding(.trailing,23).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("I/Y", action:{
                            processButton(buttonId: "I/Y")
                        }).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("PV", action:{
                            processButton(buttonId: "PV")
                        }).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("PMT", action:{
                            processButton(buttonId: "PMT")
                        }).font(.headline).foregroundColor(navyColor)
                            .padding(.leading,11) .padding(.trailing,11).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("FV", action:{
                            processButton(buttonId: "FV")
                        }).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Spacer()
                    }
                    brick
                    HStack(alignment: .bottom){
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Button("７", action:{
                                    processButton(buttonId: "7")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("８", action:{
                                    processButton(buttonId: "8")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("９", action:{
                                    processButton(buttonId: "9")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack{
                                Button("４", action:{
                                    processButton(buttonId: "4")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("５", action:{
                                    processButton(buttonId: "5")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("６", action:{
                                    processButton(buttonId: "6")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack{
                                Button("１", action:{
                                    processButton(buttonId: "1")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("２", action:{
                                    processButton(buttonId: "2")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("３", action:{
                                    processButton(buttonId: "3")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack(alignment: .bottom){
                                Button("０", action:{
                                    processButton(buttonId: "0")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("．", action:{
                                    processButton(buttonId: ".")
                                }).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("±", action:{
                                    processButton(buttonId: "+/-")
                                }).font(.title).foregroundColor(.black)
                                    .padding(.leading,31) .padding(.trailing,31).padding(.top, 22).padding(.bottom,22)
                                    .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                        }
                        VStack(alignment: .leading){
                            Button(" ÷ ", action:{
                                processButton(buttonId: "÷")
                            }).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" × ", action:{
                                processButton(buttonId: "×")
                            }).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" − ", action:{
                                processButton(buttonId: "−")
                            }).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" + ", action:{
                                processButton(buttonId: "+")
                            }).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button("＝", action:{
                                processButton(buttonId: "＝")
                            }).font(.title).foregroundColor(navyColor)
                                .padding(.leading,19) .padding(.trailing,19).padding(.top, 23).padding(.bottom,23)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                    }
                    Rectangle().frame(minWidth: 0, idealWidth: 0, maxWidth: 5, minHeight: 0, idealHeight: 25, maxHeight: 25, alignment: .center).opacity(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                }
            } else if viewMode == ViewMode.Options {
                VStack {
                    Spacer()
                    Text("Accurately Finacial Calculator").underline()
                    brick
                    VStack {
                        brick
                        HStack(alignment: .center) {
                            Text("Payments per Year")
                            Button("12", action:{
                                vpy = 12
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: vpy == 12))
                            Button("4", action:{
                                vpy = 4
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: vpy == 4))
                            Button("1", action:{
                                vpy = 1
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: vpy == 1))
                        }
                        HStack(alignment: .center) {
                            Text("Display precision")
                            Button("0", action:{
                                setDecimalDigits(digit: 0)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 0))
                            Button("1", action:{
                                setDecimalDigits(digit: 1)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 1))
                            Button("2", action:{
                                setDecimalDigits(digit: 2)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 2))
                            Button("3", action:{
                                setDecimalDigits(digit: 3)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 3))
                            Button("4", action:{
                                setDecimalDigits(digit: 4)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 4))
                            Button("5", action:{
                                setDecimalDigits(digit: 5)
                            }).font(.headline).foregroundColor(navyColor).padding(10).overlay(mold).background(buttonBackgroundColor(selected: decimalDigits == 5))
                        }
                        Toggle("Hit C twice to clear TVM", isOn: $clearTvm).frame(width: 250)
                        brick
                    }.background(Color.white)
                    brick
                    Button("Amortization Schedule") {
                        viewMode = ViewMode.AmortizationSchedule
                    }.font(.headline).foregroundColor(navyColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    brick
                    Button("Back") {
                        viewMode = ViewMode.Calculator
                    }.font(.headline).foregroundColor(oliveColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            } else if viewMode == ViewMode.AmortizationSchedule {
                VStack {
                    Spacer()
                    VStack {
                        Text("Amortization Schedule").underline()
                        brick
                        ScrollView() {
                            Text(amortizationSchedule).background(Color.white).font(Font.system(size: 12, design: .monospaced))
                        }
                    }
                    brick
                    HStack(alignment: .center) {
                        Button("Copy to Clipboard") {
                            UIPasteboard.general.string = amortizationSchedule
                        }.font(.headline).foregroundColor(navyColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("Back") {
                            viewMode = ViewMode.Calculator
                        }.font(.headline).foregroundColor(oliveColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                }
            }
        }
    }
    
    func setDecimalDigits(digit: Int) {
        decimalDigits = digit
        displayNumber = formattedNumber()
    }
    
    func buttonBackgroundColor(selected: Bool) -> Color {
        if selected {
            return yellowColor
        } else {
            return Color.white
        }
    }
    
    func formattedNumber() -> String {
        return formattedNumber(value: Double(numberRawText) ?? operand)
    }
    
    func formattedNumber(value: Double) -> String {
        let decimalFormatStr = "%.\(decimalDigits)f"
        return String(format: decimalFormatStr, value)
    }
    
    func processButton(buttonId: String) {
        switch buttonId {
        case "0","1","2","3","4","5","6","7","8","9",".","+/-":
            processNumberButton(buttonId: buttonId)
            cleared = false
        case "c":
            if cleared && operatorText.count > 0 {
                operand = 0.0
                operatorText = ""
            }
            if operatorText.count == 0 {
                operand = 0.0
            }
            if cleared && clearTvm {
                tvm["N"] = 0.0
                tvm["I/Y"] = 0.0
                tvm["PV"] = 0.0
                tvm["PMT"] = 0.0
                tvm["FV"] = 0.0
                amortizationSchedule = "Compute PMT to see the schedule"
            }
            numberRawText = ""
            storageText = ""
            displayNumber = formattedNumber()
            cleared = true
        case "÷","×","−","+","＝":
            processOperatorButton(buttonId: buttonId)
            cleared = false
        case "N","I/Y","PV","PMT","FV":
            if operatorText == "CPT" {
                let vn = tvm["N"]!
                let vapr = tvm["I/Y"]! * 0.01
                let vpv = tvm["PV"]!
                let vpmt = tvm["PMT"]!
                let vfv = tvm["FV"]!
                let vi = vapr / Double(vpy)
                
                operand = computeTvm(computeFor: buttonId, vn: vn, vi: vi, vpv: vpv, vpmt: vpmt, vfv: vfv)
                tvm[buttonId] = operand
            } else if operatorText == "RCL" {
                operand = tvm[buttonId]!
            } else {
                tvm[buttonId] = Double(numberRawText) ?? operand
                operand = tvm[buttonId]!
            }
            displayNumber = formattedNumber(value: operand)
            storageText = buttonId + " ="
            numberRawText = ""
            operatorText = ""
        case "CPT", "RCL":
            operatorText = buttonId
            storageText = ""
        case "STO":
            operatorText = buttonId
            operand = Double(numberRawText) ?? operand
            displayNumber = formattedNumber(value: operand)
            numberRawText = ""
        default:
            break
        }
    }
    
    func computeTvm(computeFor: String, vn: Double, vi: Double, vpv: Double, vpmt: Double, vfv: Double) -> Double {
        let DELTA: Double = 1E-5
        let TOLERANCE: Double = 1E20
        let MAX_ITER: Int = 1000
        var value = 0.0

        if computeFor == "N" {
            if vi==0 {
                value = -(vpv + vfv)/vpmt
            } else {
                let v1 = vpmt - vfv*vi
                let v2 = vpmt + vpv*vi
                
                value = log(v1/v2)/log(1+vi)
            }
        } else if computeFor == "I/Y" {
            var v: Double = 0.0
            if vpmt == 0 {
                v = pow(-vfv/vpv, 1/vn)-1
            } else {
                let vd = vpv+vpmt*vn+vfv
                if (vd == 0) {
                    v=0.0
                } else {
                    var vsign = 0.0
                    if vd < 0 {vsign = 1.0}
                    else {vsign = -1.0}

                    v = DELTA*vsign; // starts from finite plus or minus
                    let pvn = pow(1+v, -vn)
                    var vf = vpv + vpmt * (1-pvn)/v + vfv*pvn
                    var testfunc = vd/vf

                    var iter=0

                    while (testfunc < TOLERANCE)
                    {
                        let step1 = pow(1+v,-vn-1)
                        let step2 = pow(1+v,-vn)
                        let slope = vpmt*(vn*step1/v+(step2-1)/v/v)-vfv*vn*step1
                        v = v - vf/slope
                        vf = vpv + vpmt * (1-pow(1+v, -vn))/v + vfv*pow(1+v,-vn)
                        if iter > MAX_ITER {break}
                        iter += 1
                        testfunc = vd/vf
                    }
                }
            }
            value = Double(vpy) * v * 100.0
        } else if computeFor == "PV" {
            if vi==0 {
                value = -(vfv + vpmt*vn)
            } else {
                value = (vpmt/vi-vfv)*pow(1+vi,-vn) - vpmt/vi
            }
        } else if computeFor == "PMT" {
            if vi==0 {
                value = -(vpv + vfv)/vn
            } else {
                value = -vi*(vpv + (vpv+vfv)/(pow(1+vi,vn)-1))
            }
            if (!value.isNaN) {
                amortizationSchedule = processAmortSchedule(vn:vn, vi:vi, vpv:vpv, vpmt:value, vfv:vfv)
            } else {
                amortizationSchedule = "Compute a finite PMT to see the schedule"
            }
        } else if computeFor == "FV" {
            if vi==0 {
                value = -(vpv + vpmt*vn)
            } else {
                value = -(vpmt/vi+vpv)*pow(1+vi,vn) + vpmt/vi
            }
        }
        
        return value
    }
    
    func processOperatorButton(buttonId: String) {
        if (operatorText == "") {
            if (numberRawText.count > 0) {
                operand = Double(numberRawText) ?? operand
            }
            displayNumber = formattedNumber(value: operand)
            if (buttonId != "＝") {
                operatorText = buttonId
                if (numberRawText.count > 0) {
                    operand = Double(numberRawText)!
                }
            }
        } else {
            if operatorText == "÷" {
                operand = operand / (Double(numberRawText) ?? operand)
            } else if operatorText == "×" {
                operand = operand * (Double(numberRawText) ?? operand)
            } else if operatorText == "−" {
                operand = operand - (Double(numberRawText) ?? operand)
            } else if operatorText == "+" {
                operand = operand + (Double(numberRawText) ?? operand)
            }
            displayNumber = formattedNumber(value: operand)
            if (buttonId != "＝") {
                operatorText = buttonId
            } else {
                operatorText = ""
            }
        }
        numberRawText = ""
        storageText = ""
    }
    
    func processNumberButton(buttonId: String) {
        if operatorText == "STO" {
            operatorText = ""
            if mem.keys.contains(buttonId) {
                storageText = "MEM " + buttonId + " ="
                mem[buttonId] = operand
            }
        } else if operatorText == "RCL" {
            operatorText = ""
            if mem.keys.contains(buttonId) {
                storageText = "MEM " + buttonId + " ="
                operand = mem[buttonId]!
                displayNumber = formattedNumber(value: operand)
                numberRawText = ""
            }
        } else {
            if buttonId == "+/-" {
                if numberRawText.count > 0 {
                    if numberRawText.hasPrefix("-") {
                        numberRawText = String(numberRawText.suffix(numberRawText.count - 1))
                    } else {
                        numberRawText = "-" + numberRawText
                    }
                } else if operand != 0.0 {
                    operand *= -1.0
                    displayNumber = formattedNumber(value: operand)
                }
            } else if buttonId == "." {
                if !numberRawText.contains(".") {
                    if numberRawText.count == 0 {
                        numberRawText = "0"
                    }
                    numberRawText += buttonId
                }
            } else {
                if (numberRawText == "0") {
                    numberRawText = buttonId
                } else if (numberRawText == "-0") {
                    numberRawText = "-" + buttonId
                } else {
                    numberRawText += buttonId
                }
            }
            if (numberRawText.count > 0) {
                displayNumber = numberRawText
            }
            storageText = ""
        }
    }
    
    func processAmortSchedule(vn:Double, vi:Double, vpv:Double, vpmt:Double, vfv:Double) -> String {
        let vapr = vi * Double(vpy) * 100.0
        var msg: String
        msg  = "N  : " + String(vn) + "\n"
        msg += "APR: " + formattedNumber(value: vapr) + "\n"
        msg += "PV : " + formattedNumber(value: vpv) + "\n"
        msg += "PMT: " + formattedNumber(value: vpmt) + "\n"
        msg += "FV : " + formattedNumber(value: vfv) + "\n"
        msg += "\n"
        msg += "Period  Interest  Principal    Balance\n"
        var prevBalance: Double = -vpv
        for i in 1...Int(vn) {
            var balance: Double = 0.0
            if vi==0 {
                balance = -(vpv + vpmt*Double(i))
            } else {
                balance = -(vpmt/vi+vpv)*pow(1+vi,Double(i)) + vpmt/vi
            }
            let principal = prevBalance - balance
            let interest = vpmt - principal

            msg += String(format: "%5d ", i)
            msg += String(format: "%10.0f ", abs(interest))
            msg += String(format: "%10.0f ", abs(principal))
            msg += String(format: "%10.0f\n", abs(balance))

            prevBalance = balance
        }
        return msg
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

