//
//  main.swift
//  4I_DonskayaEkaterina
//
//  Created by Ekaterina Donskaya on 08/07/2020.
//  Copyright © 2020 Ekaterina Donskaya. All rights reserved.
//

import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести значения свойств экземпляров в консоль.


enum DoorPosition {
    case open, close
}

enum Transmission {
    case manual, auto
}

class Car: CustomStringConvertible {
        
    let model: String
    let year: Int
    var transmission: Transmission
    var doors: DoorPosition
    var km: Double
    
    init(model: String, year: Int, transmission: Transmission, doors: DoorPosition, km: Double) {
        self.model = model
        self.year = year
        self.transmission = transmission
        self.doors = doors
        self.km = km
    }
    
    func ManualTransmission() {
        transmission = .manual
    }
    func AutomaticTransmission() {
        transmission = .auto
    }

    var description: String {
        get {
            return ("model: \(model), year: \(year), transmission: \(transmission), doors: \(doors), km: \(km)")
        }
    }
    
}


enum TruckTypes {
    case dump, garbage, logCarrier, refrigerator, tractor
}

enum AutotruckLoad: Int {
    case fullTruckLoad = 3000
    case lowTruckLoad = 1000
    case fullContainerLoad = 2000
}

class TrunkCar: Car {
    let truckType: TruckTypes
    var truckload: AutotruckLoad {
        willSet {
            if newValue == .fullTruckLoad {
                print("Грузовик загружен полностью")
            } else if newValue == .fullContainerLoad {
                print("Заполнен один контейнер")
            } else {
               print("Еще есть место для груза")
            }
        }
    }
    
    init(model: String, year: Int, transmission: Transmission, doors: DoorPosition, km: Double, truckType: TruckTypes, truckload: AutotruckLoad) {
        self.truckType = truckType
        self.truckload = truckload
        
        super.init(model: model, year: year, transmission: transmission, doors: doors, km: km)
    }
    
    override func AutomaticTransmission() {
        super.AutomaticTransmission()
        print("Можно выбрать только механическую коробку передач")
        transmission = .manual
    }
    
    override var description: String {
        get {
            return ("model: \(model), year: \(year), transmission: \(transmission), doors: \(doors), km: \(km), truckType: \(truckType), trackload: \(truckload)")
        }
    }
}


enum ModelType{
    case coupe, roadster
}

enum SportSpeed {
    case turboS, superS
}

class SportCar: Car {
    var speed: SportSpeed
    var typeOfModel: ModelType
    
    init(model: String, year: Int, transmission: Transmission, doors: DoorPosition, km: Double, speed: SportSpeed, typeOfModel: ModelType) {
        self.speed = speed
        self.typeOfModel = typeOfModel
        
        super.init(model: model, year: year, transmission: transmission, doors: doors, km: km)
        
    }
       
    func turboSpeed() {
        speed = .turboS
    }
    
    func superSpeed() {
        speed = .superS
    }
    
    override func AutomaticTransmission() {
        super.AutomaticTransmission()
        print("Роботизированная коробка передач")
    }
    
    override func ManualTransmission() {
        super.ManualTransmission()
        print("Механическая 6-и ступенчатая коробка передач")
    }
    
    override var description: String {
        get {
            return ("model: \(model), year: \(year), transmission: \(transmission), doors: \(doors), km: \(km), speed: \(speed), typeOfModel: \(typeOfModel)")
        }
    }
}

var scania = TrunkCar(model: "Scania", year: 2010, transmission: .manual, doors: .close, km: 200000, truckType: .dump, truckload: .lowTruckLoad)
scania.AutomaticTransmission()
scania.truckload = .fullTruckLoad
print(scania)

var zil = TrunkCar(model: "ЗИЛ", year: 1995, transmission: .manual, doors: .close, km: 100000, truckType: .logCarrier, truckload: .fullTruckLoad)
zil.doors = .open
zil.truckload = .lowTruckLoad
print(zil)

var honda = SportCar(model: "Honda", year: 2020, transmission: .manual, doors:
    .open, km: 0.0, speed: .superS, typeOfModel: .coupe)
honda.AutomaticTransmission()
honda.turboSpeed()
print(honda)

var tesla = SportCar(model: "Tesla", year: 2020, transmission: .auto, doors: .close, km: 100, speed: .superS, typeOfModel: .roadster)
tesla.ManualTransmission()
tesla.speed = .turboS
print(tesla)
