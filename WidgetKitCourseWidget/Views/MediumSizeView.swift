//
//  MediumSizeView.swift
//  WidgetKitCourseWidgetExtension
//
//  Created by Gabor Sornyei on 2023. 04. 15..
//

import SwiftUI
import WidgetKit

struct MediumSizeView: View {
    var entry: SimpleEntry
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("todo title")
                        .font(.headline)
                    Text("Completed")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
        } label: {
            Label("My Todos", systemImage: "list.dash")
        }
        .widgetURL(URL(string: "myapp://todo/1"))
    }
}


struct Previews_MediumSizeView_Previews: PreviewProvider {
    static var previews: some View {
        MediumSizeView(entry: Provider.Entry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
