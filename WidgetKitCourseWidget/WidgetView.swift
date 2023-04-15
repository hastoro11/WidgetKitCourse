//
//  WidgetView.swift
//  WidgetKitCourseWidgetExtension
//
//  Created by Gabor Sornyei on 2023. 04. 15..
//

import WidgetKit
import SwiftUI

struct WidgetView: View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.date, style: .time)
    }
}
