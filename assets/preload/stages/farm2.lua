function onCreate()
	makeLuaSprite('farm2', 'farm2', -500, -400);
	scaleObject('farm2', 1, 1);
	setLuaSpriteScrollFactor('farm2', 1, 1);

	addLuaSprite('farm2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end