part of 'login_page.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  String? strUsername;

  bool _usernameInteracts() => strUsername != null;
  bool _isLoading = false;

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    Future.delayed(
      const Duration(seconds: 3),
          () => setState(() => _isLoading = false),
    );

    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppSpacing.verticalSpacing20,
                  Text('Welcome to Food Catalog',
                    style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                  ),
                  AppSpacing.verticalSpacing10,
                  Row(
                    children: [
                      const Icon(Icons.people,
                        size: 24,
                        color: Colors.grey,
                      ),
                      AppSpacing.horizontalSpacing10,
                      Flexible(child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.disabledLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => setState(() {
                            strUsername = value;
                          }),
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: AppColors.disabledColor,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),),
                    ],
                  ),
                  AppSpacing.verticalSpacing10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton.icon(
                        onPressed: !_usernameInteracts() ? null : _onSubmit,
                        style: ElevatedButton.styleFrom(padding: const
                        EdgeInsets.symmetric(
                            horizontal: 16,),
                            backgroundColor: !_usernameInteracts() ? AppColors.disabledColor
                            : AppColors.mainColor,),
                        icon: _isLoading ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ) : Container(),
                        label: const Text('Sign In', style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),),
                    ),
                  ),
                  AppSpacing.verticalSpacing20
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}