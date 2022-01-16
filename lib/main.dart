import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project01',
      theme: ThemeData(),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'iOS';
    var items = ['iOS', 'Android'];
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red[300],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          // setState(() {
          //   _selectedIndex = index;
          // });
        },
        items: const [
          BottomNavigationBarItem(
            title: Text('Explore'),
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Search'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Favorites'),
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            title: Text('Cart'),
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Me'),
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
      body: ListView(
        // ListView : 스크롤 가능 (children)
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(top: 40.0, bottom: 15.0),
            iconSize: 33.0,
            alignment: Alignment.topLeft,
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          const Text('Search',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
          Container(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            alignment: Alignment.centerLeft,
            height: 40,
            width: displaysize.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child: const Icon(Icons.search, color: Colors.grey),
          ),
          Container(height: 30),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
            ),
            value: dropdownvalue,
            icon: const Icon(Icons.arrow_drop_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          _itemList01(), // 상품 리스트 첫째 줄
          _itemList02(), // 상품 리스트 둘째 줄
          _itemList03(), // 상품 리스트 셋째 줄
        ],
      ),
    );
  }
}

Widget _itemList01() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 15.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/iPhone13Pro.png"),
          ),
          Container(height: 5),
          const Text('iPhone13 Pro',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('궁극의 iPhone.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩1,350,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
      Container(width: 20),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 15.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/iPhone13.png"),
          ),
          Container(height: 5),
          const Text('iPhone13',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('막강한 성능.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩950,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ],
  );
}

Widget _itemList02() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 15.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/appleWatchSeries7.png"),
          ),
          Container(height: 5),
          const Text('Watch 7',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('더 크게 앞서 나아가다.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩499,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
      Container(width: 20),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 15.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/appleWatchSE.png"),
          ),
          Container(height: 5),
          const Text('Watch SE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('손색없다. 부담 없다.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩359,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ],
  );
}

Widget _itemList03() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 25.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/iPadAir.png"),
          ),
          Container(height: 5),
          const Text('iPad Air',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('강력하다. 다채롭다.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩779,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
      Container(width: 20),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 25.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/iPadMini.png"),
          ),
          Container(height: 5),
          const Text('iPad mini',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(height: 5),
          const Text('메가급 성능. 크기만 미니.', style: TextStyle(fontSize: 15)),
          Container(height: 15),
          const Text('₩649,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ],
  );
}
