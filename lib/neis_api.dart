import 'dart:convert';

import 'package:http/http.dart' as http;

class NeisApi {
  Future<List<dynamic>> getMeal(
      {required String fromDate, required String toDate}) async {
    String site =
        'https://open.neis.go.kr/hub/mealServiceDietInfo?KEY=cf1e8729e9f7499c99f49cc0fc44950b&TYPE=json&ATPT_OFCDC_SC_CODE=J10&SD_SCHUL_CODE=7530167&MLSV_FROM_YMD=$fromDate&MLSV_TO_YMD=$toDate';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var meals = jsonDecode(response.body)['mealServiceDietInfo'][1]['row']
          as List<dynamic>;
      return meals;
    } else {
      return [];
    }
  }
}
