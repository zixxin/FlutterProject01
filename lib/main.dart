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
    // final Size displaysize = MediaQuery.of(context).size;

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
          TextField(
            decoration: InputDecoration(
                isDense: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15)),
                fillColor: Colors.grey[200],
                filled: true,
                // border: InputBorder.none,
                // focusedBorder: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 23.0,
                ), // 검색 아이콘 추가
                suffixIcon: const Icon(
                  Icons.clear_rounded,
                  color: Colors.grey,
                  size: 23.0,
                ),
                contentPadding: const EdgeInsets.only(left: 5, right: 5),
                hintText: 'Search for Items'),
          ),
          Container(height: 30),
          _infoLine(),
          // DropdownButtonFormField(
          //   decoration: InputDecoration(
          //     focusedBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.white),
          //         borderRadius: BorderRadius.circular(30)),
          //     enabledBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.white),
          //         borderRadius: BorderRadius.circular(30)),
          //     border: InputBorder.none,
          //     contentPadding: const EdgeInsets.only(
          //         left: 27, bottom: 13, top: 13, right: 20),
          //     filled: true,
          //     fillColor: Colors.grey[200],
          //   ),
          //   isExpanded: true,
          //   value: dropdownvalue,
          //   icon: const Icon(Icons.arrow_drop_down),
          //   items: items.map((String items) {
          //     return DropdownMenuItem(
          //       value: items,
          //       child: Text(items),
          //     );
          //   }).toList(),
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       dropdownvalue = newValue!;
          //     });
          //   },
          // ),
          _itemList01(), // 상품 리스트 첫째 줄
          _itemList02(), // 상품 리스트 둘째 줄
          _itemList03(), // 상품 리스트 셋째 줄
        ],
      ),
    );
  }
}

// 상품 나타내기 필터, 아이템 개수, 상품 view
Widget _infoLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [_filter()],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [_itemForms()],
      ),
    ],
  );
}

// 상품 나타내기 필터
Widget _filter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Icon(Icons.tune_rounded, color: Colors.grey, size: 26.0)
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 10)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('filter',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))
        ],
      ),
    ],
  );
}

// 아이템 개수, 상품 view
Widget _itemForms() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('6 items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
        ],
      ),
      Container(width: 15.0),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Icon(Icons.crop_square, color: Colors.grey, size: 26.0)
        ],
      ),
      // crop_square
      Container(width: 5.0),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Icon(Icons.grid_view_outlined, color: Colors.red[300], size: 23.0)
        ],
      ),
    ],
  );
}

// 상품 리스트 첫째 줄
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('궁극의 iPhone.', style: TextStyle(fontSize: 12)),
          _proColor(),
          const Text('₩1,350,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('막강한 성능.', style: TextStyle(fontSize: 12)),
          _nonProColor(),
          const Text('₩950,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    ],
  );
}

// 상품 리스트 첫째 줄 - iPhone 13 Pro color
Widget _proColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFA3B4C5),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE3E4DF),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFF9ECD6),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF52514D),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}

// 상품 리스트 첫째 줄 - iPhone 13 color
Widget _nonProColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFF5DED8),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF386684),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF242A30),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFB02421),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}

// 상품 리스트 둘째 줄
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
            margin: const EdgeInsets.only(top: 25.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/appleWatchSeries3.png"),
          ),
          Container(height: 5),
          const Text('Watch Series 3',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('3의 매력.', style: TextStyle(fontSize: 12)),
          _watchSeriesColor(),
          const Text('₩249,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
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
            child: Image.asset("img/appleWatchSE.png"),
          ),
          Container(height: 5),
          const Text('Watch SE',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('손색없다. 부담 없다.', style: TextStyle(fontSize: 12)),
          _watchSEColor(),
          const Text('₩359,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    ],
  );
}

// 상품 리스트 둘째 줄 - Watch Series 3 color
Widget _watchSeriesColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF727272),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE4C7B8),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}

// 상품 리스트 둘째 줄 - Watch SE color
Widget _watchSEColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF727272),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE9E9E9),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}

// 상품 리스트 셋째 줄
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('강력하다. 다채롭다.', style: TextStyle(fontSize: 12)),
          _iPadAirColor(),
          const Text('₩779,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          Container(height: 5),
          const Text('메가급 성능. 크기만 미니.', style: TextStyle(fontSize: 12)),
          _iPadMiniColor(),
          const Text('₩649,000부터',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    ],
  );
}

// 상품 리스트 셋째 줄 - iPad Air color
Widget _iPadAirColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE2E3E5),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF67686B),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE9CAC3),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFCDDCC8),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFD2E2F4),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}

// 상품 리스트 셋째 줄 - iPad Mini color
Widget _iPadMiniColor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFF666467),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE5D2D0),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFB9B7D0),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
      Container(width: 5),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            margin: const EdgeInsets.only(top: 15.0, bottom: 8.0),
            decoration: BoxDecoration(
                color: const Color(0xFFE2DDD2),
                borderRadius: BorderRadius.circular(100) //모서리를 둥글게
                ),
          ),
        ],
      ),
    ],
  );
}
