import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flt_t_300721/pages/page_vulture.dart';
import 'package:flt_t_300721/pages/page_leopard.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page!;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: Stack(children: [
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: [
              Page1(),
              Page2(),
            ],
          ),
          LeopardImage(),
        ]),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  const LeopardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(builder: (context, notifier, child) {
      return Positioned(
        top: 100,
        left: -notifier.offset,
        height: 250,
        child: Image.asset('assets/images/leopard.png'),
      );
    });
  }
}
