import 'package:flutter/material.dart';

Widget heading(BuildContext context,
    {String? text = "",
    Color? color,
    Key? key,
    double opacity = 1,
    double txtSize = 15,
    double height = 1,
    int maxLines = 100,
    TextDecoration textDecoration = TextDecoration.none,
    FontWeight weight = FontWeight.w400,
    TextAlign align = TextAlign.left,
    double scale = 1}) {
  double unitHeightValue = 950 * 0.0010;

  return Opacity(
    key: key,
    opacity: opacity,
    child: Text("$text",
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: align,
        textScaleFactor: scale,
        // pre: TextSpan(
        //     text: 'PRE',
        //     style: TextStyle(color: Colors.purple)),
        // post: TextSpan(
        //     text: 'POST',
        //     style: TextStyle(color: Colors.purple)),
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            decoration: textDecoration,
            fontSize: txtSize,
            height: height,
            color: color == null ? Colors.black : color,
            fontWeight: weight)),
  );
}

PageController controller = PageController(
  initialPage: 0,
);

Widget txtFieldContainer(BuildContext context,
    {String hintText = "",
    Widget? label,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? style,
    Function? onEnable,
    InputBorder? enabledBOrder,
    double radius = 0,
    Function? onSubmit,
    bool readOnly = false,
    TextCapitalization? textCapitalization,
    Color color = Colors.black12,
    // TextEditingController controller,
    Color borcolor = Colors.black12,
    Widget? suffixIcon,
    String? initialValue,
    bool autofocus = false,
    Widget? prefixIcon,
    Widget? prefix,
    int? maxLines = 1,
    bool enabled = true,
    Function(String)? onSubmitted,
    FontWeight hintWeight = FontWeight.w600,
    double hintheight = 1.0,
    Function(String)? onChanged,
    TextEditingController? textEditingController,
    TextInputType? keyboardType,
    double borthickness = 1.0,
    bool obsecure = false,
    bool? showCursor,
    double hintSize = 12,
    Color hintColor = Colors.black26}) {
  bool isSelected = false;
  return Row(
    children: [
      Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: color == null ? hexColor("f5f5f5") : color,
                  borderRadius: BorderRadius.circular(radius),
                  border: Border.all(
                      color: borcolor == null ? hexColor("f5f5f5") : borcolor,
                      width: borthickness == null ? 0 : borthickness)),
              child: Padding(
                padding: EdgeInsets.only(left: prefixIcon == null ? 10 : 0),
                child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, prefixIcon == null ? 0.0 : 3.0, 0.0),
                  child: TextFormField(
                    enabled: enabled,
                    keyboardType: keyboardType,
                    onTap: onEnable as void Function()?,
                    controller: textEditingController,
                    minLines: maxLines,
                    maxLines: maxLines,
                    autofocus: autofocus,
                    readOnly: readOnly,
                    initialValue: initialValue,
                    onChanged: onChanged,
                    onFieldSubmitted: onSubmitted,
                    obscureText: obsecure,
                    showCursor: showCursor ?? true,
                    textCapitalization:
                        textCapitalization ?? TextCapitalization.none,
                    decoration: InputDecoration(
                        contentPadding: contentPadding,
                        isDense: true,
                        fillColor: Colors.white,
                        enabledBorder: enabledBOrder,
                        label: label,
                        suffixIcon: suffixIcon,
                        prefix: prefix,
                        prefixIcon: prefixIcon,
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                            color: hintColor,
                            height: hintheight,
                            fontWeight: hintWeight,
                            fontSize: hintSize)),
                    style: style == null
                        ? TextStyle(fontWeight: FontWeight.w400)
                        : style,
                  ),
                ),
              )))
    ],
  );
}

Widget button1(Widget child, double radius,
    {Color color = Colors.blueAccent,
    VoidCallback? onTap,
    Color borColor = Colors.transparent,
    Color shadowColor = Colors.transparent,
    double borthickness = 0.6,
    double horizontal = 15.0,
    double vertival = 5.0,
    double height = 60}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      // height: 60,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertival),
        child: Center(child: child),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borColor, width: borthickness),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: 30,
                spreadRadius: 1,
                offset: Offset(0, 30))
          ],
          borderRadius: BorderRadius.circular(radius),
          color: color),
    ),
  );
}

Widget button2(Widget child, double radius,
    {Color color = Colors.blueAccent,
    VoidCallback? onTap,
    Color borColor = Colors.transparent,
    Color shadowColor = Colors.transparent,
    double borthickness = 0.6,
    double horizontal = 15.0,
    double vertival = 5.0,
    double height = 60}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      // height: 60,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertival),
        child: Center(child: child),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borColor, width: borthickness),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: 30,
                spreadRadius: 1,
                offset: Offset(0, 30))
          ],
          borderRadius: BorderRadius.circular(radius),
          color: color),
    ),
  );
}

Widget chatBubble(Widget child, double radius,
    {Color color = Colors.blueAccent,
    VoidCallback? onTap,
    Color borColor = Colors.transparent,
    Color shadowColor = Colors.transparent,
    double borthickness = 0.6,
    required double maxWidth,
    bool isImage = false,
    BorderRadius? borderRadius,
    double horizontalPadding = 10,
    double minWidth = 40,
    double minHeight = 40}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      constraints: BoxConstraints(
          // maxHeight: maxHeight,
          minHeight: minHeight,
          minWidth: minWidth,
          maxWidth: maxWidth),
      // height: 60,
      child: Padding(
        padding: isImage
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 3),
        child: child,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: borColor, width: borthickness),
          boxShadow: [
            BoxShadow(
                color: shadowColor,
                blurRadius: 30,
                spreadRadius: 1,
                offset: Offset(0, 30))
          ],
          borderRadius: borderRadius == null
              ? BorderRadius.circular(radius)
              : borderRadius,
          color: color),
    ),
  );
}

Widget hPadding({Widget? child}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: child,
  );
}

Color hexColor(String? color) {
  int c = int.parse("0xff$color");
  return Color(c);
}

Widget navigate(
    {required BuildContext context,
    required Widget? page,
    Function? onPop,
    required Widget child}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
    },
    child: child,
  );
}



Widget SBox(BuildContext context, double hght) {
  var height = MediaQuery.of(context).size.height;
  return SizedBox(height: height * hght);
}

Widget aimage(String name, {double scale = 1, Color? color}) {
  if (name == "thumbnail") {
    return Image.asset(
      "images/thumbnail.png",
      fit: BoxFit.cover,
    );
  }
  return Image.asset(
    "images/$name.png",
    scale: scale,
    color: color,
  );
}

// var mq = MediaQuery.of(context).size;