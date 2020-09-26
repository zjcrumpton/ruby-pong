# # frozen_string_literal: true

# Bundler Set Up
require 'rubygems'
require 'bundler/setup'

require 'socket'

# Allow all scripts to access gems in the Gemfile
Bundler.require(:default)

require './lib/window.rb'
require './lib/paddle.rb'
require './lib/ball.rb'

# Set Colors
left_color = Color.new('#06a2b5')
right_color = Color.new('#f3975f')

# Place Paddles
left_paddle = Paddle.new(1, left_color)
right_paddle = Paddle.new(2, right_color)

# Set Scoreboard
left_score = Text.new(left_paddle.score, x: 300, size: 100)
right_score = Text.new(right_paddle.score, x: 650, size: 100)

ball = Ball.new

# Player Movement
on :key_held do |event|
  if event.key == 'w'
    left_paddle.move_up
  elsif event.key == 's'
    left_paddle.move_down
  elsif event.key == 'up'
    right_paddle.move_up
  elsif event.key == 'down'
    right_paddle.move_down
  end
end

# Stop player when no key is being pressed
on :key_up do |event|
  if event.key == 'w'
    left_paddle.stop
  elsif event.key == 's'
    left_paddle.stop
  elsif event.key == 'up'
    right_paddle.stop
  elsif event.key == 'down'
    right_paddle.stop
  end
end

def collide_with_edge(left, right)
  left_paddle.body.y = 0 if left_paddle.body.y <= 0
end

tick = 0

update do
  if ball.body
    if left_paddle.hit_ball?(ball) || right_paddle.hit_ball?(ball)
      ball.x_speed < 0 ? ball.x_speed = 12 : ball.x_speed = -12
      ball.y_speed = [ball.y_speed - 4, ball.y_speed + 4].sample
    end
  end

  ball.body.x += ball.x_speed
  ball.body.y += ball.y_speed


  left_paddle.body.y += left_paddle.speed
  right_paddle.body.y += right_paddle.speed
  left_paddle.hit_edge
  right_paddle.hit_edge

  if tick % 60 == 0
    ball.change_color
  end
  tick += 1

  left_score.text = left_paddle.score
  right_score.text = right_paddle.score

  if ball.body.x < -25
    right_paddle.goal
    ball.body.remove
    ball = Ball.new
    sleep(1)
  elsif ball.body.x > 1005
    left_paddle.goal
    ball.body.remove
    ball = Ball.new
    sleep(1)
  elsif ball.body.y < 0
    ball.y_speed = -ball.y_speed + 1
  elsif ball.body.y > 740
    ball.y_speed = -ball.y_speed - 1
  end
end

# Opens the window
show

