var exec = require('cordova/exec');

exports.baiMapNavigatorMethod = function(arg0, success, error) {
    exec(success, error, "MapNavigator", "baiMapNavigatorMethod", [arg0]);
};
