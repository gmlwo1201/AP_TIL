# 중간고사 시험범위 정리

## 0. 플러터 개발 환경 준비
* **앱 개발 방식**
  * 네이티브 양식
    - 플랫폼 자체 제공 개발 환경으로 개발
    - 각 플랫폼에 맞는 환경으로 개발해야 함
    - 안드로이드 > 안드로이드 스튜디오/자바,코틀린|iOS(맥OS) > 엑스코드/스위프트,오브젝티브-C 
  * 하이브리드 방식
    - 웹 기술로 앱 화면 제작 > 네이티브 기술로 앱 형태로 포장
    - 빠른 앱 개발 가능
    - UI 별도 개발 필요 > 네이티브 성능에 미치지 못함
  * 크로스 플랫폼 방식
    - 한번 구현으로 각 플랫폼용 앱 제작 가능
    - 빌드 시 네이티브 코드로 변환 > 네이티브와 거의 같은 성능

* **플러터 특징**
  - 크로스 플랫폼 지원
  - 고성능
  - 사용자 정의 UI 구성 용이
  - 빠른 개발
  - 강력한 커뮤니티 및 생태계

## 1. 첫 모바일 앱 생성
* **환경 구성 검사**
  * Flutter doctor 명령어 이용해 검사
    - 1. cmd에서 실행 - flutter doctor
    - 2. 안드로이드 스튜디오 Terminal에서 실행 - flutter doctor
    - 3. 안드로이드 스튜디오 프로젝트 창에서 사용
      > 프로젝트 열기 > pubspec.yaml > Flutter doctor

## 2. Dart 문법
* **변수 타입**
  - int : 정수
  - double : 실수/소수점
  - String : 문자열
  - bool : 참/거짓
* **final, const**
  - 상수(값 설정되면 바꿀 수 없음)
  - 차이점 : final은 동작 중 값 고정, const는 컴파일 시점에서 값 고정
* **타입 검사, 형 변환**(강의 설명 내용 - hint. 상속)
  * 타입 검사 - is, is!
    - is : 같은 타입이면 true, 아니면 false/is!는 반대
    - 연산 결과 : bool형
    - 상속 : 부모 검사도 true/ 부모가 아니라면 false
  * 형 변환 - as
    - 명시적 형 변환
    - 연산 결과 : 형 변환 된 타입
    - 형 변환 필요성 - 객체지향 언어 객체의 형 변환 필요
    - 상속 : 자식 타입으로 캐스팅할 때 사용(실제 타입 맞아야 함)                                                                                                                                                             
* **익명 함수, 람다식**
  * 익명 함수
    - 함수 코드 변수 값처럼 취급 > 변수에 담기 가능
  ```dart
  var list = [1, 2, 3, 4];
  list.forEach((item) {			// (item) { … } 익명 함수
    print(item);
  });
  ```
  * 람다식
    - 익명 함수보다 단순한 함수코드 간단하게 표현 가능
    - (인수 명) => (코드/반환 값)
  ```dart
  var list = [1, 2, 3, 4];
  list.forEach((item) => print(item));
  ```
* **선택 매개변수**
  - 선택적으로 함수에 전달하고자 하는 매개변수 {}로 표시
```dart
void somthing({String name, int age}) {}
void main() {
   something(name: ‘홍길동’, age: 10);
   something(name: ‘홍길동’);
   something(age: 10);
}
```
* **클래스 정의**
  - 구성 요소 : 필드, 생성자, 메소드
```dart
class Person {
  // 필드 - 선언된 변수, 객체 상태 저장
  String name;
  int age;

  // 생성자 - 객체 생성 시 호출되는 함수
  Person(this.name, this.age);

  // 메소드 - 클래스가 가진 동작(함수와 동일)
  void introduce() {
    print("$name");
  }
}
```
  - 기타 문법
    > 접근 지정자(이름 앞 _붙이면 외부 접근 불가), 게터/세터, 상속, 추상 클래스, 믹스인, 열거 타입, 컬렉션, 스프레드 연산자, Map, Set
* **상속 vs 인터페이스**(강의 설명 내용 - hint. 서로 장단점 반대)
  * 상속
    - 한 클래스의 속성과 클래스 그대로 상속
    - 단 하나의 클래스만 상속 가능
    - 메소드 재정의(override) 가능
    - 부모의 기능 그대로/일부만 바꿔서 재사용에 용이
  * 인터페이스
    - 다중 구현 가능
    - 구현 시 모든 멤머(메소드, 게터/세터 등) 반드시 재정의 해야함
    - 기존 클래스도 인터페이스처럼 사용 가능
    - 규칙 강제하고 싶을 때, 여러 개 클래스 기반 기능 구현에 용이
* **List, Map, Set 표기법**
  * List
    ```dart
    List<String> items = ['A, B, C'];  // List<> var로 사용 가능
    ```
  * Map
    ```dart
    var cityMap = {
      '한국':'부산'
      '일본':'도쿄'
      '중국':'베이징'
    };

    cityMap['한국'] = '서울'; // value 값 변경
    cityMap['미국'] = '워싱턴' // 새로운 값 추가
    ```
  * Set
    ```dart
    var citySet = {'서울', '수원', '오산'};

    citySet.add('부산'); // 추가
    cirySet.remove('오산'); // 제거

    print(citySet.contains('서울')); // Set에 서울이 있는지 = true
    ```
    
* **함수형 프로그래밍 특징 : 일급 객체, forEach, where, map**
  * 일급 객체 - 함수를 변수로 전달, 수정, 대입 가능한 객체
    - 함수를 함수 반환 값으로 사용 가능
    - 프로그래밍 유연성, 표현력 높일 수 있음
  * forEach - 내부 반복 수행(for: 외부 반복 수행)
    - (E element) {} 향테 함수를 인수로 받음 (E는 모든 타입 가능)
  * where - 조건 필터링
    - (상수 값).where(조건 식).forEach(print);
  * map - 반복되는 값 다른 형태로 변환
    - E.where.map(변환 식).forEach();
* **컬랙션 if/for**
  * 조건에 의해 컬렉션 값 조정/다르게 사용하고 싶을 때
  * if - 임시 변수 작성 필요 없음, 더 유동적 코드 작성 가능
    ```dart
    bool proActive = true;

    print([1,2,3,4,5, if(promoActive) 6]); // [1,2,3,4,5,6]
    ```
  * for
    ```dart
    var listOfInts = [1,2,3]
    var listOfStrings = [
      '#0',
      for (var i in listOfInts) '#$i'
    ];
    listIfStrings.forEach(print);  // #0,#1,#2,#3
    ```
## 3. 프로젝트 구조 / 앱 구조
* **pubspec.yaml 관련 설명**(LLM 이용해 상세 파악)
* **샘플 앱 기본 구조**(Ex. Stateless/StatefulWidget 기본 구조, 각각 동작성 차이)

## 4. 기본 위젯 I
* **화면 배치용**
* **위치, 정렬, 크기**
* **버튼 등**

## 5. 기본 위젯 II
* **입력 관련**
* **다이얼로그 등**
* **이벤트**
* **애니메이션**
* **쿠퍼티노 디자인**

## 6. 내비게이션
* **내비게이션 동작성**
* **push/pop 사용법**
* **routes 이용한 방법**(강의 설명 내용)

## 7. 플러터 2 변경점
* **Null 안전한 코드**(flutter 3 기준 Null에 안전한 코드 LLM으로 숙지)
