You can specify and exact version of the pod, recommended for release builds. 

pod 'XCTest', '5.0.22'
You can specify a greater than version of the pod, recommended for experimental/development builds.  

pod 'XCTest', '~>5.0.22'
That syntax will allow cocoapods to search for the version of the pod matching '1.15.x'. You could also use '~>1.15' to match the latest version of '1.x'. 
