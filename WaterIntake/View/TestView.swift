//
//  TestView.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        HStack(spacing: 40){
            
            Image("icon_water_glass")
                .resizable()
                .frame(width: 52, height: 52)
        
            
            ZStack{
                Image("icon_water_glass")
                    .resizable()
                    .frame(width: 52, height: 52)
            
                
                Image("icon_water_glass")
                    .resizable()
                    .frame(width: 52, height: 58)
                    .offset(x: 13, y: 0)
                    .zIndex(1.0)
                    
                    
                    
            }
            ZStack{
                Image("icon_water_glass")
                    .resizable()
                    .frame(width: 52, height: 52)
            
                
                Image("icon_water_glass")
                    .resizable()
                    .frame(width: 52, height: 62)
                    .offset(x: 13, y: 0)
                    .zIndex(1.0)
                    
                    
                
                Image("icon_water_glass")
                    .resizable()
                    .frame(width: 52, height: 52)
                    .offset(x: 26, y: 0)
                    
                    
            }
        }
    }
}

#Preview {
    TestView()
}
