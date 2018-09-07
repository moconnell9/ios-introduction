
## [Cocoapods tutorial](https://www.raywenderlich.com/626-cocoapods-tutorial-for-swift-getting-started)

## The gist

To use cocoapods, you need to:
1. Install, using 
```
sudo gem install cocoapods
pod setup --verbose
```
2. **In your project folder, create a Podfile:**
```
pod init
open -a Xcode Podfile
```
(I'm pretty sure you can also just insert a file called "Podfile" (no extension) into the directory...)

3. Edit the podfile (here's the default)
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MyProject' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for IceCreamShop

end
```
You can specify and exact version of the pod, recommended for release builds. 

```pod 'Swiftlint', '1.15.22'```

You can specify a greater than version of the pod, recommended for experimental/development builds.  

```pod 'Swiftlint', '~>1.15.22'```

That syntax will allow cocoapods to search for the version of the pod matching '1.15.x'. You could also use '~>1.15' to match the latest version of '1.x'. 

4. Every time you add a pod to the podfile, run:
```
pod install
```
To update a pod to a newer version, run:
```
pod update
```
