Below are java equivalents to the Swift example code snippets given.

A free online java compiler is a great tool to start playing with java: https://www.tutorialspoint.com/compile_java_online.php

## Let vs. Var

In Java, types must be specified when declaring a variable. 
Instead of "let" we can use "static" in front of the type to make it immutable.

```
private static double pi = 3.14;
private static String toolbox;
```

```
String[] toolbox = {"hammer", "screwdriver", "wrench"};
for (String tool: toolbox) {
    System.out.println(tool);
}
```



## Optional variables

Optionals are a modern solution/replacement for null checking.

```
private static void myFunc(String[] toolbox) {
    if (toolbox != null) {
       //do stuff
    }
}

```
Java 8 and above does support optionals:
```
Optional<String[]> toolbox = Optional.empty();
```


