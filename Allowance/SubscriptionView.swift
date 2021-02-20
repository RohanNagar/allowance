//
//  SubscriptionView.swift
//  Allowance
//
//  Created by Rohan Nagar on 2/19/21.
//

import SwiftUI

struct SubscriptionView: View {
  @State var subscriptions: [Subscription]
  @State var addAccountModal = false
  @State var settingsModal = false

    var body: some View {
      VStack {
        HStack {
          Button(action: {
            settingsModal = true
          }) {
            Image(systemName: "gearshape.fill")
              .font(.headline)
              .foregroundColor(.black)
          }
          .padding()
          .sheet(isPresented: $settingsModal) {
            Text("Settings tapped!")
          }

          Spacer()

          Text("My Subscriptions").bold().padding()

          Spacer()

          Button(action: {
            addAccountModal = true
          }) {
            Image(systemName: "plus")
              .font(.headline)
              .foregroundColor(.black)
          }
          .padding()
          .sheet(isPresented: $addAccountModal) {
            Text("Add Account tapped!")
          }
        }

        ScrollView {
          ForEach(subscriptions, id: \.self) { sub in
            SubscriptionCellView(subscription: sub)
          }
        }

        Spacer()
      }
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView(subscriptions: [Subscription(
                                          id: 1,
                                          name: "Spotify",
                                          description: "MUSIC STREAMING",
                                          price: "$12.99",
                                          imageUrl: "https://www.rohannagar.com/allowance-data/spotify/white.png",
                                          firstBill: Date(timeIntervalSince1970: 100),
                                          cycle: .yearly,
                                          hexColor: "#1db954"),
                                         Subscription(
                                          id: 2,
                                          name: "Hulu",
                                          description: "AD-SUPPORTED VERSION",
                                          price: "$1.99",
                                          imageUrl: "https://www.rohannagar.com/allowance-data/spotify/white.png",
                                          firstBill: Date(),
                                          cycle: .monthly,
                                          hexColor: "#1ce783"),
                                         Subscription(
                                          id: 3,
                                          name: "Netflix",
                                          description: "FROM T-MOBILE",
                                          price: "$0.00",
                                          imageUrl: "https://www.rohannagar.com/allowance-data/spotify/white.png",
                                          firstBill: Date(timeIntervalSince1970: 1435),
                                          cycle: .monthly,
                                          hexColor: "#e50914")])
    }
}
