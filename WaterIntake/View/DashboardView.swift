//
//  DashboardView.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 27/11/24.
//

import SwiftUI

struct DashboardView: View {
    
    
    @StateObject var vm = DashboardViewModel()
    
    
    var body: some View {
        
        ZStack{
            Color.backgroudGray
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 50){
                    
                    Text("Water Traker")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    VStack{
                        MeterView(progress: $vm.progress, vm: vm)
                            .padding(.top, 20)
                        
                    }
                    .frame(width: vm.screenHeight * 0.4, height: vm.screenHeight * 0.38)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    VStack{
                        
                        if vm.arrData.count == 0 {
                            
                            Text("Start your Hydration now.")
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                            
                        }else{
                            
                            List(vm.arrData) { data in
                                SingleCellView(iconImg: data.img, txtQuntity: data.quantity, txtTime: data.time, txtUnit: data.unit, txtWaterIntakeType: data.type.rawValue)
                            }
                            .scrollDisabled(true)
                            .frame(width: vm.screenHeight * 0.45, height: 130 * CGFloat(vm.arrData.count))
                            
                        }
                        
                        
                        
                        
                        
                            

                    }
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    
                    
                }
                .padding(30)
                
            }
            
            
            
            
        }
        .sheet(isPresented: $vm.isPresentSheet, content: {
            SelectWaterIntakeView(dashboardVM: vm)
        })
        

        
    }
}

#Preview {
    DashboardView()
}




struct MeterView : View {
    
    @Binding var progress : CGFloat
    @StateObject var vm: DashboardViewModel
    
    var body: some View{
           
        ZStack{
            
            Circle()
                .trim(from: 0, to: 0.5)
                .stroke(Color.colorEmptyGray, lineWidth: 55)
                .frame(width: 250, height: 250)
            
            
            Circle()
                .trim(from: 0, to: setProgress())
                .stroke(Color.colorPrimary, lineWidth: 55)
                .frame(width: 250, height: 250)
            
            Text(vm.totalLiterWater)
                .padding(.bottom, 60)
                .font(.title)
                .fontWeight(.semibold)
                .rotationEffect(.init(degrees: 180))
            
            
            
            HStack(spacing: 43){
                Button(action: {
                    vm.isPresentSheet = true
                    
                }, label: {
                    Text("Drink ")
                        .frame(width: 90, height: 29)
                        .font(.title3)
                })
                .buttonStyle(BorderedProminentButtonStyle.borderedProminent)
                
                Button(action: {
                    
                    vm.refreshData()
                    
                }, label: {
                    Image("icon_water_glass")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .padding(14)
                        .overlay {
                            Circle()
                                .stroke(Color.colorEmptyGray, lineWidth: 2)
                            Image("icon_refresh")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .offset(x: 15, y: 18)
                            
                        }
                })
                
                
                
            }
            .padding(.top, 120)
            .rotationEffect(.init(degrees: 180))
            
        }
        .rotationEffect(.init(degrees: 180))
         
    }
    
    func setProgress()->CGFloat{
        
        var prog: CGFloat = 0
        
        if progress <= 100{
            let temp = self.progress / 2
            prog = temp * 0.01
            
        }else{
            let temp = self.progress / 2
            prog = 50 * 0.01
            
        }
        
        return prog

    }
    

}
