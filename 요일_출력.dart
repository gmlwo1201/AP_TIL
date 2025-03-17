void main() {
    var input = '2025-03-11'; // 날짜 지정
    var date = DateTime.parse(input); // 날짜를 숫자열에서 함수로 지정
    List<String> week = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일']; // 요일로 표시하기 위해 리스트 생성

    print('${week[date.weekday - 1]}');
}
