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
            VStack(alignment: .center, spacing: 16) {
                FriendBubbleView()
                Text("Marco")
                    .font(.system(size: 16, weight: .semibold, design: .default))
            }
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
                .foregroundColor(Color(red: 97/255, green: 65/255, blue: 217/255))
        }
        .padding(.horizontal, 16)
    }
}

struct AddButtonView: View {
    var body: some View {
        VStack {
            Image("add")
                .renderingMode(.template)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(.all, 20.0)
                .background(Color(red: 97/255, green: 65/255, blue: 217/255))
                .cornerRadius(35)
            Text("Add")
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(Color(red: 97/255, green: 65/255, blue: 217/255))
        }
    }
}

struct FriendBubbleView: View {
    var body: some View {
        Image("marco")
            .resizable()
            .frame(width: 150, height: 150)
            .cornerRadius(75)
            .overlay(Circle().stroke(Color(red: 97/255, green: 65/255, blue: 217/255), lineWidth: 7))
    }
}
