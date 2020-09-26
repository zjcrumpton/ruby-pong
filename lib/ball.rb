class Ball
  attr_accessor :body, :x_speed, :y_speed
  def initialize
   @body = Square.new(
      size: 20,
      x: 502, y: 400
    )

    @x_speed = [-12, 12].sample
    @y_speed = [-2, 2].sample
  end

  def change_color
    @body.color = 'random'
  end

  def hit_edge?
    [0]
    @body.contains?
  end

end

