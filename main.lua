-- Tablero
local tablero = {}
tablero.arriba_izquierda_x = 140
tablero.arriba_izquierda_y = 100
tablero.ancho = 100
tablero.alto = 60
tablero.distancia_horizontal = 20
tablero.distancia_vertical = 30
tablero.celdas = {}

function tablero.nueva_celda( x, y )
   return( { pos_x = x,
	         pos_y = y,
	         alto = tablero.alto,
	         ancho = tablero.ancho } )
end

function tablero.load()
  local total_ancho = love.graphics.getWidth( )
  local total_alto = love.graphics.getHeight( )
  tablero.arriba_izquierda_x = total_ancho * 0.15
  tablero.arriba_izquierda_y = total_alto * 0.15
  tablero.ancho = total_ancho * 0.20
  tablero.alto = total_alto * 0.20
  tablero.distancia_horizontal = total_ancho * 0.05
  tablero.distancia_vertical = total_alto * 0.05
  for fila=1, 3 do
    for colum=1, 3 do
      local celda_posicion_x = tablero.arriba_izquierda_x +
	   (colum-1) * ( tablero.ancho + tablero.distancia_horizontal )
	  local celda_posicion_Y = tablero.arriba_izquierda_y +
	   (fila-1) * ( tablero.alto + tablero.distancia_vertical )
	  local nueva_celda = tablero.nueva_celda( celda_posicion_x, celda_posicion_Y, fila, colum )
	  table.insert( tablero.celdas, nueva_celda )
    end
   end
end

function tablero.draw() 
  for _, celda in pairs( tablero.celdas ) do
    love.graphics.rectangle( 'line', celda.pos_x, celda.pos_y, celda.ancho, celda.alto )
  end
end

-- General
function love.load()
  tablero.load()
end

function love.draw()
  tablero.draw()
end

-- Salir con escape
function love.keypressed(key)
   if key == 'escape' then
      love.event.quit()
   end
end
function love.quit()
  print("Thanks for playing! Come back soon!")
end