# meeting_scheduler

*Adventures in scheduling across timezones.*

A project by the [Adventures In \[Dart, Flutter, Firebase\]] group.

Goals:

- Help people find a good meeting time across multiple timezones
- Authenticate and sync with Google calendar so both exisiting schedules & timezones are used to find a good time

Feel free to join us as we experiment with ways to solve this problem, using:

- FlutterFire packages: [firebase_messaging], [firebase_auth], [cloud_firestore]
- [Firebase Cloud Functions] for the notifications App Server
- [Riverpod] for state management
- [go_router] for navigation

## References

[Team Project Notes]

### Running the app

#### Android

To use Google Sign In you'll need to add your SHA-1 fingerprint to the relevant Firebase project.  

See: [Authenticating Your Client](https://developers.google.com/android/guides/client-auth?authuser=0)

[Adventures In \[Dart, Flutter, Firebase\]]: https://www.meetup.com/Adventures-In-Dart-Flutter-Firebase/
[Firebase Cloud Functions]: https://firebase.google.com/docs/functions
[Riverpod]: https://riverpod.dev/
[Team Project Notes]: https://adventures-in.notion.site/Meeting-Scheduler-262ad85a6cb04c5080e7a624151a800a
[firebase_messaging]: https://firebase.flutter.dev/docs/messaging/overview/
[firebase_auth]: https://firebase.flutter.dev/docs/auth/overview
[cloud_firestore]: https://firebase.flutter.dev/docs/firestore/overview
[go_router]: https://gorouter.dev/
