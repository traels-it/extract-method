class ReceiptPrinter
  attr_reader :output, :items

  COST = {
    "meat" => 5,
    "milk" => 3,
    "candy" => 1
  }

  TAX = 0.05

  def initialize(items:, output: $stdout)
    @output = output
    @items = items
  end

  def print
    print_items

    print_divider
    print_subtotal
    print_tax
    print_divider
    print_total
  end

  private

  def printout(lable, amount)
    output.puts "#{lable}: #{sprintf("$%.2f", amount)}"
  end

  def subtotal
    items.reduce(0) do |sum, item|
      sum + COST[item].to_i
    end
  end

  def print_items
    items.reduce(0) do |sum, item|
      printout(item.to_s, COST[item])
    end
  end

  def print_divider
    output.puts "-" * 13
  end

  def print_subtotal
    printout("subtotal", subtotal)
  end

  def print_tax
    printout("tax", subtotal * TAX)
  end

  def print_total
    printout("total", subtotal + (subtotal * TAX))
  end
end
