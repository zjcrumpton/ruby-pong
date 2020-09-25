class Paddle
  attr_accessor :x, :speed, :body, :score

 def initialize(player, color)
    player == 1 ? @x = 20 : @x = 960
    @score = 0

    @body = Rectangle.new(
      x: x, y: 350,
      width: 20, height: 100,
      color: color
    )

    @speed = 0
 end

 def move_up
  @speed = -12
 end

 def move_down
  @speed = 12
 end

 def stop
  @speed = 0
 end

 def hit_edge
  @body.y = 0 if @body.y <= 0
  @body.y = 660 if @body.y >= 660
 end

 def goal
  @score += 1
 end
end

