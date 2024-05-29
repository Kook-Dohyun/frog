import 'package:dart_frog/dart_frog.dart';

/// Handles incoming HTTP requests based on the method type.
/// If the request is a GET method, it responds with 'GET method'.
/// For all other types of requests, it responds with 'Not available method'.
Response onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return Response(body: 'GET method');
  } else {
    return Response(body: 'Not available method');
  }
}
