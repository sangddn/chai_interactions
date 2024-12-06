import 'package:flutter/material.dart';

// State management
part 'home_providers.dart';


// Components
part 'components/app_bar.dart';
part 'components/search_section.dart';
part 'components/your_bots_section.dart';
part 'components/top_bots_section.dart';
part 'components/image_generation_section.dart';
part 'components/explore_by_topics_section.dart';
part 'components/recommended_bots_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
