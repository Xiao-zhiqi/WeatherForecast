struct AddPath {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  private path2Da: Path2D = new Path2D("M250 150 L150 350 L350 350 Z")
  private path2Db: Path2D = new Path2D()
export default class MainAbility extends Ability {
  onCreate(want, launchParam) {
    // 获取页面的组件容器
    const container = this.context.findComponentById('container');
    const canvas = container.findComponentById('myCanvas');
    const ctx = canvas.getContext('2d');

    // 四个数据值
    const values = [10, 20, 30, 40];

    // 设置画布大小
    canvas.width = 500;
    canvas.height = 300;

    // 绘制坐标轴
    ctx.beginPath();
    ctx.moveTo(50, 250);
    ctx.lineTo(450, 250);
    ctx.strokeStyle = 'gray';
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(50, 250);
    ctx.lineTo(50, 50);
    ctx.strokeStyle = 'gray';
    ctx.stroke();

    // 绘制折线
    ctx.beginPath();
    ctx.moveTo(100, 250 - values[0]);
    ctx.lineTo(200, 250 - values[1]);
    ctx.lineTo(300, 250 - values[2]);
    ctx.lineTo(400, 250 - values[3]);
    ctx.strokeStyle = 'blue';
    ctx.lineWidth = 2;
    ctx.stroke();
  }
}