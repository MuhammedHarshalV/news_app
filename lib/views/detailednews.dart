import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controles/tophedlinecontroler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Detailednews extends StatefulWidget {
  final int index;
  Detailednews({super.key, required this.index});

  @override
  State<Detailednews> createState() => _DetailednewsState();
}

class _DetailednewsState extends State<Detailednews> {
  @override
  Widget build(BuildContext context) {
    Newses providertophed = context.watch<Newses>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Detailed News',
            style: GoogleFonts.orbitron(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Image.network(
                  providertophed.tophedline[widget.index].urlToImage ?? '',
                ),
                Text(
                  'News Source : ${providertophed.tophedline[widget.index].source?.name ?? ''}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  providertophed.tophedline[widget.index].title ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  providertophed.tophedline[widget.index].description ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'News Published Date : ${providertophed.tophedline[widget.index].publishedAt ?? ''}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  providertophed.tophedline[widget.index].content ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () async {
                      final Uri url = Uri.parse(
                        providertophed.tophedline[widget.index].url ?? '',
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        throw 'could not launch ';
                      }
                    },
                    child: Text(
                      providertophed.tophedline[widget.index].url ?? '',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder:
                      (context, index) => Image.network(
                        providertophed.tophedline[widget.index].urlToImage ??
                            '',
                        fit: BoxFit.fill,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
