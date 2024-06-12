//
//  TaskViewModel.swift
//  TaskList
//
//  Created by user254330 on 6/12/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class TaskViewModel : ObservableObject {
    
    @Published var tasks = [TaskModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.tasks.removeAll()
        db.collection("tasks")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                }
                else {
                    for document in querySnapshot!.documents {
                        do {
                            self.tasks.append(try document.data(as: TaskModel.self))
                        }
                        catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    func addData(task: TaskModel)
    {
        var ref: DocumentReference? = nil
        ref = db.collection("tasks").addDocument(data: [
            "taskName": task.taskName,
            "dueDate": task.dueDate
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            }
            else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func deleteData(task: TaskModel)
    {
        db.collection("tasks").document(task.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            }
            else {
                print("Document removed successfully!")
            }
        }
    }
}
