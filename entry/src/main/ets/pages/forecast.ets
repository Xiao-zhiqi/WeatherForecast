import {casts}from "../pages/casts"

export class forecasts {
  city: string;
  adcode: number;
  casts: Array<casts>;

  constructor() {
    this.city = '';  // 为 city 赋值
    this.adcode = 0;
    this.casts = [];
  }
}