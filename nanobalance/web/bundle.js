(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
'use strict';

module.exports = function () {
  throw new Error(
    'ws does not work in the browser. Browser clients must use the native ' +
      'WebSocket object'
  );
};

},{}],2:[function(require,module,exports){
module.exports = XMLHttpRequest;

},{}],3:[function(require,module,exports){
function runAll() {
  var XMLHttpRequest = require("xhr2");
  var xhr = new XMLHttpRequest();
  var WebSocket = require("ws");
  var mNano = Math.pow(10, 30);

  // View other options of Public Nano Nodes: https://publicnodes.somenano.com
  var RPC_SERVER = "https://node.somenano.com/proxy";
  var REQUEST_TIMEOUT = 10 * 1000; // 10 seconds

  find();

  function activator() {}
  function post(url, params) {
    return new Promise((resolve, reject) => {
      let xhttp = new XMLHttpRequest();
      xhttp.timeout = REQUEST_TIMEOUT;
      xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
          try {
            resolve(JSON.parse(this.responseText));
            return;
          } catch (e) {
            console.error("Failed to parse response from node");
            console.error(this.responseText);
            reject(e);
            return;
          }
        } else if (this.readyState == 4 && this.status != 200) {
          console.error("Failed to connect to " + url);
          reject();
          return;
        }
      };
      xhttp.open("POST", url, true);
      xhttp.setRequestHeader("Content-Type", "application/json");
      xhttp.send(JSON.stringify(params));
    });
  }

  function account_balance(address) {
    input = {
      action: "account_balance",
      account: address,
    };
    return post("https://node.somenano.com/proxy", input);
  }

  async function find() {
    // console.log ("Hello dad")
    const address =
      "nano_1yb83g9ykz83ewqh65zhckiohaj4am6stub5b4opt7pxfjrzn845khp96d4p";
    // account_balance(address).then(console.log);
    var x = await account_balance(address);
    console.log(x);
    balanceAmount = Object.values(x)[0];
    intBalance = balanceAmount;
    // console.log(intBalance)
    var finalBalance = intBalance / mNano;
    console.log("something");
    console.log(finalBalance);
    return finalBalance;
  }
}
// Send a POST request and return a Promise

// window.logger = (flutter_value) => {
//     console.log({ js_context: this, flutter_value });
//  }
runAll();

},{"ws":1,"xhr2":2}]},{},[3]);
