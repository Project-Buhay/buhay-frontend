import 'package:buhay/system_ui/presentation/login/redirect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../controller/login/form_controller.dart';
import '../constituent/map_dashboard.dart';
import '../rescuer/rescuer_dashboard.dart';
import '../../../features/map_error_dialog_box/presentation/map_error_dialog_box.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FormController _controller = FormController();
  bool _firstPress = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  // Submit Login Function
  void _onSubmitLogin() async {
    // Change timer into an if firstpressed bool to decrease delays
    if (!_firstPress){
      _firstPress = true;
      _submitAction();
    }
  }

  void _submitAction() async {
    if (!(await _controller.checkIfConnected())) {
      _showErrorDialog();
      return;
    }

    try {
      showDialog<AlertDialog>(
        context: context,
        barrierDismissible: false, // Disable dismissing dialog box to avoid popping login page
        builder: (BuildContext context) {
          return PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Text('Validating Credentials...'),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LoadingAnimationWidget.discreteCircle(
                    color: Theme.of(context).colorScheme.primary,
                    size: 100.0,
                  ),
                ],
              ),
            ),
          );
        },
      );
      _controller.formKey.currentState!.saveAndValidate();
      Map<String, dynamic> loginData = await _controller.submitForm(context);
      if (loginData.isNotEmpty) {
        var type = loginData['access_control'];
        var personID = loginData['person_id'];
        print("Access Type ${type}");
        // For constituent
        if (type == 1) {
          if (context.mounted) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          }
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MapDashboard(
                        personID: personID,
                      )),
            );
          }
          _firstPress = false;
          return;
        } else if (type == 2) {
          if (context.mounted) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          }
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RescuerDashboard(
                        rescuerId: personID.toString(),
                      )),
            );
          }
          _firstPress = false;
          return;
        }
        else if (type == 3){
          if (context.mounted) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          }
          _onRedirect("Kindly use the WebApp version of Project Buhay");
          _firstPress = false;
          return;
        }
      }
      // Pop DialogBox
      Navigator.of(context, rootNavigator: true).pop();
    } catch (e) {
      await showDialog<AlertDialog>(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: <TextButton>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    _firstPress = false;

  }

  Future<void> _showErrorDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MapConnectionErrorBox(controller: _controller);
      },
    );
  }

  void _onRedirect(message) async {
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Redirect(message: message,)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FormBuilder(
          key: _controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Sign In to continue',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Color(0xFF1C1C1C),
                  ),
                ),
                SizedBox(height: 26),
                FormBuilderTextField(
                  name: 'username',
                  decoration: const InputDecoration(labelText: 'Username'),
                  validator: _controller.validateUsername(),
                ),
                SizedBox(height: 26),
                FormBuilderTextField(
                  name: 'password',
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                            color: Colors.black,
                            ),
                          onPressed: () {
                            setState(() {
                                _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                    ),
                  validator: _controller.validatePassword(),
                ),
                SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      _onSubmitLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3B62FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 26),
                Center(
                    child: GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF87879D),
                    ),
                  ),
                  onTap: () => _onRedirect("Work in Progress..."),
                )),
                SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Don't have an Account? Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFF87879D),
                      ),
                    ),
                    onTap: () => _onRedirect("Work in Progress..."),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
