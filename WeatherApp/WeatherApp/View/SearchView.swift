//
//  SearchView.swift
//  WeatherApp
//
//  Created by Vijaya Lakshmi on 9/28/24.
//

import SwiftUI
struct SearchView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vmObj = WeatherViewModel()
    @Binding var text: String
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(.all) // Fills the entire screen, including safe area
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HStack {
                    SearchTextField(text: $text, onSubmit: {
                                         dismiss()
                    }).frame(height: 40)
                }
                .padding(.horizontal)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                Spacer()
            }
        }
    }
}

