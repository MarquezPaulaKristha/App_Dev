import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tab Bar Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _tabs = [
    Tab(icon: Icon(Icons.people), text: 'Personal'),
    Tab(icon: Icon(Icons.school_outlined), text: 'Education'),
    Tab(icon: Icon(Icons.info), text: 'Skills'),
    Tab(icon: Icon(Icons.help), text: 'Interests'),
    Tab(icon: Icon(Icons.phone), text: 'Contact'),
  ];

  final List<Widget> _tabViews = [
Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/rename.jpg'),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Paula Kristha Marquez', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              Text('July 31, 2003', style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
              Text('Age: 20', style: TextStyle(fontSize: 17), textAlign: TextAlign.center),
              Text('Bachelor of Science and Information Technology', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              Text('Batangas State University - The NEU', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ],
          ),
        ],
      ),
      SizedBox(height: 20),
      Text('I LOVE DOGS', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
    ],
  ),
),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Educational Background', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
            Text('Tertiary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Bachelor of Science Information Technology', style: TextStyle(fontSize: 19)),
            Text('Batangas State University - The NEU'),
            Text('Year Graduated: 2024 - Present'),
          SizedBox(height: 20),
            Text('Secondary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Information Technology in Web Application Development', style: TextStyle(fontSize: 19)),
            Text('STI College Batangas'),
            Text('Year Graduated: 2021'),
          SizedBox(height: 20),
            Text('Puerto Galera Academy'),
            Text('Year Graduated: 2019'),
          SizedBox(height: 20),
            Text('Elementary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Sabang Elementary School'),
            Text('Year Graduated: 2015'),
          SizedBox(height: 20)
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Technical Skills:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Programming languages: Java, Python, C++',
              style: TextStyle(fontSize: 18)),
          Text('Development frameworks: Spring, Django, React',
              style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text('Non-Technical Skills:'),
          Text('Communication, Teamwork, Leadership',
              style: TextStyle(fontSize: 18)),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Professional Interests:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              List<IconData> icons = [
                Icons.videocam,
                Icons.sports,
                Icons.art_track,
                Icons.edit
              ];
              List<String> texts = ['Videography', 'Sports', 'Arts', 'Editing'];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], size: 20),
                  SizedBox(width: 5),
                  Text(texts[index], style: TextStyle(fontSize: 18)),
                  SizedBox(width: 20),
                ],
              );
            },
          ),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contact Details:', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              List<IconData> icons = [
                Icons.email,
                Icons.phone,
                Icons.location_on
              ];
              List<String> texts = [
                'Email: pk31marquez@gmail.com',
                'Phone: 0975-024-1197',
                'Address: Cuta, Batangas City'
              ];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], size: 20),
                  SizedBox(width: 5),
                  Text(texts[index], style: TextStyle(fontSize: 18)),
                  SizedBox(width: 20),
                ],
              );
            },
          ),
        ],
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PORTFOLIO'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
          indicatorColor: Color.fromARGB(255, 0, 0, 0),
          labelColor: Color.fromARGB(255, 3, 3, 3),
          unselectedLabelColor: Color.fromARGB(255, 168, 162, 162),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabViews,
      ),
    );
  }
}
