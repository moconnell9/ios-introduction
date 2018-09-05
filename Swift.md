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
