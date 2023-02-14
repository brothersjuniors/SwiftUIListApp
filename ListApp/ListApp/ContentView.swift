//
//  ContentView.swift
//  ListApp
//
//  Created by 近江伸一 on 2023/02/14.
//

import SwiftUI
struct Player: Identifiable {
    var id: Int
    let name: String
    let image: Image
}
struct ContentView: View {
    let players: [[Player]] = [
        
        [.init(id: 0, name: "apuri", image: Image("1")),
         .init(id: 1, name: "depuri", image: Image("1")),
         .init(id: 2, name: "sapouri", image: Image("1"))],
        
        [.init(id: 0, name: "apuri", image: Image("1")),
         .init(id: 1, name: "depuri", image: Image("1")),
         .init(id: 2, name: "sapouri", image: Image("1")),]
        
    ]
    var body: some View {
        NavigationView{
            List {
                ForEach(players.startIndex...(players.endIndex-1),id: \.self){
                    section in
                 Section(header: Text(self.switchHeaderTitle(section: section ))
                  )
                    {
                        ForEach(self.players[section]) { player in
                            PlayerRow(player: player,generation: self.switchHeaderTitle(section: section))
                           
                        }
                    }
                }.frame(height: 40)
            }.navigationTitle(Text("name"))
               
              

        }
    }
    
    func switchHeaderTitle(section: Int) -> String {
        switch section {
        case 0:
            return "1990's"
        case 1:
            return "2000's"
        case 2:
            return "2010's"
        default:
         return ""
        }
    }
    
}
struct PlayerRow: View{
    let player: Player
    let generation: String
    var body: some View {
       
        HStack{
            NavigationLink(destination: PlayerDetail(generation: generation, player: player)) {
                player.image
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50,height: 50)
                Text(player.name)
                  .font(.body)
                    .padding(.leading, 10)
            }

          
        }
    }
}
struct PlayerDetail: View{
    let generation: String
    let player: Player
    var body: some View {
    NavigationView{
        VStack {
            player.image
                .resizable()
                .scaledToFill()
                .frame(width: 400,height: 400, alignment: .top)
                .cornerRadius(20)
                .padding(.init(top: 0,leading: 50,bottom: 0, trailing: 50))
            HStack {
                Text(player.name)
                    .font(.system(size: 30, weight: .heavy))
                    .padding(.top, -85)
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
                
            }
            .frame(width: 400,height: 60,alignment: .trailing)
            HStack {
                Text(player.name)
                    .font(.system(size: 30, weight: .medium))
                Text(generation)
                    .font(.system(size: 40,weight: .heavy))
            }
            Spacer()
           
               
        }.padding(.top,-80)
    }.navigationBarTitle(Text(player.name), displayMode: .inline)
        
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

