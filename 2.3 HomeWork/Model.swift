//
//  Model.swift
//  2.3 HomeWork
//
//  Created by Елена Лазука on 06.02.2021.
//

import Foundation

struct User {
    let name: String
    let password: String
    let person: Person
    let hobbies: Hobbies
    
    static func getUserData() -> User {
        User(
            name: "User",
            password: "Password",
            person: Person(name: "Alena", sureName: "Ilysova", age: 28, job: "национальный центр вертолетостроения"), hobbies: Hobbies(hobby:"танцы, нейропсихология", description: "преподаю танцы деткам и практиуюсь на мастер классах, изучаю научно-популярную литературу и смотрю лекции"))
    }
   
    
}

struct Person{
    let name: String
    let sureName: String
    let age: Int
    let job: String
    
    var fullName: String {
        "\(name) \(sureName)"
    }
}

struct Hobbies {
    let hobby: String
    let description: String
    
    var aboutHobbies: String {
        "\(hobby) \(description)"
    }
  
}

