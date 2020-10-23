def stock_picker(prices)
    # Track  current best price differential and store buy/sell positions
    best_differential = 0
    buy_sell = []

    # Iterate through each position looking at forward prices
    prices.each_with_index do |price, index|
        forward_prices = prices.slice(index + 1, prices.length)
        forward_prices.each_with_index do |val, val_index|
            current_differental = val - price
            # Check if current buy/sell is best differential seen to date
            if current_differental > best_differential
                # Update variables
                best_differential = current_differental
                buy_sell = [index, index + 1 + val_index]
            end
        end
    end

    # Return optimum buy_sell positions and profit
    return {dates: buy_sell, profit: best_differential}
end

data = stock_picker([18, 3, 4, 6, 8, 3, 5, 12, 4, 5, 33, 45, 23, 1, 4, 3, 5, 7, 4, 2, 7, 9, 0, 1, 4])

# Print data
puts "Optimal day to buy is Day #{data[:dates][0] + 1}"
puts "Optimal day to sell is Day #{data[:dates][1] + 1}"
puts "Total profit is $#{data[:profit]}"


