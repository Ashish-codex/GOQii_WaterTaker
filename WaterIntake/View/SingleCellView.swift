//
//  SingleCellView.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import SwiftUI

struct SingleCellView: View {
    
    let iconImg, txtQuntity, txtTime, txtUnit, txtWaterIntakeType : String
    
    
    
    var body: some View {
        
        HStack{
            
            HStack{
                Image(iconImg)
                    .resizable()
                    .frame(width: 35, height: 35)
                
                VStack(alignment: .leading){
                    Text("\(txtQuntity) \(txtWaterIntakeType) Water")
                        .font(.headline)
                        .fontWeight(.semibold)
                
                    
                    
                    Text("\(txtTime) pm")
                        .font(.subheadline)
                        
                }
            }
            
            
            Spacer()
            
            
            Text("\(txtUnit) mL")
                .font(.headline)
                .fontWeight(.semibold)
            
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    SingleCellView(iconImg: "icon_water_glass", txtQuntity: "3", txtTime: "03:00", txtUnit: "200", txtWaterIntakeType: "Glass")
}
