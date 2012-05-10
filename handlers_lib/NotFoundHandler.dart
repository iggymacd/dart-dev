class NotFoundHandler {
  NotFoundHandler(){
  }
  List<int> _notFoundPage;
  static final String notFoundPageHtml = """
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL was not found on this server.</p>
</body></html>""";
  void onRequest(HttpRequest request, HttpResponse response){

    if (_notFoundPage == null) {
      _notFoundPage = notFoundPageHtml.charCodes();
    }
    response.statusCode = HttpStatus.NOT_FOUND;
    response.headers.set("Content-Type", "text/html; charset=UTF-8");
    response.contentLength = _notFoundPage.length;
    response.outputStream.write(_notFoundPage);
    response.outputStream.close();
  }
}
