import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(
  RequestContext context,
  String id,
) async {
  return switch (context.request.method) {
    HttpMethod.delete => _deleteId(id: id),
    HttpMethod.put => _putId(id: id, context: context),
    HttpMethod.patch => _patchId(id: id, context: context),
    _ => Future.value(Response(body: 'default'))
  };
}

Future<Response> _deleteId({required String id}) async {
  return Response.json(body: {'message': 'user with id:$id is deleted.'});
}

Future<Response> _putId({
  required String id,
  required RequestContext context,
}) async {
  final json = Map<String, dynamic>.from(
    await context.request.json() as Map<dynamic, dynamic>,
  );
  return Response.json(
    body: {'message': 'user with id:$id is updated.', 'data': json},
  );
}

Future<Response> _patchId({
  required String id,
  required RequestContext context,
}) async {
  final json = Map<String, dynamic>.from(
    await context.request.json() as Map<dynamic, dynamic>,
  );
  return Response.json(
    body: {'message': 'user with id:$id is updated.', 'data': json},
  );
}
