# Swift

Please see [JSONHandling.playground](JSONHandling.playground) for a quick-to-work demonstration that includes the below concepts.

[Apple's documentation for Swift](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html) is very good- be sure to check it out! The below are just some highlights.

- [Swift](#swift)
  * [Let vs. Var](#let-vs-var)
  * [Optional variables](#optional-variables)
    + ['If let' vs. 'guard let'](#-if-let--vs--guard-let-)
    + [Force-unwrapping](#force-unwrapping)
  * [Try, Try?, Try!](#try--try---try-)
  * [Constants](#constants)
  * [Class functions vs. Instance functions](#class-functions-vs-instance-functions)
  * [Inout functions (pointer equivalent)](#inout-functions--pointer-equivalent-)

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
var toolbox: [String: String]?
...
toolbox = ["hammer" : "Stanley 5oz. Pro", "screwdriver" : "Craftsman 9-31794 Slotted Phillips"]
        
//PREFERRED: 'guard let'
func guardHammerFunc() {
    guard let hammerType = toolbox?["hammer"] else { return }
    print("I have a \(hammerType) hammer in my toolbox")
}

//'if let'
func letHammerFunc() {
    if let hammerType = toolbox?["hammer"] {
        print("I have a \(hammerType) hammer in my toolbox")
    }
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

***WRONG.*** **Force unwrapping is unsafe and is generally considered bad practice.** Swiftlint will fail your build if you use it anywhere other than UIOutlets or try-catch statements.

In this example, if the key "hammer" is not in the dictionary, the entire app crashes. (This is very bad.)

When you force-unwrap, you are making a guarantee to the compiler that you know better than it does, and that you are 100% sure the value will be there. If you are wrong, your app crashes. That's it- so use sparingly.

## Try, Try?, Try!

Of course you don't want to leave your app open to the possibility of crashing. As a developer, you handle the edge cases, errors and exceptions and decide ahead of time what to do next.

[This article](https://medium.com/@JoyceMatos/error-handling-in-swift-3-try-try-and-try-f19705e32ff4) does a great job of explaining how to use try/catch statements in Swift, and the differences between optional try and forced try.

## Constants

In line with our earlier conversation about force unwrapping, constants are another way to ensure that your code is as strongly typed (and least susceptible to crashing) as possible. By defining string literal constants in one place and using variable references everywhere else, we minimize code duplication and the risk of creating a typo that is very difficult to find.

Enums and structs are commonly used for this purpose in Swift.
```
struct Constants {
    static let userAppGroup = "B672DS45"
    static let pathToJSON = "path/to/file"
    
    struct Tables {
        static let tools = "tools__c" //e.g. these fieldnames are how Salesforce custom fields are structured
        static let accessories = "accessories__c"
        
        struct ToolsKeys {
            static let hammer = "hammer__c"
            static let wrench = "wrench__c"
            static let screwdriver = "screwdriver__c"
        }
    }
}
```

## Class functions vs. Instance functions

Syntax for a class function:
```
MyClass {
    class func myFunc() {
        <code>
    }
}

//implementation
let result = MyClass.myFunc()
```

Instance function:
```
MyClass {
    func myFunc() {
        <code>
    }
}

//implementation
let instance = MyClass()
let result = instance.myFunc()
```
## Inout functions (pointer equivalent)

![types](https://cdn-images-1.medium.com/max/1600/1*6aJyC6_MrCRjdIAgXxAxkQ.png)
<br/>[Value vs. Reference types in Swift](https://medium.com/@abhimuralidharan/difference-between-value-type-and-a-reference-type-in-ios-swift-18cb5145ad7a)

<br/>You normally will not need to pass objects as pointers in Swift, but it can be done, and is occasionally more elegant. In this example we are simply rearrainging an object's elements.
```
Sorter.sortNames(&names)

...
private class Sorter {
    public class func sortNames(_ names: inout [String]) {
        names.sort { 
            <sort implementation>
        }
    }                
}               
