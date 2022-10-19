import 'package:al_ibtesam/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: splash()),
    ),
  );
}

class link_page extends StatefulWidget {
  @override
  State<link_page> createState() => _link_pageState();
}

bool loading = true;

class _link_pageState extends State<link_page> {
  late WebViewController controller;

  @override
  void dispose() {
    controller.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              if (await controller.canGoBack()) {
                controller.goBack();
                return false;
              } else {
                return true;
              }
            },
            child: Stack(
              children: [
                WebView(
                  initialUrl: 'http://www.alibtesamcarpet.com/app-home-2/',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onPageStarted: (finish) {
                    setState(() {
                      loading = false;
                    });
                  },
                ),
                loading ? Center(child: CircularProgressIndicator()) : Stack(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
