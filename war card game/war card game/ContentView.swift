//
//  ContentView.swift
//  war card game
//
//  Created by 陳昀靖 on 2023/2/4.
//

import SwiftUI

struct ContentView: View {
    @State var playerCard = "back"
    @State var cupCard = "back"
    @State var playerScore = 0
    @State var cupScore = 0
    var body: some View {
        ZStack{
            
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 200.0)
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cupCard)
                    Spacer()
                }
                Spacer()
                Button {
                    deal()
                }label: {
                    Image("button")
                }
                Spacer()
                Button("clear") {
                    restart()
                }.foregroundColor(.white)
                    .font(.largeTitle)
                    .backgroundStyle(Color.white)
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding()
                        Text(String(playerScore))
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    VStack{
                        Text("Cup")
                            .font(.headline)
                            .padding()
                        Text(String(cupScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
              
                
            }
            .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
            
        }
    }
     func deal(){
        let card = setcard()
        playerCard = card.playerS
        cupCard = card.cupS
    }
    func setcard() -> (playerS:String,cupS:String){
        var playerS = "card"
        var cupS = "card"
        var playernum = Int.random(in: 1..<14)
        var cupnum = Int.random(in: 1..<14)
        if playernum>cupnum{
            playerScore = playerScore+1
        }else{
            cupScore = cupScore+1
        }
        playerS = playerS+String(playernum)
        cupS=cupS+String(cupnum)
        return (playerS,cupS)
    }
    
    func restart(){
        playerScore = 0
        cupScore = 0
        playerCard = "back"
        cupCard = "back"
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
