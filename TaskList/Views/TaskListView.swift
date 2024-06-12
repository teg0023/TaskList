//
//  TaskListView.swift
//  TaskList
//
//  Created by user254330 on 6/12/24.
//

import SwiftUI

struct TaskListView: View {
    
    var tasks : [TaskModel]
    @StateObject var tskvm = TaskViewModel()
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                Group {
                    Text("Task: \(task.taskName)\n\n Due Date: \(task.dueDate)")
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        tskvm.deleteData(task: task)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
        }
    }
}
