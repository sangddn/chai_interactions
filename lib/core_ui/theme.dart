part of 'core_ui.dart';

final kLightTheme = _baseLightTheme.copyWith(
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      primaryColor: const Color(0xff323232),
      textStyle: _lightTextTheme.bodyMedium,
      actionTextStyle: _lightTextTheme.bodyMedium,
      dateTimePickerTextStyle: _lightTextTheme.bodyMedium,
      navActionTextStyle: _lightTextTheme.bodyMedium,
      navLargeTitleTextStyle: _lightTextTheme.titleLarge,
      navTitleTextStyle: _lightTextTheme.titleMedium,
      pickerTextStyle: _lightTextTheme.bodyMedium,
      tabLabelTextStyle: _lightTextTheme.labelLarge,
    ),
  ),
  applyElevationOverlayColor: false,
  brightness: Brightness.light,
  canvasColor: ChaiColors.offWhite,
  cardColor: Colors.white,
  colorScheme: _lightColorScheme,
  dialogBackgroundColor: const Color(0xfffffefc),
  scaffoldBackgroundColor: ChaiColors.white,
  disabledColor: const Color(0x61000000),
  dividerColor: ChaiColors._grayLightMode,
  focusColor: const Color(0x1f000000),
  highlightColor: ChaiColors._lightGrayLightMode,
  hintColor: const Color(0x99000000),
  hoverColor: const Color(0x0a000000),
  indicatorColor: const Color(0xfffffefc),
  secondaryHeaderColor: const Color(0xffe3f2fd),
  shadowColor: Colors.black,
  splashColor: Colors.transparent,
  splashFactory: InkRipple.splashFactory,
  unselectedWidgetColor: const Color(0x8a000000),
  visualDensity: VisualDensity.compact,
  inputDecorationTheme: _baseLightTheme.inputDecorationTheme.copyWith(
    alignLabelWithHint: true,
    filled: false,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    isCollapsed: false,
    isDense: false,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  primaryColor: const Color(0xff323232),
  primaryColorDark: const Color(0xff1976d2),
  primaryColorLight: const Color(0xffbbdefb),
  primaryIconTheme: _baseLightTheme.iconTheme.copyWith(
    color: Colors.white,
  ),
  iconTheme: _baseLightTheme.iconTheme.copyWith(
    color: const Color(0xdd000000),
  ),
  switchTheme: _baseLightTheme.switchTheme.copyWith(
    // ! This is a hack to get the current animation value of [ThemeData]
    // ! to animate custom theme properties like [ChaiColors].
    //
    // See also:
    // * [kDarkTheme.switchTheme.splashRadius], which is set to 1.0.
    // * [ThemeData.interpolationValue], which is set to [switchTheme.splashRadius].
    //
    splashRadius: 0.0,
    thumbColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0x52000000);
        }
        return const Color(0xff323232);
      },
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0x1f000000);
        }
        return const Color(0x52000000);
      },
    ),
  ),
  textTheme: _lightTextTheme,
  appBarTheme: _baseLightTheme.appBarTheme.copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    backgroundColor: ChaiColors.white,
  ),
  dividerTheme: _baseLightTheme.dividerTheme.copyWith(
    color: ChaiColors._grayLightMode,
    space: 0.5,
    thickness: 0.5,
  ),
);

final kDarkTheme = _baseDarkTheme.copyWith(
  cupertinoOverrideTheme: CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      primaryColor: const Color(0xfffffefc),
      textStyle: _darkTextTheme.bodyMedium,
      actionTextStyle: _darkTextTheme.bodyMedium,
      dateTimePickerTextStyle: _darkTextTheme.bodyMedium,
      navActionTextStyle: _darkTextTheme.bodyMedium,
      navLargeTitleTextStyle: _darkTextTheme.titleLarge,
      navTitleTextStyle: _darkTextTheme.titleMedium,
      pickerTextStyle: _darkTextTheme.bodyMedium,
      tabLabelTextStyle: _darkTextTheme.labelLarge,
    ),
  ),
  applyElevationOverlayColor: false,
  brightness: Brightness.dark,
  canvasColor: Colors.black,
  cardColor: ChaiColors.dark.tint20,
  colorScheme: _darkColorScheme,
  dialogBackgroundColor: ChaiColors.dark,
  scaffoldBackgroundColor: Colors.black,
  disabledColor: const Color(0x62ffffff),
  dividerColor: ChaiColors._grayDarkMode,
  focusColor: const Color(0x1fffffff),
  highlightColor: ChaiColors._lightGrayDarkMode,
  hintColor: const Color(0x99ffffff),
  hoverColor: const Color.fromARGB(9, 211, 211, 211),
  indicatorColor: const Color(0xffe4e2dd),
  secondaryHeaderColor: const Color(0xff616161),
  shadowColor: Colors.black.withOpacity(0.0),
  splashColor: Colors.transparent,
  splashFactory: InkRipple.splashFactory,
  unselectedWidgetColor: const Color(0xb3ffffff),
  visualDensity: VisualDensity.compact,
  inputDecorationTheme: _baseDarkTheme.inputDecorationTheme.copyWith(
    alignLabelWithHint: true,
    filled: false,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    isCollapsed: false,
    isDense: false,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
  ),
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  primaryColor: ChaiColors.offDark,
  primaryColorDark: Colors.black,
  primaryColorLight: const Color(0xff9e9e9e),
  primaryIconTheme: _baseDarkTheme.iconTheme.copyWith(
    color: Colors.white,
  ),
  iconTheme: _baseDarkTheme.iconTheme.copyWith(
    color: Colors.white,
  ),
  switchTheme: _baseDarkTheme.switchTheme.copyWith(
    // ! This is a hack to get the current animation value of [ThemeData]
    // ! to animate custom theme properties like [ChaiColors].
    //
    // See also:
    // * [kLightTheme.switchTheme.splashRadius], which is set to 0.0.
    // * [ThemeData.interpolationValue], which is set to [switchTheme.splashRadius].
    //
    splashRadius: 1.0,
    thumbColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0x52000000);
        }
        return const Color(0xfffffefc);
      },
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return const Color(0x1fe4e2dd);
        }
        return const Color(0x52000000);
      },
    ),
  ),
  textTheme: _darkTextTheme,
  appBarTheme: _baseDarkTheme.appBarTheme.copyWith(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    backgroundColor: Colors.black,
  ),
  dividerTheme: _baseDarkTheme.dividerTheme.copyWith(
    color: ChaiColors._grayDarkMode,
    space: 0.5,
    thickness: 0.5,
  ),
);

final _baseLightTheme = ThemeData.light(useMaterial3: true);
final _baseDarkTheme = ThemeData.dark(useMaterial3: true);

extension BrightnessCheck on Theme {
  bool get isDark => data.isDark;
  bool get isLight => data.isLight;
}

extension BrightnessCheckData on ThemeData {
  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;

  /// Returns the interpolation value between different [Theme]s when app's
  /// [Theme] animates.
  ///
  /// Returns 0.0 when the theme is light, 1.0 when the theme is dark.
  ///
  /// The app's [Theme] at any point is not only determined by [kLightTheme] or
  /// [kDarkTheme] but also by the animation state of [AnimatedTheme], which is
  /// not 0.0 or 1.0 when user is switching between light and dark themes.
  ///
  /// In order to provide a similarly smooth transition for custom defined colors
  /// like "gray" or "lightGray", as in [ChaiColors], this method calculates the
  /// current "lerp value" between the light and dark themes, so even custom
  /// colors animate.
  ///
  /// The trick here is to use the [switchTheme.splashRadius] property, which is
  /// a double value that we define to animate between 0.0 and 1.0. This value
  /// is not used anywhere else in the app.
  ///
  double get interpolationValue => switchTheme.splashRadius!;

  double resolveNum<T extends num>(
    T light,
    T dark, {
    ThemeMode mode = ThemeMode.system,
    bool inverse = false,
  }) {
    final a = (inverse ? dark : light).toDouble();
    final b = (inverse ? light : dark).toDouble();
    switch (mode) {
      case ThemeMode.light:
        return a;
      case ThemeMode.dark:
        return b;
      case ThemeMode.system:
        final a = light.toDouble();
        final b = dark.toDouble();
        final t = interpolationValue;
        if (a == b || (a.isNaN) && (b.isNaN)) {
          return a;
        }
        assert(
          a.isFinite,
          'Cannot interpolate between finite and non-finite values',
        );
        assert(
          b.isFinite,
          'Cannot interpolate between finite and non-finite values',
        );
        assert(
          t.isFinite,
          't must be finite when interpolating between values',
        );
        return a * (1.0 - t) + b * t;
    }
  }

  BorderSide resolveBorderSide(BorderSide light, BorderSide dark) {
    return BorderSide.lerp(light, dark, interpolationValue);
  }

  /// Resolves any type [T] between [light] and [dark] based on the current
  /// [Theme.brightness] and an optional [mode].
  ///
  /// Should not be used in favor of type-specific methods like [resolveColor]
  /// or [resolveNum] when possible, since this method does not interpolate
  /// between the two values when the theme is animating.
  ///
  T resolveBrightness<T>(
    T light,
    T dark, [
    ThemeMode mode = ThemeMode.system,
  ]) {
    switch (mode) {
      case ThemeMode.system:
        return isDark ? dark : light;
      case ThemeMode.light:
        return light;
      case ThemeMode.dark:
        return dark;
    }
  }
}

// ------------------------------
// BEGIN COLOR SCHEME
// ------------------------------

final _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ChaiColors.dark,
  onPrimary: Colors.white,
  primaryContainer: Colors.white,
  onPrimaryContainer: Colors.black,
  primaryFixed: ChaiColors.dark.tint30,
  primaryFixedDim: ChaiColors.dark.tint20,
  onPrimaryFixed: Colors.white,
  onPrimaryFixedVariant: ChaiColors.offWhite,
  secondary: ChaiColors.offDark,
  onSecondary: Colors.white,
  secondaryContainer: ChaiColors.offWhite,
  onSecondaryContainer: ChaiColors.dark,
  tertiary: ChaiColors.dark.tint50,
  onTertiary: Colors.white,
  tertiaryContainer: ChaiColors.offWhite,
  onTertiaryContainer: ChaiColors.dark.tint30,
  error: CupertinoColors.systemRed.color,
  errorContainer: CupertinoColors.systemRed.color.withOpacity(0.1),
  onError: Colors.white,
  onErrorContainer: ChaiColors.offDark,
  surface: ChaiColors.offWhite,
  onSurface: ChaiColors.dark.tint20,
  surfaceTint: ChaiColors.offWhite,
  onSurfaceVariant: ChaiColors.dark.tint50,
  surfaceDim: ChaiColors.offWhite,
  surfaceBright: Colors.white,
  surfaceContainerLowest: ChaiColors.offWhite.tint80,
  surfaceContainerLow: ChaiColors.offWhite.tint60,
  surfaceContainer: ChaiColors.offWhite.tint40,
  surfaceContainerHigh: ChaiColors._grayLightModeNoOpacity,
  surfaceContainerHighest: const Color(0xffcdcbc7),
  outline: ChaiColors.dark.tint90,
  outlineVariant: ChaiColors._grayLightModeNoOpacity,
  inverseSurface: ChaiColors.offDark,
  onInverseSurface: Colors.white,
  inversePrimary: ChaiColors.offWhite,
  shadow: Colors.black,
  scrim: Colors.black,
);

final _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: ChaiColors.offWhite,
  onPrimary: ChaiColors.dark,
  primaryContainer: ChaiColors.dark.tint20,
  onPrimaryContainer: ChaiColors.offWhite,
  primaryFixed: ChaiColors.offWhite.tint40,
  primaryFixedDim: ChaiColors.offWhite.tint20,
  onPrimaryFixed: ChaiColors.dark,
  onPrimaryFixedVariant: ChaiColors.dark.tint30,
  secondary: ChaiColors.offWhite.tint30,
  onSecondary: ChaiColors.dark,
  secondaryContainer: ChaiColors.dark.tint30,
  onSecondaryContainer: ChaiColors.offWhite,
  tertiary: ChaiColors.offWhite,
  onTertiary: ChaiColors.dark,
  tertiaryContainer: ChaiColors.dark.tint50,
  onTertiaryContainer: ChaiColors.offWhite.tint30,
  error: CupertinoColors.systemRed.darkColor,
  errorContainer: CupertinoColors.systemRed.darkColor.withOpacity(0.1),
  onError: ChaiColors.dark,
  onErrorContainer: ChaiColors.offWhite,
  surface: ChaiColors.dark,
  onSurface: ChaiColors.offWhite,
  surfaceTint: ChaiColors.offDark,
  onSurfaceVariant: ChaiColors.offWhite.tint80,
  surfaceDim: ChaiColors.dark,
  surfaceBright: ChaiColors.dark.tint20,
  surfaceContainerLowest: ChaiColors.dark.tint20,
  surfaceContainerLow: ChaiColors.dark.tint30,
  surfaceContainer: ChaiColors.dark.tint40,
  surfaceContainerHigh: ChaiColors.dark.tint60,
  surfaceContainerHighest: ChaiColors.dark.tint80,
  outline: ChaiColors.dark.tint80,
  outlineVariant: ChaiColors.dark.tint50,
  inverseSurface: ChaiColors.offWhite,
  onInverseSurface: ChaiColors.dark,
  inversePrimary: ChaiColors.dark,
  shadow: Colors.black,
  scrim: Colors.black,
);

// ------------------------------
// END COLOR SCHEME
// ------------------------------

// ------------------------------
// BEGIN TYPEFACES
// ------------------------------

const kFontFamily = 'Inter';
const kMonoFontFamily = 'Azeret Mono';
const kStylizedFontFamily = 'Neuton';

final _textThemeWithFontFamily =
    _baseLightTheme.textTheme.apply(fontFamily: kFontFamily);

final _lightTextTheme = _textThemeWithFontFamily.copyWith(
  displayLarge: _textThemeWithFontFamily.displayLarge,
  displayMedium: _textThemeWithFontFamily.displayMedium,
  displaySmall: _textThemeWithFontFamily.displaySmall,
  headlineLarge: _textThemeWithFontFamily.headlineLarge,
  headlineMedium: _textThemeWithFontFamily.headlineMedium,
  headlineSmall: _textThemeWithFontFamily.headlineSmall,
  titleLarge: _textThemeWithFontFamily.titleLarge!.mediumWeight,
  titleMedium: _textThemeWithFontFamily.titleMedium!.mediumWeight,
  titleSmall: _textThemeWithFontFamily.titleSmall!.mediumWeight,
  bodyLarge: _textThemeWithFontFamily.bodyLarge!.regularWeight,
  bodyMedium: _textThemeWithFontFamily.bodyMedium!.regularWeight,
  bodySmall: _textThemeWithFontFamily.bodySmall!.regularWeight,
  labelLarge: _textThemeWithFontFamily.labelLarge!.mediumWeight,
  labelMedium: _textThemeWithFontFamily.labelMedium!.regularWeight,
  labelSmall: _textThemeWithFontFamily.labelSmall!.regularWeight,
);

final _darkTextThemeWithFontFamily =
    _baseDarkTheme.textTheme.apply(fontFamily: kFontFamily);

final _darkTextTheme = _darkTextThemeWithFontFamily.copyWith(
  displayLarge: _darkTextThemeWithFontFamily.displayLarge,
  displayMedium: _darkTextThemeWithFontFamily.displayMedium,
  displaySmall: _darkTextThemeWithFontFamily.displaySmall,
  headlineLarge: _darkTextThemeWithFontFamily.headlineLarge,
  headlineMedium: _darkTextThemeWithFontFamily.headlineMedium,
  headlineSmall: _darkTextThemeWithFontFamily.headlineSmall,
  titleLarge: _darkTextThemeWithFontFamily.titleLarge!.mediumWeight,
  titleMedium: _darkTextThemeWithFontFamily.titleMedium!.mediumWeight,
  titleSmall: _darkTextThemeWithFontFamily.titleSmall!.mediumWeight,
  bodyLarge: _darkTextThemeWithFontFamily.bodyLarge!.regularWeight,
  bodyMedium: _darkTextThemeWithFontFamily.bodyMedium!.regularWeight,
  bodySmall: _darkTextThemeWithFontFamily.bodySmall!.regularWeight,
  labelLarge: _darkTextThemeWithFontFamily.labelLarge!.mediumWeight,
  labelMedium: _darkTextThemeWithFontFamily.labelMedium!.regularWeight,
  labelSmall: _darkTextThemeWithFontFamily.labelSmall!.regularWeight,
);

extension TextStyleUtils on TextStyle {
  TextStyle get w300 =>
      copyWith(fontVariations: const [FontVariation.weight(300)]);
  TextStyle get w400 =>
      copyWith(fontVariations: const [FontVariation.weight(400)]);
  TextStyle get w500 =>
      copyWith(fontVariations: const [FontVariation.weight(500)]);
  TextStyle get w600 =>
      copyWith(fontVariations: const [FontVariation.weight(600)]);
  TextStyle get w700 =>
      copyWith(fontVariations: const [FontVariation.weight(700)]);
  TextStyle get w800 =>
      copyWith(fontVariations: const [FontVariation.weight(800)]);
  TextStyle get w900 =>
      copyWith(fontVariations: const [FontVariation.weight(900)]);

  /// Modifies the weight of the font.
  ///
  /// Fractional weight deltas are only supported for variable fonts.
  /// For non-variable fonts, [delta] will be rounded to the nearest hundred.
  ///
  /// A [delta] value of `0.0` will return the current [TextStyle] without any
  /// changes. A non-zero [delta] value will be added the weight in multiples
  /// of `100`. Typically, the weight is clamped below by `100` and above by
  /// `900`, but the exact effect can vary depending on the font.
  ///
  TextStyle modifyWeight(double delta) {
    if (delta == 0.0) {
      return this;
    }
    final weight = fontVariations
        ?.firstWhereOrNull((variation) => variation.axis == 'wght')
        ?.value as num?;
    if (weight != null && fontVariations == null) {
      return apply(fontWeightDelta: delta.round());
    }
    return copyWith(
      fontVariations: [FontVariation.weight((weight ?? 400) + delta * 100)],
    );
  }

  /// Modifies the letter spacing of the font.
  ///
  /// Defaults to `0.0`, which is the normal letter spacing. A positive value
  /// will increase the letter spacing, and a negative value will decrease it.
  ///
  TextStyle modifyLetterSpacing(double delta) =>
      apply(letterSpacingDelta: delta);

  /// Modifies the width of the font. This is only supported for variable fonts.
  ///
  /// Defaults to `1.0`, which is the normal width. A value greater
  /// than `1.0` will expand the width, and a value less than `1.0`
  /// will condense the width.
  ///
  TextStyle modifyWidth([double width = 1.0]) => copyWith(
        fontVariations: [FontVariation.width(width * 100.0)],
      );

  TextStyle enableFeature(String feature) {
    return copyWith(
      fontFeatures: [
        ...?fontFeatures,
        FontFeature.enable(feature),
      ],
    );
  }

  TextStyle enableFeatures(List<String> features) {
    return copyWith(
      fontFeatures: [
        ...?fontFeatures,
        ...features.map(FontFeature.enable),
      ],
    );
  }

  TextStyle disableFeature(String feature) {
    return copyWith(
      fontFeatures: [
        ...?fontFeatures,
        FontFeature.disable(feature),
      ],
    );
  }

  TextStyle disableFeatures(List<String> features) {
    return copyWith(
      fontFeatures: [
        ...?fontFeatures,
        ...features.map(FontFeature.disable),
      ],
    );
  }

  TextStyle get lightWeight => w300;
  TextStyle get regularWeight => w400;
  TextStyle get mediumWeight => w500;
  TextStyle get trackTighter => modifyLetterSpacing(-0.5);
  TextStyle get trackLooser => modifyLetterSpacing(0.5);
}

// ------------------------------
// END TYPEFACES
// ------------------------------
