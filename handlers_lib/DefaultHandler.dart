class DefaultHandler {
  String title = 'Some Sample';
  DefaultHandler(){
    
  }
  List<int> _notFoundPage;
  void onRequest(HttpRequest request, HttpResponse response){
    String notFoundPageHtml = """
        <html><head>
        <title>$owner's $projectName</title>
        </head><body>
        <h1>Sample</h1>
        <p>The requested URL is a sample.</p>
        </body></html>""";
    HttpHeaders headers = request.headers;
    print('begin printing out headers');
    print(headers.toString());
    print('end printing out headers');
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
