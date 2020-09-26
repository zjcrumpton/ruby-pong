class Paddle
  attr_accessor :x, :speed, :body, :score

 def initialize(player, color)
    player == 1 ? @x = 20 : @x = 960
    @score = 0

    @body = Rectangle.new(
      x: x, y: 350,
      width: 20, height: 150,
      color: color,
      z: 1
    )

    @speed = 0
 end

 def move_up
  @speed = -18
 end

 def move_down
  @speed = 18
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

  def hit_ball?(ball)
    ball.body && [[ball.body.x1, ball.body.y1], [ball.body.x2, ball.body.y2], [ball.body.x3,
      ball.body.y3], [ball.body.x4, ball.body.y4]].any? do |coordinates|
      @body.contains?(coordinates[0], coordinates[1])
    end
  end
end

