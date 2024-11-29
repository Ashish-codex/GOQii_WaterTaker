//
//  DashboardViewModel.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import Foundation
import SwiftUI

class DashboardViewModel:ObservableObject {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    @Published var progress : CGFloat = 0
    @Published var arrData:[ModelWaterIntake] = []
    @Published var isPresentSheet = false
    @Published var totalLiterWater:String = "0.0 L"
    
    init() {
        
        UNUserNotificationCenter.current().delegate = NotificationManager.shared
    }
    
    
    func setData(data:ModelWaterIntake){
        arrData.append(data)
        getTotoalLiter()
    }
    
    
    func refreshData(){
        arrData.removeAll()
        totalLiterWater = "0.0 L"
        progress = 0
    }
    

    func getTime() -> String{
        
        let str1 = String(describing: Date.now).split(separator: " ")[1].split(separator: ":").first
        let str2 = String(describing: Date.now).split(separator: " ")[1].split(separator: ":")[1]
        
        print(Date.now)
        print("\(String(describing: str1 ?? "-")):\(String(describing: str2 ))")
        
        return "\(String(describing: str1 ?? "-")):\(String(describing: str2 ))"
    }
    
    
    func getTotoalLiter(){
        
        var tempTotal:Float = 0.0
        
        
        for item in arrData{
            
            tempTotal = tempTotal + ((Float(item.unit) ?? 0.0) * 0.001)
        }
        
        if tempTotal <= 4.0{

            totalLiterWater = "\(String(format: "%.1f", tempTotal)) L"
            
            if tempTotal == 4.0{
                NotificationManager.shared.notifyCompleteDailyTarget()
            }
            
            
        }else{
            
            if tempTotal == 5.0{
                NotificationManager.shared.notifyAfterDailyTarget()
            }
            
            totalLiterWater = "4.0 L+"
        }
        
        
        
        progress = CGFloat((tempTotal / 4) * 100)
        
        
    }
    
    
    
}
