import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class fbLogin {
  FacebookLogin facebookLogin = FacebookLogin();

  Future<FacebookLoginResult> signIn() async {
    FacebookLoginResult result =
        await facebookLogin.logIn(['email', 'public_profile']);

    print(result.errorMessage);

    switch (result.status) {
      case FacebookLoginStatus.cancelledByUser:
        Fluttertoast.showToast(msg: result.errorMessage);
        facebookLogin.logOut();
        return null;

      case FacebookLoginStatus.error:
        Fluttertoast.showToast(msg: result.errorMessage.toString());
        facebookLogin.logOut();
        return null;

      case FacebookLoginStatus.loggedIn:
        return result;
      // await _firebaseAuth.signInWithCredential(
      //     FacebookAuthProvider.getCredential(
      //         accessToken: result.accessToken.token));

    }
  }

  void signOut() {
    facebookLogin.logOut();
  }
}
