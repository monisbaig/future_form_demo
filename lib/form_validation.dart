import 'package:flutter/material.dart';

class FormValidation extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController userpasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Demo'),
      ),
      body: Form(
        child: Builder(builder: (childContext) {
          return Column(
            children: [
              TextFormField(
                controller: usernameCtrl,
                validator: (currentValue) {
                  var nonNullValue = currentValue ?? '';
                  if (nonNullValue.isEmpty || !nonNullValue.contains('@')) {
                    return 'Please enter a valid Username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: userpasswordCtrl,
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(childContext)?.validate() ?? false) {
                    print('Hello World form Passed');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
