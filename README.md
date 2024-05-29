# frog_server


[![license_badge](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![very_good_analysis_badge](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

An example application built with dart_frog

---

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
 - 
