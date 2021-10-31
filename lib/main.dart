import 'dart:math';

import 'package:easytest/handel_images.dart';
import 'package:easytest/responsive.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HandelImages handelImages = HandelImages();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Images"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          child: Wrap(spacing: 10, runSpacing: 10, children: [
            Wrap(
                spacing: 10,
                runSpacing: 10,
                children: handelImages.selectedImages
                    .map(
                      (e) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: AssetThumb(
                              asset: e,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              handelImages.deleteImage(e);
                              setState(() {});
                            },
                            child: const CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.close,
                                  size: 16,
                                )),
                          ),
                        ],
                      ),
                    )
                    .toList()),
            Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    onPressed: () async {
                      await handelImages.fetchImages();
                      setState(() {});
                    },
                    icon: Icon(Icons.camera_alt,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
