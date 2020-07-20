import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleLogin {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<AuthCredential> signIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return credential;
  }

  void signOut() async {
    await _googleSignIn.signOut();
    print("User sign out");
  }
}

//  final Firestore _db =Firestore.instance;
