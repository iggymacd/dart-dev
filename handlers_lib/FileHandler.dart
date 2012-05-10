class FileHandler {
  FileHandler(){
  }
  void onRequest(HttpRequest request, HttpResponse response, [String fileName = null]){
    if (fileName == null) {
      fileName = request.path.substring(1);
    }
    File file = new File(fileName);
    if (file.existsSync()) {
      print('file path is ${file.fullPathSync()}');
      String mimeType = "text/html; charset=UTF-8";
      int lastDot = fileName.lastIndexOf(".", fileName.length);
      if (lastDot != -1) {
        String extension = fileName.substring(lastDot);
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
      print("File not found: $fileName");
      new NotFoundHandler().onRequest(request, response);
    }
  }
}
