import 'dart:io';
import 'dart:convert';

void main() async {
  // TODO: Get port from environment variable
  const port = 9090;
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);

  print('Server listening on port $port');

  await for (HttpRequest request in server) {
    // TODO: Handle requests
  }
}