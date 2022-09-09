//
//  OnBoardingView.swift
//  Restart
//
//  Created by Mobarak Hossen on 1/9/22.
//

import SwiftUI

struct OnBoardingView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive:Bool = true
    
    @State var buttonWidth :CGFloat = UIScreen.main.bounds.size.width - 80
    @State var buttonOffset :CGFloat  = 0
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing:20){
                
                Spacer()
                VStack(spacing:0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("""
                        Its not how much we give but
                        how much love we put into giving
                        """)
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,10)
                }
                ZStack{
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                
                Spacer()
                
                ZStack{
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width:80)
                        Spacer()
                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24,weight: .bold))
                            
                        }.foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x:buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged{ gesture in
                                        
                                        if gesture.translation.width>0 && buttonOffset <= buttonWidth - 80{
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                    .onEnded{ _ in
                                        
                                        if buttonOffset>buttonWidth/2{
                                            
                                            buttonOffset = buttonWidth - 80
                                            isOnBoardingViewActive = false
                                        }else{
                                            buttonOffset = 0
                                        }
                                    }
                            )
                        Spacer()
                    }
                    
                }.frame(width:buttonWidth, height: 80, alignment: .center)
                    .padding()
            }
        }
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
