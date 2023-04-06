import 'package:country_news/screen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).countryApiCall('in');
  }

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Country Detalis"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProviderTrue!.countryApiCall('in');
                  },
                  child: Text("in"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProviderTrue!.countryApiCall('us');
                  },
                  child: Text("us"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProviderTrue!.countryApiCall('au');
                  },
                  child: Text("au"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProviderTrue!.countryApiCall('ca');
                  },
                  child: Text("ca"),
                ),
                SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeProviderTrue!.countryApiCall('uk');
                  },
                  child: Text("uk"),
                ),
                Expanded(
                  child: homeProviderTrue!.countryModel==null?ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              "${homeProviderTrue!.countryModel!.articles![index].title}"),
                          subtitle: Text(
                              "${homeProviderTrue!.countryModel!.articles![index].author}"),
                        );
                      },
                      itemCount:
                          homeProviderFalse!.countryModel!.articles!.length):Container()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
