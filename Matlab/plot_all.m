SeqName={'PeopleOnStreet' 'Traffic' 'BasketballDrive' 'BQTerrace' 'Cactus' 'Kimono' 'ParkScene' 'BasketballDrill' 'BQMall' 'PartyScene' 'RaceHorsesC' 'BasketballPass' 'BlowingBubbles' 'BQSquare' 'RaceHorses' 'FourPeople' 'Johnny' 'KristenAndSara' 'Vidyo1' 'Vidyo3' 'Vidyo4' 'BasketballDrillText' 'ChinaSpeed' 'SlideEditing' 'SlideShow'};

parfor i = 1:numel(SeqName)
    i
    build_residual(strcat(SeqName{i},'.log'));
end