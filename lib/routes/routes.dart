import 'package:flutter/material.dart';

import '../pages/pages.dart';

part 'home_route.dart';
part 'not_found_route.dart';

final kAppRoutes = <String, Route<dynamic>>{
  '/': HomeRoute(),
  '404': NotFoundRoute(),
};
