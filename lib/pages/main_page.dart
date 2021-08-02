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
        body: Stack(
          alignment: Alignment.centerLeft,
          children: [
            PageView(
              controller: _pageController,
              physics: ClampingScrollPhysics(),
              children: [
                PageLeopard(),
                PageVulture(),
              ],
            ),
            LeopardImage(),
            VultureImage(),
          ],
        ),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  const LeopardImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        print(MediaQuery.of(context).size.width);
        return Positioned(
          left: -0.8 * notifier.offset,
          width: MediaQuery.of(context).size.width * 1.5,
          child: child!,
        );
      },
      child: IgnorePointer(child: Image.asset('assets/images/leopard.png')),
    );
  }
}

class VultureImage extends StatelessWidget {
  const VultureImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        print(MediaQuery.of(context).size.width);
        return Positioned(
          left:
              1.15 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          //width: MediaQuery.of(context).size.width * 1.6,
          height: MediaQuery.of(context).size.height / 3,
          child: child!,
        );
      },
      child: IgnorePointer(
        child: Image.asset('assets/images/vulture.png'),
      ),
    );
  }
}
