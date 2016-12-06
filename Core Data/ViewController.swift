//
//  ViewController.swift
//  Core Data
//
//  Created by Amreth on 12/6/16.
//  Copyright © 2016 Amreth. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let student:Student=Student(context: DatabaseController.getContext())
        student.firstName = "Amreth"
        student.lastName = "Lida"
        let course:Course=Course(context: DatabaseController.getContext())
        course.courseName = "iOS"
        course.addToStudent(student)
        
        student.addToCourse(course)
        // Save to core data
        DatabaseController.saveContext()
        
        // Read
        // Create request to context to read data
        // Select * from Student
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        // Get result
        let result = try? DatabaseController.getContext().fetch(request)
        
        // loop
        for stu in result as! [Student]{
            print(stu.firstName!)
            print(stu.lastName!)
//            for (index, cou) in (stu.course?.enumerated())!{
//                print(cou.cour)
//                
//            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

