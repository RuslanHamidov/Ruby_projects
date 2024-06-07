def stock_picker(stocks)
  best_days = generate_best_days(stocks)
  max_num = best_days[0][1] - best_days[0][0]
  buy_day = 0
  sell_day = 0
  best_days.each_with_index do |element, index|
  temp_num = best_days[index][1] - best_days[index][0]
  if temp_num > max_num
    max_num = temp_num
    buy_day = best_days[index][0]
    sell_day = best_days[index][1]
  end

  end
  [stocks.find_index(buy_day), stocks.find_index(sell_day)]
end

def generate_best_days(stocks)
  best_days = []
  stocks.each_with_index do |element, index|
    temp_arr = []
    temp_arr << element
    new_stocks = stocks[index + 1..stocks.length - 1]
    max_value = new_stocks.max
    if max_value.nil?
      max_value = element
    end
    temp_arr << max_value
    best_days << temp_arr
  end
  best_days
end


p stock_picker([17,3,6,9,15,8,6,1,10])
