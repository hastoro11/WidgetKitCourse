//
//  Provider.swift
//  WidgetKitCourse
//
//  Created by Gabor Sornyei on 2023. 04. 15..
//

import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = SimpleEntry
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todos: [.placeholder(0), .placeholder(1)])
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        Task {
            do {
                let allTodos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(allTodos.prefix(5))
                let entry = SimpleEntry(date: Date.now, todos: fiveTodos)
                completion(entry)
            } catch {
                completion(SimpleEntry(date: .now, todos: [.placeholder(0)]))
            }
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            do {
                let allTodos = try await TodoService.shared.getAllTodos()
                let fiveTodos = Array(allTodos.prefix(5))
                let entry = SimpleEntry(date: .now, todos: fiveTodos)
                
                let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60*30)))
                completion(timeline)
            } catch {
                let entries = [SimpleEntry(date: .now, todos: [Todo.placeholder(0)])]
                let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 30*60)))
                completion(timeline)
            }
        }
        
    }
}
