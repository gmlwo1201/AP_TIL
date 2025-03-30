# Today I Learned

### 수평적 사고 : 같은 대상을 봐도 여러 가지 생각이 나오는데 이것을 수평적 사고라고 한다.<br>
&nbsp;&nbsp;&nbsp;&nbsp;ex) 자전거를 보고 그냥 자전거라고 생각하는 경우도 있고 인생에 비유하는 경우도 있다.

## @ Dart 언어란?
▶ Google에서 만든 JavaScript와 유사하지만 다른 정적 언어<br>
&nbsp;&nbsp;&nbsp;&nbsp;(Java - 클래스 및 매서드 구문 유사 / C# - 비동기 프로그래밍 async, await 등 유사)<br><br>
▶JavaScript의 동적 언어의 성능, 일관성 문제를 보완하기 위해 설계

## ● Dart 언어 - 실습
- **[구구단](./구구단.dart)**
- **[정사각형 출력](./정사각형_출력.dart)**
- **[요일 출력](./요일_출력.dart)**

## 변수
* 데이터(값)을 저장하는 장소
* 변수 종류 = 타입 or 자료형
* Dart는 숫자형, 문자열 기본 변수 타입 제공
* int(정수), double(실수/소수점), String(문자열), bool(참, 거짓)

## ● var 선언
* var 사용 이유 : 가독성, 유연성, 일관성 향상
```dart
void main() {
  int a = 5;
  double b = 3.1415;
  String c = '문자열1';
  String d = "문자열2";
  bool e = true;
  num n1 = 10;
  num n2 = 10.25;
  
  bool cond1 = a > 5; // false
  bool cond2 = d == "문자열2";
  bool result = cond1 || cond2;
  
  // 전부 var로 변수 선언 가능
}
```

## ● 상수 final, const, 사칙연산
```dart
//final, const로 설정한 변수는 변경X
void main() {
  final name = '홍길동';
  //name = '임꺽정'; X
  
  const name2 = '임꺽정';
  //name2 = '홍길동'; X
  
  // +, -, *, /
  var a = 10;
  var b = 5;
  var result = a % b;
  print(result);
  print(result is int);
  print(result is double);

  // /:나누기, double형으로 반환
  // ~/:몫, int형으로 반환
  // %:나머지, int형으로 반환
}
```

## ● 숫자 관련, 비교
```dart
// ++/-- 증감 연산자
// 후위 연산(시작하면서 계산):x++,x--
// 전위 연산(계산하면서 시작):++x,--x
void main() {
  var v = 5;
  v++;
  print(v);
}
```
```dart
// 비교
void main() {
  var a = 5;
  var b = 6;
  
  var c1 = a == b;
  var c2 = a != b;
  var c3 = a < b;
  var c4 = a > b;
  var c5 = a >= b;
  var c6 = a <= b;
  
  var result = [c1, c2, c3, c4, c5, c6];
  print(result);

  // and(%%), or(||), not(!)
  var isA = true; // 아침식사
  var isB = true; // 점심
  var isC = true; // 저녁
  
  //오늘 밥 먹었나
  var c = isA || isB || isC;

  // 변수 상태 확인
  var v = 5;
  print(v is int); // v 는 정수
  print(v is double); // 5 = 5.0
  print(v is String);
  print(v is bool);
  
  int a = 5;
  num b = a as num;
  print(b);
}
```

## ● 함수 선언
```dart
// print2 함수를 만들고 인자로 주어진 문자열로 다음처럼 출력하는 함수를 만들어 사용하자.
//
//print2("Hello World");
//출력:*Hello World*

void main() {
  print2('Hello World');
}

void print2(String message) {
  //print('*$message*');
  print('*' + message + '*');
}
```

## ● List
```dart
void main() {
  var lottoNums = [5, 6, 11, 13, 17, 21];
  //print(lottoNums is List); 리스트인지 확인
  
  lottoNums.forEach((num) => print(num));
}
```

## ● if
```dart
void main() {
  var score = 88;
  if (score >= 90) {
    print('A');
  } else if (score >= 80) {
    print('B');
  } else if (score >= 70) {
    print('C');
  } else if (score >= 60) {
    print('D');
  } else {
    print('F');
  }
}
```

## ● for
```dart
void main() {
  var items = ['짜장', '라면', '볶음밥'];
  
  for (var i = 0; i < items.length; i++) {
    print(items[i]);
  }
  
  print('');
  
  for (var item in items) {
    print(item);
  }
  
  print('');
  
  items.forEach((item) => print(item));
}
```
>>>>>>> 1~2주차

## 객체 지향 프로그래밍
- 클래스
- 접근 지정자
- 생성자
- 게터, 세터
- 상속
- 추상 클래스
- interface 클래스, sealed 클래스 (Flutter3)
* @ 객체 지향이란?
  - 프로그래밍에서 목적에 따라 쓰임새를 고유하게 정의한 것을 '객체(Object)'라고 한다.
    - 필드(값)와 메서드(기능)로 구성된 단위
    - 객체 생성 전 형태를 클래스, 하나의 객체를 인스턴스라고 한다.
  - 객체와 객체의 상호작용으로 프로그램이 동작하게 프로그래밍 하는 것을 '객체 지향 프로그래밍'이라고 한다.
* 클래스
  - 객체의 설계도
  - 설계도에 의해 만들어진 형태를 객체 또는 클래스를 인스턴스화 했다고 한다.
* 접근 지정자
  - 이름 앞에 '_'를 붙이면 외부 접근 불가
  - 붙이지 않으면 접근 가능
* 생성자
  - 객체를 생성할 때 해당 인스턴스에 정보를 생성
* 게터, 세터
  - 속성 값을 받아 변수에 지정
  - 게터만 사용하면 외부에서 변경 불가
  - 세터와 같이 사용하면 외부에서 변경 가능하지만 키는 클래스가 가지고 있음
* 상속
  - 부모 클래스의 고유 상태를 자식 클래스에 물려주는 것
  - 코드의 재사용성 높이고 계층 구조 형성
* 추상 클래스
  - 구현하지 않고 선언만 하는 것
  - abstract
  - 선언 후에 하위 클래스들을 하나로 묶을 수 있음 (객체 지향 프로그래밍의 다형성)

* 믹스인
  - with 키워드 사용하면 상속하지 않고 다른 클래스의 기능 가져오거나 오버라이드 가능
  - * 믹스인이 없이 상속만 사용하면 부모 클래스를 상속할 때 간섭이 발생함
* 열거 타입
  -  상수를 정의하는 특수한 형태의 클래스
  -  상태를 표현할 때 가독성 있게 표현 가능 (ex. 로그인, 학점, 직원 목록)
* 컬랙션
  - 파이썬 참고
  - List[1,2,3...], Map{'한국':'서울','일본':'도쿄'...}(name, value), Set{1,2,3...}(중복 불가)
  - 순서가 있는 연속된 자료 표현에 사용
  - dynamic : json 형태를 표현할 수 있도록 허용
* 스프레드 연산자
  - var에서 값들 설정할 때 가독성 좋게 표현(...items)
* Map
  - 키와 값으로 쌍 지어진 사전 형태 자료 구조 표현에 사용
  - Dictionary 라고도 함
* Set
  - 중복되지 않는 집합 표현에 사용

## 함수형 프로그래밍
- 일급 객체
- for문과 forEach() 함수
- where()
- map()
- toList()
- toSet()
- any()
- reduce()
* 일급 객체
  - 값이나 개체가 언어 내에서 동등한 대우를 받는 것
    - 함수를 변수에 저장 가능
    - 함수를 함수 인자에 넘길 수 있음
    - 함수를 함수의 반환 값으로 사용 가능
    - 프로그래밍 유연성, 표현력 높일 수 있음
* for문과 forEach() 함수
  - Dart 언어의 일급 객체의 특징
  - List 목록 조회하는 forEach() 메서드 가능
* where()
  - 조건 필터링할 때 사용하는 함수
* map()
  - 반복되는 값 다른 형태로 변환
* toList()
  - lterable<T>를 List<T>로 변환
* toSet()
  - 중복 값 제거하고 목록 만들 때 유용
* any()
  - 조건을 충족하는 요소 하나라도 있는지 확인
* reduce()
  - 반복 요소 줄여가며 결과 만들 때 유용

## 기타 유용한 기법
- 계단식 표기법
- 컬렉션 if
- 컬렉션 for
- null 처리 관련

* LINQ
  - 필터링
    - where, take, skip
  - 변환
    - map, expand
  - 정렬
    - sort, reversed
  - 집계
    - reduce, fold
  - 조건 검사
    - any, every, contains
  - 검색
    - firstWhere, lastWhere
* dart에서 LINQ 사용 이유
  - 코드 간결성, 가독성
  - 선언적이고 직관적인 방식
  - 안정성과 유지보수성
* 선언적/명령적 프로그래밍 차이
  - 선언적 프로그래밍 : 무엇을 해야하는지, 결과만 표현
  - 명령적 프로그래밍 : 어떻게 해야하는지, 절차와 단계 명확히 작성해야 함
>>>>>>> 3주차 


>>>>>>> 4주차 
