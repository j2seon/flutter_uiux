import 'package:flutter/material.dart';

class AccordionPage extends StatelessWidget {
  List<Map<String, String>> _datas = [
    {
      'title': 'Section 1',
      'des':
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
    {
      'title': 'Section 2',
      'des':
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
    {
      'title': 'Section 3',
      'des':
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
    },
  ];

  AccordionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: this._datas.map<Widget>((e) => Container(
          child: Accordion(
            title: e['title'].toString(),
            des: e['des'].toString(),
            check: this._datas.indexOf(e) == 0 ? true : false,
          ),
        )).toList(),
      ),
    );
  }
}

class Accordion extends StatefulWidget {
  final String title;
  final String des;
  bool check= false;
  Accordion({required this.title,required this.des, required this.check, Key? key}) : super(key: key);

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                widget.check = !widget.check;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              color: this.widget.check ? Colors.grey : Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title, style: _titleStyle,),
                  Icon(widget.check ? Icons.minimize : Icons.add ),
                ],
              ),
            ),
          ),
          this.widget.check?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(this.widget.des),
              ) : Container()
        ],
      ),
    );
  }
}
