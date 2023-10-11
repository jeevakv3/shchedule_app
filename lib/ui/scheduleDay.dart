import '../allpackages.dart';

class ScheduleDay extends StatefulWidget {
  const ScheduleDay({Key? key}) : super(key: key);

  @override
  State<ScheduleDay> createState() => _ScheduleDayState();
}

class _ScheduleDayState extends State<ScheduleDay> {
  Map<String, Map<String, bool>> selections = {
    'Sun': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Mon': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Tue': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Wed': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Thu': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Fri': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Sat': {'Morning': false, 'Afternoon': false, 'Evening': false},
  };
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set your weekly hours',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(
                height: 1,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 400, // Adjust the height as needed
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: selections.length,
                      itemBuilder: (context, index) {
                        final day = selections.keys.elementAt(index);
                        final sessionSelections = selections[day]!;
                        return Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: isSelected
                                          ? Color(0xff198038)
                                          : Colors.grey,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                  buildSessionSelection(
                                      sessionSelections, day, 'Morning'),
                                  buildSessionSelection(
                                      sessionSelections, day, 'Afternoon'),
                                  buildSessionSelection(
                                      sessionSelections, day, 'Evening'),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 85,
                  ),
                  InkWell(
                    onTap: () {
                      navigateToSelectedSessionPage();
                    },
                    child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xff5563F5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSelectedSessionPage() {
    List<String> selectedDays = [];
    List<String> selectedSessions = [];

    // Collect selected days and sessions
    for (var day in selections.keys) {
      for (var session in selections[day]!.keys) {
        if (selections[day]![session] == true) {
          selectedDays.add(day);
          selectedSessions.add(session);
        }
      }
    }
    if (selectedDays.isEmpty || selectedSessions.isEmpty) {
      const snackBar = SnackBar(
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.red,
        content: Text('Please Select day and session'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ScheduleScreen(
            selectedDays: selectedDays,
            selectedSessions: selectedSessions,
          ),
        ),
      );
    }
  }

  Widget buildSessionSelection(
      Map<String, bool> sessionSelections, String day, String session) {
    isSelected = sessionSelections[session] ?? false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            sessionSelections[session] = !sessionSelections[session]!;
          });
        },
        child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? const Color(0xff7F86D4) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              session,
              style: TextStyle(
                color: isSelected ? const Color(0xff7F86D4) : Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
