export class IpLocation {
  status: number;
  info: string;
  infocode: number;
  province: string;
  city: string;
  adcode: number;
  rectangle: string;

  constructor() {
    this.status = 0;
    this.info = '';
    this.infocode = 0;
    this.province = '';
    this.city = '';
    this.adcode = 0;
    this.rectangle = '';
  }
}