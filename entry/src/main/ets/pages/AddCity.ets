import { router } from '@kit.ArkUI';
import { casts } from '../pages/casts';
import { IpLocation } from '../pages/ipcasts';
import axios from '@ohos/axios';
import { http } from '@kit.NetworkKit';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { xml } from '@kit.ArkTS';
import { rcp } from '@kit.RemoteCommunicationKit';
import { WeatherModel } from "../pages/WeatherModel";
import { cityView } from './cityView';
import getweatherUtil from './getWeatherUtil';  // 导入天气获取工具类
import { CityData } from "../pages/resource";
import preferenceUtil from '../pages/Preference';

interface LocationResponse {
  status: number;
  info: string;
  infocode: number;
  province: string;
  city: string;
  adcode: number;
  rectangle: string;
}

@Entry
@Component
struct AddCity {
  cityLists = new CityData();
  @State Index: number = 0;
  @State RCityNameList: Array<string> = ['北京市', '天津市', '黑龙江省', '内蒙古自治区', '河北省', '山西省', '辽宁省', '吉林省', '上海市', '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省', '河南省', '湖北省', '湖南省', '广东省', '海南省', '重庆市', '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '西安市', '铜川市', '宝鸡市', '咸阳市', '渭南市', '延安市', '汉中市', '榆林市', '安康市', '商洛市'];
  @State cityCodeList: number[] = [];
  @State cityNameList: string[] = [];
  @State cityWeatherList: Array<WeatherModel> = [];
  @State cityname: string = '';
  @State bgpictures: string[] = [];
  // tabController: TabsController = new TabsController();

  async onPageShow() {
    interface Params {
      codes: number[];
      names: string[];
    }

    let params = router.getParams() as Params;
    this.cityCodeList = params.codes;
    this.cityNameList = params.names;
    await this.getCityWeathers();
  }

  setBgPicture2(weather: string) {
    if (weather === '晴') {
      return 'app.media.bgqingtian';
    } else if (weather === '阴') {
      return 'app.media.bgyintian';
    } else if (weather === '多云') {
      return 'app.media.bgduoyun';
    } else if (weather.includes('雨')) {
      return 'app.media.bgrain';
    }
    return 'app.media.bg1';
  }

  onImageClick() {
    if (this.cityname === '') {
      try {
        promptAction.showDialog({
          title: '输入信息不能为空',
          message: '请输入有效的城市名称',
          buttons: [
            {
              text: '确定',
              color: '#000000'
            }
          ],
        })
          .then(data => {
            console.info('showDialog success, click button: ' + data.index);
          })
          .catch((err: Error) => {
            console.info('showDialog error: ' + err);
          });
      } catch (error) {
        let message = (error as BusinessError).message;
        let code = (error as BusinessError).code;
        console.error(`showDialog args error code is ${code}, message is ${message}`);
      };
      return;
    }

    let index = this.cityLists.AllCityNameList.findIndex(obj => obj === this.cityname);
    if (index === -1) {
      try {
        promptAction.showDialog({
          title: '城市不存在',
          message: '您输入的城市在列表中未找到',
          buttons: [
            {
              text: '确定',
              color: '#000000'
            }
          ],
        })
          .then(data => {
            console.info('showDialog success, click button: ' + data.index);
          })
          .catch((err: Error) => {
            console.info('showDialog error: ' + err);
          });
      } catch (error) {
        let message = (error as BusinessError).message;
        let code = (error as BusinessError).code;
        console.error(`showDialog args error code is ${code}, message is ${message}`);
      };
      return;
    }

    if (this.cityCodeList.includes(this.cityLists.AllCityCodeList[index]) && this.cityNameList.includes(this.cityname)) {
      try {
        promptAction.showDialog({
          title: '添加成功',
          message: '该城市已添加，无需重复添加！',
          buttons: [
            {
              text: '确定',
              color: '#000000'
            }
          ],
        })
          .then(data => {
            console.info('showDialog success, click button: ' + data.index);
          })
          .catch((err: Error) => {
            console.info('showDialog error: ' + err);
          });
      } catch (error) {
        let message = (error as BusinessError).message;
        let code = (error as BusinessError).code;
        console.error(`showDialog args error code is ${code}, message is ${message}`);
      };
      return;
    } else {
      try {
        promptAction.showDialog({
          title: '确认添加',
          message: `是否确定添加${this.cityname}？`,
          buttons: [
            {
              text: '确定',
              color: '#000000',
            },
            {
              text: '取消',
              color: '#000000'
            }
          ],
        })
          .then(data => {
            if (data.index === 0) {
              let citycode: number = this.cityLists.AllCityCodeList[index];
              this.cityCodeList.push(citycode);
              this.cityNameList.push(this.cityname);
              this.getCityWeathers();
            }
            console.info('showDialog success, click button: ' + data.index);
          })
          .catch((err: Error) => {
            console.info('showDialog error: ' + err);
          });
      } catch (error) {
        let message = (error as BusinessError).message;
        let code = (error as BusinessError).code;
        console.error(`showDialog args error code is ${code}, message is ${message}`);
      };
    }
  }

  async getLocation() {
    return new Promise<LocationResponse>((resolve, reject) => {
      let request = http.createHttp();
      let url = `https://restapi.amap.com/v3/ip?&output=json&key=73f58ea81f2a425f22cc9a2655338f70`;

      let result = request.request(url);
      result.then((res) => {
        if (res.responseCode === 200) {
          let responseData: LocationResponse = JSON.parse(res.result.toString());
          let ipcity: string = responseData.city;
          let ipadcode: number = responseData.adcode;

          if (this.cityNameList.includes(ipcity)) {
            try {
              promptAction.showDialog({
                title: '已添加',
                message: `该定位城市为${ipcity},已添加，无需重复添加！`,
                buttons: [
                  {
                    text: '确定',
                    color: '#000000',
                  },
                ],
              })
                .then(data => {
                  console.info('showDialog success, click button: ' + data.index);
                })
                .catch((err: Error) => {
                  console.info('showDialog error: ' + err);
                });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            };
            return;
          } else {
            try {
              promptAction.showDialog({
                title: '定位城市',
                message: `定位到的城市是: ${ipcity}，是否添加？`,
                buttons: [
                  {
                    text: '确定',
                    color: '#000000',
                  },
                  {
                    text: '取消',
                    color: '#000000',
                  }
                ],
              })
                .then(data => {
                  if (data.index === 0) {
                    this.cityCodeList.push(ipadcode);
                    this.cityNameList.push(ipcity);
                    this.getCityWeathers();
                  }
                  console.info('showDialog success, click button: ' + data.index);
                })
                .catch((err: Error) => {
                  console.info('showDialog error: ' + err);
                });
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`showDialog args error code is ${code}, message is ${message}`);
            };
          }
        }
      }).catch((err: string) => {
        console.log(err);
        reject(err);
      });
    });
  }

  async getCityWeathers() {
    let codes = this.cityCodeList;
    try {
      let weatherModels = await getweatherUtil.getWeathers(codes);
      this.cityWeatherList = weatherModels;
      console.log('获取到天气数据并成功更新 this.cityWeatherList:', this.cityWeatherList.map(item => `${item.forecasts[0].city}: 白天温度 ${item.forecasts[0].casts[0].daytemp}, 夜间温度 ${item.forecasts[0].casts[0].nighttemp}`));
    } catch (error) {
      console.error(`获取天气数据出错，城市代码: ${codes.join(',')}, 错误: ${error}`);
    }
  }

  build() {
    Column() {
      // 城市操作部分
      Row() {
        Text('城市列表').fontSize(35).fontColor(Color.White);
        Blank();
        Text('完成  ').fontSize(26).fontColor(Color.White).height(35)
          .borderRadius(20)
          .onClick(() => {
            console.log('接收到的参数1：',  JSON.stringify(this.cityCodeList));
            console.log('接收到的参数1：',  JSON.stringify(this.cityNameList));
            router.back({
              url: "pages/Index",
              params: {
                codes: this.cityCodeList,
                names: this.cityNameList,
                index: 0
              }
            });
            // this.tabController.changeIndex(0);
          });
      }.height('10%').width('95%');

      Row() {
        Image($r('app.media.dingwei')).width(40).height(35).onClick(() => {
          this.getLocation();
        }).fillColor(Color.White);
        TextInput({ placeholder: '搜索查询', text: this.cityname })
          .fontSize(20)
          .fontColor(Color.White)
          .opacity(0.8)
          .height(40)
          .width(270)
          .borderRadius(20)
          .onChange(value => {
            this.cityname = value;
          })
          .backgroundColor(Color.White);
        Image($r('app.media.sousuo')).height(30).width(30)
          .onClick(() => {
            this.onImageClick();
          }).fillColor(Color.White);
      }.width('100%')
      .margin({
        top: '0.00vp',
        right: '0.00vp',
        bottom: '0.00vp',
        left: '25.00vp'
      });

      // 城市列表部分
      Scroll() {
        Column() {
          // 再显示未添加的城市
          Column() {
            Text('热门城市').fontSize(20).fontColor(Color.White)
              .margin({
                top: '10.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '10.00vp'
              });
            Grid() {
              ForEach(this.RCityNameList, (name: string) => {
                GridItem() {
                  Button(name)
                    .fontSize(15)
                    .fontColor(Color.White)
                    .height(35)
                    .backgroundColor("#66f1f3f3")
                    .borderRadius(15)
                    .onClick(() => {
                      if (!this.cityNameList.includes(name)) {
                        let index = this.cityLists.AllCityNameList.findIndex(obj => obj === name);
                        promptAction.showDialog({
                          title: '确认添加',
                          message: `是否确定添加${name}？`,
                          buttons: [
                            {
                              text: '确定',
                              color: '#000000',
                            },
                            {
                              text: '取消',
                              color: '#000000'
                            }
                          ],
                        })
                          .then(data => {
                            if (data.index === 0) {
                              let citycode: number = this.cityLists.AllCityCodeList[index];
                              this.cityCodeList.push(citycode);
                              this.cityNameList.push(name);
                              this.getCityWeathers();
                            }
                            console.info('showDialog success, click button: ' + data.index);
                          })
                          .catch((err: Error) => {
                            console.info('showDialog error: ' + err);
                          });
                      }
                      if (this.cityNameList.includes(name)) {
                        promptAction.showDialog({
                          title: "",
                          message: "该城市已存在,请勿重复添加!",
                          buttons: [
                            {
                              text: '确定',
                              color: '#000000',
                            }
                          ]
                        });
                      }
                    })
                    .margin({ top: '0.00vp', right: '0.00vp', bottom: '5.00vp', left: '0.00vp' });
                }
              });
            }.columnsTemplate('1fr 1fr 1fr 1fr').height('25%').width('100%');
          }.width('100%').alignItems(HorizontalAlign.Start);

          Column() {
            Text('已添加城市').fontSize(20).fontColor(Color.White)
              .margin({ top: '10.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' });
            Grid() {
              ForEach(this.cityLists.AllCityNameList, (name: string, index: number) => {
                if (this.cityNameList.includes(name)) {
                  GridItem() {
                    Button(name)
                      .fontSize(15)
                      .fontColor(Color.White)
                      .height(30)
                      .backgroundColor("#66f1f3f3")
                      .borderRadius(20)
                      .onClick(() => {
                        const index = this.cityNameList.indexOf(name);
                        console.log('接收到的参数2：',  JSON.stringify(this.cityCodeList));
                        console.log('接收到的参数2：',  JSON.stringify(this.cityNameList));
                        console.log('接收到的参数2：',  JSON.stringify(name));
                        console.log('接收到的参数2：',  JSON.stringify(index));
                        if (index!== -1) {
                          this.Index = index;
                          router.back({
                            url: "pages/Index",
                            params: {
                              codes: this.cityCodeList,
                              names: this.cityNameList,
                              index: this.Index
                            }
                          });
                        } else {
                          console.error('指定的城市名称不在列表中。');
                        }
                        // this.tabController.changeIndex(ToIndex);
                      });
                  }
                }
              });
            }.columnsTemplate('1fr 1fr 1fr 1fr').height('70%').width('100%');
          }.width('100%').alignItems(HorizontalAlign.Start)
          .margin({
            top: '10.00vp',
            right: '0.00vp',
            bottom: '10.00vp',
            left: '10.00vp'
          });
        }
      }.width('100%').height('90%');
    }.width('100%').height('100%').backgroundImage($r('app.media.bg')).backgroundImageSize({ width: '100%', height: '100%' });
  }
}


