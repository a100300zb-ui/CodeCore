@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // منطقة العرض
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // التعبير الحسابي
                    Text(
                      _expression,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFF8E8E93),
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    const SizedBox(height: 12),
                    // النتيجة
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerRight,
                      child: Text(
                        _display,
                        style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // لوحة الأزرار
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    _buildRow(['C', '⌫', '%', '÷']),
                    _buildRow(['7', '8', '9', '×']),
                    _buildRow(['4', '5', '6', '-']),
                    _buildRow(['1', '2', '3', '+']),
                    _buildRow(['+/-', '0', '.', '=']),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((btn) => _buildButton(btn)).toList(),
      ),
    );
  }

  Widget _buildButton(String label) {
    Color bgColor;
    Color textColor = Colors.white;

    if (['÷', '×', '-', '+', '='].contains(label)) {
      bgColor = const Color(0xFFFF9F0A);
    } else if (['C', '⌫', '%', '+/-'].contains(label)) {
      bgColor = const Color(0xFF505050);
    } else {
      bgColor = const Color(0xFF2C2C2E);
    }

    // تمييز زر العملية النشطة
    if (_operator == label && _shouldResetDisplay) {
      bgColor = Colors.white;
      textColor = const Color(0xFFFF9F0A);
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => _onButtonPressed(label),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
