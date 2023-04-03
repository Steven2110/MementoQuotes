//
//  ContentView.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 20.03.2023.
//

import SwiftUI
import UIKit

struct QuoteGeneratorView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var vm: CaretakerViewModel = CaretakerViewModel(
        originator: Originator(
            quote: DefaultQuote.quote,
            image: DefaultImage.image
        )
    )
    
    var backgroundTextColor: Color {
        colorScheme == .light ? Color.white.opacity(0.5) : Color.gray.opacity(0.5)
    }
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationView {
            VStack {
                quoteView
                    .padding(.bottom)
                HStack(spacing: 10) {
                    Button {
                        vm.undo()
                    } label: {
                        undoButton
                    }.background(Capsule().stroke(gradient, lineWidth: 2))
                    Button {
                        vm.generate()
                    } label: {
                        generateButton
                    }.background(Capsule().stroke(gradient, lineWidth: 2))
                    Button {
                        vm.next()
                    } label: {
                        revertUndoButton
                    }.background(Capsule().stroke(gradient, lineWidth: 2))
                }
            }
            .navigationTitle("Quote Generator")
            .toolbar {
                Button {
                    let image = quoteView.asUIImage()
                    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

extension QuoteGeneratorView {
    private var quoteView: some View {
        ZStack {
            Image(uiImage: vm.image)
                .resizable()
                .scaledToFill()
                .frame(width: 500, height: 400)
                .clipped()
            VStack(spacing: 10) {
                Text(vm.quote.content)
                    .font(.title2)
                    .minimumScaleFactor(0.80)
                    .bold()
                    .padding()
                    .background(backgroundTextColor)
                Text("~ \(vm.quote.author) ~")
                    .font(.title3)
                    .bold()
                    .padding()
                    .background(backgroundTextColor)
            }
            .frame(maxWidth: 350, maxHeight: 300)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private var undoButton: some View {
        Text("Undo")
            .font(.title2)
            .foregroundColor(.orange)
            .padding(.vertical, 5)
            .padding(.horizontal)
    }
    
    private var generateButton: some View {
        Text("Generate")
            .font(.title2)
            .foregroundColor(.red)
            .padding(.vertical, 5)
            .padding(.horizontal)
    }
    
    private var revertUndoButton: some View {
        Text("Revert Undo")
            .font(.title2)
            .foregroundColor(.yellow)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.vertical, 5)
            .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteGeneratorView()
    }
}
