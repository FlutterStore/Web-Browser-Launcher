import 'package:flutter/material.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebBrowserlauncher()
    );
  }
}

class WebBrowserlauncher extends StatefulWidget {
  const WebBrowserlauncher({super.key});

  @override
  State<WebBrowserlauncher> createState() => _WebBrowserlauncherState();
}

class _WebBrowserlauncherState extends State<WebBrowserlauncher> {

  Future<void> _launchInBrowser(String url) async {
    if (await UrlLauncherPlatform.instance.canLaunch(url)) {
      await UrlLauncherPlatform.instance.launch(
        url,
        useSafariVC: false,
        useWebView: false,
        enableJavaScript: false,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: <String, String>{},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web Browser Launcher',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("https://successoftinfotech.com/",textAlign: TextAlign.center,style: TextStyle(fontSize: 22,),),
            const SizedBox(height: 10,),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green)
              ),
              onPressed:() async {
                String url="https://successoftinfotech.com/";
                await _launchInBrowser(url);
              }, 
              child: const Text("Web Browser Launcher")
            ),
          ],
        ),
      ),
    );
  }
}
