//
//  OptionView.swift
//  Accurately
//
//  Created by Chang Song on 7/2/21.
//

import SwiftUI

struct OptionView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                NavigationLink(destination: AmortizationView()) {
                    Text("See the amortization schedule")
                }
                
            }
        }.navigationBarTitle("To Calculator", displayMode: .inline)
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
