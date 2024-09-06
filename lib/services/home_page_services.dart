
import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';

abstract class HomePageServices {
  static Future<ApiResp> getHomeList() async {
    dynamic resp;
    await errMAsync(() async {
      resp = await MyDio().get("${ApiPaths.baseUrl}");
    });

    return resp != null
        ? ApiResp(
      ok: true,
      rdata: resp,
      msgs: [

      ], message: '',
    )
        : ApiResp(
      ok: false,
      rdata: resp,
      msgs: [

      ], message: '',
    );
  }
}



