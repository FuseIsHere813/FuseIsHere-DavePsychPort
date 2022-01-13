function onStartCountdown()
setProperty('health', 2)
end

function onUpdate(elapsed)
songPos = getSongPosition()
setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.2)
cameraSetTarget('dad')
doTweenZoom('camerazoom','camGame',1.1,0.2,'quadInOut')
setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraSetTarget('boyfriend')
end
end