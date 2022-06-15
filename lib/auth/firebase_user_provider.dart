import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ActividAd8ConFirebaseFirebaseUser {
  ActividAd8ConFirebaseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ActividAd8ConFirebaseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ActividAd8ConFirebaseFirebaseUser>
    actividAd8ConFirebaseFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ActividAd8ConFirebaseFirebaseUser>(
            (user) => currentUser = ActividAd8ConFirebaseFirebaseUser(user));
