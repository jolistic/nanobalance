var XMLHttpRequest = require("xhr2");
var xhr = new XMLHttpRequest();
var WebSocket = require("ws");
var mNano = Math.pow(10, 30);

// View other options of Public Nano Nodes: https://publicnodes.somenano.com
RPC_SERVER = "https://node.somenano.com/proxy";
REQUEST_TIMEOUT = 10 * 1000; // 10 seconds

// Send a POST request and return a Promise
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
  return post(RPC_SERVER, input);
}

async function go() {
  const address =
    "nano_1yb83g9ykz83ewqh65zhckiohaj4am6stub5b4opt7pxfjrzn845khp96d4p";
  // account_balance(address).then(console.log);
  var x = await account_balance(address);
  // console.log(x)
  balanceAmount = Object.values(x)[0];
  intBalance = balanceAmount;
  // console.log(intBalance)
  var finalBalance = intBalance / mNano;
  console.log(finalBalance);
  return finalBalance;
}
go();
