dart-dev
========

Various projects experimenting with Dart

The three folders that I have started with work hand with each other to accomplish one approach to developing a client and server side solution with Dart.

handlers_lib
scaffold_client
scaffold_server

Each folder can be opened in the Dart editor individually as a project folder. 

The scaffold_client folder is unchanged from creating a new web project, and generating the javascript. 
The scaffold_server folder is a simple HTTP server that imports a handler library, and delegates to a ClientSide handler to handle requests. That is where the static files are found and pushed to the client when requested.

Consider this code as Alpha and more of a proof of concept.

My plan is to have a project starting point to ramp up quickly when building a server/client application.
What this simple code demonstrates is the ability to develop the client and server in side by side projects in the Dart editor, and execute both with very little trouble.

If you clone the given repository, and then open each folder in the Dart editor, you will be able to navigate to the scaffold_server folder and run the scaffold_server.dart file. Open any local browser and navigate to http://localhost:8001/scaffold_client.html. 

You will see that the client side dart code is running as expected.

Please feel free to make recommendations and changes where you see a need.

ToDo:
=====
* Create base client side templates based on twitter bootstrap.
* Provide additional server side services like logging and session support.
* Many more additional services as time goes on. I am close to having an upload handler implemented and will add this as well. 
* Later on I will upload my FormHandler to the handler library.

