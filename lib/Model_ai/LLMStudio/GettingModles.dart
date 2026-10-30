import 'package:http/http.dart' as http;
import 'dart:convert';


void main() async {
    GettingModels r = GettingModels();
await r.fetchModels();
}

class GettingModels{

    Future<void> fetchModels() async{
        final url = Uri.parse("http://localhost:1234/api/v1/models");
     try{
        final response = await http.get(url);
        if (response.statusCode ==200 ){
            final Map<String, dynamic> data = jsonDecode(response.body);
            print("Data is  : \n $data \n --------------- \n $data['models']");
            
        }else{
    print("Error ${response.statusCode}");
        }

     }catch(e){print("Errors : $e");}     
   
    }

}