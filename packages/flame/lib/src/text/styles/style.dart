import 'package:flame/src/text/styles/document_style.dart';
import 'package:meta/meta.dart';

/// A [Style] is a base class for several classes that collectively describe
/// the desired visual appearance of a "rich-text" document.
///
/// The style classes mostly are collections of properties that describe how a
/// potential document should be formatted. However, they have little logic
/// beyond that. The style classes are then passed to document `Node`s so that
/// the content of a document can be formatted.
///
/// Various [Style] classes are organized into a tree, with [DocumentStyle] at
/// the root.
///
/// The tree of [Style]s is roughly equivalent to a CSS stylesheet.
abstract class Style {
  const Style();

  Style mergeWith(covariant Style other);

  static Style? merge(Style? style1, Style? style2) {
    if (style1 == null) {
      return style2;
    } else if (style2 == null) {
      return style1;
    } else {
      return style1.mergeWith(style2);
    }
  }
}
