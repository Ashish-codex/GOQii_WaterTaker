//
//  SelectWaterIntakeViewModel.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import Foundation

class SelectWaterIntakeViewModel: ObservableObject {
    
    @Published var arrGlassClicks:[Bool] = [false, false, false]
    @Published var arrBottleClicks:[Bool] = [false, false, false]
    
    var totalGlassML = 0
    var totalGlassQuantity = 0
    
    var totalBootleML = 0
    var totalBottleQuantity = 0
    
    init(){
        
    }
    
    
    func onClickGlass(pos: Int)  {
        
        for indx in 0..<arrGlassClicks.count{
            if pos == indx{
                arrGlassClicks[indx] = !arrGlassClicks[indx]
                
                if arrGlassClicks[indx]{
                    totalGlassML = (2 * (100 * (indx + 1)))
                    totalGlassQuantity =  (indx + 1)
                }else{
                    totalGlassML = 0
                    totalGlassQuantity = 0
                }
                
                
                
            }else{
                arrGlassClicks[indx] = false
            }
            
        }
        
        
        print("TotalGlassML = \(totalGlassML)")
        print("TotalGlassQuantity = \(totalGlassQuantity)")
       
    }
    
    func onClickBottle(pos: Int)  {
        
        for indx in 0..<arrGlassClicks.count{
            if pos == indx{
                arrBottleClicks[indx] = !arrBottleClicks[indx]
                
                if arrBottleClicks[indx]{
                    totalBootleML =  (indx+1) * 1000
                    totalBottleQuantity = (indx + 1)
                }else{
                    totalBootleML = 0
                    totalBottleQuantity = 0
                }
                
            }else{
                arrBottleClicks[indx] = false
            }
            
        }
        
        print("TotalBottelML = \(totalBootleML)")
        print("TotalBottelQuantity = \(totalBottleQuantity)")
        
    }
}
