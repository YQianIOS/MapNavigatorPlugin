# MapNavigatorPlugin
ionic2 地图导航跳转第三方应用(优先跳转百度地图,若没安装会自动跳转高德地图, 若都没有安装则提示需要安装)


## Usage

	cordova plugin add cordova-plugin-mapnavigator


```javascript

cordova.plugins.MapNavigator.baiMapNavigatorMethod(address, result => {
                if (result === false) {
                    //提示请安装百度或者高德app;
                    that.alert.showAlert("未检测到导航软件，请安装百度地图或高度地图App");
                }
            }, error => {
                console.log(error);
            })
```
