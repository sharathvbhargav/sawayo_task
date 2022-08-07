import 'package:flutter/material.dart';
import 'package:leave_manager/utils/colors.dart';
import 'package:leave_manager/utils/dimensions.dart';

class GridTileView extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final bool? isSelected;
  final VoidCallback? onTap;

  const GridTileView({Key? key, this.icon, this.text, this.isSelected, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          color: isSelected ?? false ? AppColors.selected : AppColors.unselected ,
        ),
        child: Container(
          padding: EdgeInsets.only(top: Dimensions.height10),
          child: Column(
            children: [
              Container(
                width: Dimensions.height45,
                height: Dimensions.height45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30), color: Colors.white),
                child: Icon(icon, color: Colors.black, size: Dimensions.size24),
              ),
              SizedBox(height: Dimensions.height10),
              Text(
                text!,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: isSelected ?? false ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
