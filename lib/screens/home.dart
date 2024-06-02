import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:translation_test/common/images.dart';
import 'package:translation_test/common/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 100);
  static const _itemSlideTime = Duration(milliseconds: 300);
  static const _staggerTime = Duration(milliseconds: 100);

  final _animationDuration = _initialDelayTime + (_staggerTime * 4);

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < 5; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.orangeAccent.withOpacity(0.01),
          Colors.orangeAccent.shade100.withOpacity(0.4)
        ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              ...topContainer(),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  topContainer() {
    final listItems = <Widget>[];
    listItems.add(AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[0].transform(_staggeredController.value));
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(0, slideDistance),
              child: child,
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _titleRow())));

    listItems.add(AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[2].transform(_staggeredController.value));
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(0, slideDistance),
              child: child,
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: subHeading())));

    listItems.add(AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[4].transform(_staggeredController.value));
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(0, slideDistance),
              child: child,
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buyRentWidget())));

    listItems.add(AnimatedBuilder(
        animation: _staggeredController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[2].transform(_staggeredController.value));
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(0, slideDistance),
              child: child,
            ),
          );
        },
        child: _bottomContainer()));

    return listItems;
  }

  Column _buyRentWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange),
                child: Column(children: [
                  Text(
                    'BUY',
                    style: TestTheme.setTextStyle(
                        style: TestTheme.w400f12, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '1 000',
                    style: TestTheme.setTextStyle(
                        style: TestTheme.w600f27, color: Colors.white),
                  ),
                  Text(
                    'offers',
                    style: TestTheme.setTextStyle(
                        style: TestTheme.w400f12, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ]),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(children: [
                Text(
                  'RENT',
                  style: TestTheme.setTextStyle(
                      style: TestTheme.w400f12, color: Colors.brown.shade400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '2 212',
                  style: TestTheme.setTextStyle(
                      style: TestTheme.w600f27, color: Colors.brown.shade400),
                ),
                Text(
                  'offers',
                  style: TestTheme.setTextStyle(
                      style: TestTheme.w400f12, color: Colors.brown.shade400),
                ),
                const SizedBox(
                  height: 40,
                ),
              ]),
            ))
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Column subHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text('Hi, Marina',
            style: TestTheme.setTextStyle(
                style: TestTheme.w400f19, color: Colors.brown.shade400)),
        Text('let\'s select your\nperfect place',
            style: TestTheme.setTextStyle(
                style: TestTheme.w500f25, color: Colors.black)),
      ],
    );
  }

  Container _bottomContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          staggeredTile(5, 2, ImagesName.kitchen, 'Gladkova St., 25'),
          staggeredTile(2, 3.5, ImagesName.livingroom, 'Gubina St. 11'),
          staggeredTile(2, 1.75, ImagesName.emptyRoom, 'Trefoleva St. 13'),
          staggeredTile(2, 1.75, ImagesName.bedroom, 'Trefoleva St. 13'),
        ],
      ),
    );
  }

  StaggeredGridTile staggeredTile(int crossAxisCount, double mainAxisCount,
      String image, String buttonLabel) {
    return StaggeredGridTile.count(
        crossAxisCellCount: crossAxisCount,
        mainAxisCellCount: mainAxisCount,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              button(buttonLabel)
            ],
          ),
        ));
  }

  button(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade200.withOpacity(0.9)),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TestTheme.setTextStyle(style: TestTheme.w400f17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, right: 4),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(30),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Row(
            children: [
              const Icon(Icons.location_on_sharp),
              const SizedBox(width: 4),
              Text('Saint Petersburg',
                  style: TestTheme.setTextStyle(
                      style: TestTheme.w400f14, color: Colors.brown))
            ],
          ),
        ),
        Image.asset(
          ImagesName.profileLogo,
          width: 40,
        )
      ],
    );
  }
}
