import 'package:flutter/material.dart';
import 'package:leave_manager/utils/colors.dart';
import 'package:leave_manager/utils/dimensions.dart';

class TypeTile extends StatefulWidget {
  final IconData icon;
  final String text;
  const TypeTile({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  State<TypeTile> createState() => _TypeTileState();
}

class _TypeTileState extends State<TypeTile> {
  Color _colorContainer = AppColors.unselected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height10, right: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: _colorContainer,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _colorContainer = _colorContainer == AppColors.selected ?
            AppColors.unselected :
            AppColors.selected;
          });
        },
        child: Container(
          padding: EdgeInsets.only(top: Dimensions.height10),
          height: Dimensions.height100,
          child: Column(
            children: [
              Container(
                width: Dimensions.height45,
                height: Dimensions.height45,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius30), color: Colors.white),
                child: Icon(widget.icon, color: Colors.black, size: Dimensions.size24),
              ),
              SizedBox(height: Dimensions.height10),
              Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.headerTextColor
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
