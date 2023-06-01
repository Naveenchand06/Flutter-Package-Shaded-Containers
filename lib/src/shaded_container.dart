import 'package:flutter/material.dart';
import 'package:shaded_containers/src/utils/typedefs.dart';

class ShadedContainer extends StatefulWidget {
  const ShadedContainer({
    super.key,
    this.height,
    this.shaderHeight,
    this.width,
    this.containerColor,
    this.shadeColor = Colors.black,
    this.child,
    this.shaderChild,
    this.shaderPadding = const EdgeInsets.all(8.0),
    this.shaderBorderRadiusType = ShaderBorderRadius.bottom,
    this.shaderBorderRadiusValue = 12.0,
    this.containerBorderRadiusValue = 12.0,
  });

  final double? height;
  final double? width;
  final double? shaderHeight;
  final double shaderBorderRadiusValue;
  final double containerBorderRadiusValue;
  final Widget? child;
  final Widget? shaderChild;
  final Color? containerColor;
  final Color shadeColor;
  final EdgeInsetsGeometry shaderPadding;
  final ShaderBorderRadius shaderBorderRadiusType;
  @override
  State<ShadedContainer> createState() => _ShadedContainerState();
}

class _ShadedContainerState extends State<ShadedContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.containerColor,
            borderRadius:
                BorderRadius.circular(widget.containerBorderRadiusValue),
          ),
          child: widget.child,
        ),
        Container(
          height: widget.shaderHeight,
          width: widget.width,
          padding: widget.shaderPadding,
          decoration: BoxDecoration(
            borderRadius: _getBoderRadius(widget.shaderBorderRadiusType),
            color: widget.containerColor,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                widget.shadeColor.withOpacity(0.0),
                widget.shadeColor.withOpacity(0.1),
                widget.shadeColor.withOpacity(0.2),
                widget.shadeColor.withOpacity(0.3),
                widget.shadeColor.withOpacity(0.4),
                widget.shadeColor.withOpacity(0.5),
                widget.shadeColor.withOpacity(0.6),
                widget.shadeColor.withOpacity(0.7),
                widget.shadeColor.withOpacity(0.8),
                widget.shadeColor.withOpacity(0.9)
              ],
            ),
          ),
          child: widget.shaderChild,
        ),
      ],
    );
  }

  BorderRadius? _getBoderRadius(ShaderBorderRadius type) {
    switch (type) {
      case ShaderBorderRadius.top:
        return BorderRadius.only(
          topLeft: Radius.circular(widget.shaderBorderRadiusValue),
          topRight: Radius.circular(widget.shaderBorderRadiusValue),
        );
      case ShaderBorderRadius.bottom:
        return BorderRadius.only(
          topLeft: Radius.circular(widget.shaderBorderRadiusValue),
          topRight: Radius.circular(widget.shaderBorderRadiusValue),
        );
      default:
        return null;
    }
  }
}
