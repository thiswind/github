import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网络图片示例',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetworkImageExample(),
    );
  }
}

class NetworkImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('从网络获取图片示例'),
      ),
      body: Center(
        child: Image.network(
          'https://storage.googleapis.com/cms-storage-bucket/3461c6a5b33c339001c5.jpg',
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Text('无法加载图片');
          },
        ),
      ),
    );
  }
}
