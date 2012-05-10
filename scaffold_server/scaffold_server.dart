#import('dart:io');
#import('../handlers_lib/handlers_lib.dart');

void main() {
  HttpServer server = new HttpServer();
  
  server.defaultRequestHandler = (req,resp) => 
      new DefaultHandler().onRequest(req,resp);
  server.addRequestHandler((req) => 
      req.path == '/favicon.ico', (req,resp) => 
          new FileHandler().onRequest(req,resp,'static/images/favicon.ico'));
  server.addRequestHandler((req) => 
      req.path.startsWith('/') && req.method == 'GET', (req,resp) => 
          new ClientSideHandler().onRequest(req,resp,'../scaffold_client'));

  server.listen('127.0.0.1', 8001);
  print('server listening on port ${server.port}');
}
