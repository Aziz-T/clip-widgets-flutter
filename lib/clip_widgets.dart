import 'package:flutter/material.dart';

class ClipWidgets extends StatelessWidget {
  const ClipWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(child: buildUserImagesRow(context)),
        ],
      ),
    );
  }

  Widget buildUserImagesRow(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      print("size.maxHeight: ${size.maxHeight}");
      print("size.maxWidth: ${size.maxWidth}");
      return Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ClipPath(
              clipper: DiagonalPathClipperOne(wd:size.maxWidth / 3 ),
              child: Image.network(
                "https://lokeshdhakar.com/projects/lightbox2/images/image-3.jpg",
                height: 200,
                width: size.maxWidth / 3 + 51,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            child: ClipPath(
                clipper: DiagonalPathClipperThree(wd: size.maxWidth / 3 ),
                child: Image.network(
                    "https://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg",
                    height: 200,
                    width: size.maxWidth / 3 + 51,
                    fit: BoxFit.cover)),
          ),
          // Align(
          //   child: ClipPath(
          //       clipper: DiagonalPathClipperThree(wd: size.maxWidth / 3 ),
          //       child: Image.network(
          //           "https://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg",
          //           height: 200,
          //           width: size.maxWidth / 3 + 51,
          //           fit: BoxFit.cover)),
          // ),
          // Align(
          //   child: ClipPath(
          //       clipper: DiagonalPathClipperThree(wd: size.maxWidth / 3 ),
          //       child: Image.network(
          //           "https://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg",
          //           height: 200,
          //           width: size.maxWidth / 3 + 51,
          //           fit: BoxFit.cover)),
          // ),
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
                clipper: DiagonalPathClipperTwo(wd: size.maxWidth / 3 ),
                child: Image.network(
                    "https://lokeshdhakar.com/projects/lightbox2/images/image-4.jpg",
                    height: 200,
                    width: size.maxWidth / 3 + 51,
                    fit: BoxFit.cover)),
          ),
        ],
      );
    });
  }
}

class DiagonalPathClipperOne extends CustomClipper<Path> {
  final double? wd;

  DiagonalPathClipperOne({this.wd});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width - ((wd??80)/2), size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathClipperTwo extends CustomClipper<Path> {
  final double? wd;

  DiagonalPathClipperTwo({this.wd});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..lineTo(((wd??80)/2), 0.0)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DiagonalPathClipperThree extends CustomClipper<Path> {
  final double? wd;

  DiagonalPathClipperThree({this.wd});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)

      /// 0.0 dan y ekseni
      ..lineTo(size.width - ((wd??80)/2), size.height)

      ///
      ..lineTo(size.width, 0.0)
      ..lineTo(((wd??80)/2), 0.0)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/*
*  path.lineTo(size.width * 2/3, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);*/
