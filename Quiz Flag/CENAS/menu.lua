local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaMenu = self.view


  local x = display.contentWidth
  local y = display.contentHeight

  local fundo = display.newImageRect(cenaMenu, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  local textoMenu = display.newText(cenaMenu, 'MENU', x*0.5, y*0.2, nil, 200 )
  textoMenu:setFillColor( 0,0,0 )

  local bloco = display.newRoundedRect(cenaMenu, x*0.5, y*0.6, x*0.8, y*0.5, 100 )
  bloco.alpha = 0.7

  local botaoJogar = display.newRoundedRect(cenaMenu, x*0.5, y*0.45, x*0.6, y*0.07, 100 )
  botaoJogar:setFillColor(0, 0, 0.6) 

  local textoJogar = display.newText(cenaMenu, 'JOGAR', botaoJogar.x, botaoJogar.y, nil, 100 )

  local botaoTutorial = display.newRoundedRect(cenaMenu, x*0.5, y*0.6, x*0.6, y*0.07, 100 )
  botaoTutorial:setFillColor(0, 0, 0.6) 

  local textoTutorial = display.newText(cenaMenu, 'TUTORIAL', botaoTutorial.x, botaoTutorial.y, nil, 100 )

  local botaoCreditos = display.newRoundedRect(cenaMenu, x*0.5, y*0.75, x*0.6, y*0.07, 100 )
  botaoCreditos:setFillColor(0, 0, 0.6) 

  local textoCreditos = display.newText(cenaMenu, 'CREDITOS', botaoCreditos.x, botaoCreditos.y, nil, 100 )


function verificaToque( event)
  if event.phase=='began' then
    if event.target == botaoJogar then
        composer.gotoScene('cenas.jogo', {
          time = 300, effect = 'fade'
        })

      elseif event.target == botaoTutorial then
        composer.gotoScene('cenas.tutorial', {
          time = 300, effect = 'fade'
         })

        elseif event.target == botaoCredito then
          composer.gotoScene('cenas.creditos', {
            time = 300, effect = 'fade'
           }) 
    end  
  end
end

botaoJogar: addEventListener('touch', verificaToque)
botaoTutorial: addEventListener('touch', verificaToque)
botaoCreditos: addEventListener('touch', verificaToque)  
end
cena:addEventListener('create', cena)
return cena