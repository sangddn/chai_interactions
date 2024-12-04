part of 'routes.dart';

class NotFoundRoute extends MaterialPageRoute<void> {
  NotFoundRoute()
      : super(
          builder: (context) => const Scaffold(body: Text('Not Found')),
        );
}
