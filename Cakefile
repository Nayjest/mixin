{spawn, exec} = require 'child_process'

task 'watch', 'continually build with --watch', ->
    coffee = spawn 'coffee.cmd', ['-cw', '-o', 'lib', 'src']
    coffee.stdout.on 'data', (data) -> console.log data.toString().trim()
    coffee.stderr.on 'data', (data) -> console.log data.toString().trim()