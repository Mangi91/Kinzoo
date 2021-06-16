//
//  ContentView.swift
//  Kinzoo
//
//  Created by Manuel Cubillo on 6/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Header()
            ScrollView {
                LazyVGrid(columns: [.init(), .init()]) {
                    AddButton()
                    TrioGroup(friends: ["ahmed", "brad", "walter"], color: .kinzooPurple)
                        .frame(height:265)
                    UnoGroup(friend: "marco", color: .kinzooPurple)
                    UnoGroup(friend: "kevin", color: .clear)
                    DuoGroup(friends: ["clem", "charles"])
                    TrioGroup(friends: ["john", "natalia", "michelle"], color: .white)
                }
                .padding(.top)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var body: some View {
        HStack {
            HStack {
                Image("mike")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(20)
                Text("Mike")
                    .font(.system(size: 16, weight: .semibold, design: .default))
                Image("down-arrow")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image("settings")
                .renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.kinzooPurple)
        }
        .padding(.horizontal, 16)
    }
}

struct AddButton: View {
    var body: some View {
        VStack {
            Image("add")
                .renderingMode(.template)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(.all, 20.0)
                .background(Color.kinzooPurple)
                .cornerRadius(35)
            Text("Add")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.kinzooPurple)
        }
    }
}

struct FriendBubbleView: View {
    var friend: String
    var size: CGFloat
    var borderColor: Color
    
    var body: some View {
        Image(friend)
            .resizable()
            .frame(width: size, height: size)
            .cornerRadius(size/2)
            .overlay(Circle().stroke(borderColor, lineWidth: 7))
    }
}

struct ColorBubbleView: View {
    var color: Color
    var size: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: size, height: size)
            .cornerRadius(size/2)
    }
}

struct UnoGroup: View {
    public var friend: String
    public var color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            FriendBubbleView(friend: friend, size: 130, borderColor: color)
            Text(friend.capitilizeFirst())
                .font(.system(size: 16, weight: .bold, design: .default))
        }
    }
}

struct DuoGroup: View {
    public var friends: [String]

    var body: some View {
        ZStack(alignment: .leading) {
            FriendBubbleView(friend: friends[0], size: 70, borderColor: Color.clear)
            FriendBubbleView(friend: friends[1], size: 70, borderColor: Color.white)
                .offset(x:40 ,y: 50)
            ColorBubbleView(color: .kinzooPink, size: 17)
                .offset(x: 25, y: 75)
            ColorBubbleView(color: .kinzooOrange, size: 7)
                .offset(x: 10, y: 80)
            ColorBubbleView(color: .kinzooYellow, size: 10)
                .offset(x: 12, y: 45)
            ColorBubbleView(color: .kinzooBlue, size: 12)
                .offset(x: 80, y: 5)
            ColorBubbleView(color: .kinzooYellow, size: 15)
                .offset(x: 90, y: -22)
            ColorBubbleView(color: .kinzooOrange, size: 10)
                .offset(x: 110, y: 7)
            Text("\(friends[0].capitilizeFirst()) & \(friends[1].capitilizeFirst())")
                .font(.system(size: 16, weight: .bold, design: .default))
                .offset(y: 115)
        }
    }
}

struct TrioGroup: View {
    public var friends: [String]
    public var color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            FriendBubbleView(friend: friends[0], size: 70, borderColor: color)
                .offset(x:0, y:0)
            FriendBubbleView(friend: friends[1], size: 70, borderColor: color)
               .offset(x:55, y:0)
            FriendBubbleView(friend: friends[2], size: 70, borderColor: color)
               .offset(x:25, y:47)
            ColorBubbleView(color: .kinzooPink, size: 17)
                .offset(x: 2, y: 70)
            ColorBubbleView(color: .kinzooOrange, size: 7)
                .offset(x: 5, y: 40)
            ColorBubbleView(color: .kinzooBlue, size: 12)
                .offset(x: 110, y: 55)
            ColorBubbleView(color: .kinzooOrange, size: 10)
                .offset(x: 100, y: 70)
            Text("\(friends[0].capitilizeFirst()), \(friends[1].capitilizeFirst()) &\n \(friends[2].capitilizeFirst())")
                .font(.system(size: 16, weight: .bold, design: .default))
                .fixedSize(horizontal: false, vertical:true)
                .multilineTextAlignment(.center)
                .offset(y: 115)
        }
    }
}
