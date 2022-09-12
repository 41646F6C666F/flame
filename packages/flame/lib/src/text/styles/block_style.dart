import 'package:flame/src/text/styles/background_style.dart';
import 'package:flame/src/text/styles/style.dart';
import 'package:flame/src/text/styles/text_style.dart';
import 'package:flutter/painting.dart' hide TextStyle;
import 'package:meta/meta.dart';

/// [BlockStyle] is a generic descriptor for a visual appearance of a block-
/// level element.
@immutable
class BlockStyle extends Style {
  const BlockStyle({
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.background,
    this.text,
  });

  final EdgeInsets margin;
  final EdgeInsets padding;
  final BackgroundStyle? background;
  final TextStyle? text;

  @override
  BlockStyle mergeWith(BlockStyle other) {
    return BlockStyle(
      margin: other.margin,
      padding: other.padding,
      background: other.background ?? background,
      text: Style.merge(text, other.text) as TextStyle?,
    );
  }
}
