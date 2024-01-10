
local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaCarregamento = self.view

  local x = display.contentWidth
  local y = display.contentHeight

  local fundo = display.newImageRect(cenaCarregamento, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local logo = display.newImageRect(cenaCarregamento, 'recursos/imagens/logo.png', x*0.8, y*0.3 )
  logo.x = x*0.5
  logo.y = y*0.3

  local texto = display.newText(cenaCarregamento, 'Carregando...', x*0.5, y*0.69, nil, 80 )
  texto:setFillColor( 0, 0 ,0 )

  local barra = display.newRoundedRect(cenaCarregamento, x*0.5, y*0.75, 0, y*0.05, 100 )

  transition.to( barra, {
    time = math.random( 5000, 10000 ),
    width = x*0.8,
    onComplete = function()
      composer.gotoScene( 'cenas.menu' )
    end
  })

  



end
cena:addEventListener('create', cena)
return cena