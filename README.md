# FlutterCustomIgnorePointer

FlutterCustomIgnorePointer allow hit on child and ignores hit on itself

FlutterCustomIgnorePointer is inspired by IgnorePointer.

# Sample Code
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
                    child: Container(
                      key: underContainerKey,
                      color: Colors.blue,
                    ),
                  ),
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
                              key: topContainerKey,
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

