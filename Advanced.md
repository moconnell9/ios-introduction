Here I leave you some tidbits and articles I find interesting, that may or may not be useful to you.

## Design Patterns
[Design Patterns - Ray Wenderlich](https://www.raywenderlich.com/477-design-patterns-on-ios-using-swift-part-1-2)
- great overview from Ray Wenderlich aka Internet Lord of all things Swift

### Using delegates

There are two things you need to do to use delegates. Delegates are great and easy to use.
Again, don't be afraid to reference [official documentation.](https://developer.apple.com/documentation/uikit/uitextfielddelegate)
1. Add the delegate to the view controller declaration:
```
@interface ViewController : UIViewController <UITextFieldDelegate>
```
2. override and implement the delegate functions you would like to use.
```
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}
 
- (void)textFieldDidBeginEditing:(UITextField *)textField{           
    NSLog(@"textFieldDidBeginEditing");
}
```

That's it! Now when a text field is tapped in your view, your code is automatically called and executed. (Here, the background color is changed.)

### Protocol-Oriented Programming (POP)

Protocols are basically interfaces that can have sibling relationships, not just parent-child. They are commonly referred to as "blueprints" because you can mix and match them with other implementations as necessary.
> [All about protocols](https://www.raywenderlich.com/814-introducing-protocol-oriented-programming-in-swift-3)

### UI Design Patterns
[Comparing MVC, MVP, MVVM - Understanding Common UI Design Patterns](https://www.linkedin.com/pulse/understanding-difference-between-mvc-mvp-mvvm-design-rishabh-software/))
- Take a quick look at these simple diagrams, which explain why they are many-1, 1-1, and 1-many, respectively.

## Style Guide
At the risk of being totally overwhelming, if you are interested in the nitty gritty details about best practices in Swift check out Ray's [Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
> "Our overarching goals are clarity, consistency and brevity, in that order."

### Swiftlint

[Swiftlint](Build Phases -> Run Script) is a sophisticated linter that helps enforce best practices even beyond basic formatting, such as keeping functions and files relatively short in scope and using ```isEmpty``` over ```== 0``` when available.

1. Add Swiftlint to your Podfile. (see the page on cocoapods)
2. Add a yml file to the same directory as your xcodeproj file.
3. Add a script to your target Build Phases -> Run Script (see the page on Xcode, build settings)
```
//.swiftlint.yml

disabled_rules:
- trailing_whitespace
- mark
- cyclomatic_complexity

opt_in_rules:
- empty_count
- empty_string
- switch_case_on_newline

statement_position:
  statement_mode: uncuddled_else

line_length:
  warning: 160
  error: 200

excluded:
- Carthage
```

```
//under Build Phases -> Run Script -> Shell: /bin/sh

if which swiftlint >/dev/null; then
swiftlint lint --config .swiftlint.yml //--autocorrect
else
echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```
