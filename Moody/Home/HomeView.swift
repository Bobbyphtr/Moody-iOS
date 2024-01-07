//
//  HomeView.swift
//  Moody
//
//  Created by Bobby Pehtrus on 03/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var memories: [Memory]
    
    var body: some View {
        VStack {
            NavigationView()
            ScrollView {
                HeaderView()
                MoodDiary(memories: $memories)
            }
        }
        .padding(.horizontal)
    }
}

struct MoodDiary: View {
    
    @Binding var memories: [Memory]
    
    var body: some View {
        LazyVStack {
            ForEach(memories) { memory in
                VStack {
                    HStack {
                        Text("\(memory.date.get(.month))")
                        Spacer()
                        Text("\(memory.moments.count) moments")
                    }
                    ForEach(memory.moments) { moment in
                        HStack {
                            Text("\(moment.date.get(.day))")
                            Text("\(moment.mood.emoji)")
                            Text("\(moment.point)")
                        }
                    }
                }
            }
        }
    }
}



struct HeaderView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Good Morning!")
                    .multilineTextAlignment(.leading)
                    .font(.largeTitle)
                Spacer()
            }
            HStack {
                Text("Don't let a bad day makes you think you have a bad life!")
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.top, 8.0)
        }
    }
}

struct NavigationView: View {
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 48.0)
            Spacer()
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 32.0)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: View {
        
        @State var memories: [Memory] = [
            Memory(date: Date(), moments: [
                Moment(mood: .neutral, point: 0),
                Moment(mood: .happy, point: 30),
                Moment(mood: .happy, point: 80)
            ])
        ]
        
        var body: some View {
            HomeView(memories: memories)
        }
    }
}
