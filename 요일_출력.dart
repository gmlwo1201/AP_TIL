void main() {
    var input = '2025-03-11';
    var date = DateTime.parse(input);
    List<String> week = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];

    print('${week[date.weekday - 1]}');
}