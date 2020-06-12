//
//  ContentView.swift
//  BullsEye
//
//  Created by Benjamin Inemugha on 04/06/2020.
//  Copyright © 2020 Techelopers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View{
        VStack{
            Spacer()
            //Target row
            HStack {
                Text("Slide as close as you can to:")
                Text("\(self.target)")
                
            }
            Spacer()
            //Slider row
            
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            //Button row
            Button(action:{
                //print("Button pressed!")
                self.alertIsVisible = true
                //self.score = self.score + self.pointsForCurrentRound()
            }){
                Text("Hit me!")
            }
            Spacer()
                
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    //let roundedValue = Int(self.sliderValue.rounded())
                    return Alert(title: Text("\(alertTitle())"), message: Text("Slider value is \(sliderValueRounded()).\n" + "You scored \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")){
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                        })
                    
            }
            Spacer()
            //Score row
            HStack{
                Button(action: {
                    self.startNewGame()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
            
        }
    }
    
    func sliderValueRounded() -> Int{
        Int(self.sliderValue.rounded())
    }
    
    func amountOff() -> Int{
        abs(self.target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int{
        
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        }else{
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String{
        let difference = amountOff()
        let title: String
        if difference == 0{
            title = "Perfect"
        }else if difference < 5 {
            title = "You almost had it!"
            
        }else if difference <= 10 {
            title = "Not bad"
        }else if difference <= 15 {
            title = "Poor"
        }else{
            title = "Are you even trying?"
        }
        return title
    }
    func startNewGame() {
        round = 1
        score = 0
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().previewLayout(.fixed(width: 896, height: 414))
        }
    }
}
