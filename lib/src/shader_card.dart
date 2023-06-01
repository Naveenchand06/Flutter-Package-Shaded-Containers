import 'package:flutter/material.dart';

class ShaderCard extends StatefulWidget {
  const ShaderCard({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 12.0,
    this.child,
    this.containerColor,
    this.shadeColor = Colors.black,
    this.borderRadiusGeometry,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final Widget? child;
  final Color? containerColor;
  final Color shadeColor;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  State<ShaderCard> createState() => _ShaderCardState();
}

class _ShaderCardState extends State<ShaderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadiusGeometry ??
            BorderRadius.circular(widget.borderRadius),
        color: widget.containerColor,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget.shadeColor.withOpacity(0.0),
            widget.shadeColor.withOpacity(0.1),
            widget.shadeColor.withOpacity(0.2),
            widget.shadeColor.withOpacity(0.4),
            widget.shadeColor.withOpacity(0.6),
            widget.shadeColor.withOpacity(0.8),
            widget.shadeColor.withOpacity(1)
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
