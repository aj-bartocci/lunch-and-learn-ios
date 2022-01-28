//
//  CounterView.swift
//  LunchAndLearn
//
//  Created by AJ Bartocci on 1/28/22.
//

import SwiftUI

struct CounterView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
            HStack(spacing: 40) {
                Button("-", action: decrement)
                Button("+", action: increment)
            }
        }
        .font(.largeTitle)
    }
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
