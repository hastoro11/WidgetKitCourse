//
//  WidgetKitCourseWidget.swift
//  WidgetKitCourseWidget
//
//  Created by Gabor Sornyei on 2023. 04. 15..
//

import WidgetKit
import SwiftUI

struct WidgetKitCourseWidget: Widget {
    let kind: String = "WidgetKitCourseWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Todos")
        .description("View your latest todo(s).")
    }
}

struct WidgetKitCourseWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
