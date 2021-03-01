clear

ang = atan([32,26,21,17,13,9,5,2,0]/32)
costhe2_10 = cos(ang);
sinthe2_10 = zeros(1,9);

ang = atan(32./[2,5,9,13,17,21,26,32,26,21,17,13,9,5,2]);
costhe11_25 = cos(ang);
sinthe11_25 = sin(ang);

ang = atan(32./[2,5,9,13,17,21,26,32]);
sinthe26_34 = [0,sin(ang)];
costhe26_34 = zeros(1,9);

costhe = [0,0,costhe2_10,costhe11_25,costhe26_34];
sinthe = [0,0,sinthe2_10,sinthe11_25,sinthe26_34];