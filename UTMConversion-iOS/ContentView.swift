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
                    Text("\(formatZone())")
                    .frame(width: 200)
                }
                HStack {
                    Text("Coordinates")
                    Text("\(formatUTMCoordinates())")
                    .frame(width: 200)
                }
            }
        .frame(height: 200)
            
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func formatZone() -> String {
        let (zone, hem) = UTMZoneFromWGS84(longitude: centerCoordinate.longitude, latitude: centerCoordinate.latitude)
        
        return "\(zone)\(hem.capitalized)"
    }
    
    private func formatUTMCoordinates() -> String {
        let (easting, northing) = toEastingNorthing(longitude: centerCoordinate.longitude, latitude: centerCoordinate.latitude)
        
        return "\(easting.roundToDecimal(2)), \(northing.roundToDecimal(2))"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
