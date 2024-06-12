//
//  TaskModel.swift
//  TaskList
//
//  Created by user254330 on 6/12/24.
//

import Foundation
import FirebaseFirestoreSwift

struct TaskModel : Codable, Identifiable {
    @DocumentID var id: String?
    var taskName: String
    var dueDate: String
}
