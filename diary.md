[240529](#240529)

## 240529
 - frog 로컬서버 실행
 ```dart_frog
 dart_frog dev
 ```
 - `method`별로 논리 구성
 ```
Response onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return Response(body: 'GET method');
  } else {
    return Response(body: 'Not available method');
  }
}
 ```
 - 새로운 `Route` 생성
 ```
 dart_frog new route "/user/index"
 ```
 - `_` (언더스코어)는 Dart 언어에서 패턴 매칭이나 조건 분기에서 사용되며, "나머지 모든 경우"나 "기타 모든 값"을 포괄적으로 처리할 때 사용된다.
![/routes/user/index.dart]
