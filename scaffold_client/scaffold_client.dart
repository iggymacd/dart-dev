#import('dart:html');

class scaffold_client {

  scaffold_client() {
  }

  void run() {
    write("Hello Dart!");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new scaffold_client().run();
}
