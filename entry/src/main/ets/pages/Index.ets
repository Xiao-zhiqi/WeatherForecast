import axios from '@ohos/axios';
import getweatherUtil from "../pages/getWeatherUtil";
import { WeatherModel } from "../pages/WeatherModel";
import { cityView } from './cityView';
import { router } from '@kit.ArkUI';
import preferenceUtil from '../pages/Preference';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // 城市代码、名字、信息
  @State Index: number = 0;
  @State cityCodeList: number[] = [120000];
  @State cityNameList: string[] = [];
  @State cityWeatherList: Array<WeatherModel> = [];
  @State cityIndex: number = 0;
  @State bgpictures: string[] = [];
  // Swiper 的控制器
  Scontroller: SwiperController = new SwiperController();

  setBgPicture(weather: string, index: number) { // 添加索引参数
    if (weather === '晴') {
      this.bgpictures[index] = 'app.media.bgqingtian';
    } else if (weather === '阴') {
      this.bgpictures[index] = 'app.media.bgyintian';
    } else if (weather === '多云') {
      this.bgpictures[index] = 'app.media.bgduoyun';
    } else if (weather.includes('雨')) {
      this.bgpictures[index] = 'app.media.bgrain';
    }
  }

  onPageShow() {
    interface Params {
      codes: number[];
      names: string[];
      index: number;
    }

    let params = router.getParams() as Params;
    console.log('接收到的参数：', JSON.stringify(params));
    if (params && params.codes && params.names) {
      this.cityCodeList = params.codes;
      this.cityNameList = params.names;
      this.Index = params.index;
      this.cityWeatherList = [];
      this.cityNameList = [];
      this.initDate();
      // this.Scontroller.changeIndex(params.index);
      if (this.cityWeatherList[params.index] && this.cityWeatherList[params.index].forecasts &&
      this.cityWeatherList[params.index].forecasts[0] && this.cityWeatherList[params.index].forecasts[0].casts &&
      this.cityWeatherList[params.index].forecasts[0].casts[0]) {
        this.setBgPicture(this.cityWeatherList[params.index].forecasts[0].casts[0].dayweather, params.index);
      } else {
        console.error('无法获取正确的天气数据以设置背景图片。');
      }
    } else {
      console.error('Params do not contain the expected codes or names property');
    }
  }

  // 弹窗
  onImageClick1() {
    try {
      promptAction.showDialog({
        title: '',
        message: ``,
        buttons: [
          {
            text: '删除城市信息',
            color: '#ff484646'
          },
          {
            text: '反馈天气',
            color: '#ff484646'
          }
        ],
      })
        .then(data => {
          if (data.index === 0 && this.cityNameList.length > 1) {
            AlertDialog.show({
              title: "删除",
              message: `你确定要删除${this.cityNameList[this.cityIndex]}吗？`,
              confirm: {
                value: "确定",
                action: () => {
                  this.cityNameList = this.cityNameList.filter(item => item !== this.cityNameList[this.cityIndex]);
                  this.cityCodeList = this.cityCodeList.filter(item => item !== this.cityCodeList[this.cityIndex]);
                  this.cityWeatherList =
                    this.cityWeatherList.filter(item => item !== this.cityWeatherList[this.cityIndex]);
                  this.saveToPreferences();
                  this.loadFromPreferences();
                }
              }
            });
          } else {
            promptAction.showDialog({
              title: '至少保留一所城市',
              message: '城市删除失败！',
              buttons: [
                {
                  text: '确定',
                  color: '#000000'
                }
              ],
            });
          }
        });
    } catch (error) {
      console.error(`showDialog error `);
    }
  }

  // 获取数据
  aboutToAppear() {
    this.initDate();
    this.loadFromPreferences();
  }

  // 初始化方法
  async initDate() {
    let result: Array<WeatherModel> = await getweatherUtil.getWeathers(this.cityCodeList);

    for (let i = 0; i < result.length; i++) {
      let ACityWeather = new WeatherModel();
      ACityWeather = result[i];
      if (!this.cityWeatherList.includes(ACityWeather)) {
        this.cityWeatherList.push(ACityWeather);
      }
      let cityName = result[i].forecasts[0].city;
      if (!this.cityNameList.includes(cityName)) {
        this.cityNameList.push(cityName);
      }
      // 根据天气设置背景图片
      this.setBgPicture(result[i].forecasts[0].casts[0].dayweather, i);
    }
    // 将城市列表保存到首选项
    await this.saveToPreferences();
  }

  async loadFromPreferences() {
    // const loadedCityCodesStr = await preferenceUtil.get('cityPrefs', 'cityCodeslist', '[]') as string;
    // const loadedCityNamesStr = await preferenceUtil.get('cityPrefs', 'cityNameslist', '[]') as string;
    // const loadedCityCodes = JSON.parse(loadedCityCodesStr) as number[];
    // const loadedCityNames = JSON.parse(loadedCityNamesStr) as string[];
    // if (loadedCityCodes.length > 0 && loadedCityNames.length > 0) {
    //   this.cityCodeList = loadedCityCodes;
    //   this.cityNameList = loadedCityNames;
    // }
  }

  async saveToPreferences() {
    //   await preferenceUtil.Put('cityPrefs', 'cityCodeslist', JSON.stringify(this.cityCodeList));
    //   await preferenceUtil.Put('cityPrefs', 'cityNameslist', JSON.stringify(this.cityNameList));
  }

  // 数据展示
  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Image($r(this.bgpictures[this.cityIndex]))
        .width('100%').height('100%');
      Row() {
        Row() {
          Row() {
            Column() {
              Text(' ')
                .onClick(() => {
                  console.log('Processing item:', JSON.stringify(this.cityIndex));
                })
                .height(50)
                .width(40)
                .fontSize(30);
              Text(' ' + this.cityNameList[this.cityIndex])
                .height(45)
                .fontSize(35)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Medium)
                .fontStyle(FontStyle.Normal)
                .margin({
                  top: '0.00vp',
                  right: '0.00vp',
                  bottom: '10.00vp',
                  left: '0.00vp'
                });
            }
          }

          Row() {
            Image($r('app.media.add'))
              .height(32)
              .fillColor(Color.White)
              .margin({
                top: '0.00px',
                right: '0.00px',
                bottom: '0.00vp',
                left: '30.00px'
              })
              .onClick(() => {
                router.pushUrl({
                  url: "pages/AddCity",
                  params: {
                    codes: this.cityCodeList,
                    names: this.cityNameList
                  }
                });
              });
            Text(' ').fontSize(20).height(35);
            Image($r('app.media.more'))
              .fillColor(Color.White)
              .opacity(1)
              .height(32)
              .margin({
                top: '0.00vp',
                right: '3.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })
              .onClick(() => {
                this.onImageClick1();
              });
          }.width('50%').justifyContent(FlexAlign.End).alignItems(VerticalAlign.Top)
          .margin({
            top: '-30.00vp',
            right: '30.00vp',
            bottom: '0.00vp',
            left: '0.00vp'
          });
        }
        .width('100%')
        .height('13%')
        .justifyContent(FlexAlign.SpaceBetween)
        .margin({
          top: '0.00vp',
          right: '30.00vp',
          bottom: '0.00vp',
          left: '30.00vp'
        });
      }
      .position({ x: 0, y: 0 })

      Swiper(this.Scontroller) {
        ForEach(this.cityWeatherList, (cityWeather: WeatherModel, index: number) => {
          Column() {
            cityView({ casts: cityWeather.forecasts[0].casts });
          }
          .width('100%').height('100%');
        })
      }
      .index(this.Index)
      .onChange((index: number) => {
        this.cityIndex = index;
        this.setBgPicture(this.cityWeatherList[index].forecasts[0].casts[0].dayweather, index);
      })
      .margin({
        top: '90.00vp',
        right: '0.00vp',
        bottom: '0.00vp',
        left: '0.00vp'
      })

      // }.backgroundImage($r(this.bgpictures[this.cityIndex]))
      //   .backgroundImageSize({ width: '100%', height: '100%' })
    }
  }
}