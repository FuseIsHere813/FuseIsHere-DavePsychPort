function onCreate()
	makeLuaSprite('3d', '3d', -500, -250);
	scaleObject('3d', 2, 2);
	setLuaSpriteScrollFactor('3d', 1, 1);

	addLuaSprite('3d', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end