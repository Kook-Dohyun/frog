import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => _getUsers(),
    HttpMethod.post => _createUser(context),
    _ => Future.value(Response(body: 'This is default'))
  };
}

Future<Response> _getUsers() {
  return Future.value(
    Response.json(
      body: [
        {'name': 'Dohyun', 'last_name': 'Kook', 'age': 29},
        {'name': 'Bunjun', 'last_name': 'Park', 'age': 25},
      ],
    ),
  );
}

Future<Response> _createUser(RequestContext context) async {
  final json = Map<String, dynamic>.from(
    await context.request.json() as Map<dynamic, dynamic>,
  );
  final name = json['name'].toString();
  final lastName = json['last_name'].toString();
  final age = int.parse(json['age'].toString());
  return Response.json(
    body: {
      'message': 'Create user ${'$lastName $name'} Successfuly!',
      'user': {'name': name, 'last_name': lastName, 'age': age},
    },
  );
}
