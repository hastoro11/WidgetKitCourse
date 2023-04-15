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
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetKitCourseWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
