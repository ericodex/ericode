import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? compact;
  final Widget? small;
  final Widget? medium;
  final Widget? large;
  final Widget? wide;

  const Responsive({
    super.key,
    this.compact,
    this.small,
    this.medium,
    this.large,
    this.wide,
  });

  static bool isCompact(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < 960 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width < 1280 &&
      MediaQuery.of(context).size.width >= 960;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width < 1920 &&
      MediaQuery.of(context).size.width >= 1280;

  static bool isWide(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1920;

  @override
  Widget build(BuildContext context) {
    if (isWide(context)) {
      return wide ?? large ?? medium ?? small ?? compact ?? Container();
    } else if (isLarge(context)) {
      return large ?? medium ?? small ?? compact ?? Container();
    } else if (isMedium(context)) {
      return medium ?? small ?? compact ?? Container();
    } else if (isSmall(context)) {
      return small ?? compact ?? Container();
    } else {
      return compact ?? Container();
    }
  }
}
