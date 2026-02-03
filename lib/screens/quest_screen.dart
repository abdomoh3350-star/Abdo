import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/app_colors.dart';

class QuestScreen extends StatefulWidget {
  const QuestScreen({super.key});

  @override
  State<QuestScreen> createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> with SingleTickerProviderStateMixin {
  final _answerController = TextEditingController();
  bool _isButtonPressed = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _answerController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_answerController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text('Solution Deployed!'),
          content: const Text('Great work! You\'ve completed this quest.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go('/engineering-dashboard');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Back to Dashboard',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'calculus',
                      child: Container(
                        height: 280,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.primaryBlue.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.calculate_outlined,
                                size: 120,
                                color: AppColors.primaryBlue.withOpacity(0.3),
                              ),
                            ),
                            Positioned.fill(
                              child: CustomPaint(
                                painter: CircuitDiagramPainter(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.primaryBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flag_outlined,
                                  color: AppColors.primaryBlue,
                                  size: 28,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Mission: Restore the Power',
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'The Challenge',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Calculate the integral to determine the current flow through the circuit. The voltage source provides V(t) = 5sin(2πt) volts.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textSecondary,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.primaryBlue.withOpacity(0.2),
                                    ),
                                  ),
                                  child: Text(
                                    '∫ 5sin(2πt) dt = ?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBlue,
                                      fontFamily: 'monospace',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text(
                            'Your Solution',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _answerController,
                            decoration: const InputDecoration(
                              hintText: 'Enter your answer',
                              prefixIcon: Icon(Icons.edit_outlined),
                            ),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 32),
                          GestureDetector(
                            onTapDown: (_) => setState(() => _isButtonPressed = true),
                            onTapUp: (_) {
                              setState(() => _isButtonPressed = false);
                              _handleSubmit();
                            },
                            onTapCancel: () => setState(() => _isButtonPressed = false),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              transform: Matrix4.identity()..scale(_isButtonPressed ? 1.02 : 1.0),
                              height: 60,
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryBlue.withOpacity(_isButtonPressed ? 0.4 : 0.3),
                                    blurRadius: _isButtonPressed ? 16 : 12,
                                    offset: Offset(0, _isButtonPressed ? 6 : 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.rocket_launch_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'Deploy Solution',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircuitDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryBlue.withOpacity(0.4)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Draw simple circuit diagram
    final path = Path();
    
    // Battery
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.3, size.height * 0.5);
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.4),
      Offset(size.width * 0.3, size.height * 0.6),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.45),
      Offset(size.width * 0.35, size.height * 0.55),
      paint,
    );
    
    // Top wire with resistor
    path.moveTo(size.width * 0.35, size.height * 0.5);
    path.lineTo(size.width * 0.45, size.height * 0.5);
    path.lineTo(size.width * 0.45, size.height * 0.3);
    
    // Resistor symbol
    for (int i = 0; i < 4; i++) {
      final x = size.width * 0.45 + (i * 20);
      path.lineTo(x + 5, size.height * 0.25);
      path.lineTo(x + 10, size.height * 0.35);
    }
    path.lineTo(size.width * 0.55, size.height * 0.3);
    
    path.lineTo(size.width * 0.55, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    
    // Bottom wire
    path.moveTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    
    canvas.drawPath(path, paint);
    
    // Draw arrows indicating current flow
    final arrowPaint = Paint()
      ..color = AppColors.primaryBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    
    final arrowPath = Path();
    arrowPath.moveTo(size.width * 0.6, size.height * 0.3);
    arrowPath.lineTo(size.width * 0.65, size.height * 0.28);
    arrowPath.lineTo(size.width * 0.65, size.height * 0.32);
    arrowPath.close();
    
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
