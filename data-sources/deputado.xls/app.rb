require 'spreadsheet'
require 'json'

file = './deputado.xls.txt'
s = Spreadsheet.open(file)
w = s.worksheets.first
r = w.rows.map(&:entries)
headers = r.shift
map = r.reduce([]) {|m, v| m << Hash[headers.zip(v)]; m }
json = JSON.dump(map)
puts json
