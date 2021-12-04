function onTweenCompleted(tag)
    -- A tween you called has been completed, value "tag" is it's tag
    if tag == 'nonsenseup' then
        doTweenY('nonsensedown', 'dad', 100, 2, 'smoothStepInOut');
    end
    if tag == 'nonsensedown' then
        doTweenY('nonsenseup', 'dad', 250, 2, 'smoothStepInOut');
    end
end

function onCountdownTick(counter)
    -- counter = 0 -> "Three"
    -- counter = 1 -> "Two"
    -- counter = 2 -> "One"
    -- counter = 3 -> "Go!"
    -- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
    if counter == 0 then
        doTweenY('nonsenseup', 'dad', 250, 2, 'smoothStepInOut');
    end
end