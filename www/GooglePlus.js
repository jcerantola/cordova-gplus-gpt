var exec = require('cordova/exec');

exports.login = function (options, success, error) {
    exec(success, error, 'GooglePlus', 'login', [options]);
};

exports.logout = function (success, error) {
    exec(success, error, 'GooglePlus', 'logout', []);
};

exports.trySilentLogin = function (options, success, error) {
    exec(success, error, 'GooglePlus', 'trySilentLogin', [options]);
};

exports.disconnect = function (success, error) {
    exec(success, error, 'GooglePlus', 'disconnect', []);
};

exports.isAvailable = function (success, error) {
    exec(success, error, 'GooglePlus', 'isAvailable', []);
};

exports.handleURL = function (url) {
    exec(function() {}, function() {}, 'GooglePlus', 'handleURL', [url]);
};
