//
//  LargeSizeView.swift
//  WidgetKitCourseWidgetExtension
//
//  Created by Gabor Sornyei on 2023. 04. 15..
//

import SwiftUI
import WidgetKit

struct LargeSizeView: View {
    var entry: SimpleEntry
    
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text("My Todos")
                Text(Date.now, format: .dateTime)
                Spacer()
            }
            .padding(8)
            .background(.blue)
            .foregroundColor(.white)
            .clipped()
            .shadow(radius: 5)
            
            ForEach(0..<6, id:\.self) { id in
                Link(destination: URL(string: "myapp://todo/\(id)")!) {
                    HStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 30, height: 30)
                            .overlay {
                                if true {
                                    Image(systemName: "checkmark")
                                }
                        }
                        
                        Text("todo title")
                        
                        Spacer()
                        
                        
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
            
            Spacer()
        }
        
       
    }
}


struct Previews_LargeSizeView_Previews: PreviewProvider {
    static var previews: some View {
        LargeSizeView(entry: SimpleEntry(date: Date.distantFuture))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
