# ios-introduction
Everything you need to get started coding an iOS application in Swift.

# FAQ

- Should I go [native or hybrid?](https://hackernoon.com/react-native-vs-real-native-apps-which-is-better-a8383d6f7ca5)
    - https://stackshare.io/stackups/java-vs-swift-vs-python
- Do I need to purchase an Apple developer account?
    - A Developer account lets you run your app on a real device and publish to the app store. You can still develop in Xcode and use the simulator for free.
- How popular is Swift?
    - Well, it is #11 on the [TIOBE index](https://www.tiobe.com/tiobe-index/)
- Is style checking really important?
    - Consistent indentation style is one of the most statistically significant indicators of [low bug density](https://books.google.com/books?id=hjEFCAAAQBAJ&pg=PR22&lpg=PR22&dq=Consistent+indentation+style+is+one+of+the+most+statistically+significant+indicators+of+low+bug+density.&source=bl&ots=T7eLrGZFOo&sig=2WnH3QqMLJntoIyfPnQC2jg86no&hl=en&sa=X&ved=2ahUKEwjb6O-d84PdAhVQX60KHUzTAOwQ6AEwAHoECAAQAQ#v=onepage&q=Consistent%20indentation%20style%20is%20one%20of%20the%20most%20statistically%20significant%20indicators%20of%20low%20bug%20density.&f=false)
- [How object oriented is Swift?](https://skookum.com/blog/swift-blurs-the-lines-of-programming-paradigms)
	- you can subclass classes, and you can override functions in subclasses, but enums and structs are not really OO
- What is a workspace?
    - Xcode 3 introduced the subproject, which is a parent-child relationship, e.g. the parent can reference its child target, but not vice versa
    - Xcode 4 introduced the workspace, which is a sibling relationship, meaning that any project can reference projects in the same workspace
