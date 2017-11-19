Graphics.set_background(Palette::White)

def cantor(x, y, len)
  h = 30

  if len >= 1
    Rect.new(x, y, len, h/3).draw(Palette::Black)
    y += h
    cantor(x, y, len/3)
    cantor(x + len*2/3, y, len/3)
  end
end

camera = Camera2D.new

while System.update do
  camera.update
  camera.draw(Palette::Orange)
  camera.transform do
    cantor(35, 0, 730)
  end
end
