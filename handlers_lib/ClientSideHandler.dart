class ClientSideHandler {
  ClientSideHandler(){
  }
  void onRequest(HttpRequest request, HttpResponse response, String clientSidePath){
    if (clientSidePath == null) {
      print("Path not found: $clientSidePath");
      new NotFoundHandler().onRequest(request, response);
    }
    String resourcePath = request.path;
    Directory directory = new Directory(clientSidePath);
    if(!directory.existsSync()){
      print("Path not found: $clientSidePath");
      new NotFoundHandler().onRequest(request, response);
    }
    File file = new File('$clientSidePath/$resourcePath');
    if (file.existsSync()) {
      String fullPath = file.fullPathSync();
      print('file path is ${fullPath}');
      String mimeType = "text/html; charset=UTF-8";
      int lastDot = fullPath.lastIndexOf(".", fullPath.length);
      if (lastDot != -1) {
        String extension = fullPath.substring(lastDot);
        if (extension == ".css") { mimeType = "text/css"; }
        else if (extension == ".html") { mimeType = "text/html; charset=UTF-8"; }
        else if (extension == ".htm") { mimeType = "text/html; charset=UTF-8"; }
        else if (extension == ".js") { mimeType = "application/javascript"; }
        else if (extension == ".ico") { mimeType = "image/vnd.microsoft.icon"; }
        else if (extension == ".png") { mimeType = "image/png"; }
        else {mimeType = "application/octet-stream";}
      }
      response.headers.set("Content-Type", mimeType);
      response.contentLength = file.lengthSync();
      file.openInputStream().pipe(response.outputStream);
    } else {
      print("Path not found: $clientSidePath");
      new NotFoundHandler().onRequest(request, response);
    }
  }
}
