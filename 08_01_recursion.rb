Graphics.set_background(Palette::White)

def draw_circle(x, y, radius)
  Circle.new(x, y, radius).draw_frame(1, Palette::Black)
  if radius > 2
    draw_circle(x, y, radius * 0.75)
  end
end

camera = Camera2D.new

while System.update do
  camera.update
  camera.draw(Palette::Orange)
  camera.transform do
    draw_circle(Window.width/2, Window.height/2, 1000)
  end
end
