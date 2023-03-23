import Cocoa

enum TextAlignment: Int {
    case left = 20
    case right = 30
    case center = 40
    case justify = 50
}
var alignment = TextAlignment.justify

TextAlignment.left.rawValue
TextAlignment.right.rawValue
TextAlignment.center.rawValue
TextAlignment.justify.rawValue
alignment.rawValue

//creat a raw value
let myRawValue = 20
//try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    //conversion succeeded
    print("successfully created \(myAlignment) from \(myRawValue)")
} else {
    //conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}


switch alignment {
case .left:
        print("left aligned")
case .right:
        print("right aligned")
case .center:
        print("center aligned")
case .justify:
        print("justified")
}

enum ProgrammingLanguage: String {
    case swift
    case objectiveC = "objective-c"
    case c
    case cpp = "c++"
    case java
}

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")

enum LightBulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        //the "self" inside of this method is used to accessed the instance: LightBulb
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
            
        }
    }
}

var bulb = LightBulb.on
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature )")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")


enum ShapeDimensions {
    //point has no associated value - it is dimensionless, remember to add this line below to add a member of case in the scope, otherwise there will be an error
    case point
    //square's accociated value is the length of one side
    case square(side: Double)
    //rectangle's accpciated value defines its width and height
    case rectangle(width: Double, height: Double)
    case perimeter(width: Double, height: Double)
    
   
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: side):
            return side * side
        case let .rectangle(width: w, height: h):
            return w * h
        case let .perimeter(width: w, height: h):
            return (w + h) * 2
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var recShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point
var periShape = ShapeDimensions.perimeter(width: 3.0, height: 6.0)
 
print("square's area = \(squareShape.area())")
print("rectangle's area = \(recShape.area())")
print("point's area = \(pointShape.area())")
print("perimeter's area = \(periShape.area())")


enum FamilyTree {
    case noKnownParents
    indirect case oneKnownParent(name: String, ancestors: FamilyTree)
    indirect case twoKnownParents(fatherName: String,
                         paternalAncestors: FamilyTree,
                         motherName: String,
                         maternalAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.twoKnownParents(fatherName: "Fred Sr.", paternalAncestors: .oneKnownParent(name: "Beth", ancestors: .noKnownParents), motherName: "Marsha", maternalAncestors: .noKnownParents)
print(fredAncestors)
