import 'package:flutter/material.dart';

class MenuModal extends StatelessWidget {
  final VoidCallback? onStart;

  const MenuModal({
    this.onStart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onStart,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Reaction Color",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: "press start2p regular",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Toque para iniciar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "press start2p regular",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
