# meeting_scheduler

*Adventures in scheduling across timezones.*

A project by the [Adventures In \[Dart, Flutter, Firebase\]] group.

Goals:

- Help people find a good meeting time across multiple timezones
- Authenticate and sync with Google calendar so both exisiting schedules & timezones are used to find a good time

Feel free to join us as we experiment with ways to solve this problem, using:

- FlutterFire packages: [firebase_messaging], [firebase_auth], [cloud_firestore]
- [Firebase Cloud Functions] for the App Server
- [Riverpod] for state management
- [go_router] for navigation

[Project Notes]

- [x] Create a Flutter project
- [ ] Create a Firebase project
- [x] Import firebase_messaging
- [ ] Initialize Firebase
- [ ] Go over [firebase_messaging] docs & create feature request issues to implement required functionality
- [ ] Create a firebase function that sends notifications

[Adventures In \[Dart, Flutter, Firebase\]]: https://www.meetup.com/Adventures-In-Dart-Flutter-Firebase/
[Firebase Cloud Functions]: https://firebase.google.com/docs/functions
[Riverpod]: https://riverpod.dev/
[Project Notes]: https://adventures-in.notion.site/Notification-Fun-20be3226d6824c3798bab0ab48974c6c
[firebase_messaging]: https://firebase.flutter.dev/docs/messaging/overview/
[firebase_auth]: https://firebase.flutter.dev/docs/auth/overview
[cloud_firestore]: https://firebase.flutter.dev/docs/firestore/overview
[go_router]: https://gorouter.dev/
