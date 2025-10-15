
export class casts {
  date: string;
  week:string;
  dayweather: string;
  nightweather: string;
  daytemp: number;
  nighttemp: number;
  daywind: string;
  nightwind: string;
  daypower: string;
  nightpower: string;
  daytemp_float: number;
  nighttemp_float: number;

  constructor() {
    this.date = '';
    this.week=''
    this.dayweather = ''; // 为 dayweather 赋值
    this.nightweather = '';
    this.daytemp = 0;
    this.nighttemp = 0;
    this.daywind = '';
    this.nightwind = '';
    this.daypower = '';
    this.nightpower = '';
    this.daytemp_float = 0;
    this.nighttemp_float = 0;
  }
}