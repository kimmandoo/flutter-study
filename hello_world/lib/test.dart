void main() {
  Future<void> todo(int sec) async {
    // async -> Future로 키워드 바꿔줘야됨
    await Future.delayed(
      Duration(seconds: sec),
    ); // delay와 동일하다 Future작업이 끝나는 걸 기다렸다가 실행되는 함수 await
    print("todo done in $sec");
  }

  Stream<int> todo2() async* {
    // stream은 끊기지않는게 전제사항
    int cnt  = 0;

    while(cnt < 5){
      cnt++;
      await Future.delayed(
        Duration(seconds: 1),
      );
      print("todo is running");
      yield cnt; // cnt 객체를 Stream에 넣어서 return 시켜줄 수 있다.
    }
  }
  
  todo2().listen((event){
    // yield로 넘겨준 값이 event에 들어가는 것
    print(event);
  });
  // FutureBuilder, StreamBuilder 모두 존재함

  // 비동기 연습하기
  todo(3);
  todo(1);
  todo(5);
  // async, await, Future
  // async*, yield, Stream
  // Future -> 1회만 응답받기
  // Stream -> 지속적으로 응답을 받아야하는 경우
}
