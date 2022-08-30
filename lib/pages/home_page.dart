import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:lesson_application/pages/detail.dart';
import 'package:lesson_application/widget/bg_clipper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<CountryCode> pages=[
  CountryCode(flagUri: "flags/es.png",name: "spanish"),
  CountryCode(flagUri: "flags/de.png",name: "German"),
  CountryCode(flagUri: "flags/id.png",name: "Indonesia"),
  CountryCode(flagUri: "flags/kr.png",name: "Korea"),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildHeader(),
          Text("Select your mother tongue",style: TextStyle(
            fontSize: 16,
            fontFamily: "Raleway"
          ),),
          SizedBox(height: 18,),
          CountryCodePicker(
            initialSelection: "Italia",
            builder: (codes) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withAlpha(100)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 22,vertical: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage("${codes?.flagUri}",
                                    package: "country_code_picker"))),
                      ),
                      SizedBox(width: 10,),
                      Text("${codes!.name}",style: TextStyle(
                        color: Colors.indigo
                      ),),
                      SizedBox(width: 20,),

                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.indigo,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 22,),
          Text("What do you want to learn",style: TextStyle(
              fontSize: 16,
              fontFamily: "Raleway",fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 16,),
          buildCard(),
          SizedBox(height: 32,),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsPage()));
              },
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22))),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                child: Text(
                  "Start",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                ),
              ))
        ],
      ),
    );
  }

  Container buildCard() {
    return Container(
          padding: EdgeInsets.all(6),
          height: 150,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: pages.length,
              itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Container(
                    padding: EdgeInsets.all(18),
                    width: 175,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: AssetImage("${pages[index].flagUri}",
                                      package: "country_code_picker"))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${pages[index].name}"),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: Colors.black12)
                                ),
                                child: Icon(Icons.check)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
          }),
        );
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Column(
          children: [
            ClipPath(
              clipper: BgClipper(),
              child: Image.asset("assets/image/back.jpg"),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.grey.shade200,
                    fontSize: 33,
                    fontFamily: "MyFlutterApp",
                    fontWeight: FontWeight.w600),
              )),
        ),
        SizedBox(
          height: 240,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                margin: EdgeInsets.all(8),
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage("assets/image/usr1.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
