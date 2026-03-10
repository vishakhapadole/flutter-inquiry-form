import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final companyController = TextEditingController();
  final messageController = TextEditingController();

  bool isLoading = false;

 void submitInquiry() async {

  if (!_formKey.currentState!.validate()) return;

  setState(() {
    isLoading = true;
  });

  await FirebaseFirestore.instance.collection("inquiries").add({
    "name": nameController.text,
    "email": emailController.text,
    "company": companyController.text,
    "message": messageController.text,
    "created_at": Timestamp.now()
  });

  setState(() {
    isLoading = false;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Inquiry submitted successfully")),
  );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inquiry Page"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              InputField(
                label: "Name",
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              InputField(
                label: "Email",
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              InputField(
                label: "Company",
                controller: companyController,
              ),

              const SizedBox(height: 15),

              InputField(
                label: "Message",
                controller: messageController,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your inquiry";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              CustomButton(
                text: "Submit Inquiry",
                isLoading: isLoading,
                onPressed: submitInquiry,
              ),

            ],
          ),
        ),
      ),
    );
  }
}