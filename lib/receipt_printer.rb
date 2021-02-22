class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1,
  }

  TAX = 0.05

  def initialize(output: $stdout, items:)
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

  attr_reader :output, :items

  def print_items
    items.each do |item|
      output.puts "#{item}: #{sprintf('$%.2f', COST[item])}"
    end
  end

  def subtotal
    @_subtotal ||= items.reduce(0) do |sum, item|
      sum + COST[item]
    end
  end

  def print_subtotal
    output.puts "subtotal: #{sprintf('$%.2f', subtotal)}"
  end

  def print_tax
    output.puts "tax: #{sprintf('$%.2f', subtotal * TAX)}"
  end

  def print_total
    output.puts "total: #{sprintf('$%.2f', subtotal + (subtotal * TAX))}"
  end

  def print_divider
    output.puts divider
  end

  def divider
    '-' * 13
  end
end
