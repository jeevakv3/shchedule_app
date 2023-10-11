import '../allpackages.dart';

class ScheduleScreen extends StatefulWidget {
  final List<String> selectedDays;
  final List<String> selectedSessions;
  const ScheduleScreen(
      {required this.selectedDays, required this.selectedSessions});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    String message = '';
    for (int i = 0; i < widget.selectedDays.length; i++) {
      message += '${widget.selectedDays[i]} ${widget.selectedSessions[i]}';
      if (i < widget.selectedDays.length - 1) {
        message += ', ';
      }
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Image.asset(
            'assets/appBar.png',
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Jose!',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const Text(
              'Let’s get started',
              style: TextStyle(color: Color(0xff62656B), fontSize: 14),
            ),
            SizedBox(
              height: 160,
            ),
            Center(
              child: Text(
                'You’re available in',
                style: TextStyle(color: Color(0xff62656B), fontSize: 24),
              ),
            ),
            Center(
              child: Text(
                message,
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff5563F5),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
