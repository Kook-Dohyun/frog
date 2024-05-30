[240529](#240529)

## 240529
 - frog 로컬서버 실행
 ```bash
 dart_frog dev
 ```
 
 - `method`별로 논리 구성
 ```dart
Response onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return Response(body: 'GET method');
  } else {
    return Response(body: 'Not available method');
  }
}
 ```
 [index.dart](/routes/user/index.dart)
 
 - 새로운 `Route` 생성
 ```bash
 dart_frog new route "/user/index"
 ```
 
 - `_` (언더스코어)는 Dart 언어에서 패턴 매칭이나 조건 분기에서 사용되며, "나머지 모든 경우"나 "기타 모든 값"을 포괄적으로 처리할 때 사용된다.
[index.dart: L6](/routes/user/index.dart#L6)
 
## 240530
 - 각 Route를 통한 CRUD 요청은 `HttpMethod`의 members로 처리한다.
  ```dart
  HttpMethod.delete,
  HttpMethod.get,
  HttpMethod.post,
  HttpMethod.put,
  HttpMethod.patch, ...
  ```
#### Dynamic Route(동적 경로) 생성 및 사용.
 - `Route`의 `경로 변수` `동적 경로(dynamic Route)`를 만드는 명령어 e.g. "/user/" 경로에 "id"라는 동적 경로를 생성하는 경우.
  ```bash
  dart_frog new route '/user/[id]'
  ```

  [`user/[id].dart`](/routes/user/[id].dart) 생성된다.
 
 - `PUT` 과 `DELETE`,`PATCH` 메소드 처리 로직을 생성했다. 
 "PUT http://localhost:8080/user/Kook-Dohyun"라면, 다음과 같이 `Kook-Dohyun`을 `id`로 참조해서 로직이 동작한다. 
    ![alt text](/assets/image.png)
#### Database 구축
- Prisma를 이용 : [Prisma Docs](https://prisma.pub/getting-started/)

1) node.js 패키지 설치
```bash
 npm i prisma@4.16.2
```

2) Prisma 초기화
```bash
 npx prisma init
```
```diff
...
├── prisma
│   └─── schema.prisma
└─── .env
```
or 이 경우에는 3),4) 건너뜀.
```bash
npx prisma init --datasource-provider=mysql --generator-provider="dart run orm"
```

3) .env 이름 변경
 [.env: L7](.env#L7) => [.env: L9](.env#L9)

4) 스키마 설정 ([schema.prisma](/prisma/schema.prisma))
```prisma
generator client {
  provider = "dart run orm" // "prisma-client-js" => 'dart run orm'
}

datasource db {
  provider = "mysql" // "postgresql"=> 'mysql'
  url      = env("DATABASE_URL")
}

```

5) Add data model
```prisma
model User {
  id    Int     @id @default(autoincrement())
  email String  @unique
  name  String?
}
```

<!-- 6) Prisma Dart Client 생성
```bash
npx prisma generate
```
```diff
...
└─── prisma
     └─── generated_dart_client
          ├─── client.dart - The Prisma client implementation.
          ├─── model.dart - Your Prisma schema models, views and enums.
          └─── prisma.dart - Auto-generated Prisma client types.
``` -->