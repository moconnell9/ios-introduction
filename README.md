# ios-introduction
Everything you need to get started coding an iOS application in Swift.

## Getting Started

1. With your Apple ID, make an Apple developer account. It is free to use Xcode and build apps locally- you are only required
    to pay an annual fee if you wish to publish on the App Store.
    - Go to `developer.apple.com` and go to the `Account` tab.
    - If you skip this step, you will see a "failure to create provisioning profile" error in Signing in your project.
2. Go to the App Store and download Xcode. You will need your Apple ID and password.
    - If your OS isn't up to date, Xcode may fail to install without telling you why. It is most likely because 
    the latest Xcode is not supported on your OS. You can get a previous version of Xcode by going to 
    `developer.apple.com/downloads`.
    
## Targeted Skills

This collection is organized into three tiers of information, based on how much time you may have.

### Essential
- [Get comfortable with the Xcode editor](./Xcode.md)
- [Begin learning the Swift language](./Swift.md)

### Recommended
- [Use the Storyboard editor and its Outlets](./Storyboards.md)
- [Install and use frameworks through Cocoapods](./Cocoapods.md)
- [Decode data from a file](./JSONHandling.playground)

### [Additional](./Additional.md)
- Design patterns, e.g. delegates, protocols
- Style Guide + Swiftlint
- Unit Testing with XCTest
- Bridging with Objective-C code

## FAQ

- Ray Wenderlich is the de facto authority on all things iOS - do yourself a favor and check out the guides and videos on https://www.raywenderlich.com.

### Nerdy articles
- Should I go [native or hybrid?](https://hackernoon.com/react-native-vs-real-native-apps-which-is-better-a8383d6f7ca5)
- How does [Swift](https://en.wikipedia.org/wiki/Swift_(programming_language)#Comparisons_to_other_languages) compare to other languages?
    - Swift highlights:
   	- It has a clean and modern syntax
	- offers seamless access to existing C and Objective-C code and frameworks
	- is memory safe by default
- How popular is Swift?
    - It is fairly high on the [TIOBE index](https://www.tiobe.com/tiobe-index/), updated monthly.
    - [Java vs. Swift vs. Python](https://stackshare.io/stackups/java-vs-swift-vs-python)
- [How object oriented is Swift?](https://skookum.com/blog/swift-blurs-the-lines-of-programming-paradigms)
	- you can subclass classes, and you can override functions in subclasses, but enums and structs are not really OO
- Do I need to purchase an Apple developer account?
    - You do not need a developer account to develop in Xcode and use the device simulator.
    - A Developer account lets you run your app on a real device and publish to the app store.
- Why did you include style? Is style checking really that important?
    - Fun fact, consistent indentation style is one of the most statistically significant indicators of [low bug density](https://books.google.com/books?id=hjEFCAAAQBAJ&pg=PR22&lpg=PR22&dq=Consistent+indentation+style+is+one+of+the+most+statistically+significant+indicators+of+low+bug+density.&source=bl&ots=T7eLrGZFOo&sig=2WnH3QqMLJntoIyfPnQC2jg86no&hl=en&sa=X&ved=2ahUKEwjb6O-d84PdAhVQX60KHUzTAOwQ6AEwAHoECAAQAQ#v=onepage&q=Consistent%20indentation%20style%20is%20one%20of%20the%20most%20statistically%20significant%20indicators%20of%20low%20bug%20density.&f=false)
    - Swiftlint [helps enforce best practices.](https://theswiftpost.co/using-swiftlint-and-danger-for-swift-best-practices/)

### Really useful links
- Can I please just download an example project and start there?
	- In addition to the Storyboard tutorial and file decoding example above, here is a nice variety of [30 Example Projects](https://github.com/soapyigu/Swift-30-Projects)
- How is the documentation?
    - Pretty darn thorough:
        - [Swift documentation](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
        - [Apple frameworks](https://developer.apple.com/documentation/)


