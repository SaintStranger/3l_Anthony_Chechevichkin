//
//  main.swift
//  3l_Anthony_Chechevichkin
//
//  Created by Katerina on 07.07.2020.
//  Copyright © 2020 CHAS. All rights reserved.
//

import Foundation

enum brandCar {
    case Ferrari, McLaren, Mercedes, Peterbilt, Freightliner, Volvo
}

enum engineMode: String {
    case turnOn = "Двигатель работает", turnOff = "Двигатель выключен"
}

enum windowsMode: String {
    case opened = "Окна открыты", closed = "Окна закрыты"
}

struct Car {
    var brand: brandCar
    var year: Int
    var emptytrunkSize: Double
    var engine: engineMode
    var windows: windowsMode
    var cargoSize: Double
    
    mutating func changingEngineMode() {
        switch engine {
        case .turnOn:
            self.engine = .turnOff
        case .turnOff:
            self.engine = .turnOn
        }
    }
    
    mutating func changingWindowsMode() {
        switch windows {
        case .opened:
            self.windows = .closed
        case .closed:
            self.windows = .opened
        }
    }
    
    
    init(brand: brandCar, year: Int, emptytrunkSize: Double, engine: engineMode, windows: windowsMode, cargoSize: Double = 0.0) {   // То есть для того, чтобы прописать хотя бы одно значение по молчанию, необходимо описывать всю структуру целиком?
        self.brand = brand
        self.year = year
        self.emptytrunkSize = emptytrunkSize
        self.engine = engine
        self.windows = windows
        self.cargoSize = cargoSize
    }
}


struct Truck {
    var brand: brandCar
    var year: Int
    var emptytrunkSize: Double
    var engine: engineMode
    var windows: windowsMode
    var cargoSize: Double
    
    
    mutating func load () {
        emptytrunkSize = emptytrunkSize - cargoSize
    }
    
    mutating func unLoad () {
        emptytrunkSize = emptytrunkSize + cargoSize
    }
    
    
    init(brand: brandCar, year: Int, emptytrunkSize: Double, engine: engineMode, windows: windowsMode, cargoSize: Double = 0.0) {
        self.brand = brand
        self.year = year
        self.emptytrunkSize = emptytrunkSize
        self.engine = engine
        self.windows = windows
        self.cargoSize = cargoSize
    }

}


var firstCar = Car(brand: .Ferrari, year: 1987, emptytrunkSize: 20.0, engine: .turnOn, windows: .closed, cargoSize: 3.7)

print("Старая добрая \(firstCar.brand) \(firstCar.year) года выпуска. \(firstCar.engine.rawValue), \(firstCar.windows.rawValue)")

firstCar.changingEngineMode()
firstCar.changingWindowsMode()

print("Старая добрая \(firstCar.brand) \(firstCar.year) года выпуска. \(firstCar.engine.rawValue), \(firstCar.windows.rawValue)")

var secondCar = Car(brand: .McLaren, year: 2010, emptytrunkSize: 15.0, engine: .turnOff, windows: .closed)
var firstTruck = Truck(brand: .Freightliner, year: 1995, emptytrunkSize: 200.0, engine: .turnOn, windows: .opened, cargoSize: 197.2)

print("В модели грузовика \(firstTruck.brand) \(firstTruck.year) года выпуска общая вместимость багажника \(firstTruck.emptytrunkSize) т")

firstTruck.load()

print("После загрузки \(firstTruck.cargoSize) т у грузовика останется еще \(firstTruck.emptytrunkSize) т")



//  Прошу прощения, что высылаю достаточно поздно. Как всегда работа отвлекает))
//  Я долго "Въезжал" в работу свитча в структуре. Собственно, я так до конца и не понял, может ли ассоциативное значение принимать другой тип кроме стринга?  У меня была задумка сделать загрузку/разгрузку через свитч, и в енаме кейсам прописать значение "Полный багажник = полный багажник - вес груза". Теперь я понимаю, что по сути это попытка записать в кейс функцию, так вообще можно?)))
//  В любом случае загрузку/разгрузку оставил в двух разных фунциях.


