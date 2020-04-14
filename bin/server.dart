import 'dart:io';
import 'dart:convert';

Future main() async {
  // TODO: Get port from environment variable
  const port = 9090;
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    // TODO: Handle requests
    // TODO: Only needed in local development. Will be removed in future
    request.response.headers.add('Access-Control-Allow-Origin', 'http://localhost:8080');


    switch (request.uri.path) {
      case '/signin':
        String payload = await request.transform(Utf8Decoder()).join();
        var username = Uri.splitQueryString(payload)['username'];
        break;
      default:
    }
  }
}