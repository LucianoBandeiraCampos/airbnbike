class AvailabilityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    orders = Order.where(["bike_id =? AND state=?", record.id, 'paid'])
    date_ranges = orders.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      record.errors.add(attribute, "not available") if range.include? value
    end
  end
end
