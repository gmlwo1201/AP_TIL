# 네비게이션 동작 방식
![tempFileForShare_20250427-140149](https://github.com/user-attachments/assets/47c6b857-9765-44bd-886a-ea168ee08377)

* 앱이 실행될 때 화면은 *스택*구조로 메모리에 쌓임
* 스택 : 후입 선출 방식
* 스택에서 모든 화면이 제거되면 앱 종료

# StatelessWidget 클래스 동작
```dart
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');  // 1
    return Scaffold(...);
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');  // 1
    return Scaffold(...);
  }
}
```
> 1. 어떤 화면인지 알 수 있도록 print 로그 작성
> 2. 앱 실행
> 3. push로 두 번째 페이지 표시
> 4. pop으로 ok 값 가지고 돌아가기 실행

# StatefulWidget 클래스 동작
```dart
class FirstStatefulPage extends StatefulWidget {
  @override
  _FirstStatefulPageState createState() => _FirstStatefulPageState();
}

class _FirstStatefulPageState extends State<FirstStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');  // 2
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      body: ElevatedButton(
        child: Text('다음 페이지로'),
        onPressed: () {
          final person = Person('홍길동',20);
          Navigator.push(  // 1
            context,
            MaterialPageRoute(builder: (context) => SecondStatefulPage(person: person)),
          );
        }
      )
    );
  }
}

class SecondStatefulPage extends StatefulWidget {
  final Person person;

  SecondStatefulPage({Key key, @required this.person}) : super(key: key);

  @override
  _SecondStatefulPageState createState() => _SecondStatefulPageState();
}

class _SecondStatefulPageState extends State<SecondStatefulPage> {
  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');  // 3
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: ElevatedButton(
        child: Text('이전 페이지로'),
        onPressed: () {
          Navigator.pop(context);
        }
      )
    );
  }
}
```
> 1. push 메소드로 SecondStatefulPage 클래스 표시
> 2. FirstStatefulPage 클래스의 build 메소드 호출
> 3. SecondStatefulPage 클래스의 build 메소드 호출

# initState, dispose - 생명주기 메소드
* initState : 위젯 생성될 때 호출
* dispose : 위젯이 완전히 종료될 때(pop될 때) 호출
```dart
class _FirstStatefulPageState extends State<FirstStatefulPage> {
  @override
  void initState() {
    super.initState();
    print("FirstPage initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print("FirstPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('FirstPage build()');
    return Scaffold(...);
  }
}

class _SecondStatefulPageState extends State<SecondStatefulPage> {
  @override
  void initState() {
    super.initState();
    print("SecondPage initState()');
  }

  @override
  void dispose() {
    super.dispose();
    print("SecondPage dispose()');
  }

  @override
  Widget build(BuildContext context) {
    print('SecondPage build()');
    return Scaffold(...);
  }
}
```
> 1. FirstPage push > FirstPage iniState, FirstPage build 출력
> 2. SecondPage push > SecondPage initState, SecondPage build 출력
> 3. 뒤로(pop) > FirstPage build, SecondPage dispose 출력
> 4. 뒤로(pop) > FirstPage dispose 출력

* **복잡한 처리나 네트워크 요청 등의 로직은 build 메소드가 아닌 initState 메소드에서 수행해야 함**
