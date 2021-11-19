import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnProviders extends StatefulWidget {
  @override
  _LearnProvidersState createState() => _LearnProvidersState();
}

class _LearnProvidersState extends State<LearnProviders> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return ProvOne();
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: ListView(
        children: [
          Consumer<ProvOne>(builder: (context,provone,child){
            return Text(provone.showsomething);
          },),

          Consumer<ProvOne>(builder: (context,provone,child){
            return RaisedButton(onPressed: (){
              provone.dosomething();
            } , child: Text('Do something ' + provone.showsomething),);
          },),

        ],
      ),
    ),
    );
  }
}

class ProvOne with ChangeNotifier{
  var showsomething = "Show something";
  dosomething(){
    showsomething = "Yes provider";
    notifyListeners();
  }
}
