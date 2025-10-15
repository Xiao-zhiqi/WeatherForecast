import {forecasts}from  "./forecast"

export class WeatherModel {
  status: number;
  count: number;
  infocode: number;
  forecasts: Array<forecasts> = [];

  constructor() {
    this.status = 0;  // 为 status 赋值
    this.count = 0;
    this.infocode = 0;
  }
}