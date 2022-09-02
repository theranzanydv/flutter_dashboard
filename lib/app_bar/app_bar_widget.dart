import 'package:flutter/material.dart';
import '../constants.dart';
import '../responsive_layout.dart';

List<String> _buttonNames = ["Overview", "Revenue", "Sales", "Control"];
int _currentSelectedButton = 0;

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    offset: const Offset(0, 10),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 30,
                child: Image.asset('./images/logo.png'),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30,
              color: Colors.white,
              icon: const Icon(Icons.menu),
            ),
          const SizedBox(width: Constants.kPadding),
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonNames.length,
              (index) => TextButton(
                  onPressed: () {
                    setState(() {
                      _currentSelectedButton = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Constants.kPadding * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _buttonNames[index],
                          style: TextStyle(
                            color: _currentSelectedButton == index
                                ? Colors.white
                                : Colors.white60,
                            // fontSize: 20,
                            // fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(Constants.kPadding / 2),
                          width: 60,
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: _currentSelectedButton == index
                                ? const LinearGradient(colors: [
                                    Constants.orangeDark,
                                    Constants.redDark,
                                  ])
                                : null,
                          ),
                        )
                      ],
                    ),
                  )),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _buttonNames[_currentSelectedButton],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Container(
                    margin: const EdgeInsets.all(Constants.kPadding / 2),
                    width: 60,
                    height: 2,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Constants.orangeDark,
                      Constants.redDark,
                    ])),
                  )
                ],
              ),
            ),
          const Spacer(),
          IconButton(
            color: Colors.white60,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white60,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 8,
                  child: Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          if ((!ResponsiveLayout.isPhone(context)))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.1),
                    offset: const Offset(0, 10),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30,
                child: Image.asset('./images/logo.png'),
                // child: Image.asset('./images/profile.png'),
              ),
            ),
        ],
      ),
    );
  }
}
