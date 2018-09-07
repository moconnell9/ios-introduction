Here I leave you some tidbits and articles I find interesting, that may or may not be useful to you.

## Using delegates

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

## Protocol-Oriented Programming (POP)

[Comparing MVC, MVP, MVVM - Understanding Common UI Design Patterns](https://www.linkedin.com/pulse/understanding-difference-between-mvc-mvp-mvvm-design-rishabh-software/))
- Take a quick look at these simple diagrams, which explain why they are many-1, 1-1, and 1-many, respectively.
