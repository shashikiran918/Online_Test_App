import 'package:demo/question_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? _controller;
  int indexCurrent = 0;
  int length = 10;

  List<QuestionModel> questionList = [];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    setDataOfQuestion();
  }

  setDataOfQuestion() async {
    setState(() {
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/albert.jpeg',
          'name':
          'In school, Albert Einstein failed most of the subjects, except for physics and math.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/happybirthday.jpeg',
          'name': 'The first song ever sung in the space was “Happy Birthday.”',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/USA.png',
          'name':
          'The first country in the world to use postcards was the United States of America.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': '',
          'name':
          'A male canary tends to have a better singing voice than a female canary.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/caffeine.jpeg',
          'name': 'Tea contains more caffeine than coffee and soda.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/dog.jpg',
          'name': 'Dogs have an appendix.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/bill.jpeg',
          'name': 'Bill Gates is the founder of Amazon.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/mice.jpeg',
          'name': 'Mice have more bones than humans.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/John F. Kennedy .jpg',
          'name':
          'John F. Kennedy is one of the four U.S. President who is on Mount Rushmore.',
        }),
      );
      questionList.add(
        QuestionModel.fromJson({
          'img': 'assets/imag/chewing_gum.jpeg',
          'name': 'The first product with a bar code was chewing gum.',
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.only(top: 45, left: 15, right: 24, bottom: 10),
            child: Text(
              'Q. No. ${indexCurrent + 1}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              itemCount: questionList.length,
              onPageChanged: (int index) {
                setState(() {
                  indexCurrent = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              questionList[index].img!.isEmpty
                                  ? const SizedBox.shrink()
                                  : Image.asset(questionList[index].img!),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                questionList[index].name!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xff00184F),
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                value: questionList[index].yes,
                                onChanged: (value) {
                                  setState(() {
                                    questionList[index].yes = value;
                                    questionList[index].no = false;
                                  });
                                },
                              ),
                              const Text(
                                'Yes',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff00184F),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                value: questionList[index].no,
                                onChanged: (value) {
                                  setState(() {
                                    questionList[index].yes = false;
                                    questionList[index].no = value;
                                  });
                                },
                              ),
                              const Text(
                                'No',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff00184F),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue,
                  onPressed: indexCurrent == 0
                      ? null
                      : () {
                    _controller!.animateToPage(
                      indexCurrent - 1,
                      duration: const Duration(milliseconds: 10),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    '< Previous',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.blue,
                  onPressed: indexCurrent == 9
                      ? null
                      : () {
                    _controller!.animateToPage(
                      indexCurrent + 1,
                      duration: const Duration(milliseconds: 10),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    'Next >',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}