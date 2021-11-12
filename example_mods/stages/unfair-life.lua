function onCreate()
	makeLuaSprite('cheater', 'fuckyou', -500, -250);
	scaleObject('cheater', 2, 2);
	setLuaSpriteScrollFactor('cheater', 1, 1);

	addLuaSprite('cheater', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end