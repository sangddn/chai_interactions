part of 'core_ui.dart';

abstract final class ChaiColors {
  static const Color offWhite = Color(0xffF4F4F4);
  static const Color white = Color(0xffFFFFFF);

  static const _grayLightModeNoOpacity = Color(0xFFE0E0E0);
  static final _grayLightMode = Colors.black.withOpacity(0.05);
  static final _grayLightModeHighContrast = Colors.black.withOpacity(0.085);
  static const _grayDarkMode = Colors.white10;
  static final _grayDarkModeHighContrast = Colors.white.withOpacity(0.15);

  static final _lightGrayLightMode = Colors.black.withOpacity(0.025);
  static final _lightGrayLightModeHighContrast =
      Colors.black.withOpacity(0.035);
  static final _lightGrayDarkMode = Colors.white.withOpacity(0.08);
  static final _lightGrayDarkModeHighContrast = Colors.white.withOpacity(0.12);

  static const _darkGrayLightMode = Colors.black26;
  static const _darkGrayLightModeHighContrast = Colors.black38;
  static const _darkGrayDarkMode = Colors.white30;
  static final _darkGrayDarkModeHighContrast = Colors.white.withOpacity(0.45);

  static const _textGrayLightMode = Colors.black54;
  static final _textGrayLightModeHighContrast = Colors.black.withOpacity(0.64);
  static const _textGrayDarkMode = Colors.white54;
  static final _textGrayDarkModeHighContrast = Colors.white.withOpacity(0.75);

  static final lightGray = CupertinoDynamicColor.withBrightnessAndContrast(
    color: _lightGrayLightMode,
    darkColor: _lightGrayDarkMode,
    highContrastColor: _lightGrayLightModeHighContrast,
    darkHighContrastColor: _lightGrayDarkModeHighContrast,
  );
  static final opaqueLightGray =
      CupertinoDynamicColor.withBrightnessAndContrast(
    color: Colors.grey.tint(.95),
    darkColor: Colors.grey.shade(.9),
    highContrastColor: Colors.grey.tint(.9),
    darkHighContrastColor: Colors.grey.shade(.7),
  );
  static final gray = CupertinoDynamicColor.withBrightnessAndContrast(
    color: _grayLightMode,
    darkColor: _grayDarkMode,
    highContrastColor: _grayLightModeHighContrast,
    darkHighContrastColor: _grayDarkModeHighContrast,
  );
  static final darkGray = CupertinoDynamicColor.withBrightnessAndContrast(
    color: _darkGrayLightMode,
    darkColor: _darkGrayDarkMode,
    highContrastColor: _darkGrayLightModeHighContrast,
    darkHighContrastColor: _darkGrayDarkModeHighContrast,
  );
  static final textGray = CupertinoDynamicColor.withBrightnessAndContrast(
    color: _textGrayLightMode,
    darkColor: _textGrayDarkMode,
    highContrastColor: _textGrayLightModeHighContrast,
    darkHighContrastColor: _textGrayDarkModeHighContrast,
  );

  static const dark = Color(0xff121212);
  static const offDark = Color(0xff181818);
}

extension ColorUtilsExtension on Color {
  Color get inverse => ColorUtils.getInverseColor(this);

  double get r => red / 255;
  double get g => green / 255;
  double get b => blue / 255;
  double get a => alpha / 255;

  String toHexStringRGB() {
    final r = (this.r * 255).round().toRadixString(16).padLeft(2, '0');
    final g = (this.g * 255).round().toRadixString(16).padLeft(2, '0');
    final b = (this.b * 255).round().toRadixString(16).padLeft(2, '0');
    return '#$r$g$b';
  }

  Color adaptForDarkMode() {
    final hsl = HSLColor.fromColor(this);
    final lightness = hsl.lightness;
    final saturation = hsl.saturation;
    final hue = hsl.hue;

    if (lightness <= 0.75) {
      return HSLColor.fromAHSL(
        1.0,
        hue,
        saturation,
        0.75,
      ).toColor();
    }

    return this;
  }

  Color adaptForLightMode() {
    final hsl = HSLColor.fromColor(this);
    final lightness = hsl.lightness;
    final saturation = hsl.saturation;
    final hue = hsl.hue;

    if (lightness > 0.4) {
      return HSLColor.fromAHSL(
        1.0,
        hue,
        saturation,
        0.4,
      ).toColor();
    }

    return this;
  }

  Color adaptForContext(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.light:
        return adaptForLightMode();
      case Brightness.dark:
        return adaptForDarkMode();
    }
  }

  Color inverseAdaptForContext(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.light:
        return adaptForDarkMode();
      case Brightness.dark:
        return adaptForLightMode();
    }
  }

  CupertinoDynamicColor adaptive() => CupertinoDynamicColor.withBrightness(
        color: adaptForLightMode(),
        darkColor: adaptForDarkMode(),
      );

  CupertinoDynamicColor inverseAdaptive() =>
      CupertinoDynamicColor.withBrightness(
        color: adaptForDarkMode(),
        darkColor: adaptForLightMode(),
      );

  Color opacityFactor(double factor) {
    // return Color.from(
    //   alpha: a * factor,
    //   red: r,
    //   green: g,
    //   blue: b,
    // );

    return Color.fromARGB(
      (a * 255 * factor).round(),
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
    );
  }

  Color getBolderShade({
    double saturationFactor = 1.2,
    double lightnessAdjustment = -0.05,
  }) {
    // Convert the color to HSL
    final hsl = HSLColor.fromColor(this);

    // Increase the saturation (within bounds of 0.0 to 1.0)
    final newSaturation = (hsl.saturation * saturationFactor).clamp(0.0, 1.0);

    // Adjust the lightness (make it slightly darker, but not too much)
    final newLightness = (hsl.lightness + lightnessAdjustment).clamp(0.0, 1.0);

    // Return the new color with updated saturation and lightness
    return hsl
        .withSaturation(newSaturation)
        .withLightness(newLightness)
        .toColor();
  }

  Color getPastel() {
    // Convert to HSL
    final hslColor = HSLColor.fromColor(this);

    // Create a pastel version by reducing saturation and increasing lightness
    final pastelHslColor = hslColor.withSaturation(0.4).withLightness(0.8);

    // Convert back to Color
    return pastelHslColor.toColor();
  }
}

abstract final class ColorUtils {
  static Color colorFromHexString(String hexString) {
    final hex = hexString.replaceFirst('#', '');
    final r = int.parse(hex.substring(0, 2), radix: 16);
    final g = int.parse(hex.substring(2, 4), radix: 16);
    final b = int.parse(hex.substring(4, 6), radix: 16);
    return Color.fromARGB(255, r, g, b);
  }

  static Color getInverseColor(Color color) {
    final r = 1.0 - color.r;
    final g = 1.0 - color.g;
    final b = 1.0 - color.b;

    // return Color.from(
    //   alpha: color.a,
    //   red: r,
    //   green: g,
    //   blue: b,
    // );
    return Color.fromARGB(
      (color.a * 255).round(),
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
    );
  }

  static Future<List<Color>> detectImageColors(
    ImageProvider image, [
    int maximumColorCount = 6,
  ]) async {
    try {
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        image,
        maximumColorCount: maximumColorCount,
        timeout: const Duration(seconds: 5),
      );
      return paletteGenerator.colors.toList();
    } on TimeoutException {
      return [];
    }
  }

  /// Get the vibrant colors of an image.
  ///
  /// [onPaletteObtained] is a callback that is called with the [PaletteGenerator]
  /// after it is obtained. This is not called if the palette is cached.
  ///
  static Future<CupertinoDynamicColor> getVibrantColors(
    ImageProvider imageProvider,
    String cacheKey, {
    CupertinoDynamicColor? fallbackColors,
  }) async {
    try {
      final palette = await generatePalette(imageProvider);
      final muted = palette.mutedColor?.color;
      final lightMuted = palette.lightMutedColor?.color;
      final darkMuted = palette.darkMutedColor?.color;
      final vibrant = palette.vibrantColor?.color;
      final lightVibrant = palette.lightVibrantColor?.color;
      final darkVibrant = palette.darkVibrantColor?.color;

      final light = darkMuted ??
          lightMuted ??
          fallbackColors?.color ??
          Colors.transparent;

      final dark = lightVibrant ??
          vibrant ??
          darkVibrant ??
          muted ??
          fallbackColors?.darkColor ??
          Colors.transparent;

      return CupertinoDynamicColor.withBrightness(
        color: light,
        darkColor: dark,
      );
    } on TimeoutException {
      return const CupertinoDynamicColor.withBrightness(
        color: Colors.transparent,
        darkColor: Colors.transparent,
      );
    }
  }

  static Future<PaletteGenerator> generatePalette(
    ImageProvider imageProvider,
  ) async {
    final ImageStream stream = imageProvider.resolve(
      const ImageConfiguration(
        size: Size(200.0, 200.0),
        devicePixelRatio: 1.0,
      ),
    );
    final imageCompleter = Completer<ui.Image>();
    Timer? loadFailureTimeout;
    late ImageStreamListener listener;
    listener = ImageStreamListener((ImageInfo info, bool synchronousCall) {
      loadFailureTimeout?.cancel();
      stream.removeListener(listener);
      imageCompleter.complete(info.image);
    });
    loadFailureTimeout = Timer(const Duration(seconds: 5), () {
      stream.removeListener(listener);
      imageCompleter.completeError(
        TimeoutException(
          'Timeout occurred trying to load from $imageProvider',
        ),
      );
    });
    stream.addListener(listener);
    final image = await imageCompleter.future;
    final imageData = await image.toByteData();
    if (imageData == null) {
      throw StateError('Failed to encode the image.');
    }

    return compute(
      _generatePalette,
      (imageData, image.width, image.height),
    );
  }
}

Future<PaletteGenerator> _generatePalette(
  (ByteData data, int width, int height) m,
) {
  return PaletteGenerator.fromByteData(
    EncodedImage(m.$1, width: m.$2, height: m.$3),
    maximumColorCount: 6,
  );
}

extension SpecificTintsShades on Color {
  /// Internal method to convert the Color to a list of RGB values.
  List<double> _toRgb() {
    return [r, g, b];
  }

  /// Internal method to create a Color from RGB values.
  static Color _fromRgb(double r, double g, double b, [double opacity = 1.0]) {
    // return Color.from(red: r, green: g, blue: b, alpha: opacity);
    return Color.fromARGB(
      (opacity * 255).round(),
      (r * 255).round(),
      (g * 255).round(),
      (b * 255).round(),
    );
  }

  /// Internal method to create a tint of the Color.
  Color tint(double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');

    final rgb = _toRgb();
    final tintedRgb = rgb.map((c) => c + ((1.0 - c) * factor)).toList();

    return _fromRgb(tintedRgb[0], tintedRgb[1], tintedRgb[2], a);
  }

  /// Internal method to create a shade of the Color.
  Color shade(double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor must be between 0 and 1');

    final rgb = _toRgb();
    final shadedRgb = rgb.map((c) => c * (1.0 - factor)).toList();
    return _fromRgb(shadedRgb[0], shadedRgb[1], shadedRgb[2], a);
  }

  // Tint methods
  Color get tint10 => tint(0.1);
  Color get tint20 => tint(0.2);
  Color get tint30 => tint(0.3);
  Color get tint40 => tint(0.4);
  Color get tint50 => tint(0.5);
  Color get tint60 => tint(0.6);
  Color get tint70 => tint(0.7);
  Color get tint80 => tint(0.8);
  Color get tint90 => tint(0.9);

  // Shade methods
  Color get shade10 => shade(0.1);
  Color get shade20 => shade(0.2);
  Color get shade30 => shade(0.3);
  Color get shade40 => shade(0.4);
  Color get shade50 => shade(0.5);
  Color get shade60 => shade(0.6);
  Color get shade70 => shade(0.7);
  Color get shade80 => shade(0.8);
  Color get shade90 => shade(0.9);
}
