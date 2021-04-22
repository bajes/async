import 'package:flutter/material.dart';
import 'package:login_tsbbar/pages/FavouritePage.dart';
import 'package:login_tsbbar/pages/news_list.dart';
import 'package:login_tsbbar/pages/profilePage.dart';

void main() {
  runApp(MaterialApp(home: TasksHomePage()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  List categories = [
    {
      'name': 'MAKEUP',
      'products': [
        {'product_name': 'makeup1'},
        {'product_name': 'makeup2'},
        {'product_name': 'makeup3'},
        {'product_name': 'makeup4'}
      ]
    },
    {
      'name': 'CLOTHES',
      'products': [
        {'product_name': 'clothes1'},
        {'product_name': 'clothes2'},
        {'product_name': 'clothes3'},
        {'product_name': 'clothes4'}
      ]
    },
    {
      'name': 'FOOD',
      'products': [
        {'product_name': 'food1'},
        {'product_name': 'food2'},
        {'product_name': 'food3'},
        {'product_name': 'food4'}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        bottom: TabBar(
            controller: controller,
            tabs: categories.map((e) {
              return Tab(
                text: e['name'],
              );
            }).toList()),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller,
          children: categories.map((e) {
            List products = e['products'];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Text(
                    products[index]['product_name'],
                    style: TextStyle(fontSize: 30),
                  );
                });
          }).toList()),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: TabBar(
            controller: controller,
            tabs: categories.map((e) {
              return Tab(
                text: e['name'],
              );
            }).toList()),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('name'), accountEmail: Text('email')),
            ListTile(
              onTap: () {
                controller.animateTo(0);
                Navigator.pop(context);
              },
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {
                controller.animateTo(1);
                Navigator.pop(context);
              },
              title: Text('Favourite'),
            ),
            ListTile(
              onTap: () {
                controller.animateTo(2);
                Navigator.pop(context);
              },
              title: Text('Profile'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          controller.animateTo(1);
        },
      ),
    );
  }
}

class TasksHomePage extends StatefulWidget {
  @override
  _TasksHomePageState createState() => _TasksHomePageState();
}

class _TasksHomePageState extends State<TasksHomePage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks Home'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: currentIndex == 0 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(0);
                  currentIndex = 0;
                  setState(() {});
                }),
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: currentIndex == 1 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(1);
                  currentIndex = 1;
                  setState(() {});
                }),
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: currentIndex == 2 ? Colors.blue : Colors.black,
                ),
                onPressed: () {
                  pageController.jumpToPage(2);
                  currentIndex = 2;
                  setState(() {});
                })
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          this.currentIndex = index;
          setState(() {});
        },
        children: [NewsList(), ProfilePage(), FavouritePage()],
      ),
    );
  }
}
