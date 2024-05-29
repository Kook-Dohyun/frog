import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return switch (context.request.method) {
    HttpMethod.get=> _getUsers(),
    _ => Response(body: 'This is default')
  };
}

Response _getUsers() {
  return Response.json(
    body: [
      {'name': 'Dohyun', 'lastname': 'Kook', 'age': 29},
      {'name': 'Bunjun', 'lastname': 'Park', 'age': 25},
    ],
  );
}
