import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final int _pages = 2;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  /*Build indicator */
  List<Widget> _buildIndicator() {
    List<Widget> list = [];

    for (int i = 0; i < _pages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  /*Indicator Widget */
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        height: 8.0,
        width: isActive ? 24.0 : 16.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12),),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Skip button
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              //Pageview
              Container(
                height: 500,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    /*Slide 01 */
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/01.png'),
                            height: 300,
                            width: 300,
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Testing Onboarding Screen",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra tellus nulla, tristique euismod augue. ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /*Slide 02 */
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/01.png'),
                            height: 300,
                            width: 300,
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Testing Onboarding Screen",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra tellus nulla, tristique euismod augue. ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /*Indicators */
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
