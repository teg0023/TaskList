//
//  ContentView.swift
//  TaskList
//
//  Created by user254330 on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskvm = TaskViewModel()
    @State var newTask = TaskModel(taskName: "", dueDate: "")
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    TaskListView(tasks: taskvm.tasks)
                } label: {
                    Text("Task List")
                }
                Section {
                    NavigationLink {
                        NewTaskView(task: $newTask)
                    } label: {
                        Text("New Task")
                    }
                }
            }
            .onAppear {
                taskvm.fetchData()
                newTask.taskName = ""
                newTask.dueDate = ""
            }
            .navigationTitle("Task List App")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
