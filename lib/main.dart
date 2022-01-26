import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: 0, //현재 선택된 Index
        onTap: (int index) {
          // setState(() {
          //   _selectedIndex = index;
          // });
        },
        items: [
          BottomNavigationBarItem(
            title: const Text('', style: TextStyle(fontSize: 0.0)),
            icon: Icon(Icons.menu_rounded, size: displaysize.width * 0.08),
          ),
          BottomNavigationBarItem(
            title: const Text('', style: TextStyle(fontSize: 0.0)),
            icon: Icon(Icons.search_rounded, size: displaysize.width * 0.08),
          ),
          BottomNavigationBarItem(
            title: const Text('', style: TextStyle(fontSize: 0.0)),
            icon: Icon(Icons.home_outlined, size: displaysize.width * 0.08),
          ),
          BottomNavigationBarItem(
            title: const Text('', style: TextStyle(fontSize: 0.0)),
            icon: Icon(Icons.favorite_border_rounded,
                size: displaysize.width * 0.08),
          ),
          BottomNavigationBarItem(
            title: const Text('', style: TextStyle(fontSize: 0.0)),
            icon: Icon(Icons.person_outline_rounded,
                size: displaysize.width * 0.08),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
        bottom: PreferredSize(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            // Row에서는 mainAxis가 가로, crossAxis가 세로
            // Column에서는 crossAxis가 가로, mainAxis가 세로
            children: [
              Container(height: 10),
              SizedBox(
                width: displaysize.width * 0.9,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFAFAFA)),
                          borderRadius: BorderRadius.circular(17)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFAFAFA)),
                          borderRadius: BorderRadius.circular(17)),
                      fillColor: Colors.grey[200],
                      filled: true,
                      // border: InputBorder.none,
                      // focusedBorder: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[600],
                        size: displaysize.width * 0.06,
                      ), // 검색 아이콘 추가
                      contentPadding: const EdgeInsets.only(left: 5, right: 5),
                      hintText: 'Search'),
                ),
              ),
              Container(height: 10)
            ],
          ),
          preferredSize: Size(displaysize.width * 0.9, 50),
        ),
        title: Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[_logonicon()],
          ),
        )),
      ),
      body: ListView(
        // ListView : 스크롤 가능 (children)
        padding: const EdgeInsets.only(top: 165.0, bottom: 20.0),
        children: <Widget>[
          _bestitemstext(),
          _bestitemsscroller(),
          Container(height: 10),
          _infoLine(context), // 필터, item 개수, view 모드
          _itemList01(), // 상품 리스트 첫째 줄
          _itemList02(), // 상품 리스트 둘째 줄
          _itemList03(), // 상품 리스트 셋째 줄
          _itemList04(), // 상품 리스트 넷째 줄
        ],
      ),
    );
  }
}

// dropdown menu 설정
Widget _selectMenus() {
  final _valueList = ['신발', '의류', '용품'];
  var _selectedValue = '신발';

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          DropdownButton(
            icon: const Icon(Icons.keyboard_arrow_down_rounded,
                color: Colors.black, size: 35.0),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(20),
            value: _selectedValue,
            items: _valueList.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                );
              },
            ).toList(),
            onChanged: (value) {
              // setState(() {
              //   _selectedValue = value;
              // });
            },
          ),
        ],
      ),
    ],
  );
}

// 화면 제일 상단의 나이키 로고, dropdown button, 장바구니 icon
Widget _logonicon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: Image.asset("img/nike.png", width: 50, height: 50))
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [_selectMenus()],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [_shoppingCartBadge()],
      ),
    ],
  );
}

// badge 달린 shopping bag icon
Widget _shoppingCartBadge() {
  return Badge(
    position: BadgePosition.topEnd(top: 1, end: 2),
    // animationDuration: Duration(milliseconds: 300),
    animationType: BadgeAnimationType.slide,
    badgeColor: const Color(0xFFE57373),
    badgeContent: const Text(
      '2',
      style: TextStyle(color: Colors.white),
    ),
    child: IconButton(
        icon: const Icon(Icons.shopping_bag_outlined,
            color: Colors.black, size: 30.0),
        onPressed: () {}),
  );
}

Widget _bestitemstext() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0),
              child: Image.asset("img/pin.png", width: 24, height: 24)),
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 7)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('Best Seller',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    ],
  );
}

// best item 나열을 위한 가로 스크롤
Widget _bestitemsscroller() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: 270, // fixed height
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // ListView : 스크롤 가능 (children)
          children: <Widget>[_bestitems()],
        ),
      ),
    ],
  );
}

// best item 나열
Widget _bestitems() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 20)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 110,
            margin: const EdgeInsets.only(top: 12.0, bottom: 5.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikedaybreak02.png"),
          ),
          Container(height: 5),
          const Text('01', style: TextStyle(fontSize: 13)),
          Container(height: 5),
          const Text('데이브레이크', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('119,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars481()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 20)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 110,
            margin: const EdgeInsets.only(top: 12.0, bottom: 5.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikewaffletrainer.png"),
          ),
          Container(height: 5),
          const Text('02', style: TextStyle(fontSize: 13)),
          Container(height: 5),
          const Text('와플 트레이너', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('89,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars482()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 20)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 110,
            margin: const EdgeInsets.only(top: 12.0, bottom: 5.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikedaybreak01.png"),
          ),
          Container(height: 5),
          const Text('03', style: TextStyle(fontSize: 13)),
          Container(height: 5),
          const Text('데이브레이크', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('119,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars481()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 20)],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 110,
            margin: const EdgeInsets.only(top: 12.0, bottom: 5.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikecoatvision01.png"),
          ),
          Container(height: 5),
          const Text('04', style: TextStyle(fontSize: 13)),
          Container(height: 5),
          const Text('코트 비전 알타 LTR', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('89,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars46()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [Container(width: 20)],
      ),
    ],
  );
}

// 상품 나타내기 필터, 아이템 개수, 상품 view
Widget _infoLine(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // 위젯 사이 공간 동일하게 만들기
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0), child: _itemForms()),
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(right: 26.0),
              child: _filter(context)),
        ],
      ),
    ],
  );
}

// 아이템 개수, 상품 view
Widget _itemForms() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('Total 359',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
        ],
      ),
    ],
  );
}

Widget _up(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0, top: 20.0),
              height: 50,
              child: const Text('신상품순',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0, top: 5.0),
              height: 50,
              child: Text('추천순',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red[300],
                      fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0, top: 5.0),
              height: 50,
              child: const Text('리뷰 많은 순',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0, top: 5.0),
              height: 50,
              child: const Text('높은 가격 순',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Container(
              margin: const EdgeInsets.only(left: 25.0, top: 5.0, bottom: 20.0),
              height: 50,
              child: const Text('낮은 가격 순',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
      ),
    ],
  );
}

// 상품 나타내기 필터
Widget _filter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          IconButton(
            icon: const Icon(Icons.sort_rounded),
            color: Colors.black,
            iconSize: 20.0,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: _up(context),
                    ));
                  });
            },
          ),
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('추천순',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
        ],
      ),
    ],
  );
}

Widget _stars481() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow[700], size: 20.0)
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('4.8',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [Text('(175)', style: TextStyle(fontSize: 13))],
      ),
    ],
  );
}

Widget _stars482() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow[700], size: 20.0)
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('4.8',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [Text('(98)', style: TextStyle(fontSize: 13))],
      ),
    ],
  );
}

Widget _stars46() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow[700], size: 20.0)
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('4.6',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [Text('(57)', style: TextStyle(fontSize: 13))],
      ),
    ],
  );
}

Widget _stars45() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: [
          Icon(Icons.star_rounded, color: Colors.yellow[700], size: 20.0)
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [
          Text('4.5',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
        ],
      ),
      Container(width: 2),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        // Row에서는 mainAxis가 가로, crossAxis가 세로
        // Column에서는 crossAxis가 가로, mainAxis가 세로
        children: const [Text('(23)', style: TextStyle(fontSize: 13))],
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
            margin: const EdgeInsets.only(bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikeairpos.png"),
          ),
          Container(height: 5),
          const Text('에어포스 1 폰탄카', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('149,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars46()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikedaybreak02.png"),
          ),
          Container(height: 5),
          const Text('데이브레이크', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('119,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars481(),
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
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikejdserieses.png"),
          ),
          Container(height: 5),
          const Text('조던 시리즈 ES', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('89,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars482()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikedaybreak01.png"),
          ),
          Container(height: 5),
          const Text('데이브레이크', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('119,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars481()
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
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikewaffletrainer.png"),
          ),
          Container(height: 5),
          const Text('와플 트레이너', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('89,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars482()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikecoatvision01.png"),
          ),
          Container(height: 5),
          const Text('코트 비전 알타 LTR', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('89,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars46()
        ],
      ),
    ],
  );
}

// 상품 리스트 넷째 줄
Widget _itemList04() {
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
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikedaybreak03.png"),
          ),
          Container(height: 5),
          const Text('데이브레이크', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('119,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars481()
        ],
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 150,
            margin: const EdgeInsets.only(top: 22.0, bottom: 7.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                ),
            child: Image.asset("img/nikecoatlegacy.png"),
          ),
          Container(height: 5),
          const Text('코트 레거시', style: TextStyle(fontSize: 14)),
          Container(height: 3),
          const Text('Nike', style: TextStyle(fontSize: 13)),
          Container(height: 7),
          const Text('69,000',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Container(height: 5),
          _stars45()
        ],
      ),
    ],
  );
}
