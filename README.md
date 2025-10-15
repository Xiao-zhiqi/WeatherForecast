# WeatherForecast
天气预报程序（鸿蒙）

本文将聚焦 HarmonyOS 天气应用主页面的核心模块，从功能设计与实现逻辑出发，逐一拆解各模块的作用与交互流程，帮助开发者清晰理解天气应用的核心架构与业务逻辑。

天气预报程序（鸿蒙）界面演示：
<img width="521" height="928" alt="image" src="https://github.com/user-attachments/assets/a7c9ad5e-1768-45ae-915f-e5c406970a70" />
<img width="406" height="912" alt="image" src="https://github.com/user-attachments/assets/f3802943-9083-44d1-a1ab-180075b2f0b9" />
<img width="490" height="1018" alt="image" src="https://github.com/user-attachments/assets/a8d34f51-4a17-4e64-b24d-81c87e5a64d6" />
<img width="455" height="914" alt="image" src="https://github.com/user-attachments/assets/88d19c3b-863a-4623-93b9-a8768211c686" />

一、页面核心状态管理模块
状态管理是页面交互的基础，该模块通过 @State 装饰器定义关键变量，实现城市数据、天气信息、页面交互状态的动态管理，确保数据与视图同步更新。

状态变量	类型	核心功能
Index	number	记录从其他页面（如添加城市页）返回时，需要默认展示的城市索引，用于 Swiper 初始化定位。

cityCodeList	number[]	存储各城市的编码（如 120000 代表天津），是调用天气接口获取数据的核心参数。

cityNameList	string[]	存储各城市的名称（如 “天津”“北京”），用于 UI 界面展示当前城市，提升用户认知。

cityWeatherList	Array<WeatherModel>	存储各城市的完整天气数据（含实时天气、未来预报等），是天气信息展示的数据源。

cityIndex	number	记录当前选中的城市索引，关联背景图切换、城市删除等操作，确保 “操作对象” 与 “展示对象” 一致。

bgpictures	string[]	存储各城市对应的背景图资源路径（如 app.media.bgqingtian），根据天气类型动态匹配。

Scontroller	SwiperController	Swiper 组件的控制器，用于主动控制城市轮播切换（如从添加城市页返回后定位到指定城市）。

二、天气数据与背景图匹配模块
该模块是页面的 “数据核心”，负责从接口获取天气数据、解析数据，并根据天气类型匹配对应的背景图，实现 “数据驱动视图” 的核心逻辑。

1. 天气数据初始化（initDate 方法）
   功能定位：统一获取、解析、存储天气数据，是页面加载天气信息的入口。
   核心流程：
   调用工具类 getweatherUtil.getWeathers，传入 cityCodeList 批量获取多个城市的天气数据；
   清空现有数据（避免重复），遍历接口返回的天气数据，将每个城市的天气信息存入 cityWeatherList；
   从天气数据中提取城市名称（如 result[i].forecasts[0].city），存入 cityNameList，用于 UI 展示；
   调用 setBgPicture 方法，根据当前城市的天气类型匹配背景图，存入 bgpictures；
   调用 saveToPreferences 方法，将城市编码和名称保存到首选项，实现数据持久化。
2. 背景图动态匹配（setBgPicture 方法）
   功能定位：根据天气类型（晴、阴、雨等）匹配对应的背景图，提升页面视觉体验与天气场景感。
   核心逻辑：
   接收两个参数：weather（当前城市的天气类型，如 “晴”“小雨”）和 index（当前城市在列表中的索引）；
   通过条件判断匹配背景图：
   天气为 “晴” 时，设置背景图为 app.media.bgqingtian（晴天背景）；
   天气为 “阴” 时，设置背景图为 app.media.bgyintian（阴天背景）；
   天气含 “雨” 字（如 “小雨”“中雨”）时，设置背景图为 app.media.bgrain（雨天背景）；
   将匹配到的背景图路径存入 bgpictures[index]，确保与当前城市索引对应。
   三、页面跳转与参数传递模块
   该模块负责页面间的交互，实现 “添加城市” 功能的跳转与数据回传，确保多页面间数据同步。

3. 跳转到添加城市页
   触发场景：点击页面右上角的 “添加” 图标（app.media.add）。
   核心逻辑：通过 router.pushUrl 跳转到 pages/AddCity 页面，并携带当前的 cityCodeList 和 cityNameList 作为参数；
   目的：让添加城市页知道 “已存在哪些城市”，避免重复添加，同时便于返回时更新主页面的城市列表。
4. 接收添加城市页回传参数（onPageShow 方法）
   功能定位：当从添加城市页返回主页面时，接收新的城市列表参数，更新主页面数据。
   核心流程：
   通过 router.getParams() 获取添加城市页回传的参数（含新的 codes 城市编码列表、names 城市名称列表、index 默认展示索引）；
   将回传的 codes 和 names 分别赋值给 cityCodeList 和 cityNameList，更新主页面的城市数据；
   调用 initDate 方法重新加载天气数据（确保新添加的城市有天气信息）；
   通过 Scontroller.changeIndex 控制 Swiper 切换到回传的 index 对应的城市，实现 “添加后直接展示新城市” 的体验。
   四、城市管理模块（添加 / 删除）
   该模块负责城市的 “增删” 操作，是用户个性化管理城市的核心功能，包含添加（依赖跳转模块）和删除两个子功能。

5. 城市删除功能（onImageClick1 方法）
   触发场景：点击页面右上角的 “更多” 图标（app.media.more），在弹出的弹窗中选择 “删除城市信息”。
   核心流程：
   弹出一级弹窗，提供 “删除城市信息” 和 “反馈天气” 两个选项；
   若用户选择 “删除城市信息”，先判断城市列表长度（需保留至少 1 个城市），若满足条件则弹出二级确认弹窗（避免误操作）；
   用户点击 “确定” 后，根据当前 cityIndex 对应的城市，从 cityNameList、cityCodeList、cityWeatherList 中删除该城市的数据；
   调用 saveToPreferences 方法更新首选项数据，确保删除操作持久化；
   若城市列表仅剩 1 个，删除时弹出提示 “至少保留一所城市”，阻止删除操作。
   五、首选项数据持久化模块
   该模块通过 HarmonyOS 提供的 Preference 组件，实现城市数据的本地存储，确保应用重启后仍能保留用户之前添加的城市，提升用户体验。

6. 加载本地数据（loadFromPreferences 方法）
   功能定位：应用启动时，从本地首选项读取之前保存的城市数据，避免用户每次启动都重新添加城市。
   核心逻辑：
   从首选项中读取存储的 cityCodes（城市编码字符串）和 cityNames（城市名称字符串）；
   通过 JSON.parse 将字符串转为数组，分别赋值给 cityCodeList 和 cityNameList；
   若读取到有效数据，调用 initDate 加载对应城市的天气数据；若读取失败（如首次启动），使用默认城市（如 120000 天津）初始化。
7. 保存本地数据（saveToPreferences 方法）
   功能定位：当城市数据发生变化（如添加、删除城市）时，将最新的城市编码和名称保存到本地首选项。
   核心逻辑：
   通过 JSON.stringify 将 cityCodeList 和 cityNameList 转为字符串（首选项仅支持基本数据类型存储）；
   调用 preferenceUtil.Put 方法，将字符串存入首选项（存储键分别为 cityCodes 和 cityNames，所属存储组为 cityPrefs）。
   六、UI 展示与交互模块
   该模块是页面的 “视觉与交互入口”，通过 build 方法构建 UI 布局，包含背景图、顶部导航栏、Swiper 城市轮播三个核心部分。
https://i-blog.csdnimg.cn/direct/65242ef0731640268fe105f0ca7026a4.png

  https://i-blog.csdnimg.cn/direct/55f9004cb17843868fed272471c142d0.png

  https://i-blog.csdnimg.cn/direct/487dbef575be4bd78fce417726796e80.png
1. 背景图展示
   实现方式：使用 Stack 组件作为根容器，背景图 Image 作为底层元素，通过 $r(this.bgpictures[this.cityIndex]) 动态加载当前城市对应的背景图；
   特点：背景图宽度和高度均设为 100%，覆盖整个页面，且随 cityIndex 变化（城市切换时）自动更新，确保背景图与当前展示的城市天气匹配。
2. 顶部导航栏
   布局结构：采用 Row 组件实现左右布局，左侧展示当前城市名称，右侧展示 “添加” 和 “更多” 两个功能图标；
   核心交互：
   左侧城市名称：展示 cityNameList[this.cityIndex] 对应的城市名称，让用户明确当前查看的城市；
   右侧 “添加” 图标：点击触发跳转到添加城市页；
   右侧 “更多” 图标：点击触发 onImageClick1 方法，打开城市删除和天气反馈弹窗。
3. Swiper 城市轮播
   功能定位：通过横向滑动实现多城市天气的快速切换，是用户浏览不同城市天气的核心交互方式；
   核心逻辑：
   使用 Swiper 组件包裹 ForEach 循环，遍历 cityWeatherList 中的每个城市天气数据；
   每个 Swiper 项通过 cityView 自定义组件展示该城市的天气信息（如温度、风力、未来预报等），cityView 接收 casts 参数（天气预报数据）；
   通过 onChange 事件监听 Swiper 切换，当用户滑动切换城市时，更新 cityIndex 为当前滑动到的索引，并调用 setBgPicture 方法更新背景图，确保 “滑动切换城市时，背景图同步变化”。


七、总结
该天气应用主页面通过六大核心模块的协同，实现了 “数据获取 - 状态管理 - UI 展示 - 用户交互 - 数据持久化” 的完整业务闭环：

- 状态管理模块为页面提供数据基础；
- 数据与背景图模块实现 “数据驱动视觉”；
- 跳转与城市管理模块满足用户个性化需求；
- 首选项模块确保数据持久化；
- UI 交互模块提供直观的视觉与操作体验。

————————————————

                            版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。

原文链接：https://blog.csdn.net/2301_79847249/article/details/152006827
