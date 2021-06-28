//
//  ContentView.swift
//  Kinzoo
//
//  Created by Manuel Cubillo on 6/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                Header(user: "mike")
                ScrollView(showsIndicators: false) {
                    HStack(alignment: VerticalAlignment.CustAlignment, spacing: 45) {
                        VStack(spacing: 40) {
                            AddButton()
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[.bottom]
                                })
                            UnoGroup(friend: "marco", color: .kinzooPurple)
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[.bottom]
                                })
                            DuoGroup(friends: ["clem", "charles"])
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[.bottom]
                                })
                        }
                        VStack(spacing: 40) {
                            TrioGroup(friends: ["ahmed", "brad", "walter"], color: .kinzooPurple)
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[VerticalAlignment.CustAlignment]
                                })
                            UnoGroup(friend: "kevin", color: .clear)
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[.top]
                                })
                            TrioGroup(friends: ["john", "natalia", "michelle"], color: .white)
                                .alignmentGuide(VerticalAlignment.CustAlignment, computeValue: { dimension in
                                    dimension[.top]
                                })
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

extension VerticalAlignment {
    enum CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[VerticalAlignment.center]
        }
    }
    
    static let CustAlignment = Self(CustomAlignment.self)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Header: View {
    var user: String
    
    var body: some View {
        HStack {
            HStack {
                Image(user)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(20)
                Text(user.capitilizeFirst())
                    .foregroundColor(.black)
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
                .foregroundColor(.kinzooPurple)
                .font(.system(size: 16, weight: .semibold, design: .default))
        }
    }
}

struct CountBubble: View {
    var size: CGFloat
    var color: Color
    var borderColor: Color
    var count: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: size, height: size)
                .cornerRadius(size/2)
                .overlay(Circle().stroke(borderColor, lineWidth: 5))
            Text("+\(count)")
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct FriendBubble: View {
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

struct ColorBubble: View {
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
            FriendBubble(friend: friend, size: 130, borderColor: color)
            Text(friend.capitilizeFirst())
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .bold, design: .default))
        }
    }
}

struct DuoGroup: View {
    public var friends: [String]

    var body: some View {
        ZStack(alignment: .leading) {
            FriendBubble(friend: friends[0], size: 70, borderColor: Color.clear)
            FriendBubble(friend: friends[1], size: 70, borderColor: Color.white)
                .offset(x:40 ,y: 50)
            ColorBubble(color: .kinzooPink, size: 17)
                .offset(x: 25, y: 75)
            ColorBubble(color: .kinzooOrange, size: 7)
                .offset(x: 10, y: 80)
            ColorBubble(color: .kinzooYellow, size: 10)
                .offset(x: 12, y: 45)
            ColorBubble(color: .kinzooBlue, size: 12)
                .offset(x: 80, y: 5)
            ColorBubble(color: .kinzooYellow, size: 15)
                .offset(x: 90, y: -22)
            ColorBubble(color: .kinzooOrange, size: 10)
                .offset(x: 110, y: 7)
            Text("\(friends[0].capitilizeFirst()) & \(friends[1].capitilizeFirst())")
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .bold, design: .default))
                .offset(y: 115)
        }
        .padding(.bottom, 90)
    }
}

struct TrioGroup: View {
    private var friends: [String]
    private var color: Color
    private var countColor: Color
    private var countBorderColor: Color
    
    init(friends: [String], color: Color) {
        self.friends = friends
        self.color = color
        countColor = color == .kinzooPurple ? color : Color.kinzooBlue
        countBorderColor = color == .kinzooPurple ? color : .white
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            FriendBubble(friend: friends[0], size: 70, borderColor: color)
                .offset(x:0, y:0)
            FriendBubble(friend: friends[1], size: 70, borderColor: color)
               .offset(x:55, y:0)
            FriendBubble(friend: friends[2], size: 70, borderColor: color)
               .offset(x:25, y:47)
            ColorBubble(color: .kinzooPink, size: 17)
                .offset(x: 2, y: 70)
            ColorBubble(color: .kinzooOrange, size: 7)
                .offset(x: 5, y: 40)
            ColorBubble(color: .kinzooBlue, size: 12)
                .offset(x: 100, y: 63)
            ColorBubble(color: .kinzooOrange, size: 10)
                .offset(x: 95, y: 80)
            CountBubble(size: 45, color: countColor, borderColor: countBorderColor, count: 3)
                .offset(x: 80, y: 30)
            Text("\(friends[0].capitilizeFirst()), \(friends[1].capitilizeFirst()) &\n \(friends[2].capitilizeFirst())")
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .bold, design: .default))
                .fixedSize(horizontal: false, vertical:true)
                .multilineTextAlignment(.center)
                .offset(y: 115)
        }
        .padding(.bottom, 100)
    }
}
