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
    items.each { |item| print_item(item) }
  end

  def print_item(item)
    print_line(label: item, amount: cost(item))
  end

  def print_subtotal
    print_line(label: "subtotal", amount: subtotal)
  end

  def print_tax
    print_line(label: "tax", amount: tax)
  end

  def print_total
    print_line(label: "total", amount: (subtotal + tax))
  end

  def print_line(label:, amount:)
    output.puts "#{label}: #{currency_format(amount)}"
  end

  def cost(item)
    COST[item]
  end

  def currency_format(amount)
    sprintf('$%.2f', amount)
  end

  def subtotal
    @subtotal ||= items.sum { |item| cost(item).to_i }
  end

  def tax
    subtotal * TAX
  end

  def print_divider
    output.puts '-' * 13
  end
end
