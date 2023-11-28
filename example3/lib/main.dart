import 'dart:async';
import 'dart:math' show Random, pi;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}

const widthAndHeight = 40.0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;
  AudioPlayer player = AudioPlayer();
  late AnimationController _controller2;
  late Animation<Offset> _animation2;
  double imageSize = 40.0; // Initial image size
  final double minImageSize = 100.0; // Minimum image size
  int counter = 1;
  late bool startRolling;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    );

    startRolling = false;

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation2 = Tween<Offset>(
      begin: Offset(2, 25),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.ease,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1, 1),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _xController
    //   ..reset()
    //   ..repeat();

    // _yController
    //   ..reset()
    //   ..repeat();

    // _zController
    //   ..reset()
    //   ..repeat();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: MyMovingRotatingWidget(),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     const SizedBox(
          //       height: widthAndHeight,
          //       width: double.infinity,
          //     ),
          //     ElevatedButton(
          //       onPressed: () async {
          //         _yController.reset();
          //         _xController.reset();
          //       //   SlideTransition(
          //       //     position: _animation2,
          //       //     child: Image.asset('assets/images/dice_6.png', width: imageSize,),
          //       //     // child: Container(
          //       //     //   color: Colors.white,
          //       //     //   width: imageSize,
          //       //     //   height: imageSize,
          //       //     //   child: Image.asset('assets/images/dice_6.png', fit: BoxFit.cover, width: imageSize,),
          //       //     // ),
          //       //   );
        
          //       //   Timer.periodic(const Duration(milliseconds: 80), (timer1) {
          //       //     print("First timer");
          //       //     if (startRolling == false){
          //       //       setState(() {
          //       //         _controller2.repeat();
          //       //         _controller2.addListener(() {
          //       //           setState(() {
          //       //             // Reduce the image size as the animation progresses
          //       //             imageSize = 100.0 - (200.0 * _controller2.value);
          //       //             // Prevent further resizing when the image size reaches the minimum value
          //       //             if (imageSize < minImageSize) {
          //       //               imageSize = minImageSize;
          //       //             }
          //       //             else{
          //       //               // print('hjji');
          //       //               startRolling = true;
          //       //               _controller2.stop();
          //       //               timer1.cancel();
          //       //             }
          //       //           });
          //       //         }
          //       //         );
          //       //       });
          //       //     }else{
          //       //       timer1.cancel();
          //       //       _controller2.stop();
          //       //     }
          //       // });
          //       // // Timer.periodic(const Duration(milliseconds: 100), (timer2) {
          //       //     if (startRolling == true){
          //       //       counter++;
          //       //       // Rolling the dice
        
          //       //       // Sound
          //       //       // await player.setAsset('assets/audios/rolling-dice.mp3');
          //       //       // player.play();

          //             _xController.forward();
          //                   // _yController
          //                 // ..reset()
          //                 // .animateTo(15000);
                          
          //               // ..reset()
          //               // ..forward();
            
          //       //         // _yController.reset();
                        
            
          //       //         // _zController
          //       //         //   // ..reset()
          //       //         //   ..repeat();
          //       //       if (counter >= 100) {
          //       //         // timer2.cancel();
          //       //         setState(() {
                          
          //       //           counter = 1;
          //       //           _xController.stop();
          //       //           _yController.stop();
          //       //           _zController.stop();
          //       //           startRolling = false;
          //       //           _controller2.stop();
          //       //           // this.ti timer1.cancel();
          //       //         });
          //       //       }
          //       //     }
          //       // });
          //       },
          //       child: const Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Text(
          //           'Roll',
          //           style: TextStyle(fontSize: 26),
          //         ),
          //       ),
          //     ),
          //     MyMovingRotatingWidget()
          //   ],
          // ),
        ),
      ),
    );
  }
}


class MyMovingRotatingWidget extends StatefulWidget {
  @override
  _MyMovingRotatingWidgetState createState() => _MyMovingRotatingWidgetState();
}

class _MyMovingRotatingWidgetState extends State<MyMovingRotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-0.1, -3),
      end: Offset(0.1, 0),
    ).animate(_controller);
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.forward || status == AnimationStatus.reverse) {
    //     if (_controller.value >= 0.5) {
    //       _controller.stop();
    //     }
    //   }
    // });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       return AnimatedBuilder(
  //         animation: _controller,
  //         builder: (context, child) {
  //           return Transform(
  //             transform: Matrix4.identity()
  //               ..setEntry(3, 2, 0.001) // Perspective
  //               ..rotateX(_controller.value * 2.0 * pi) // Rotation around X-axis
  //               ..translate(
  //                 _offsetAnimation.value.dx * constraints.maxWidth,
  //                 _offsetAnimation.value.dy * constraints.maxHeight,
  //                 0.0,
  //               ), // Translation
  //             child: Cube(),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isAnimating) {
          _controller.stop();
        } else {
          _controller.forward();
        }
        _isAnimating = !_isAnimating;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Perspective
                  // ..rotateX(pi * 2.0)
                  ..rotateY(_controller.value * 2.0 * pi) // Rotation around X-axis
                  ..translate(
                  _offsetAnimation.value.dx * constraints.maxHeight,
                    _offsetAnimation.value.dy * constraints.maxWidth,
                    0.0,
                  ), // Translation
                child: Stack(
                  children: [
                    Cube3D(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Cube3D extends StatefulWidget {
  @override
  _Cube3DState createState() => _Cube3DState();
}
class _Cube3DState extends State<Cube3D> {
  double _angleX = 0.0;
  double _angleY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective
        ..rotateX(_angleX)
        ..rotateY(_angleY),
      alignment: FractionalOffset.center,
      child: Cube(),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        _angleX += 0.1;
        _angleY += 0.1;
      });
    });
  }
}


Widget Cube(){
  return Stack(
    children: [
      // back
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001) // Perspective effect
          ..translate(Vector3(0, 0, -widthAndHeight)),
        child: Image.asset('assets/images/dice_1.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
      // left side
      Transform(
        alignment: Alignment.centerLeft,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective effect
        ..rotateY(pi / 2.0),
        child: Image.asset('assets/images/dice_2.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
      // left side
      Transform(
        alignment: Alignment.centerRight,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective effect
        ..rotateY(-pi / 2.0),
        child: Image.asset('assets/images/dice_3.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
      // front
      Container(
        color: Colors.black54,
        width: widthAndHeight,
        height: widthAndHeight,
      ),
      // top side
      Transform(
        alignment: Alignment.topCenter,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective effect
        ..rotateX(-pi / 2.0),
        child: Image.asset('assets/images/dice_4.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
      // bottom side
      Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective effect
        ..rotateX(pi / 2.0),
        child: Image.asset('assets/images/dice_5.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
      Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective effect
        ..rotateX(pi / 2.0),
        child: Image.asset('assets/images/dice_6.png', fit: BoxFit.cover, width: widthAndHeight,),
      ),
    ],
  );
}





// class MyMovingRotatingCube extends StatefulWidget {
//   @override
//   _MyMovingRotatingCubeState createState() => _MyMovingRotatingCubeState();
// }

// class _MyMovingRotatingCubeState extends State<MyMovingRotatingCube> with TickerProviderStateMixin{
//   double _angleX = 0.0;
//   double _angleY = 0.0;
//   double _x = 0.0;
//   double _y = 0.0;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..stop();
//     Timer.periodic(Duration(milliseconds: 16), (timer) {
//       setState(() {
//         _angleX += 0.01; // Update rotation angle
//         _angleY += 0.01; // Update rotation angle
//         _x += 1; // Update x position
//         _y += 1; // Update y position
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//      final screenSize = MediaQuery.of(context).size;
//     final cubeSize = 100.0;

//     // Ensure the cube stays within the bounds of the screen
//     setState(() {
//       if (_x < 0) {
//         _x = 0;
//       } else if (_x > screenSize.width - cubeSize) {
//         _x = screenSize.width - cubeSize;
//       }

//       if (_y < 0) {
//         _y = 0;
//       } else if (_y > screenSize.height - cubeSize) {
//         _y = screenSize.height - cubeSize;
//       }
//     });
    
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Transform(
//           transform: Matrix4.identity()
//             ..setEntry(3, 2, 0.001) // Perspective
//             ..rotateX(_angleX)
//             ..rotateY(_angleY)
//             ..translate(_x, _y, 0.0), // Translation
//           alignment: FractionalOffset.center,
//           child: Container(
//             width: cubeSize,
//             height: cubeSize,
//             color: Colors.blue,
//           ),
//         );
//       },
//     );
//   }

// }