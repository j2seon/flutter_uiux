
import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgs = [
      "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
      "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
      "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
      "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
      "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
      "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
      "https://cdn.pixabay.com/photo/2020/10/14/19/49/santorini-5655299__480.jpg",
      "https://cdn.pixabay.com/photo/2021/06/21/11/30/grass-6353411__480.jpg",
      "https://cdn.pixabay.com/photo/2020/07/03/20/39/couple-5367555__480.jpg",
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SlideShow(imgUrl: imgs),
    );
  }
}

class SlideShow extends StatefulWidget {
  final List<String> imgUrl;

  const SlideShow({required this.imgUrl, Key? key}) : super(key: key);

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  PageController? _pageController;
  int imgIndex = 0;

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        if (!mounted) return;
        this.setState(() {});
        return;
      });
    super.initState();
  }

  @override
  void dispose() {
    this._pageController?.dispose();
    super.dispose();
  }

  double topSize(double topHeight) {
    return (topHeight * 0.5) - 12.0;
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    double pageViewHeight = MediaQuery.of(context).size.height * 0.5;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: pageViewHeight,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChange,
            itemCount: this.widget.imgUrl.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imgUrl[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: topSize(pageViewHeight),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
            child: IconButton(
              onPressed: () {
                if(_pageController == null) return;

                if(imgIndex == 0){
                  imgIndex = 8;
                }else{
                  imgIndex = imgIndex-1;
                }

                print(imgIndex);
                _pageController!.jumpToPage(imgIndex);
              },
              icon: Icon(Icons.keyboard_arrow_left),
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          top: topSize(pageViewHeight),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25.0)),
            child: IconButton(
              onPressed: () {
                if(_pageController == null) return;
                if(imgIndex == widget.imgUrl.length-1){
                  imgIndex = 0;
                }else{
                  imgIndex = imgIndex+1;
                }

                _pageController!.jumpToPage(imgIndex);
                print(imgIndex);
              },
              icon: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ),
      ],
    );
  }

  void _onPageChange(int value) => setState(() {
        this.imgIndex = value;
        // print(imgIndex);
      });
}
