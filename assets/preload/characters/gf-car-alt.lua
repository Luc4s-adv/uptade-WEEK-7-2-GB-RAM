--ENG:
--Script, additions and correction By Lucas ADV/Firey

--PT-BR:
--script Base,adições e correções Por Lucas ADV/Firey

--ES:
--script, adiciones y correcciones Por Lucas ADV/Firey
function onCreate()
setObjectOrder('fastCar', getObjectOrder('gfGroup') + 1)
setObjectOrder('limoLight', getObjectOrder('gfGroup') + 1)
setProperty('gfGroup.y', 270)
setProperty('gfGroup.x', 400)
scaleObject('gfGroup', 0.7, 0.7);
setScrollFactor('gfGroup', 0.4, 0.4)
end

function onEvent(n, v1, v2)
	if n == 'Kill Henchmen' then
		characterPlayAnim('gf', 'DUCK', true);
		setProperty('gf.specialAnim', true);
		runTimer('Gf 1', 0.5);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'Gf back!' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup',400,0.5,'sineOut')
		setProperty('gf.specialAnim', false);
		end
if tag == 'Gf 2' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 2000 ,0.5,'sineOut')
		runTimer('Gf 3', 0.7);
		end
if tag == 'Gf exit!' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 2000 ,2,'sineOut')
		runTimer('Gf 2', 0.4);
		end
if tag == 'Gf 1' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 350 ,0.9,'sineOut')
		runTimer('Gf exit!', 0.4);
		end
if tag == 'Gf 3' then -- Timer completed, play dialogue
		doTweenX('ee','gfGroup', 350 ,1.1,'sineOut')
		runTimer('Gf back!', 1.1);
		end
end