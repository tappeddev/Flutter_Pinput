part of '../pinput.dart';

/// Signature for a function that creates a widget for a given index, e.g., in a
/// list.
typedef JustIndexedWidgetBuilder = Widget Function(int index);

class _PinputFormField extends FormField<String> {
  const _PinputFormField({
    required final FormFieldValidator<String>? validator,
    required final bool enabled,
    required final String? initialValue,
    required final Widget Function(FormFieldState<String> field) builder,
    Key? key,
  }) : super(
          key: key,
          enabled: enabled,
          validator: validator,
          autovalidateMode: AutovalidateMode.disabled,
          initialValue: initialValue,
          builder: builder,
        );
}

class _SeparatedRaw extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final JustIndexedWidgetBuilder? separatorBuilder;

  const _SeparatedRaw({
    required this.children,
    required this.mainAxisAlignment,
    this.separatorBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCount = max(0, children.length * 2 - 1);
    final indexedList = [for (int i = 0; i < itemCount; i += 1) i];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisAlignment == MainAxisAlignment.center
          ? MainAxisSize.min
          : MainAxisSize.max,
      children: indexedList.map((index) {
        final itemIndex = index ~/ 2;
        return index.isEven ? children[itemIndex] : _separator(itemIndex);
      }).toList(growable: false),
    );
  }

  Widget _separator(int index) =>
      separatorBuilder?.call(index) ?? PinputConstants._defaultSeparator;
}
