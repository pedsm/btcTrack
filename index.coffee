parser = require 'osmosis'
sleep = require 'sleep'
util = require 'util'
chalk = require 'chalk'
currentPrice = 0
prevVal = 0

console.log "Starting"

parse = ->
    parser.get("http://www.coindesk.com/price/")
        .find(".bpi-value.bpiUSD")
        .set("value")
        .data((result) -> prevVal = currentPrice ; currentPrice = result.value)
        # .log(console.log)
        # .debug(console.log)
        .done(print)
print = ->
	text = chalk.red "Current value = " + currentPrice
	text = chalk.blue "Current value = " + currentPrice if currentPrice > prevVal
	console.log text

#start loop
setInterval (-> parse()), 1000
