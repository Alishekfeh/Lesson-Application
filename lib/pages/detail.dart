import 'package:flutter/material.dart';
import 'package:lesson_application/widget/bg_clipper.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> chapters = [
    "conversation ",
    "Usability",
    "Listening",
    "Grammar",
    "Speaking",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: ClipPath(
              clipper: BgClipper(),
              child: Container(
                  height: 260, child: Image.asset("assets/image/back.jpg")),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAppBar(context),
              buildContry(),
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Spanish",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    Text(
                      "5 Chapters",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      "10 hrs",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: chapters.length,
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Card(
                          color: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)
                          ),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              width: MediaQuery.of(context).size.width*0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [Image.asset("assets/image/chats.png",height: 100,),
                            Text(chapters[index],style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "5 Chapters",
                                      style: TextStyle(color: Colors.black38, fontSize: 14),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4),
                                      child: Container(
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "10 hrs",
                                      style: TextStyle(color: Colors.black38, fontSize: 14  ),
                                    )
                                  ],
                                ),
                              ),
                              Text("Sample the accessible writing style and tone of the text. Look at how the figures and features work to aid students' understanding of key concepts and frameworks.",style: TextStyle(color: Colors.black38,fontSize: 12),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80),
                                      image: DecorationImage(
                                        image: AssetImage("assets/image/usr2.jpg",),
                                        fit: BoxFit.fill
                                      )
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Instructor",style: TextStyle(color: Colors.grey.shade600,fontSize: 16,fontFamily: "DancingScript"),),
                                      Text("Adam Lambert",style: TextStyle(color: Colors.indigo.shade600,fontSize: 22,fontFamily: "MyFlutterApp"),),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      );
                    }),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 18, bottom: 10,top: 10),
                child: Text(
                  "Resource",
                  style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  buildColumnResource(Icons.cloud_circle, "Idioms"),
                  buildColumnResource(Icons.book, "Dictionary"),
                  buildColumnResource(Icons.create_new_folder, "Tenses Table"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColumnResource(IconData icon, String title) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: Colors.indigo,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        SizedBox(
            width: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
            ))
      ],
    );
  }

  Padding buildContry() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: AssetImage("flags/es.png",
                        package: "country_code_picker"))),
          ),
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey.shade800),
              child: Text(
                "Beginner",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
      title: Text(
        "Course",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: "MyFlutterApp",
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
      ],
    );
  }
}
