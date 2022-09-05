//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Damián Matysko on 8/7/22.
//

import SwiftUI

struct LandmarkList: View {
    //TODO: not working
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filtredLandMarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filtredLandMarks){ landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        //        ForEach(["iPhone SE (3nd generation)", "iPhone 13", "iPad Pro (9.7-inch)"],id: \.self){
        //            deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        //        }
        
        LandmarkList()
            .environmentObject(ModelData())
    }
}
