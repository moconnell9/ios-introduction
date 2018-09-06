# Swift

## Let vs. Var

A **'let'** variable is a constant, and cannot be changed.
A **'var'** variable is mutable.

**Declare** any variable with either let or var, followed by the type:

```var toolbox: [String] //array of strings```

Similar to javascript, variables in Swift use type inference. We do not need to specify the type when **assigning** to a variable in order for the compiler to figure it out.

```let toolbox = ["hammer", "screwdriver", "wrench"]```

Of course, if we want to specify the type, we can:

```let toolbox: [String] = ["hammer", "screwdriver", "wrench"]```

## Optional variables

[Optionals](https://en.wikipedia.org/wiki/Option_type) are a great tool in Swift. If a variable is optional, it can either hold a value **OR** it can be nil. (NULL does not exist in Swift- can be referenced from Obj-C as NSNull)

```var toolbox: [String]?```

> ? denotes an optional variable. 
> ! denotes a force unwrapping of an optional.

Optionals help guide you on the path to gracefully handling edge cases and error conditions. If you try to access an optional variable without any checks, the compiler will yell at you. 

### 'If let' vs. 'guard let'


'Guard let' is preferred because it reduces the level of nestedness in code, compared to 'if let'. There are use cases for both.

```
//let's use a dictionary this time
var toolbox = ["hammer" : "Stanley 5oz. Pro", "screwdriver" : "Craftsman 9-31794 Slotted Phillips"]
        
//PREFERRED: 'guard let'
guard let hammer = toolbox?["hammer"] else { return }
print("I have a %@ hammer in my toolbox", hammer)

//'if let'
if let hammer = toolbox?["hammer"] {
    print("I have a %@ hammer in my toolbox", hammer)
}
```

Many types of statements can be combined in Swift:
```
if let hammer = toolbox?["hammer"], wrench = toolbox?["wrench"] {
    print("I have a hammer AND a wrench in my toolbox!")
}
```
In this example, we can clearly see the keys are in the dictionary. But when a dictionary is populated at runtime, e.g. from a database or JSON file, we cannot be 100% certain the expected keys were found.

### Force-unwrapping

```let hammer = toolbox!["hammer"]```

Hey, that is much shorter, and the compiler still shut up! Cool, right?

***WRONG.*** **Force unwrapping is considered bad practice.** Swiftlint will fail your build if you use it anywhere other than UIOutlets or try-catch statements.

In this example, if the key "hammer" is not in the dictionary, the entire app crashes. This is very bad.

When you force-unwrap, you are making a guarantee to the compiler that you know better than it does, and that you are 100% sure the value will be there. If you are wrong, your app crashes. That's it.

## Try, Try?, Try!

Of course you don't want to leave your app open to the possibility of crashing. As a developer, you handle the edge cases, errors and exceptions and decide ahead of time what to do next.

[This article](https://medium.com/@JoyceMatos/error-handling-in-swift-3-try-try-and-try-f19705e32ff4) does a great job of explaining how to use try/catch statements in Swift, and the differences between optional try and forced try.

## Constants

In line with our earlier conversation about force unwrapping, constants are another way to ensure that your code is as strongly typed (and least susceptible to crashing) as possible. By defining string literal constants in one place and using variable references everywhere else, we minimize code duplication and the risk of creating a typo that is very difficult to find.

Enums and structs are commonly used for this purpose in Swift.
```
//Constants.swift

struct Constants
    let userAppGroup = "B672DS45"
    let pathToJSON = "path/to/file"
    
    struct databaseConstants {
        let toolTable = "tool__c" //e.g. these fieldnames are how Salesforce custom fields are structured
        let nameField = "name__c"
        let typeField = "type__c"
        
        struct databaseKeys {
            let hammer = "hammer__c"
            let wrench = "wrench__c"
        }
    }
}

//sample.json
{
    "tools": {
        "hammer": "Stanley 5oz. Pro",
        "screwdriver": "Craftsman 9-31794 Slotted Phillips"
    },
    ...
}


//JSONHandler.swift

typealias Keys = Constants.databaseConstants.databaseKeys
var json: Any?

public init(pathAsString: String) { //pass in the filepath of the JSON
    var tempData: Data = Data()
    do {
        tempData = try Data(contentsOf: URL(fileURLWithPath: pathAsString))
    }
    catch {
        print(error.localizedDescription)
    }
    self.data = tempData
    self.json = try? JSONSerialization.jsonObject(with: self.data)
}

public func getTools() {
    if let dictionary = json as? [String: Any] {
        if let hammer = toolbox?[Keys.hammer], wrench = toolbox?[Keys.wrench] {
            print("I have a hammer AND a wrench in my toolbox!")
        }
    }
}

//Main.swift
let jsonHandler = JSONHandler(pathAsString: Constants.pathToJSON)
jsonHandler.getTools()
````
