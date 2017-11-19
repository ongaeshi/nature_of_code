Graphics.set_background([11, 22, 33])
font = Font.new(30)

while System.update do
  font["🐣Please drag and drop the code!💃"].draw_at(Window.center.x, Window.center.y, Palette::White)
end
