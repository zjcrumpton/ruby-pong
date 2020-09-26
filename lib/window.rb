background = Color.new('#b4619c')
set title: 'Ruby-Pong', background: 'black', resizable: false, 
width: 1000, height: 1000, frames: 200

# Draws the dividing line in the center of the screen
y = 24
36.times do
 Rectangle.new(
  width: 5, height: 10,
  x: ((get :width) / 2), y: y
 )

 y += 20
end
