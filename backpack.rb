class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing days_of_the_week and weather keys
    @items = []
    what_to_bring
  end

  def items
    @items
  end

  def gym_days
      days_of_the_week = @attributes[:days_of_the_week]
        # Ensure gym shoes are added to backpack if it's a gym day
        # Gotta get to the gym on moday and Thursdays.
      if days_of_the_week == 'monday' || days_of_the_week == 'thursday'
        #add gym shoes to items
        @items << 'gym shoes'
      end
  end

  def weather_today
    weather_forcast = @attributes[:weather]
      # Ensure appropriate clothing is added to backpack
      @items << 'pants'
      @items << 'shirt'
      if weather_forcast == 'rainy'
        @items << 'umbrella'
      elsif weather_forcast == 'cold'
        @items << 'jacket'
      end
  end

  def weekends
    # Bring a packed lunch on all weekends.
    days_of_the_week = @attributes[:days_of_the_week]

    if days_of_the_week != 'saturday' && days_of_the_week != 'sunday'
      @items << 'packed lunch'
    else
      # bring snacks on weekdays.
      @items << 'snacks'
    end
  end

  def what_to_bring
    # set up local variables used by rest of prepare method
    weather_forcast = @attributes[:weather]
    days_of_the_week = @attributes[:days_of_the_week]
    weather_today
    gym_days
    weekends
  end

  # Prints a summary packing list for Melinda's backpack
  def packing_summary
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:days_of_the_week]}, Weather: #{@attributes[:weather]}"
    output << ""
    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end
end
