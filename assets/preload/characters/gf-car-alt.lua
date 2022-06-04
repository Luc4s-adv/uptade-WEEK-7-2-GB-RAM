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

function onBeatHit()
    objectPlayAnimation('Speaker', 'bop', true)
end

function onCountdownTick(c)
	onBeatHit()
end

function onEvent(n, v1, v2)
	if n == 'Kill Henchmen' then
		characterPlayAnim('gf', 'DUCK', true);
		setProperty('gf.specialAnim', true);
		runTimer('Gf 1', 0.5);
		runTimer('Gf ducking loop', 0);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Gf back!' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup',400,0.5,'sineOut')
		doTweenX('eo','Speaker',680,0.5,'sineOut')
		setProperty('gf.specialAnim', false);
		end
if tag == 'Gf ducking loop' then -- Timer completed, play dialogue
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
if tag == 'Gf 2' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 2000 ,0.5,'sineOut')
		doTweenX('eo','Speaker', 2900 ,2.5,'sineOut')
		runTimer('Gf 3', 0.7);
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
if tag == 'Gf exit!' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 2000 ,2,'sineOut')
		doTweenX('eo','Speaker', 3000 ,2.7,'sineOut')
		runTimer('Gf 2', 0.4);
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
if tag == 'Gf 1' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 350 ,0.9,'sineOut')
		doTweenX('eo','Speaker', 640 ,0.9,'sineOut')
		runTimer('Gf exit!', 0.4);
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
if tag == 'Gf 3' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 397, 0.9,'sineOut')
		doTweenX('eo','Speaker', 654 ,1,'sineOut')
		runTimer('Gf back!', 1);
		runTimer('Gf other', 0.9);
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
if tag == 'Gf other' then -- Timer completed, play dialogue
		doTweenX('eo','Speaker', 680 ,0.8,'sineOut')
		doTweenX('ee','gfGroup', 396, 1,'sineOut')
		characterPlayAnim('gf', 'DUCK-loop', true);
		setProperty('gf.specialAnim', true);
		end
end