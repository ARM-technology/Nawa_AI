import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nowachat/Model_ai/ModelEngine.dart';


class Promptengineering extends ConsumerStatefulWidget {
  const Promptengineering({Key? key}) : super(key: key);

  @override
  ConsumerState<Promptengineering> createState() => _Promptengineering();
}

class _Promptengineering extends ConsumerState<Promptengineering> {

  TextEditingController _input = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit role model"),
        actions: <Widget>[
                  //  جالس افكر وش اضيف ميزات    الي عنده افكار يكتب لي 👀👀👀👀👀
          ],
      ),
      body: ListView(children: [
        const SizedBox(height: 20,),
        Text("Prompt : \n ${ref.watch(promptEngineering)} \n "),
        const SizedBox(height: 5,),
        Divider(height: 1, color:  Colors.black,radius: BorderRadius.all(Radius.circular(6)),indent: 10,endIndent: 50,),
        const SizedBox(height: 20,),
        TextField(controller: _input,),
        const SizedBox(height: 5,),
        ElevatedButton(onPressed: (){
          ref.read(promptEngineering.notifier).state = _input.text;
        }, child: Text("Save"))
      ],),
    );
  }

}