import {WeatherModel}from"../pages/WeatherModel"
import { http } from '@kit.NetworkKit'

class getWeatherUtil{

  getWeather(cityCode: number) {
    return new Promise<WeatherModel>((resolve, reject) => {
      let request = http.createHttp();
      let url = `https://restapi.amap.com/v3/weather/weatherInfo?city=${cityCode}&key=73f58ea81f2a425f22cc9a2655338f70&extensions=all`;

      let result = request.request(url);
      result.then((res) => {
        if (res.responseCode === 200) {
          console.log(res.result.toString());
          resolve(JSON.parse(res.result.toString()));
        } else {
          reject(`请求失败，错误码: ${res.responseCode}`);
        }
      }).catch((err: string) => {
        reject(`网络请求出错: ${err}`);
      });
    });
  }
  //直接发送多个URL结果一并返回
  async getWeathers(cityCode:Array<number>){
  let promises:Array<Promise<WeatherModel>>=[]
  let weatherModels:Array<WeatherModel>=[]
    for (let i = 0; i < cityCode.length; i++) {
      promises.push(this.getWeather(cityCode[i]))
    }

   await Promise.all(promises).then(result=>{
     for (const element of result) {
       console.log(element.forecasts[0].city)
     }
     weatherModels=result
   })
    return weatherModels
  }
}

let getweatherUtil=new getWeatherUtil()
export default getweatherUtil as getWeatherUtil