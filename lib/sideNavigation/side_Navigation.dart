import 'package:flutter/material.dart';

class SideNavigation extends StatefulWidget {
  const SideNavigation({Key? key}) : super(key: key);

  @override
  State<SideNavigation> createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation>
    with TickerProviderStateMixin {
  Animation<double>? anim1;
  AnimationController? animationController1;

  Animation<double>? anim3;
  AnimationController? animationController3;

  bool sideCheck = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      buildAfter(context);
      buildAfter3(context);
      return;
    });
    super.initState();
  }

  void buildAfter(BuildContext context) {
    this.animationController1 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    if (animationController1 == null) return;
    this.anim1 = Tween<double>(begin: MediaQuery.of(context).size.width, end: 0)
        .animate(animationController1!);
    if (anim1 == null) return;
    anim1!.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  void buildAfter3(BuildContext context) {
    this.animationController3 = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 800));
    if (animationController3 == null) return;
    this.anim3 = Tween<double>(begin: MediaQuery.of(context).size.width, end: 0)
        .animate(animationController3!);
    if (anim3 == null) return;
    anim3!.addListener(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController1!.dispose();
    animationController3!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.sideCheck = !this.sideCheck;
                      print(sideCheck);
                    });
                  },
                  child: Text('첫번째 방법'),
                ),
                TextButton(
                  onPressed: () {
                    if (anim1 == null && animationController1 == null) return;
                    if (this.animationController1!.isCompleted) return;
                    this.animationController1!.forward();
                  },
                  child: Text('두번째 방법'),
                ),
                TextButton(
                  onPressed: () {
                    if (anim3 == null && animationController3 == null) return;
                    if (this.animationController3!.isCompleted) return;
                    this.animationController3!.forward();
                  },
                  child: Text('세번째 방법'),
                ),
              ],
            ),
          ),
          this.sideCheck
              ? Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                this.sideCheck = !sideCheck;
                              });
                            },
                            child: Opacity(
                              opacity: 0.1,
                              child: Container(
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: this.anim1?.value ?? 0,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                      child: (this.anim1?.isCompleted ?? false)
                          ? Column(
                              children: [
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                                ListTile(
                                  title: Text('asdf'),
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: GestureDetector(
                        onTap: () {
                          this.animationController1!.reset();
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Transform.translate(
              offset: Offset(
                  -(this.anim3?.value ?? MediaQuery.of(context).size.width), 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('asdf'),
                            ),
                            ListTile(
                              title: Text('asdf'),
                            ),
                            ListTile(
                              title: Text('asdf'),
                            ),
                            ListTile(
                              title: Text('asdf'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                            animationController3!.reset();
                        },
                        child: Opacity(
                          opacity: 0.1,
                          child: Container(
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
