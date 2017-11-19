Graphics.set_background(Palette::White)

def draw_lines(x1, y1, x2, y2)
  Line.new(x1, y1, x2, y2).draw(1, Palette::Black)

  dx = x2 - x1
  dy = y2 - y1

  if dx == 0 && dy > 4
    draw_lines(x1 - dy/3, y1, x1 + dy/3, y1)
    draw_lines(x1 - dy/3, y2, x1 + dy/3, y2)
  elsif dy == 0 && dx > 4
    draw_lines(x1, y1 - dx/3, x1, y1 + dx/3)
    draw_lines(x2, y1 - dx/3, x2, y2 + dx/3)
  end
end

camera = Camera2D.new

while System.update do
  camera.update
  camera.draw(Palette::Orange)
  camera.transform do
    draw_lines(40, 240, 600, 240)
    # draw_lines(320, 40, 320, 440)
  end
end
