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
    @State var displayNumber = 0.0
    @State var viewMode = ViewMode.Calculator
    
    var body: some View {
        let lineColor = Color(hue: 1.0, saturation: 0.0, brightness: 0.8)
        let oliveColor = Color(hue: 0.4, saturation: 0.2, brightness: 0.6)
        let navyColor = Color(hue: 0.6, saturation: 0.4, brightness: 0.6)
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
                            Text("operator")
                                .font(.title2)
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 250, maxWidth: 280, minHeight: 50, idealHeight: 70, maxHeight: 70, alignment: .topLeading)
                                .padding(10.0)
                        }
                        Button("C", action:{}).font(.headline).foregroundColor(.red).padding().overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        brick
                    }
                    brick
                    HStack(alignment: .bottom) {
                        Button("　CPT　", action:{}).font(.headline).foregroundColor(.orange)
                            .padding(.leading,29) .padding(.trailing,29).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("STO", action:{}).font(.headline).foregroundColor(.orange).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("RCL", action:{}).font(.headline).foregroundColor(.orange).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        Button("OPT", action:{
                            viewMode = ViewMode.Options
                        }).font(.headline).foregroundColor(oliveColor).padding(13).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                    }
                    HStack {
                        Spacer()
                        Button("N", action:{}).font(.headline).foregroundColor(navyColor)
                            .padding(.leading,23) .padding(.trailing,23).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("I/Y", action:{}).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("PV", action:{}).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("PMT", action:{}).font(.headline).foregroundColor(navyColor)
                            .padding(.leading,11) .padding(.trailing,11).padding(.top, 19).padding(.bottom,19)
                            .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Button("FV", action:{}).font(.headline).foregroundColor(navyColor).padding(19).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/).fixedSize()
                        Spacer()
                    }
                    brick
                    HStack(alignment: .bottom){
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Button("７", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("８", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("９", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack{
                                Button("４", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("５", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("６", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack{
                                Button("１", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("２", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("３", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                            HStack(alignment: .bottom){
                                Button("０", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("．", action:{}).font(.title).foregroundColor(.black).padding(.leading,26) .padding(.trailing,26).padding(.top, 22).padding(.bottom,22).overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                                Button("±", action:{}).font(.title).foregroundColor(.black)
                                    .padding(.leading,31) .padding(.trailing,31).padding(.top, 22).padding(.bottom,22)
                                    .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            }
                        }
                        VStack(alignment: .leading){
                            Button(" ÷ ", action:{}).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" × ", action:{}).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" − ", action:{}).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button(" + ", action:{}).font(.title).foregroundColor(navyColor)
                                .padding(.leading,16) .padding(.trailing,16).padding(.top, 11).padding(.bottom,11)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            Button("＝", action:{}).font(.title).foregroundColor(navyColor)
                                .padding(.leading,19) .padding(.trailing,19).padding(.top, 23).padding(.bottom,23)
                                .overlay(mold).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                    }
                    Rectangle().frame(minWidth: 0, idealWidth: 0, maxWidth: 5, minHeight: 0, idealHeight: 25, maxHeight: 25, alignment: .center).opacity(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                }
            } else if viewMode == ViewMode.Options {
                VStack {
                    Text("Yo, this is options")
                    Button("Back") {
                        viewMode = ViewMode.Calculator
                    }
                    Button("Amortization Schedule") {
                        viewMode = ViewMode.AmortizationSchedule
                    }
                }
            } else if viewMode == ViewMode.AmortizationSchedule {
                VStack {
                    Text("Amortization Schedule")
                    Button("Back") {
                        viewMode = ViewMode.Calculator
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8 Plus")
        }
    }
}
