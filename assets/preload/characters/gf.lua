--ENG:
--Script base made by TKTEMS
--additions and correction By Lucas ADV/Firey
--WARNING: DO NOT ENABLE removeGF TO "TRUE" on songs where gf is the opponent, (like the tutorial the example)

--PT-BR:
--script Base feito por TKTEMS
--adições e correções Por Lucas ADV/Firey
--AVISO: NÃO HABILITE o removeGF PARA "TRUE" em músicas onde a GF é o OPONENTE, (como o tutorial por exemplo)

--ES:
--script base hecho por TKTEMS
--adiciones y correcciones Por Lucas ADV/Firey
--ADVERTENCIA: NO HABILITAR removeGF A "TRUE" en canciones donde GF es el OPONENTE (como el tutorial, por ejemplo)

removeGF = false;

local GFSongs = {
	['Tutorial'] = true,
}

function onCreate()
    setProperty('gf.x', getProperty('gf.x') + 100)
    if removeGF then setProperty('gf.visible', false) end
    makeAnimatedLuaSprite('speaker', 'characters/GF_speaker', getProperty('gf.x') - 190, getProperty('gf.y') + 310)
    addAnimationByPrefix('speaker', 'bump', 'speaker')
    addLuaSprite('speaker')
    if GFSongs[songName] then
makeAnimatedLuaSprite('speaker2', 'characters/GF_speaker', 210, 440)
    addAnimationByPrefix('speaker2', 'bump', 'speaker')
    addLuaSprite('speaker2')
end
end

function onUpdate()
    setProperty('speaker.alpha', getProperty('gf.alpha'))
    if not removeGF then setProperty('speaker.visible', getProperty('gf.visible')) end
    setProperty('speaker.x', getProperty('gf.x') - 190)
    setProperty('speaker.y', getProperty('gf.y') + 310)
end

function onBeatHit()
    objectPlayAnimation('speaker', 'bump', true)
    objectPlayAnimation('speaker2', 'bump', true)
end

function onCountdownTick(c)
	onBeatHit()
end