//
//  NewTaskView.swift
//  TaskList
//
//  Created by user254330 on 6/12/24.
//

import SwiftUI

struct NewTaskView: View {
    
    @StateObject var tskvm = TaskViewModel()
    @Binding var task : TaskModel
    
    var body: some View {
        VStack {
            TextField("Enter a due date (yyyy/MM/dd):", text: $task.dueDate)
                .font(.system(size: 25))
                .fontWeight(.bold)
            TextField("Enter the name of a task:",text: $task.taskName)
                .font(.system(size: 20))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    tskvm.addData(task: task)
                } label: {
                    Text("Add New Task")
                }
            }
        }
    }
}
