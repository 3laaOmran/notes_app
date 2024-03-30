import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 7.0,
          ),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            labelText: "Title",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
            labelText: "Note",
          ),
          const SizedBox(
            height: 80.0,
          ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            height: 45.0,
            color: Colors.cyan[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}