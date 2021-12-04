function onCreate()
	makeLuaSprite('farm', 'farm', -500, -400);
	scaleObject('farm', 1, 1);
	setLuaSpriteScrollFactor('farm', 1, 1);

	addLuaSprite('farm', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end