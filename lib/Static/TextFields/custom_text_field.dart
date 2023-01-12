// Flutter imports:
import 'package:socialmedia/Static/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme_singleton.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  final bool autofocus;
  final Iterable<String>? autoHints;
  final double radius;
  final int limit;
  final bool? obscure;
  final bool enabled;
  final double width;
  final double height;
  final int maxlines;
  final String? Function(BuildContext context)? validation;
  final Function()? didValidationSuccess;
  final Function()? didValidationFailed;
  final String? validationErrorMessage;
  final Function()? toggleVisibility;
  final Function(BuildContext context)? onChanged;
  final Color borderColor;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.width,
    required this.height,
    required this.maxlines,
    this.autofocus = false,
    this.autoHints,
    this.limit = 100,
    required this.radius,
    this.type = TextInputType.emailAddress,
    this.validation,
    this.didValidationFailed,
    this.didValidationSuccess,
    this.validationErrorMessage,
    this.obscure,
    this.enabled = true,
    this.toggleVisibility,
    this.onChanged,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
        enabled: true,
        excludeSemantics: true,
        child: SizedBox(
          width: width,
          height: height,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.top,
            autofillHints: autoHints,
            autofocus: autofocus,
            enabled: enabled,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(context);
              }
            },
            maxLines: maxlines,
            cursorColor: ThemeColorSingleton(context).primarytextColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller,
            inputFormatters: [LengthLimitingTextInputFormatter(limit)],
            keyboardType: type,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat",
                color: Colors.black,
                fontWeight: FontWeight.w400),
            validator: (value) {
              if (validation != null) {
                return validation!(context);
              }
              return null;
            },
            obscureText: obscure ?? false,
            decoration: InputDecoration(
              //prefixIconConstraints: BoxConstraints(maxWidth: 10),

              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: BorderSide(
                    width: 3,
                    color: borderColor,
                  )),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                  width: 3,
                  color: borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                  width: 3,
                  color: borderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                  width: 3,
                  color: borderColor,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                  width: 3,
                  color: borderColor,
                ),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),

              labelStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Montserrat",
                  //color: Colors.red,
                  fontWeight: FontWeight.w400),
              border: InputBorder.none,
              // contentPadding:
              //     EdgeInsets.symmetric(vertical: height, horizontal: 10),

              //     contentPadding: EdgeInsets.only(
              //   left: 10, // HERE THE IMPORTANT PART
              // ),
              suffixIcon: obscure != null
                  ? IconButton(
                      icon: Icon(
                        obscure!
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: ThemeColorSingleton(context).primarytextColor,
                        size: 30,
                      ),
                      onPressed: toggleVisibility,
                    )
                  : const SizedBox(),
            ),
          ),
        ));
  }
}
