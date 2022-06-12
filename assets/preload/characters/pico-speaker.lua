--ENG:
--Script base made by TKTEMS
--additions and correction By Lucas ADV/Firey


--PT-BR:
--script Base feito por TKTEMS
--adições e correções Por Lucas ADV/Firey

--ES:
--script base hecho por TKTEMS
--adiciones y correcciones Por Lucas ADV/Firey

removeGF = false;

function onCreate()
    setProperty('gf.x', getProperty('gf.x') + 190)
    if removeGF then setProperty('gf.visible', false) end
    makeAnimatedLuaSprite('speaker', 'characters/GF_speaker', getProperty('gf.x') - 190, getProperty('gf.y') + 310)
    addAnimationByPrefix('speaker', 'bump', 'speaker')
    addLuaSprite('speaker')
end

function onUpdate()
    setProperty('speaker.alpha', getProperty('gf.alpha'))
    if not removeGF then setProperty('speaker.visible', getProperty('gf.visible')) end
    setProperty('speaker.x', getProperty('gf.x') - 190)
    setProperty('speaker.y', getProperty('gf.y') + 441)
end

function onBeatHit()
    objectPlayAnimation('speaker', 'bump', true)
end

function onCountdownTick(c)
	onBeatHit()
end