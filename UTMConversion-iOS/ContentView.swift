//
//  ContentView.swift
//  UTMConversion-iOS
//
//  Created by Sam Dravizki on 30/06/20.
//  Copyright © 2020 Sam Dravizki. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    
    var body: some View {

        
        VStack {
            ZStack {
                MapView(centerCoordinate: $centerCoordinate)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
            }
            
            VStack {
                Text("WGS48")
                HStack {
                    Text("Coordinates")
                    Text("\(centerCoordinate.latitude), \(centerCoordinate.longitude)")
                    .frame(width: 200)
                }
                .padding(.bottom)
                
                Text("UTM")
                
                HStack {
                    Text("Zone")
                    Text("Unknown")
                    .frame(width: 200)
                }
                HStack {
                    Text("Coordinates")
                    Text("Unknown, Unknown")
                    .frame(width: 200)
                }
            }
        .frame(height: 200)
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
