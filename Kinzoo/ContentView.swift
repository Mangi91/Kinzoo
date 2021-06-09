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
            HeaderView()
            AddButtonView()
            UnoGroupView(friend: "marco")
            DuoGroupView(friend1: "clem", friend2: "charles")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    private let purple: Color = Color(red: 97/255, green: 65/255, blue: 217/255)
    
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
                .foregroundColor(purple)
        }
        .padding(.horizontal, 16)
    }
}

struct AddButtonView: View {
    private let purple: Color = Color(red: 97/255, green: 65/255, blue: 217/255)
    
    var body: some View {
        VStack {
            Image("add")
                .renderingMode(.template)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(.all, 20.0)
                .background(purple)
                .cornerRadius(35)
            Text("Add")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(purple)
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
    var color: Color;
    var size: CGFloat;
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: size, height: size)
            .cornerRadius(size/2)
    }
}

struct UnoGroupView: View {
    public var friend: String
    
    private let purple: Color = Color(red: 97/255, green: 65/255, blue: 217/255)
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            FriendBubbleView(friend: friend, size: 130, borderColor: purple)
            Text(friend.capitilizeFirst())
                .font(.system(size: 16, weight: .bold, design: .default))
        }
    }
}

struct DuoGroupView: View {
    public var friend1: String
    public var friend2: String
    
    private let pink: Color = Color(red: 246/255, green: 90/255, blue: 186/255)
    private let orange: Color = Color(red: 251/255, green: 122/255, blue: 85/255)
    private let yellow: Color = Color(red: 254/255, green: 215/255, blue: 96/255)
    private let blue: Color = Color(red: 68/255, green: 207/255, blue: 156/255)
    
    var body: some View {
        VStack(alignment: .leading) {
            FriendBubbleView(friend: friend1, size: 70, borderColor: Color.clear)
            FriendBubbleView(friend: friend2, size: 70, borderColor: Color.white)
                .offset(x:40 ,y: -25)
            ColorBubbleView(color: pink, size: 18)
                .offset(x: 25, y: -55)
            ColorBubbleView(color: orange, size: 8)
                .offset(x: 10, y: -70)
            ColorBubbleView(color: yellow, size: 10)
                .offset(x: 12, y: -120)
            ColorBubbleView(color: blue, size: 12)
                .offset(x: 80, y: -180)
            ColorBubbleView(color: yellow, size: 15)
                .offset(x: 90, y: -230)
            ColorBubbleView(color: orange, size: 10)
                .offset(x: 110, y: -220)
            Text("\(friend1.capitilizeFirst()) & \(friend2.capitilizeFirst())")
                .font(.system(size: 16, weight: .bold, design: .default))
                .offset(y: -125)
        }
    }
}
