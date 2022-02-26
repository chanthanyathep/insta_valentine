import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaValentine',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Model> model = [
    Model(
      pro: Image(image: AssetImage('assets/images/pro1.png')),
      name: 'walter white',
      text: 'my car',
      post: Image(image: AssetImage('assets/images/car3.jpg')),
    ),
    Model(
      pro: Image(image: AssetImage('assets/images/pro2.jpg')),
      name: 'jesse pinkman',
      text: 'my car',
      post: Image(image: AssetImage('assets/images/car2.jpg')),
    ),
    Model(
      pro: Image(image: AssetImage('assets/images/pro3.jpg')),
      name: 'gustavo fring',
      text: 'my car',
      post: Image(image: AssetImage('assets/images/car1.jpg')),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'InstaValentine',
        style: TextStyle(
          fontFamily: 'Raleway',
        ),
      )),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Colors.pink.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (context, index) => MyCard(model: model[index]),
          ),
        ),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final Model model;

  const MyCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.brown.shade800,
                    ),
                    Padding(padding: const EdgeInsets.all(8.0)),
                    Text(model.name),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.list,
                    size: 30,
                  ),
                )
              ],
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: model.post.image,
                    height: 300,
                  ),
                ),
              ],
            ),
            Text(model.text),
            Padding(padding: const EdgeInsets.all(8.0)),
            Row(
              children: [
                Text(model.comment[0]['name'].toString(),style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Raleway',
                  color: Colors.pink,
                ),),
                Padding(padding: const EdgeInsets.all(8.0)),
                Text(model.comment[0]['text'].toString())
              ],
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            Row(
              children: [
                IconButton(onPressed: (){
                },
                  icon: Icon(
                  Icons.thumb_up,
                  size: 25.0,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your comment',
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Model {
  Image pro;
  String name;
  String text;
  int like = 20;
  Image post;
  List<Map<String, String>> comment = [
    {'name': 'prayut janocha','text':'very good'}
  ];

  Model({
    required this.pro,
    required this.name,
    required this.text,
    required this.post,
  });
}
