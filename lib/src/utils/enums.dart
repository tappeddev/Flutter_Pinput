part of '../pinput.dart';

/// The mode which determines the Pinput validation method
enum PinputAutovalidateMode {
  /// No auto validation will occur.
  disabled,

  /// Used to auto-validate [Pinput] only after [Pinput.onCompleted] or [Pinput.onSubmitted] is called
  onSubmit,
}

/// The animation type if Pin item
enum PinAnimationType {
  /// No animation
  none,

  /// Scale animation
  scale,

  /// Fade animation
  fade,

  /// Slide animation
  slide,

  /// Rotation animation
  rotation,
}


/// Error widget builder of Pinput
typedef PinputErrorBuilder = Widget Function(String? errorText, String pin);
