//
//  ContentView.swift
//  slotMachines
//
//  Created by Ryan Tolentino on 3/30/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var spinnable = true
    @State private var symbols = ["apple", "star", "cherry"]
    @State private var numbers = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var credits = 1
    @State private var backgrounds = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
    private var betAmount = 1
    private var diagnolBetAmount = 5
    
    
    var body: some View {
        //----------------------------------ZSTACK----------------------------//
        ZStack {
            // Background images
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                //Ignores the carrier and battery life area
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
        //----------------------------------VSTACK----------------------------//
        VStack {
            // Title
            Spacer()
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("Tolentino Slots")
                    .bold()
                    .foregroundColor(.black)
                    .italic()
                    
                
                Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            }.scaleEffect(1.5)
            Spacer()
            //----------------------------------Begin Credits Counter----------------------------//
            // Credits counter
            Text("Credits: " + String(credits))
                .foregroundColor(.black)
                .padding(.all, 10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                Spacer()
            //-----------------------------------Row 1--------------------------------------------//
            HStack {
                //Spacer on the left
                Spacer()
                CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                //Spacer on the right
                Spacer()
                    }
            //-----------------------------------Row 2--------------------------------------------//
            HStack {
                //Spacer on the left
                Spacer()
                CardView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                CardView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                CardView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                //Spacer on the right
                Spacer()}
            //-----------------------------------Row 3--------------------------------------------//
                HStack {
                //Spacer on the left
                Spacer()
                CardView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                CardView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                CardView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                //Spacer on the right
                Spacer()
                    
                    }
            //-------------------------------------------------------------------------------------//
            Spacer()
            HStack{
                Spacer()
                if self.credits >= self.betAmount{
                    Button(action: {

                        self.backgrounds = self.backgrounds.map { _ in
                            Color.white
                        }
                        self.numbers = self.numbers.map { _ in
                            Int.random(in: 0...self.symbols.count-1)}
                        
                        if self.credits < self.betAmount{
                        }
                        else{
                            self.credits -= self.betAmount
                            
                        }
                        //Horizontal check
                        if self.numbers[0] == self.numbers[1] && self.numbers[0] == self.numbers[2]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[0] = Color.green
                            self.backgrounds[1] = Color.green
                            self.backgrounds[2] = Color.green
                            }
                        if self.numbers[3] == self.numbers[4] && self.numbers[3] == self.numbers[5]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[3] = Color.green
                            self.backgrounds[4] = Color.green
                            self.backgrounds[5] = Color.green
                        }
                        if self.numbers[6] == self.numbers[7] && self.numbers[6] == self.numbers[8]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[6] = Color.green
                            self.backgrounds[7] = Color.green
                            self.backgrounds[8] = Color.green
                        }
                        //Vertical check
                        if self.numbers[0] == self.numbers[3] && self.numbers[0] == self.numbers[6]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[0] = Color.green
                            self.backgrounds[3] = Color.green
                            self.backgrounds[6] = Color.green
                            }
                        if self.numbers[1] == self.numbers[4] && self.numbers[1] == self.numbers[7]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[1] = Color.green
                            self.backgrounds[4] = Color.green
                            self.backgrounds[7] = Color.green
                            }
                        if self.numbers[2] == self.numbers[5] && self.numbers[2] == self.numbers[8]{
                            self.credits += self.betAmount * 10
                            self.backgrounds[2] = Color.green
                            self.backgrounds[5] = Color.green
                            self.backgrounds[8] = Color.green
                            }
                    }) {
                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                        }
                }
                    if self.credits < self.betAmount
                    {
                        Text("You don't have enough bread playa")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 30)
                            .background(Color.pink)
                            .cornerRadius(20)
                    }
                Spacer()
            //-----------------------------------Vertical Check button --------------------------------------//

                if self.credits >= self.diagnolBetAmount{
                Button(action: {
                    self.credits -= self.diagnolBetAmount

                self.backgrounds = self.backgrounds.map { _ in
                    Color.white
                }
                self.numbers = self.numbers.map { _ in
                    Int.random(in: 0...self.symbols.count-1)}
                
                //Diag check
                if self.numbers[0] == self.numbers[4] && self.numbers[0] == self.numbers[8]{
                    self.credits += self.betAmount * 20
                    self.backgrounds[0] = Color.gray
                    self.backgrounds[4] = Color.gray
                    self.backgrounds[8] = Color.gray
                    }
                if self.numbers[6] == self.numbers[4] && self.numbers[6] == self.numbers[2]{
                    self.credits += self.betAmount * 120
                    self.backgrounds[6] = Color.gray
                    self.backgrounds[4] = Color.gray
                    self.backgrounds[2] = Color.gray
                    }
                
            })
            {
                if self.spinnable == true{
                    Text("20 X your bet")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 30)
                    .background(Color.pink)
                    .cornerRadius(20)
                }
                }
                Spacer()
                
                }
            }
            
                    //End V Stack
            }
    //End Z Stack
    }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

