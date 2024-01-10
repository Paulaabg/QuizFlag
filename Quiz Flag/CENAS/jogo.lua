local composer = require('composer')

local cena = composer.newScene()

function cena:create( event )
  local cenaJogo = self.view

  -- VARIAVEIS DE POSICIOMENTO
  local x = display.contentWidth
  local y = display.contentHeight

  -- DECLARACAO DOS GRUPOS (CAMADAS)
  local grupoFundo = display.newGroup()
  local grupoChina = display.newGroup()
  local grupoBrasil = display.newGroup()
  local grupoVenezuela = display.newGroup()
  local grupoTela = display.newGroup()
  local grupoDerrota = display.newGroup()

  cenaJogo:insert( grupoFundo )
  cenaJogo:insert( grupoChina )
  cenaJogo:insert( grupoBrasil )
  cenaJogo:insert( grupoVenezuela )
  cenaJogo:insert( grupoTela )
  cenaJogo:insert( grupoDerrota )

  -- DECLARACAO DAS PERGUNTAS
  local pergunta = {
    china = {
      bandeira = 'recursos/bandeiras/china.png',
      respostas = { 'China', 'Japão', 'Marrocos' }
    },
    brasil = {
      bandeira = 'recursos/bandeiras/brazil-.png',
      respostas = {'Brasil', 'Colombia', 'Argentina'},
    },
    venezuela = {
      bandeira = 'recursos/bandeiras/venezuela.png',
      respostas = {'Colombia', 'Venezuela', 'Chile'}
    }
  }

  -- DECLARACAO DOS AUDIOS

  --EFEITOS SONOROS
  local audioCerto = audio.loadSound('recursos/audios/certo.mp3')
  local audioErro = audio.loadSound('recursos/audios/Erro.mp3')
  
 
 -- VARIAVEL QUE LIMITA O TOQUE NAS RESPOSTAS
  local limitaToque = true
 
  -- DECLARACAO DO FUNDO
  local fundo = display.newImageRect(grupoFundo, 'recursos/imagens/background.jpg', x, y )
  fundo.x = x*0.5
  fundo.y = y*0.5

  -- DECLARAÇÃO DO TEMPO
  local tempo = 15
  local tempoTexto = display.newText(grupoTela, tempo, x*0.1, y*0.07, nil, 150  )

  -- DECLARACAO DERROTA
  local fundoDerrota = display.newRect(grupoDerrota ,x*0.5, y*0.5, x, y )
  fundoDerrota:setFillColor(0, 0, 0)
  fundoDerrota.alpha = 0.9

  local textoDerrota = display.newText(grupoDerrota,'DERROTA' ,x*0.5, y*0.4, nil, 150 )

  local botaoDerrota = display.newRoundedRect(grupoDerrota, x*0.5, y*0.55, x*0.6, y*0.08, 100 )

  local botaoDerrotaTexto = display.newText(grupoDerrota, 'REINICIAR', botaoDerrota.x, botaoDerrota.y, nil, 100 )
  botaoDerrotaTexto:setFillColor(0,0,0)

  grupoDerrota.alpha = 0

  -- DECLARACAO CHINA
  local bandeiraChina = display.newImageRect( grupoChina, pergunta.china.bandeira, x*0.5, x*0.5 )
  bandeiraChina.x = x*0.5
  bandeiraChina.y = y*0.23

  local blocoChina = display.newRoundedRect(grupoChina, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1China = display.newRoundedRect(grupoChina, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1China:setFillColor(0, 0.4, 0.8) 

  local r1ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[1], r1China.x, r1China.y, nil, 100)

  local r2China = display.newRoundedRect(grupoChina, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2China:setFillColor(0, 0.4, 0.8) 

  local r2ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[2], r2China.x, r2China.y, nil, 100)

  local r3China = display.newRoundedRect(grupoChina, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3China:setFillColor(0, 0.4, 0.8) 

  local r3ChinaTexto = display.newText(grupoChina, pergunta.china.respostas[3], r3China.x, r3China.y, nil, 100)




  -- DECLARACAO BRASIL
  local bandeiraBrasil = display.newImageRect( grupoBrasil, pergunta.brasil.bandeira, x*0.5, x*0.5 )
  bandeiraBrasil.x = x*0.5
  bandeiraBrasil.y = y*0.23

  local blocoBrasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.67, x*0.7, y*0.5, 100 )

  local r1Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.53, x*0.5, y*0.09, 100 )
  r1Brasil:setFillColor(0, 0.4, 0.8) 

  local r1BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[1], r1Brasil.x, r1Brasil.y, nil, 100)

  local r2Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.67, x*0.5, y*0.09, 100 )
  r2Brasil:setFillColor(0, 0.4, 0.8) 

  local r2BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[2], r2Brasil.x, r2Brasil.y, nil, 100)

  local r3Brasil = display.newRoundedRect(grupoBrasil, x*0.5, y*0.81, x*0.5, y*0.09, 100 )
  r3Brasil:setFillColor(0, 0.4, 0.8) 

  local r3BrasilTexto = display.newText(grupoBrasil, pergunta.brasil.respostas[3], r3Brasil.x, r3Brasil.y, nil, 100)

  grupoBrasil.alpha = 0

  -- DECLARACAO VENEZUELA

  -- DECLARACAO DAS FUNCIONALIDADES
  function verificaChina( event )
    if event.phase == 'began' and grupoChina.alpha == 1 and limitaToque == true then
      if event.target == r1China then
        r1China:setFillColor(0, 0.7, 0)
        adicionaTempo()
        limitaToque = false
        
        timer.performWithDelay( 1000, function()
          transition.to( grupoChina, {
            time = 500,
            alpha = 0,
            onComplete = function()
              transition.to( grupoBrasil, {
                time = 500,
                alpha = 1
              } )
              limitaToque = true
            end
          })
        end, 1 )


      elseif event.target == r2China then
        r2China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )


      elseif event.target == r3China then  
        r3China:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.Play( audioErro )
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1China:addEventListener('touch', verificaChina)
  r2China:addEventListener('touch', verificaChina)
  r3China:addEventListener('touch', verificaChina)


  function verificaBrasil( event )
    if event.phase == 'began' and grupoBrasil.alpha == 1 and limitaToque == true then
      if event.target == r1Brasil then
        r1Brasil:setFillColor(0, 0.7, 0)
        adicionaTempo()
        audio.play( audioCerto)
        limitaToque = false

      elseif event.target == r2Brasil then
        r2Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro)
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      elseif event.target == r3Brasil then
        r3Brasil:setFillColor(0.7, 0, 0)
        diminuiTempo()
        audio.play( audioErro)
        limitaToque = false
        timer.performWithDelay( 300, function()
          limitaToque = true
        end , 1 )

      end
    end
  end

  r1Brasil:addEventListener('touch', verificaBrasil)
  r2Brasil:addEventListener('touch', verificaBrasil)
  r3Brasil:addEventListener('touch', verificaBrasil)


  function atualizaTempo()
    if tempo > 0 then
      tempo = tempo - 1
      tempoTexto.text = tempo
    end
  end
  timer.performWithDelay( 1000, atualizaTempo, 0 )
  
  function adicionaTempo()
    if tempo > 0 then
      tempo = tempo + 10
      tempoTexto.text = tempo
    end
  end

  function diminuiTempo()
    if tempo >= 5 then
      tempo = tempo - 5
      tempoTexto.text = tempo

    elseif tempo < 5 then
      tempo = 0
      tempoTexto.text = tempo
    end
  end

  function verificaTempo()
    if tempo == 0 then
      grupoDerrota.alpha = 1
      grupoBrasil.alpha = 0
      grupoChina.alpha = 0
    end
  end
  Runtime:addEventListener('enterFrame', verificaTempo )

  function reinicia()
    composer.removeScene( 'cenas.jogo' )
  end

  function derrota( event )
    if event.phase == 'began' and grupoDerrota.alpha == 1 then
      reinicia()
      composer.gotoScene( 'cenas.menu' , {
        time = 500, 
        effect = 'fade'
      } )
    end
  end
  botaoDerrota:addEventListener('touch', derrota)



end
cena:addEventListener('create', cena)
return cena