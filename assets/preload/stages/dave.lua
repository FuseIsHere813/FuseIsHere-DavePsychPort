function onCreate()
	makeLuaSprite('house', 'house', -500, -250);
	scaleObject('house', 2, 2);
	setLuaSpriteScrollFactor('house', 1, 1);

	addLuaSprite('house', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end