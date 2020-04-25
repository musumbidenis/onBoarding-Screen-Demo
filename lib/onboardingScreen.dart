import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final int _pages = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

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

              //Skip button//
              Container(
                alignment: Alignment.centerRight,
                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),

              //Pageview//
              Container(
                height: 600,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },

                  children: <Widget>[
                    //Asset image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:50),
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
                          
                          //Title
                            Text(
                              "Testing Onboarding Screen",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          
                          SizedBox(height: 20),

                          //Subtitle
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra tellus nulla, tristique euismod augue. ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,),
                            ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              
              
            ],
          ),
        ),
      ),
    );
  }
}
