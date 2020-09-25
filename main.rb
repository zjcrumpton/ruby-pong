# # frozen_string_literal: true

# Bundler Set Up
require 'rubygems'
require 'bundler/setup'
# Allow all scripts to access gems in the Gemfile
Bundler.require(:default)

require './lib/window.rb'
require './lib/paddle.rb'

left_color = Color.new('#06a2b5')
right_color = Color.new('#f3975f')

left_paddle = Paddle.new(1, left_color)
right_paddle = Paddle.new(2, right_color)

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


update do
  left_paddle.body.y += left_paddle.speed
  right_paddle.body.y += right_paddle.speed
  left_paddle.hit_edge
  right_paddle.hit_edge
end


# Opens the window
show
