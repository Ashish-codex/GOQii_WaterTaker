//
//  SelectWaterIntake.swift
//  WaterIntake
//
//  Created by Ashish Prajapati on 28/11/24.
//

import SwiftUI

struct SelectWaterIntakeView: View {
    
    @StateObject var vm = SelectWaterIntakeViewModel()
    @StateObject var dashboardVM: DashboardViewModel
    
    var body: some View {
        VStack{
            
            
            VStack{
                Text("I drink a Glass")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 35)
                
                glassView(imgName: "icon_water_glass")
            }
            .padding(.top, 60)
 
            
            VStack{
                Text("I drink a Bottle")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 35)
                
                bottleView(imgName: "icon_water_bottle")
            }
            .padding(.top, 100)
            
            
            Button(action: {
        
                if vm.totalGlassML != 0{
                    dashboardVM.setData(
                        data: ModelWaterIntake(
                            img: "icon_water_glass",
                            quantity: String(vm.totalGlassQuantity),
                            time: "time",
                            unit: String(vm.totalGlassML),
                            type: .Glass))
                }
                
                if vm.totalBootleML != 0{
                    dashboardVM.setData(
                        data: ModelWaterIntake(
                            img: "icon_water_bottle",
                            quantity: String(vm.totalBottleQuantity),
                            time: "time",
                            unit: String(vm.totalBootleML),
                            type: .Bottle))
                }
                
                dashboardVM.isPresentSheet = false
                
            }, label: {
                Text("ADD")
                    .frame(maxWidth:.infinity)
                    .frame(height: 29)
                    .font(.title3)

            })
            .buttonStyle(BorderedProminentButtonStyle.borderedProminent)
            .padding(.top, 50)
            .padding(45)
            
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .overlay(alignment: .topTrailing) {
            BtnCancel
//                .offset(x: 70)
        }
    }
    
    
    private var BtnCancel: some View{
        Button(action: {
            
            dashboardVM.isPresentSheet = false
            
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(10)
                .foregroundStyle(.black)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        })
    }
    
    func glassView(imgName: String) -> some View{
        return HStack(spacing: 40){
            
            VStack(spacing:25){
                Button(action: {
                    
                    vm.onClickGlass(pos: 0)
                    
                }, label: {
                    Image(imgName)
                        .resizable()
                        .frame(width: 52, height: 52)
                    
                
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrGlassClicks[0]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 78, height: 78)
                        
                }
                
                
                Text("200 mL")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
            
            VStack(spacing:25){
                
                Button(action: {
                    
                    vm.onClickGlass(pos: 1)
                    
                }, label: {
                    ZStack{
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                    
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 58)
                            .offset(x: 13, y: 0)
                            .zIndex(1.0)
                            
                            
                            
                    }
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrGlassClicks[1]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 78, height: 78)
                        .offset(x: 6, y: 0)
                        
                }
                
                Text("400 mL")
                    .offset(x: 6, y: 0)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
           
            
            
            VStack(spacing:25){

                Button(action: {
                    vm.onClickGlass(pos: 2)
                }, label: {
                    
                    ZStack{
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                    
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 62)
                            .offset(x: 13, y: 0)
                            .zIndex(1.0)
                            
                            
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                            .offset(x: 26, y: 0)
                            
                            
                    }
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrGlassClicks[2]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 88, height: 88)
                        .offset(x: 13, y: 0)
                        
                }
                
                Text("600 mL")
                    .offset(x: 13, y: 0)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
           
            
            
            
            
            
        }
    
    }
    
    func bottleView(imgName: String) -> some View{
        return HStack(spacing: 40){
            
            VStack(spacing:25){
                Button(action: {
                    
                    vm.onClickBottle(pos: 0)
                    
                }, label: {
                    Image(imgName)
                        .resizable()
                        .frame(width: 52, height: 52)
                    
                
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrBottleClicks[0]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 78, height: 78)
                        
                }
                
                
                Text("1 L")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
            
            VStack(spacing:25){
                
                Button(action: {
                    
                    vm.onClickBottle(pos: 1)
                    
                }, label: {
                    ZStack{
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                    
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 58)
                            .offset(x: 13, y: 0)
                            .zIndex(1.0)
                            
                            
                            
                    }
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrBottleClicks[1]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 78, height: 78)
                        .offset(x: 6, y: 0)
                        
                }
                
                Text("2 L")
                    .offset(x: 6, y: 0)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
            
           
            
            
            VStack(spacing:25){

                Button(action: {
                    vm.onClickBottle(pos: 2)
                }, label: {
                    
                    ZStack{
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                    
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 62)
                            .offset(x: 13, y: 0)
                            .zIndex(1.0)
                            
                            
                        
                        Image(imgName)
                            .resizable()
                            .frame(width: 52, height: 52)
                            .offset(x: 26, y: 0)
                            
                            
                    }
                })
                .overlay {
                    Circle()
                        .stroke(
                            vm.arrBottleClicks[2]
                            ? Color.colorPrimary
                            : Color.colorEmptyGray, lineWidth: 1.0)
                        .frame(width: 88, height: 88)
                        .offset(x: 13, y: 0)
                        
                }
                
                Text("3 L")
                    .offset(x: 13, y: 0)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
           
            
            
            
            
            
        }
    
    }
    
}

#Preview {
    SelectWaterIntakeView( dashboardVM: DashboardViewModel())
}
