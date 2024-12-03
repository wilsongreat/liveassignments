import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.fieldLabel,
    this.toolTipMessage,
    this.hint,
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.readOnly = false,
    this.padding = const EdgeInsets.all(10),
    this.prefixIcon,
    this.password = false,
    this.trailing,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.textAlign = TextAlign.start,
    this.textColor,
    this.hintColor,
    this.maxLines,
    this.isFilled = true,
    this.fillColor,
    this.borderColor,
    this.textInputColor,
    this.validator,
    this.onChanged,
    this.obscureInput = false,
    this.borderRadius = 12,
    this.maxLength,
    this.enabled = true,
    this.useForgotPass = false,
    this.onForgotPassTap,
    this.visibleField = true,
    this.enableInteractiveSelection,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.passEntry = '',
    this.hideIntegrityVisualiser = false,
    this.isRequired = true,
    this.prefixIconSize = const Size(20, 20),
    this.prefixIconPad = 8,
    super.key,
  });

  final String? fieldLabel;
  final String? hint;
  final String? toolTipMessage;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final bool readOnly;
  final EdgeInsetsGeometry padding;
  final String? prefixIcon;
  final bool password;
  final Widget? trailing;
  final VoidCallback? onTap;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final Color? textColor;
  final Color? hintColor;
  final int? maxLines;
  final bool isFilled;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textInputColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool obscureInput;
  final double borderRadius;
  final int? maxLength;
  final bool useForgotPass;
  final bool enabled;
  final void Function()? onForgotPassTap;
  final bool visibleField;
  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final String passEntry;
  final bool hideIntegrityVisualiser;
  final bool isRequired;
  final Size prefixIconSize;
  final double prefixIconPad;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool inputObscured = false;
  @override
  void initState() {
    /// The code `if (widget.password) { inputObscured = true; } else { inputObscured = false; }` is
    /// checking the value of the `password` property of the `KoobikTextField` widget.
    if (widget.password) {
      inputObscured = true;
    } else {
      inputObscured = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Visibility(
      visible: widget.visibleField,
      child: Container(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.fieldLabel != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: RichText(
                  text: TextSpan(
                    text: widget.fieldLabel ?? '',
                    children: [
                      TextSpan(
                        text: widget.isRequired ? '*' : '',
                        style: GoogleFonts.poppins(
                          color: AppColors.kRed,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ],
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            SizedBox(
              child: TextFormField(
                maxLength: widget.maxLength,
                controller: widget.controller,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                focusNode: widget.focusNode,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: widget.textInputColor ?? AppColors.kBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                cursorHeight: 10,
                cursorColor: AppColors.kBlack,
                keyboardType: widget.keyboardType,
                initialValue: widget.initialValue,
                textCapitalization: widget.textCapitalization,
                onTap: widget.onTap,
                readOnly: widget.readOnly,
                enabled: widget.enabled,
                textAlign: widget.textAlign,
                maxLines: widget.maxLines ?? 1,
                validator: widget.validator,
                onChanged: widget.onChanged,
                obscureText:
                    widget.password ? inputObscured : widget.obscureInput,
                inputFormatters: widget.inputFormatters,
                onFieldSubmitted: widget.onFieldSubmitted,
                onEditingComplete: widget.onEditingComplete,
                decoration: InputDecoration(
                  border: widget.readOnly ? InputBorder.none : null,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: widget.hintColor ?? Colors.grey,
                    fontSize: 13,
                  ),
                  prefixIcon: widget.prefixIcon != null
                      ? Padding(
                          padding: EdgeInsets.all(widget.prefixIconPad),
                          child: SvgPicture.asset(
                            widget.prefixIcon!,
                            width: widget.prefixIconSize.width,
                            height: widget.prefixIconSize.height,
                            color: Colors.grey,
                          ),
                        )
                      : null,
                  filled: widget.isFilled,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  fillColor: widget.fillColor ?? Colors.grey,
                  enabledBorder: widget.isFilled
                      ? OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.borderColor ?? Colors.grey,
                          ),
                        )
                      : InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide:
                        const BorderSide(color: AppColors.kBg),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide:
                        const BorderSide(color: AppColors.kRed),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide:
                        const BorderSide(color: AppColors.kRed),
                  ),
                  errorStyle: const TextStyle(color: AppColors.kRed),
                  errorMaxLines: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
