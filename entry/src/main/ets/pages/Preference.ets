import preferences from '@ohos.data.preferences';

class PreferenceUtil {
  PreMap: Map<String, preferences.Preferences> = new Map();

  // 加载用户首选项
  loadPreference(context:Context, name: string): void {
    preferences.getPreferences(context, name)
      .then((pref: preferences.Preferences) => {
        this.PreMap.set(name, pref);
      })
      .catch((err:string) => {
        console.log('testTag', `加载 Preferences[${name}]失败`, JSON.stringify(err));
      });
  }

  // 增加用户首选项
  async Put(name: string, key: string, value: preferences.ValueType): Promise<void> {
    if (!this.PreMap.has(name)) {
      console.log('testLog', `pregerence${name}尚未初始化`);
      return;
    }
    let pref = this.PreMap.get(name)!;
    await pref.put(key, value);
    await pref.flush();
    console.log('testLog', `pregerence${name}保存成功`);
  }

  // 得到用户首选项
  async get(name: string, key: string, defaultValue: preferences.ValueType): Promise<preferences.ValueType> {
    if (!this.PreMap.has(name)) {
      console.log('testLog', `pregerence${name}尚未初始化`);
      return defaultValue;
    }
    let pref = this.PreMap.get(name)!;
    let value = pref.get(key, defaultValue);
    return value;
  }

  // // 存储 cityCodelist 和 cityNamelist
  // async saveCityPreferences(name: string, cityCodelist: number[], cityNamelist: string[]): Promise<void> {
  //   await this.Put(name, 'cityCodelist', JSON.stringify(cityCodelist));
  //   await this.Put(name, 'cityNamelist', JSON.stringify(cityNamelist));
  // }
  // // 获取 cityCodelist 和 cityNamelist
  // async getCityPreferences(name: string): Promise<[number[], string[]]> {
  //   const cityCodelistStr = await this.get(name, 'cityCodelist', '[]');
  //   const cityNamelistStr = await this.get(name, 'cityNamelist', '[]');
  //   return [JSON.parse(cityCodelistStr) as number[], JSON.parse(cityNamelistStr) as string[]];
  // }
}

const preferenceUtil = new PreferenceUtil();
export default preferenceUtil as PreferenceUtil;