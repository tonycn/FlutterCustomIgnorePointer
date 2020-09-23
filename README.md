# FlutterCustomIgnorePointer
What's different, FlutterCustomIgnorePointer allow hit on child.
=======
# custom_ignore_pointer

A new Flutter package project.

## Sample Code
```
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 1000,
              height: 1000,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: SelfIgnorePointer(
                      key: aSelfIgnorePointerKey,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 50,
                            top: 50,
                            child: Container(
                              key: aContainerKey,
                              color: Colors.red,
                              width: 500,
                              height: 500,
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            )
          )
        )
```

