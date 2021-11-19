import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfcontextProviders extends StatefulWidget {
  @override
  _OfcontextProvidersState createState() => _OfcontextProvidersState();
}

class _OfcontextProvidersState extends State<OfcontextProviders> {

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
            Consumer<ProvOne>(
              builder: (context,provone,child){
                return Text("${provone.showsomething1}");
              },),
            Consumer<ProvOne>(
              builder: (context,provone,child){
                return Text(provone.showsomething2);
              },),

            Consumer<ProvOne>(builder: (context,provone,child){
              return RaisedButton(onPressed: (){
                provone.dosomething();
              } , child: Text('Do something '),);
            },),
            // Consumer<ProvOne>(builder: (context,provone,child){
            //   return RaisedButton(onPressed: (){
            //     provone.dosomething2();
            //   } , child: Text('Do something 2'),);
            // },),
            ButtonTwo(),
          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier{
  var showsomething1 = 1;
  var showsomething2 = "Show something2";
  dosomething(){
    showsomething1++;
    notifyListeners();
  }
  dosomething2(){
    showsomething2 = "Yes provider 2";
    notifyListeners();
  }
}

class ButtonTwo extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final provone = Provider.of<ProvOne>( context , listen: false );
    return RaisedButton(onPressed: (){
      provone.dosomething2();
    },child: Text("Do Something 2"));
  }
}
