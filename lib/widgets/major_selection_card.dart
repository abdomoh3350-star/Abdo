import 'package:flutter/material.dart';

class MajorSelectionCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color accentColor;
  final bool isSelected;
  final VoidCallback onTap;

  const MajorSelectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<MajorSelectionCard> createState() => _MajorSelectionCardState();
}

class _MajorSelectionCardState extends State<MajorSelectionCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.accentColor.withOpacity(0.1)
                : const Color(0xFFF1F4F8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isSelected ? widget.accentColor : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: widget.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  size: 40,
                  color: widget.accentColor,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: widget.isSelected ? widget.accentColor : const Color(0xFF101213),
                  ),
                ),
              ),
              if (widget.isSelected)
                Icon(
                  Icons.check_circle,
                  color: widget.accentColor,
                  size: 28,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
