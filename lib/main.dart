import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Profile App",
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile App'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bckimg8.jpg"),
            fit: BoxFit.cover, 
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0),
          child: Column(
            children: <Widget>[
              if (_selectedIndex == 0) ...[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 69,
                      backgroundImage: AssetImage('assets/mypic.jpg'),
                      
                      ),
                    
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Samit Srivastava",
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        Text(
                          " App Development",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.school, color: Colors.black),
                        SizedBox(width: 10),
                        Text("L.F.S", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work, color: Colors.black),
                        SizedBox(width: 10),
                        Text("My Portfolio", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on, color: Colors.black),
                        SizedBox(width: 10),
                        Text("Gkp", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(Icons.email, color: Colors.black),
                        SizedBox(width: 10),
                        Text("samitsriv59@gmail.com", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.black),
                        SizedBox(width: 10),
                        Text("9999999999", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ] else if (_selectedIndex == 1) ...[
                Text(
                  "About me",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  "Hello everyone my name is Samit Srivastava...",
                  style: TextStyle(fontSize: 27, color: Colors.black),
                ),
              ] else if (_selectedIndex == 2) ...[
                Text(
                  "Contact Info",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 40),
                Text(
                  "Email: samitsrivastava59@gmail.com",
                  style: TextStyle(fontSize: 27, color: Colors.black),
                ),
                Text(
                  "Phone: 9999999999",
                  style: TextStyle(fontSize: 27, color: Colors.black),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.person, 'About', 1),
            _buildNavItem(Icons.contact_mail, 'Contact', 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: _selectedIndex == index ? Colors.blueAccent : Colors.black),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: _selectedIndex == index ? Colors.black : Colors.black),
            Text(
              label,
              style: TextStyle(
                color: _selectedIndex == index ? Colors.black : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}