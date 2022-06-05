--ENG:
--Script, additions and correction By Lucas ADV/Firey

--PT-BR:
--script Base,adições e correções Por Lucas ADV/Firey

--ES:
--script, adiciones y correcciones Por Lucas ADV/Firey
function onCreate()
setObjectOrder('fastCar', getObjectOrder('gfGroup') + 1)
setObjectOrder('limoLight', getObjectOrder('gfGroup') + 1)
scaleObject('gfGroup', 0.7, 0.7);
setScrollFactor('gfGroup', 0.4, 0.4)

if lowQuality then
setProperty('gfGroup.visible',false)
end

if not lowQuality then
makeAnimatedLuaSprite('Speaker', 'characters/Speaker-alt', getProperty('gf.x') - 120, getProperty('gf.y') + 70)
	luaSpriteAddAnimationByPrefix('Speaker', 'bop', 'Speaker bop', 24, false);
	setLuaSpriteScrollFactor('Speaker', 0.4, 0.4);
	setProperty('Speaker.flipX', true)
	scaleObject('Speaker', 0.7, 0.7);
	addLuaSprite('Speaker', false);
	end
end

function onUpdate()
setProperty('Speaker.alpha', getProperty('gf.alpha'))
    setProperty('Speaker.x', getProperty('gf.x') - 120)
    --Week 4 custom
    setProperty('gf.x', getProperty('bgLimo.x') + 700)
    setProperty('Speaker.x', getProperty('bgLimo.x') + 580)
    ---
    setProperty('Speaker.y', getProperty('gf.y') + 70)
end

function onBeatHit()
    objectPlayAnimation('Speaker', 'bop', true)
end

function onCountdownTick(c)
	onBeatHit()
end

--Gambiarras para Week 4-Customize se quiser
function onEvent(n, v1, v2)
	if n == 'Kill Henchmen' then
		characterPlayAnim('gf', 'DUCK', true);
		setProperty('gf.specialAnim', true);
		runTimer('Gf-Loop', 0.1);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Gf-Loop' then
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		runTimer('Gf-Loop-End', 3);
		end
if tag == 'Gf-Loop-End' then
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', false);
		end
end