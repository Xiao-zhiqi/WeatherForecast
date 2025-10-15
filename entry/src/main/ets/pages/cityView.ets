// import { casts } from '../pages/casts';
// import { forecasts } from './forecast';
//
// @Component
// export struct cityView {
//   @Builder
//   weartherImage(weather: string) {
//     if (weather === '晴') {
//       Image($r('app.media.qingtian')).width(30)
//     }
//     if (weather === '阴') {
//       Image($r('app.media.yintian')).width(30)
//     }
//     if (weather === '多云') {
//       Image($r("app.media.duoyun")).width(30)
//     }
//     if (weather.includes('雨')) {
//       Image($r('app.media.yutian')).width(30)
//     }
//   }
//
//   @State close: string = ''
//   @State isRefreshing: boolean = false
//   @State promptText: string = "正在刷新"
//   //半屏显示1
//   @State isShow: boolean = false
//
//   @Builder
//   myBuilder() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.cast, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.cast.nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   @State isShow1: boolean = false
//
//   @Builder
//   myBuilder1() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.casts, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp2(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   @State isShow2: boolean = false
//
//   @Builder
//   myBuilder2() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.casts, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   @State isShow3: boolean = false
//
//   @Builder
//   myBuilder3() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.casts, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   @State isShow4: boolean = false
//
//   @Builder
//   myBuilder4() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.casts, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   @State isShow5: boolean = false
//
//   @Builder
//   myBuilder5() {
//     Column() {
//       List({ space: 20 }) {
//         ForEach(this.casts, (cast: casts, index: number) => {
//           ListItem() {
//             Row() {
//               Text(`${this.casts[index].date}`).fontSize(15)
//               Column() {
//                 Row() {
//                   Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
//                 }
//
//                 Row() {
//                   this.weartherImage(this.casts[index].nightweather)
//                   Text('转')
//                   this.weartherImage(this.casts[index].dayweather)
//                 }
//               }
//
//               Column() {
//                 Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
//                 Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               }
//
//               //   Row() {
//               //     Column() {
//               //       Text(`${this.casts[index].nightweather}`)
//               //       this.weartherImage(this.casts[index].nightweather)
//               //     }
//               //   Column(){Text('转')
//               //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
//               //            Text('转')}
//               //   Column(){
//               //     Text(`${this.casts[index].dayweather}`)
//               //     this.weartherImage(this.casts[index].dayweather)
//               //   }
//               // }
//               // Column(){
//               //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
//               //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
//               // }
//             }.width('100%').justifyContent(FlexAlign.SpaceAround)
//           }
//         })
//       }
//       .margin({
//         top: '30.00vp',
//         right: '0.00vp',
//         bottom: '0.00vp',
//         left: '0.00vp'
//       })
//     }
//     .width('100%')
//   }
//
//   // 修改判断温度的方法，增加更细致的温度区间和对应的穿着建议
//   judgeTemp1(daytemp: number) {
//     if (daytemp < -20) {
//       return '适宜加厚羽绒服'
//     }
//     if (-20 <= daytemp && daytemp < -15) {
//       return '适宜厚羽绒服'
//     }
//     if (-15 <= daytemp && daytemp < -10) {
//       return '适宜羽绒服'
//     }
//     if (-10 <= daytemp && daytemp < -5) {
//       return '适宜棉服'
//     }
//     if (-5 <= daytemp && daytemp < 0) {
//       return '适宜厚大衣'
//     }
//     if (0 <= daytemp && daytemp < 5) {
//       return '适宜毛呢大衣'
//     }
//     if (5 <= daytemp && daytemp < 10) {
//       return '适宜大衣'
//     }
//     if (10 <= daytemp && daytemp < 15) {
//       return '适宜风衣'
//     }
//     if (15 <= daytemp && daytemp < 20) {
//       return '适宜薄外套'
//     }
//     if (20 <= daytemp && daytemp < 25) {
//       return '适宜长袖衬衫'
//     }
//     if (daytemp > 25) {
//       return '适宜短袖'
//     }
//     return '注意增减衣物！'
//   }
//
//   judgeTemp2(daytemp: number) {
//     if (daytemp < 10) {
//       return '无需防晒'
//     }
//     if (10 <= daytemp && daytemp < 25) {
//       return '需防晒'
//     }
//     if (daytemp >= 25) {
//       return '需防晒'
//     }
//     return '极端天气'
//   }
//
//   judgeTemp3(daytemp: number) {
//     if (daytemp < 4) {
//       return '宜室内运动'
//     }
//     if (5 <= daytemp && daytemp < 30) {
//       return '宜室外运动'
//     }
//     if (daytemp > 30) {
//       return '易中暑'
//     }
//     return '极端天气'
//   }
//
//   judgeTemp4(daytemp: number, nighttemp: number) {
//     if ((daytemp - nighttemp) <= 14) {
//       return '少发感冒'
//     }
//     if ((daytemp - nighttemp) > 14) {
//       return '易感冒'
//     }
//     return '注意天气变化'
//   }
//
//   judgeTemp5(dayweather: string, nightweather: string) {
//     if (nightweather.includes('雨')) {
//       return '不宜洗车'
//     }
//     if (dayweather.includes('雨')) {
//       return '不宜洗车'
//     }
//     return '宜洗车'
//   }
//
//   judgeTemp6(dayweather: string, nightweather: string) {
//     if (nightweather.includes('雨')) {
//       return '有雨带伞'
//     }
//     if (dayweather.includes('雨')) {
//       return '有雨带伞'
//     }
//     return '无需带伞'
//   }
//
//   forecasts: Array<casts> = []
//
//   build() {
//     Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText}) {
//       Scroll() {
//         Column() {
//           // Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText }) {
//           Column() {
//             ForEach(this.forecasts, (forecast: forecasts,index:number) => {
//                 Row() {
//                   Text('  '+forecast.city)
//                     .height(45)
//                     .fontSize(30)
//                     .fontColor(Color.White)
//                     .fontWeight(FontWeight.Medium)
//                     .fontStyle(FontStyle.Normal)
//                   Text(forecast.casts[0].daytemp+'°').fontSize(100).fontColor(Color.White)
//                     .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '35.00vp' })
//                 }.height(100).width('100%').justifyContent(FlexAlign.Start)
//                 .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                 Row(){
//                   Column() {
//                     // Row() {
//                     //   Text(cast.date).fontSize(20).fontColor(Color.Black)
//                     // }.height(25)
//                     Row() {
//                       Text(forecast.casts[0].dayweather).fontSize(20).fontColor(Color.White)
//                         if (forecast.casts[0].dayweather === '晴') {
//                           Image($r('app.media.qingtian')).width(20)
//                         }
//                         if (forecast.casts[0].dayweather === '阴') {
//                           Image($r('app.media.yintian')).width(20)
//                         }
//                         if (forecast.casts[0].dayweather === '多云') {
//                           Image($r("app.media.duoyun")).width(20)
//                         }
//                         if (forecast.casts[0].dayweather.includes('雨')) {
//                           Image($r('app.media.yutian')).width(20)
//                         }
//                       Text(forecast.casts[0].daywind + "风").fontSize(20).fontColor(Color.White)
//                       Text(forecast.casts[0].daypower + "级").fontSize(20).fontColor(Color.White)
//                     }.height(25)
//                     .margin({ top: '15.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//
//                     Row() {
//                       Text(' 最高' +forecast.casts[0].nighttemp + "°  " +' 最低' + forecast.casts[0].daytemp + "°")
//                         .fontSize(20)
//                         .fontColor(Color.White)
//                         .margin({ top: '10.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     }.height(30)
//                     .margin({
//                       top: '0.00vp',
//                       right: '0.00vp',
//                       bottom: '10.00vp',
//                       left: '0.00vp'
//                     })
//                   }
//                   .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '10.00vp' })
//                 }
//                 .justifyContent(FlexAlign.Start)
//                 .width('100%')
//                 .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '25.00vp' })
//             })
//             Row(){
//             Column() {
//               Text('近期天气查询')
//                 .fontSize(22)
//                 .margin({
//                   top: '15.00vp',
//                   right: '0.00px',
//                   bottom: '0.00px',
//                   left: '0.00px'
//                 }).foregroundColor(Color.White)
//               Row() {
//                 ForEach(this.forecasts, (forecast: forecasts,index:number) => {
//                   Column() {
//                     Text(forecast.casts[index].date.substring(5)).fontColor(Color.White)
//                       .fontSize(22)
//                       .fontWeight(FontWeight.Medium)
//                       .margin({
//                         top: '10.00vp',
//                         right: '0.00vp',
//                         bottom: '0.00vp',
//                         left: '0.00vp'
//                       })
//                     this.weartherImage(forecast.casts[index].dayweather)
//                     Text(forecast.casts[index].daytemp.toString()).fontColor(Color.White)
//                       .fontSize(22)
//                     Line()
//                       .width(20)
//                       .height(65)
//                       .startPoint([10, 5])
//                       .endPoint([10, 55])
//                       .stroke(Color.Black)
//                       .strokeWidth(2)
//                       .strokeDashArray([7, 4])
//                       .backgroundColor(Color.White)
//                     Text(forecast.casts[index].nighttemp.toString())
//                       .fontSize(22).fontColor(Color.White)
//                     this.weartherImage(forecast.casts[index].nightweather)
//                   }.width('20%').height('80%')
//                   .margin({
//                     top: '10.00vp',
//                     right: '0.00vp',
//                     bottom: '0.00vp',
//                     left: '0.00vp'
//                   })
//                 })
//               }
//             }
//             .borderRadius(15)
//             .width('100%')
//             .height(280)
//             .backgroundColor('#8cdddbdb')
//               // .opacity(0.2)
//               .justifyContent(FlexAlign.Center)
//
//               // .margin({ top: '10.00vp', right: '0.00vp', left: '0.00vp' })
//             }.width('96%').height('38%')
//             ForEach(this.forecasts, (forecast: forecasts,index:number) => {
//                 Column() {
//                   Row() {
//                     Column() {
//                       Row(){
//                         Text(`夜间  ${forecast.casts[0].nightweather}`)
//
//                           .fontSize(25)
//                           .fontColor(Color.White)
//                           .fontWeight(FontWeight.Normal)
//                         this.weartherImage(forecast.casts[0].dayweather)
//                       }
//                       Text(forecast.casts[0].daytemp + "° ~" + forecast.casts[0].nighttemp + "°")
//                         .fontSize(25)
//                         .fontColor(Color.White)
//                         .fontWeight(FontWeight.Normal)
//                     }
//                     .borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//
//                     Column() {
//                       Text(`夜间${forecast.casts[0].nightwind}风`).fontSize(25).fontColor(Color.White).fontWeight(FontWeight.Normal)
//                      Row(){
//                         Image($r('app.media.feng')).width(30)
//                        Text(forecast.casts[0].nightpower + "级")
//                          .fontSize(25)
//                          .fontColor(Color.White)
//                          .fontWeight(FontWeight.Normal)
//                      }
//                     }
//                     .borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     // .backgroundColor(Color.White)
//                     // .opacity(0.8)
//                     .justifyContent(FlexAlign.Center)
//                     .backgroundColor('#8cdddbdb')
//                   }.width('96%').justifyContent(FlexAlign.SpaceAround)
//                   .margin({ top: '20.00vp', right: '0.00vp', bottom: '8.00vp', left: '0.00vp' })
//                   Row() {
//                     Column() {
//                       Image($r('app.media.close')).fillColor(Color.White).height(40)
//                       Text(this.judgeTemp1(forecast.casts[0].daytemp)).fontColor(Color.White).fontSize(18).height(30)
//                       // .fontColor(Color.Black).fontWeight(800)
//                     }.onClick(() => {
//                       this.isShow = true
//                     })
//                     .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow, this.myBuilder(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp1(this.forecast.casts[0].daytemp)}`,
//                         subtitle: `今日天气${this.forecast.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//
//
//                     // Line()// 增加的分割线 1
//                     //   .height('30%')
//                     //   .width(2)
//                     //   .stroke(Color.White)
//                     //   .backgroundColor(Color.White)
//                     Column() {
//                       Image($r('app.media.fangshai')).fillColor(Color.White).height(40)
//                       Text(this.judgeTemp2(forecast.casts[0].daytemp)).fontColor(Color.White).fontSize(18).height(30)
//                     }.onClick(() => {
//                       this.isShow1 = true
//                     })
//                     .margin({ top: '', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow1, this.myBuilder1(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp2(this.forecast.casts[0]..daytemp)}`,
//                         subtitle: `今日天气${this.forecast.casts[0]..dayweather}转${this.forecast.casts[0].nightweather}     ${this.forecast.casts[0].nighttemp}° / ${this.forecast.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//
//                     // Line()// 增加的分割线 1
//                     //   .height('30%')
//                     //   .width(2)
//                     //   .stroke(Color.White)
//                     //   .backgroundColor(Color.White)
//
//                   }.width('96%').justifyContent(FlexAlign.SpaceAround)
//                   .margin({ top: '0.00vp', right: '0.00vp', bottom: '8.00vp', left: '0.00vp' })
//                   Row(){
//                     Column() {
//                       Image($r('app.media.sport')).fillColor(Color.White).height(40)
//                       Text(this.judgeTemp3(forecast.casts[0].daytemp)).fontColor(Color.White).fontSize(18).height(30)
//                     }.onClick(() => {
//                       this.isShow2 = true
//                     })
//                     .margin({ top: '1.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow2, this.myBuilder2(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp3(this.forecast.casts[0].daytemp)}`,
//                         subtitle: `今日天气${this.forecast.casts[0].dayweather}转${this.forecast.casts[0].nightweather}     ${this.forecast.casts[0].nighttemp}° / ${this.forecast.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//                     Column() {
//                       Image($r('app.media.car')).fillColor(Color.White).height(40)
//                       Text(this.judgeTemp4(forecast.casts[0].daytemp, forecast.casts[0].nighttemp)).fontColor(Color.White).fontSize(18).height(30)
//                     }.onClick(() => {
//                       this.isShow3 = true
//                     })
//                     .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow3, this.myBuilder3(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp4(this.forecast.casts[0].daytemp, this.forecast.casts[0].nighttemp)}`,
//                         subtitle: `今日天气${this.forecast.casts[0].dayweather}转${this.forecast.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//                   }.width('96%').justifyContent(FlexAlign.SpaceAround)
//                   .margin({ top: '0.00vp', right: '0.00vp', bottom: '8.00vp', left: '0.00vp' })
//                   // Line()// 增加的分割线 1
//                   //   .width('90%')
//                   //   .height(1.5)
//                   //   .stroke(Color.White)
//                   //   .backgroundColor(Color.White)
//                   Row() {
//
//                     // Line()// 增加的分割线 1
//                     //   .height('30%')
//                     //   .width(2)
//                     //   .stroke(Color.White)
//                     //   .backgroundColor(Color.White)
//                     Column() {
//                       Image($r('app.media.umbrella')).fillColor(Color.White).height(40)
//                       Text(this.judgeTemp5(forecast.casts[0].dayweather, forecast.casts[0].nightweather)).fontColor(Color.White).fontSize(18).height(30)
//                     }.onClick(() => {
//                       this.isShow4 = true
//                     })
//                     .margin({ top: '2.00vp', right: '0.00vp', bottom: '8.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow4, this.myBuilder4(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp5(this.forecast.casts[0].dayweather, this.forecast.casts[0].nightweather)}`,
//                         subtitle: `今日天气${this.forecast.casts[0].dayweather}转${this.forecast.casts[0].nightweather}     ${this.forecast.casts[0].nighttemp}° / ${this.forecast.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(90)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//
//                     // Line()// 增加的分割线 1
//                     //   .height('30%')
//                     //   .width(2)
//                     //   .stroke(Color.White)
//                     //   .backgroundColor(Color.White)
//                     Column() {
//                       Image($r('app.media.yao')).height(40).fillColor(Color.White)
//                       Text(this.judgeTemp6(forecast.casts[0].dayweather, forecast.casts[0].nightweather)).fontColor(Color.White).fontSize(18).height(30)
//                     }.onClick(() => {
//                       this.isShow5 = true
//                     })
//                     .margin({ top: '-4.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                     .bindSheet($$this.isShow5, this.myBuilder5(), {
//                       detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
//                       backgroundColor: Color.Gray,
//                       blurStyle: BlurStyle.Thick,
//                       showClose: true,
//                       title: {
//                         title: `${this.judgeTemp6(this.forecast.casts[0].dayweather, this.forecast.casts[0].nightweather)}`,
//                         subtitle: `今日天气${this.forecast.casts[0].dayweather}转${this.forecast.casts[0].nightweather}     ${this.forecast.casts[0].nighttemp}° / ${this.forecast.casts[0].daytemp}°`
//                       },
//                       preferType: SheetType.CENTER,
//                       shouldDismiss: ((sheetDismiss: SheetDismiss) => {
//                         console.log("bind sheet shouldDismiss")
//                         sheetDismiss.dismiss()
//                       })
//                     }).borderRadius(15)
//                     .height(91.5)
//                     .width(170)
//                     .backgroundColor('#8cdddbdb')
//                     .justifyContent(FlexAlign.Center)
//                   }.width('96%').justifyContent(FlexAlign.SpaceAround)
//                   .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                   Column() {
//                     Text('气象数据由高德提供')
//                       .fontColor(Color.White)
//                       .fontSize(15)
//                       .margin({ top: '5.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                   }
//                   .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
//                 .height('72%')
//                 // .backgroundColor('#ffefefef')
//                 // .opacity(0.5)
//                 .borderRadius(15)
//                 .margin({
//                   top: '20.00vp',
//                   right: '0.00vp',
//                   bottom: '0.00vp',
//                   left: '0.00vp'
//                 })
//                 .width('100%').justifyContent(FlexAlign.Start)
//               }
//             })
//           }.width('100%').justifyContent(FlexAlign.SpaceAround)
//         }
//       }
//     }
//         .pullToRefresh(true)
//         .refreshOffset(96)
//         .onStateChange((refreshStatus: RefreshStatus) => {
//           console.info('Refresh onStatueChange state is ' + refreshStatus)
//         })
//         .onOffsetChange((value: number) => {
//           console.info('Refresh onOffsetChange offset:' + value)
//         })
//         .onRefreshing(() => {
//           setTimeout(() => {
//             this.isRefreshing = false
//           }, 1000)
//           console.log('onRefreshing test')
//         })
//       }
// }
import { casts } from '../pages/casts';

@Component
export struct cityView {
  @Builder weartherImage(weather: string) {
    if (weather === '晴') {
      Image($r('app.media.qingtian')).width(28)
    }
    if (weather === '阴') {
      Image($r('app.media.yintian')).width(28)
    }
    if (weather === '多云') {
      Image($r('app.media.duoyun')).width(28)
    }
    if (weather.includes('雨')) {
      Image($r('app.media.yutian')).width(28)
    }
  }

  @State close: string = ''
  @State change:boolean=true
  // @State isShow5: boolean = false
  // @State close: string = ''
  @State isRefreshing: boolean = false
  @State promptText: string = "正在刷新"
  @State bgpictures: string[] = [];
  //半屏显示1
  @State isShow: boolean = false
  setBgPicture1(weather: string, index: number) { // 添加索引参数
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
  @Builder myBuilder() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  @State isShow1:boolean = false
  @Builder myBuilder1() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp2(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  @State isShow2:boolean = false
  @Builder myBuilder2() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  @State isShow3:boolean = false
  @Builder myBuilder3() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  @State isShow4:boolean = false
  @Builder myBuilder4() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  @State isShow5:boolean = false
  @Builder myBuilder5() {
    Column() {
      List({space:20}) {
        ForEach(this.casts, (cast: casts, index: number) => {
          ListItem(){
            Row(){
              Text(`${this.casts[index].date}`).fontSize(18)
              Column(){
                Row(){
                  Text(`${this.casts[index].nightweather} 转 ${this.casts[index].dayweather}`)
                }
                Row(){
                  this.weartherImage(this.casts[index].nightweather)
                  Text('转')
                  this.weartherImage(this.casts[index].dayweather)
                }
              }
              Column(){
                Text(this.judgeTemp1(cast.daytemp)).fontSize(20)
                Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              }
              //   Row() {
              //     Column() {
              //       Text(`${this.casts[index].nightweather}`)
              //       this.weartherImage(this.casts[index].nightweather)
              //     }
              //   Column(){Text('转')
              //              .margin({ top: '0.00vp', right: '0.00vp', bottom: '10.00vp', left: '0.00vp' })
              //            Text('转')}
              //   Column(){
              //     Text(`${this.casts[index].dayweather}`)
              //     this.weartherImage(this.casts[index].dayweather)
              //   }
              // }
              // Column(){
              //   Text(this.judgeTemp1(cast.daytemp)).fontSize(15)
              //   Text(`${this.casts[index].nighttemp}° / ${this.casts[index].daytemp}°`)
              // }
            }.width('100%').justifyContent(FlexAlign.SpaceAround)
          }
        })
      }
      .margin({ top: '30.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })
    }
    .width('100%')
  }
  // 修改判断温度的方法，增加更细致的温度区间和对应的穿着建议
  judgeTemp1 (daytemp: number) {
    if (daytemp < -20) {
      return '适宜加厚羽绒服'
    } if (-20 <= daytemp && daytemp < -15) {
      return '适宜厚羽绒服'
    } if (-15 <= daytemp && daytemp < -10) {
      return '适宜羽绒服'
    }if (-10 <= daytemp && daytemp < -5) {
      return '适宜棉服'
    }  if (-5 <= daytemp && daytemp < 0) {
      return '适宜厚大衣'
    }if (0 <= daytemp && daytemp < 5) {
      return '适宜毛呢大衣'
    }if (5 <= daytemp && daytemp < 10) {
      return '适宜大衣'
    }  if (10 <= daytemp && daytemp < 15) {
      return '适宜风衣'
    } if (15 <= daytemp && daytemp < 20) {
      return '适宜薄外套'
    }if (20 <= daytemp && daytemp < 25) {
      return '适宜长袖衬衫'
    }  if (daytemp > 25) {
      return '适宜短袖'
    }
    return '注意增减衣物！'
  }
  judgeTemp2(daytemp: number) {
    if ( daytemp < 10) {
      return '无需防晒'
    }  if (10 <= daytemp && daytemp < 25) {
      return '需防晒'
    }  if (daytemp >= 25) {
      return '需防晒'
    }
    return '极端天气'
  }
  judgeTemp3(daytemp: number) {
    if ( daytemp < 4) {
      return '宜室内运动'
    }  if (5<= daytemp && daytemp < 30) {
      return '宜室外运动'
    }  if (daytemp > 30) {
      return '易中暑'
    }
    return '极端天气'
  }
  judgeTemp4(daytemp: number,nighttemp:number) {
    if ( (daytemp-nighttemp) <= 14) {
      return '少发感冒'
    }   if ( (daytemp-nighttemp) >14) {
      return '易感冒'
    }
    return '注意天气变化'
  }
  judgeTemp5(dayweather: string,nightweather:string) {
    if (nightweather.includes('雨') ) {
      return '不宜洗车'
    }  if (dayweather.includes('雨') ) {
      return '不宜洗车'
    }
    return '宜洗车'
  }
  judgeTemp6(dayweather: string,nightweather:string) {
    if (nightweather.includes('雨') ) {
      return '有雨带伞'
    }  if (dayweather.includes('雨') ) {
      return '有雨带伞'
    }
    return '无需带伞'
  }

  casts: Array<casts> = []

  build() {
    Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText}) {
    Scroll() {
      Column(){
      Column() {
        ForEach(this.casts, (cast: casts) => {
          if (this.casts[0] === cast) {


            Column() {
              Text(`${cast.daytemp}°`).fontSize(100).height(110).fontColor(Color.White)
              Row() {
                Text(' ')
                Text(cast.date).fontSize(20).fontColor(Color.White)
              }.height(30)

              Row() {
                Text(cast.dayweather).fontSize(20).fontColor(Color.White)
                if (cast.dayweather === '晴') {
                  Image($r('app.media.qingtian')).width(30)
                }
                if (cast.dayweather === '阴') {
                  Image($r('app.media.yintian')).width(30)
                }
                if (cast.dayweather === '多云') {
                  Image($r('app.media.duoyun')).width(30)
                }
                if (cast.dayweather.includes('雨')) {
                  Image($r('app.media.yutian')).width(30)
                }
                Text(' ' + cast.nighttemp + "° ~" + cast.daytemp + "°")
                  .fontSize(20).fontColor(Color.White)
              }.height(30)
              .margin({
                top: '0.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })

              Row() {
                Text('  ')
                Text(cast.daywind + "风").fontSize(20).fontColor(Color.White)
                Text(cast.daypower + "级").fontSize(20).fontColor(Color.White)
              }.height(30)
              .margin({
                top: '0.00vp',
                right: '0.00vp',
                bottom: '10.00vp',
                left: '0.00vp'
              })

            }
            .margin({
              top: '10.00vp',
              right: '0.00px',
              bottom: '0.00px',
              left: '200.00px'
            })
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            Column() {
              List() {
                ForEach(this.casts, (cast: casts) => {
                  ListItem() {
                    Column() {
                      Row() {
                        if (cast.week === '1') {
                          Text('周一').fontSize(18).height(30)
                        }
                        if (cast.week === '2') {
                          Text('周二').fontSize(18).height(30)
                        }
                        if (cast.week === '3') {
                          Text('周三').fontSize(18).height(30)
                        }
                        if (cast.week === '4') {
                          Text('周四').fontSize(18).height(30)
                        }
                        if (cast.week === '5') {
                          Text('周五').fontSize(18).height(30)
                        }
                        if (cast.week === '6') {
                          Text('周六').fontSize(18).height(30)
                        }
                        if (cast.week === '7') {
                          Text('周日').fontSize(18).height(30)
                        }
                        Blank(3)
                        Text(cast.dayweather).fontSize(18).height(30)
                        Blank(3)
                        if (cast.dayweather === '晴') {
                          Image($r('app.media.qingtian')).width(30)
                        }
                        if (cast.dayweather === '阴') {
                          Image($r('app.media.yintian')).width(30)
                        }
                        if (cast.dayweather === '多云') {
                          Image($r('app.media.duoyun')).width(30)
                        }
                        if (cast.dayweather.includes('雨')) {
                          Image($r('app.media.yutian')).width(30)
                        }
                        Blank(4)
                        Text(`${cast.nighttemp}° ~ ${cast.daytemp}°`).fontSize(18).height(30)
                      }.width('92%').height(38).justifyContent(FlexAlign.SpaceEvenly)

                      // Line() // 增加的分割线 1
                      // .width('90%')
                      // .height(1.5)
                      // .stroke(Color.Black)
                      // .backgroundColor('#80b3b3b3')}
                    }.alignItems(HorizontalAlign.Center).width('90%')
                  }
                  .margin({
                    top: '10.00vp',
                    right: '0.00vp',
                    bottom: '0.00vp',
                    left: '10.00vp'
                  })
                  .padding({
                    top: '0.00vp',
                    right: '0.00vp',
                    bottom: '0.00vp',
                    left: '5.00vp'
                  })
                })
              }
              .opacity(0.8)
              .width('92%')
              .height('23%')
              .backgroundColor("#bfecebeb")
              .borderRadius(20)
              .margin({
                top: '20.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })
            }.alignItems(HorizontalAlign.Center)

            Column() {
              Row() {
                if (this.change === true) {
                  Text('近期白天温度变化')
                    .fontSize(18).height(20)
                    .margin({
                      top: '10.00vp',
                      right: '0.00vp',
                      bottom: '0.00vp',
                      left: '0.00vp'
                    })
                }
                else{
                  Text('近期夜晚温度变化')
                    .fontSize(18).height(20)
                    .margin({
                      top: '10.00vp',
                      right: '0.00vp',
                      bottom: '0.00vp',
                      left: '0.00vp'
                    })
                }
                Text('切换').fontSize(12).height(20)
                  .onClick(() => {
                    this.change = !this.change
                  })
              }.width('90%').justifyContent(FlexAlign.SpaceBetween)

              if (this.change === true) {
                Row() {
                  ForEach(this.casts, (cast: casts) => {
                    Column() {
                      Line()
                        .width(20)
                        .height(65)
                        .startPoint([10, 5])
                        .endPoint([10, 55])
                        .stroke(Color.Black)
                        .strokeWidth(2)
                        .strokeDashArray([7, 4])

                      Text(`${cast.daytemp}°`)
                        .fontSize(16)
                      this.weartherImage(cast.dayweather)
                      Text(cast.date.substring(5))
                        .fontSize(15)
                        .fontWeight(FontWeight.Medium)


                    }.width('20%').alignItems(HorizontalAlign.End).height(190).justifyContent(FlexAlign.SpaceEvenly)
                  })
                }
                .borderRadius(15)
                .width('90%')
                .height('76%')
                .justifyContent(FlexAlign.SpaceAround)
                .alignItems(VerticalAlign.Center)
                .margin({ top: '10.00vp', right: '30.00vp', bottom: '0.00vp', left: '0.00vp' })
              }
              else{
                Row() {
                  ForEach(this.casts, (cast: casts) => {
                    Column() {
                      Line()
                        .width(20)
                        .height(65)
                        .startPoint([10, 5])
                        .endPoint([10, 55])
                        .stroke(Color.Black)
                        .strokeWidth(2)
                        .strokeDashArray([7, 4])

                      Text(`${cast.nighttemp}°`)
                        .fontSize(16)
                      this.weartherImage(cast.nightweather)
                      Text(cast.date.substring(5))
                        .fontSize(15)
                        .fontWeight(FontWeight.Medium)


                    }.width('20%').alignItems(HorizontalAlign.End).height(190).justifyContent(FlexAlign.SpaceEvenly)
                  })
                }
                .borderRadius(15)
                .width('90%')
                .height('76%')
                .justifyContent(FlexAlign.SpaceAround)
                .alignItems(VerticalAlign.Center)
                .margin({ top: '10.00vp', right: '30.00vp', bottom: '0.00vp', left: '0.00vp' })

              }
            }
            .width('92%')
            .height('35%')
            .opacity(0.8)
            .backgroundColor("#bfecebeb")
            .borderRadius(20)
            .margin({ top: '10.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp' })

            Column() {
              Row() {
                Column() {
                  Row() {
                    Text(`夜间 ${cast.nightweather}`).fontSize(18).fontWeight(0.5).fontWeight(FontWeight.Normal)
                    this.weartherImage(cast.dayweather)
                  }.height(40)

                  Text(cast.daytemp + "° ~ " + cast.nighttemp + "°")
                    .fontSize(20)
                    .fontWeight(FontWeight.Normal)
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)

                Column() {
                  Text(`夜间${cast.nightwind}风`).fontSize(18).fontWeight(FontWeight.Normal).height(40)
                  Row() {
                    Image($r('app.media.feng')).width(30).fillColor(Color.Black)
                    Text(cast.nightpower + "级").fontSize(20)
                      .fontWeight(FontWeight.Normal)
                  }
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)
              }.width('96%').justifyContent(FlexAlign.SpaceAround)
              .margin({
                top: '10.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })

              Row() {
                Column() {
                  Row() {
                    Column() {
                      Text(`紫外线`).fontSize(15).fontWeight(0.5).fontWeight(FontWeight.Normal).height(20)
                      Blank(5)
                      Column() {
                        if (cast.dayweather === '晴') {
                          Text('强').fontSize(20)
                        }
                        if (cast.dayweather === '阴') {
                          Text('中').fontSize(20)
                        }
                        if (cast.dayweather === '多云') {
                          Text('弱').fontSize(20)
                        }
                        if (cast.dayweather.includes('雨')) {
                          Text('弱').fontSize(20)
                        }
                      }
                    }.height(40)

                    Blank(5)
                    Image($r('app.media.ziwaixian')).width(60)
                  }
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)

                Column() {
                  Row() {
                    Column() {
                      Text(`湿度`).fontSize(15).fontWeight(0.5).fontWeight(FontWeight.Normal).height(20)
                      Blank(5)
                      Column() {
                        if (cast.dayweather === '晴') {
                          Text('44%').fontSize(20)
                        }
                        if (cast.dayweather === '阴') {
                          Text('50%').fontSize(20)
                        }
                        if (cast.dayweather === '多云') {
                          Text('55%').fontSize(20)
                        }
                        if (cast.dayweather.includes('雨')) {
                          Text('63%').fontSize(20)
                        }
                      }
                    }.height(40)

                    Blank(5)
                    Image($r('app.media.shidu')).width(60)
                  }
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)
              }.width('96%').justifyContent(FlexAlign.SpaceAround)
              .margin({
                top: '10.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })

              Row() {
                Column() {
                  Row() {
                    Column() {
                      Text(`体感`).fontSize(15).fontWeight(0.5).fontWeight(FontWeight.Normal).height(20)
                      Blank(5)
                      Column() {
                        Text(`${cast.daytemp_float - 3}°`).fontSize(20)
                      }
                    }.height(40)

                    Blank(5)
                    Image($r('app.media.tigan')).width(60)
                  }
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)

                Column() {
                  Row() {
                    Column() {
                      Text(`气压`).fontSize(15).fontWeight(0.5).fontWeight(FontWeight.Normal).height(20)
                      Blank(5)
                      Column() {
                        if (cast.dayweather === '晴') {
                          Text('967').fontSize(20)
                        }
                        if (cast.dayweather === '阴') {
                          Text('966').fontSize(20)
                        }
                        if (cast.dayweather === '多云') {
                          Text('959').fontSize(20)
                        }
                        if (cast.dayweather.includes('雨')) {
                          Text('987').fontSize(20)
                        }
                      }
                    }.height(40)

                    Blank(5)
                    Image($r('app.media.qiya')).width(60)
                  }
                }
                .borderRadius(15)
                .height(100)
                .width(160)
                .backgroundColor("#99ecebeb")
                .justifyContent(FlexAlign.Center)
              }.width('96%').justifyContent(FlexAlign.SpaceAround)
              .margin({
                top: '10.00vp',
                right: '0.00vp',
                bottom: '0.00vp',
                left: '0.00vp'
              })
            }

            Column() {
              Row() {
                Column() {
                  Image($r('app.media.close')).width('18%')
                  Blank(10)
                  Text(this.judgeTemp1(cast.daytemp))
                }.onClick(() => {
                  this.isShow = true
                })
                .margin(10)
                .bindSheet($$this.isShow, this.myBuilder(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp1(this.casts[0].daytemp)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })

                Line()// 增加的分割线 1
                  .height('30%')
                  .width(2)
                  .stroke(Color.Black)
                  .backgroundColor('#ffb3b3b3')
                Column() {
                  Image($r('app.media.fangshai')).width('16%')
                  Blank(12)
                  Text(this.judgeTemp2(cast.daytemp))
                }.onClick(() => {
                  this.isShow1 = true
                })
                .margin(10)
                .bindSheet($$this.isShow1, this.myBuilder1(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp2(this.casts[0].daytemp)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })

                Line()// 增加的分割线 1
                  .height('30%')
                  .width(2)
                  .stroke(Color.Black)
                  .backgroundColor('#ffb3b3b3')
                Column() {
                  Image($r('app.media.sport')).width('16%')
                  Blank(5)
                  Text(this.judgeTemp3(cast.daytemp))
                }.onClick(() => {
                  this.isShow2 = true
                })
                .margin(10)
                .bindSheet($$this.isShow2, this.myBuilder2(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp3(this.casts[0].daytemp)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })
              }.width('90%').justifyContent(FlexAlign.SpaceAround)

              Line()// 增加的分割线 1
                .width('90%')
                .height(1.5)
                .stroke(Color.Black)
                .backgroundColor('#ffb3b3b3')
              Row() {
                Column() {
                  Image($r('app.media.car')).width('18%')
                  Blank(10)
                  Text(this.judgeTemp4(cast.daytemp, cast.nighttemp))
                }.onClick(() => {
                  this.isShow3 = true
                })
                .margin(10)
                .bindSheet($$this.isShow3, this.myBuilder3(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp4(this.casts[0].daytemp, this.casts[0].nighttemp)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })

                Line()// 增加的分割线 1
                  .height('30%')
                  .width(2)
                  .stroke(Color.Black)
                  .backgroundColor('#ffb3b3b3')
                Column() {
                  Image($r('app.media.umbrella')).width('15%')
                  Blank(10)
                  Text(this.judgeTemp5(cast.dayweather, cast.nightweather))
                }.onClick(() => {
                  this.isShow4 = true
                })
                .margin(10)
                .bindSheet($$this.isShow4, this.myBuilder4(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp5(this.casts[0].dayweather, this.casts[0].nightweather)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })

                Line()// 增加的分割线 1
                  .height('30%')
                  .width(2)
                  .stroke(Color.Black)
                  .backgroundColor('#ffb3b3b3')
                Column() {
                  Image($r('app.media.yao')).width('18%')

                  Text(this.judgeTemp6(cast.dayweather, cast.nightweather))
                }.onClick(() => {
                  this.isShow5 = true
                })
                .margin(10)
                .bindSheet($$this.isShow5, this.myBuilder5(), {
                  detents: [SheetSize.MEDIUM, SheetSize.LARGE, 500],
                  backgroundColor: Color.Gray,
                  blurStyle: BlurStyle.Thick,
                  showClose: true,
                  title: {
                    title: `${this.judgeTemp6(this.casts[0].dayweather, this.casts[0].nightweather)}`,
                    subtitle: `今日天气${this.casts[0].dayweather}转${this.casts[0].nightweather}     ${this.casts[0].nighttemp}° / ${this.casts[0].daytemp}°`
                  },
                  preferType: SheetType.CENTER,
                  shouldDismiss: ((sheetDismiss: SheetDismiss) => {
                    console.log("bind sheet shouldDismiss")
                    sheetDismiss.dismiss()
                  })
                })
              }.width('90%').justifyContent(FlexAlign.SpaceAround)
            }
            .opacity(0.8)
            .justifyContent(FlexAlign.SpaceEvenly)
            .width('92%')
            .height(220)
            .backgroundColor("#bfecebeb")
            .borderRadius(15)
            .margin({
              top: '10.00vp',
              right: '0.00vp',
              bottom: '0.00vp',
              left: '0.00vp'
            })
          }
        })
      }.width('100%').justifyContent(FlexAlign.SpaceAround)
      Text('天气数据由高德提供').fontColor(Color.Gray).fontSize(12).height(35)
    }
    }
  }
    .pullToRefresh(true)
    .refreshOffset(96)
    .onStateChange((refreshStatus: RefreshStatus) => {
      console.info('Refresh onStatueChange state is ' + refreshStatus)
    })
    .onOffsetChange((value: number) => {
      console.info('Refresh onOffsetChange offset:' + value)
    })
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 1000)
      console.log('onRefreshing test')
    })
  }
}