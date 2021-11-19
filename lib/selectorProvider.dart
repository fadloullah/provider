import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorProviders extends StatefulWidget {
  @override
  _SelectorProvidersState createState() => _SelectorProvidersState();
}

class _SelectorProvidersState extends State<SelectorProviders> {

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
            Selector<ProvOne,int>(
              selector: (context , provs1)=>provs1.showone,
              builder: (context,provone,child){
              return Text("${provone}");
            },),
            Selector<ProvOne,String>(
              selector: (context,provs2)=>provs2.showtwo,
              builder: (context,provone,child){
              return Text(provone);
            },),

            Consumer<ProvOne>(builder: (context,provone,child){
              return RaisedButton(onPressed: (){
                provone.dosomething();
              } , child: Text('Do something '),);
            },),
            Consumer<ProvOne>(builder: (context,provone,child){
              return RaisedButton(onPressed: (){
                provone.dosomething2();
              } , child: Text('Do something 2'),);
            },),

          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier{
  var showsomething1 = 1;
  var showsomething2 = "Show something2";

  //pour utiliser le Selector
  get showone => showsomething1;
  get showtwo => showsomething2;

  dosomething(){
    showsomething1++;
    notifyListeners();
  }
  dosomething2(){
    showsomething2 = "Yes provider 2";
    notifyListeners();
  }
}
