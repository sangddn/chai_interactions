import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

/// CHAI Logo.
///
/// This logo animates to the current theme's brightness (light or dark).
///
class ChaiLogo extends StatelessWidget {
  const ChaiLogo({this.color, super.key});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    const path = 'assets/logos/chai-logo.svg';
    final svg = ScalableImageWidget.fromSISource(
      si: ScalableImageSource.fromSvg(rootBundle, path),
    );
    return ColorFiltered(
      colorFilter: ui.ColorFilter.mode(
        Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
      child: svg,
    );
  }
}
