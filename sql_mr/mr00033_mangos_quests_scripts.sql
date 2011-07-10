-- For YTDB s
DELETE FROM scripted_areatrigger WHERE entry=3626;
INSERT INTO scripted_areatrigger VALUES (3626, 'at_vaelastrasz');

-- -------------------------
-- fix quest toxic_test 9051
-- -------------------------
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '6498' WHERE `entry` =9051;
DELETE FROM `creature_ai_scripts` WHERE `id` =649802;
INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `action1_type`, `action1_param1`, `action1_param2`, `comment`) VALUES
('649802', '6498', '8', '100', '1', '7211', '-1', '33', '6498', '6', 'quest Credit for quest 9051'); 

-- ------------------------------
-- Quest : 12078 Worm Wrangler --
-- ------------------------------

DELETE FROM `item_required_target` WHERE `entry` = 36771 AND `type` = 1 AND `targetEntry` = 26359;
INSERT INTO `item_required_target` (`entry`, `type`, `targetEntry`) VALUES
('36771', '1', '26359');

-- ------------------------------
-- Quest: Drake Hunt (11940/11919)
-- ------------------------------
UPDATE `creature_template` SET ScriptName='npc_nexus_drake', AIName='' WHERE entry = 26127;

-- -------------------------------
-- Quest: Merciful Freedom (11676)
-- -------------------------------
UPDATE gameobject_template SET ScriptName='go_scourge_cage' WHERE entry IN (187854,187855,187856,187857,187858,187859,187860,187862,187863,187864,187865,187866,187867,187868,187870,187871,187872,187873,187874,187861,190803);

-- Quest: Abduction (11590)
UPDATE `creature_template` SET
minhealth=6387,
maxhealth=7185,
minlevel=64,
maxlevel=70,
minmana=7031,
maxmana=7196
WHERE entry=25474;

UPDATE `creature_template` SET
`ScriptName`='npc_beryl_sorcerer' , AIName=''
WHERE entry=25316;

-- ---------------------------------------------------
-- Mob support for Quest: Powering Our Defenses (8490)
-- ---------------------------------------------------
-- Enraged Wraith
DELETE FROM `creature` WHERE id = 17086;
UPDATE `creature_template` SET AIName='EventAI', flags_extra=flags_extra|64 WHERE entry=17086;

DELETE FROM `creature_ai_scripts` WHERE creature_id = 17086;
INSERT INTO `creature_ai_scripts` VALUES
(1708601,17086,2,0,100,0,25,0,0,0,11,8599,0,1,1,-106,0,0,0,0,0,0,'Enraged Wraith - Cast Enrage on 50% HP');


-- Console/conflict fixes from recent checks added by mangos for EventAI
DELETE FROM `creature_ai_scripts` WHERE (`id`='2531612') OR (`id`='2531601') OR (`id`='2531603') OR (`id`='2531609') OR (`id`='2531611') OR (`id`='2531608') OR (`id`='2531607') OR (`id`='2531610') OR (`id`='2531604') OR (`id`='2531606') OR (`id`='2531602') OR (`id`='2531605') OR (`id`='2531651');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2612702') OR (`id`='2612701');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2748307') OR (`id`='2748302') OR (`id`='2748305') OR (`id`='2748303') OR (`id`='2748308') OR (`id`='2748301') OR (`id`='2748306') OR (`id`='2748304');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2760001') OR (`id`='2760006') OR (`id`='2760007') OR (`id`='2760004') OR (`id`='2760010') OR (`id`='2760009') OR (`id`='2760002') OR (`id`='2760011') OR (`id`='2760005') OR (`id`='2760008') OR (`id`='2760003');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2920404') OR (`id`='2920403') OR (`id`='2920402') OR (`id`='2920401') OR (`id`='2920003') OR (`id`='2920001') OR (`id`='2920002') OR (`id`='2919902') OR (`id`='2919901') OR (`id`='2919903');

DELETE FROM `creature_ai_texts` WHERE (`entry`='-1120') OR (`entry`='-1121') OR (`entry`='-1122') OR (`entry`='-1123') OR (`entry`='-1124') OR (`entry`='-1125') OR (`entry`='-1126') OR (`entry`='-1127') OR (`entry`='-1128');
DELETE FROM `creature_ai_texts` WHERE (`entry`='-696') OR (`entry`='-697');

-- ---------------
-- Gamel the Cruel
-- ---------------
UPDATE creature SET spawntimesecs = 30 WHERE id = 26449;

UPDATE creature_template SET AIName = 'EventAI', dmg_multiplier = 2 WHERE entry = 26449;
DELETE FROM creature_ai_scripts WHERE creature_id = 26449;
INSERT INTO creature_ai_scripts VALUES
(2644901, 26449, 0,0,80,1, 2000,2000,5000,5000, 11,19643,1,0, 0,0,0,0, 0,0,0,0,'Gamel the Cruel - mortal strike');

-- ---------------------------
-- fix quest _abduction 11590
-- ---------------------------
-- item (Arcane Binder)
DELETE FROM item_required_target WHERE entry = 34691;
INSERT INTO item_required_target VALUES
(34691,1,25316);


-- --------------------------------------------------
-- fixes for Quest Kickin'Nass and Takin manes (12630)
-- --------------------------------------------------
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 28523;
DELETE FROM creature WHERE id=28523;  -- deletes  nass kc bunny credit needs to be summoned not already spawn

-- -----------------------------
-- Quest Fixes to Hard_to_sallow
-- -----------------------------
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '26293';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2629302');
INSERT INTO `creature_ai_scripts` VALUES ('2629302', '26293', '2', '0', '100', '0', '70', '50', '0', '0', '1', '-262930', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Hulking Jormungar - emote between 70% and 50% ');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '26293';
DELETE FROM `creature_ai_scripts` WHERE (`id`='2629301');
INSERT INTO `creature_ai_scripts` VALUES ('2629301', '26293', '9', '0', '100', '1', '0', '30', '14000', '17000', '11', '50293', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Hulking Jormungar - Cast Corrosive Poison');

DELETE FROM `creature_ai_texts` WHERE entry IN ('-262930');
INSERT INTO `creature_ai_texts` VALUES ('-262930', 'The Hulking Jormungar falters for a moment, opening its mouth wide.', '', '', '', '', '', '', '', '', '3', '0', '0', '0', 'Hulking Jormungar-raid emote');

-- ------------------------------------------
-- Support for quest The Denouncement (12273)
-- ------------------------------------------

-- Remove creature
DELETE FROM creature WHERE guid=105029 AND id=27237;

-- Rod of Compulsion Item (37438)

DELETE FROM item_required_target WHERE entry=37438;
INSERT INTO item_required_target VALUES
(37438,1,27237),
(37438,1,27235),
(37438,1,27234),
(37438,1,27236);

-- Rod of Compulsion Spell (48712)

-- Texts
DELETE FROM creature_ai_texts WHERE entry IN (-272371,-272351,-272341,-272361);
INSERT INTO creature_ai_texts VALUES
(-272371,'High general Abbendis personally told me that it was a mistake to come north and that we\'re doomed! I urge you all to lay down your weapons and leave before it\'s too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Commander Jordan yell'),
(-272351,'Renounce the Scarlet Onslaught! Don\'t listen to the lies of the high general and the grand admiral any longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Lead Cannoneer Zierhut yell'),
(-272341,'You are being misled! The Onslaught is all lies! The Scourge and the Forsaken are not our enemies! Wake up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Blacksmith Goodman yell'),
(-272361,'Abbendis is nothing but a harlot and Grand Admiral Westwind is selling her cheap like he sold us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'Stable Master Mercer yell');

-- ACID
DELETE FROM creature_ai_scripts WHERE id IN (2723701,2723702,2723703,2723704,2723705,2723501,2723502,2723503,2723504,2723401,2723402,2723403,2723404,2723405,2723601,2723602,2723603,2723604);
INSERT INTO creature_ai_scripts VALUES

-- Commander Jordan (27237)

-- yell
(2723701,27237,4,0,100,6,0,0,0,0,1,-272371,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Yell on Aggro'),
-- Avenging Wrath (50837)
(2723702,27237,0,0,100,1,1000,3000,25000,30000,11,50837,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Cast Avenging Wrath'),
-- Consecration (32773)
(2723703,27237,9,0,100,1,0,10,18000,23000,11,32773,0,1,0,0,0,0,0,0,0,0,'Commander Jordan - Cast Consecration'),
-- Kill credit (48723/48724)
(2723704,27237,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Commander Jordan - Set Phase 2 after spell hit'),
(2723705,27237,6,1,100,0,0,0,0,0,33,27426,6,3,0,0,0,0,0,0,0,0,'Commander Jordan - Kill Credit on Death (Phase 2)'),


-- Lead Cannoneer Zierhut (27235)

-- yell
(2723501,27235,4,0,100,6,0,0,0,0,1,-272351,0,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Yell on Aggro'),
-- Torch Toss (50832)
(2723502,27235,0,0,100,1,3000,7000,12000,15000,11,50832,4,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Cast Torch Toss'),
-- Kill Credit (48725/48726)
(2723503,27235,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Set Phase 2 after spell hit'),
(2723504,27235,6,1,100,0,0,0,0,0,33,27427,6,3,0,0,0,0,0,0,0,0,'Lead Cannoneer Zierhut - Kill Credit on Death (Phase 2)'),

-- Blacksmith Goodman (27234)

-- yell
(2723401,27234,4,0,100,6,0,0,0,0,1,-272341,0,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Yell on Aggro'),
-- Crush Armor (33661)
(2723402,27234,0,0,100,1,2000,5000,5000,7000,11,33661,1,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Cast Crush Armor'),
-- Skull Crack (15621)
(2723403,27234,0,0,100,1,6000,9000,10000,14000,11,15621,1,1,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Cast Skull Crack'),
-- Kill credit (48727/48728)
(2723404,27234,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Set Phase 2 after spell hit'),
(2723405,27234,6,1,100,0,0,0,0,0,33,27428,6,3,0,0,0,0,0,0,0,0,'Blacksmith Goodman - Kill Credit on Death (Phase 2)'),

-- Stable Master Mercer (27236)

-- yell
(2723601,27236,4,0,100,6,0,0,0,0,1,-272361,0,0,0,0,0,0,0,0,0,0,'Stable Master Mercer - Yell on Aggro'),
-- Summon Warhorse (50829)
(2723602,27236,4,0,100,0,0,0,0,0,11,50829,0,1,12,28187,6,0,0,0,0,0,'Stable Master Mercer - Summon Warhorse on Aggro'),
-- Kill credit (48729/48730)
(2723603,27236,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'Stable Master Mercer - Set Phase 2 after spell hit'),
(2723604,27236,6,1,100,0,0,0,0,0,33,27429,6,3,0,0,0,0,0,0,0,0,'Stable Master Mercer - Kill Credit on Death (Phase 2)');

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27236;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27234;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27235;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 27237;

-- ----------------------------------------------
-- Support for quest Defiling Uther's Tomb (9444)
-- ----------------------------------------------
DELETE FROM creature_ai_scripts WHERE creature_id=27002;
INSERT INTO creature_ai_scripts VALUES
(2700201,27002,11,0,100,0,0,0,0,0,1,-270021,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Spawn'),
(2700202,27002,9,0,100,1,5,45,19000,25000,11,52167,1,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Magnataur Charge'),
(2700203,27002,0,0,100,1,7000,14000,12000,16000,11,52166,0,1,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Thunder'),
(2700204,27002,6,0,100,0,0,0,0,0,1,-270022,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Death');

DELETE FROM creature_ai_texts WHERE entry IN (-270021,-270022);
INSERT INTO creature_ai_texts (entry, content_default, type, comment) VALUES
(-270021,'I\'ll consume your flesh and pick my teeth with your bones!',1,'Grom\'thar the Thunderbringer yell1'),
(-270022,'You\'re no magnataur! Where... did you... find... such strength?',1,'Grom\'thar the Thunderbringer yell2');

-- --------------------------------------------------------
-- aldaron the reckless loc fix Blood elf starting area fix
-- --------------------------------------------------------
DELETE FROM `creature` WHERE `id`=16294;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(67521, 16294, 530, 1, 1, 0, 0, 8747.7, -6116.85, 68.5645, 5.28401, 300, 0, 0, 148, 825, 0, 0);

-- -------------------------------------------------
-- Support for quest A Necessary Distraction (10637)
-- -------------------------------------------------

-- Azaloth (21506)
-- UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 21506;
-- UPDATE `creature_template` SET `modelid_2` = 17287 WHERE `entry` = 21506; -- this isnt correct display yet

--DELETE FROM creature_ai_scripts WHERE creature_id=21506;
--INSERT INTO creature_ai_scripts VALUES
--(2150601,21506,8,0,100,1,37834,-1,0,0,1,-21506,0,0,21,6,0,0,16,21892,37834,6,'Azaloth  - Yell and Start Combat Movements'),
--(2150602,21506,3,0,100,0,0,0,0,0,0,28,0,37833,0,0,0,0,0,0,0,0,'Azaloth  - Yell and Start Combat Movements'),
--(2150603,21506,0,0,100,1,4000,4000,8000,8000,11,40504,1,0,0,0,0,0,0,0,0,0,'Azaloth - Cast Cleave'),
--(2150604,21506,0,0,100,1,3000,3000,17000,17000,11,11443,1,1,0,0,0,0,0,0,0,0,'Azaloth Cast Cripple'),
--(2150605,21506,0,0,100,1,10000,12000,33000,33000,11,38741,4,3,0,0,0,0,0,0,0,0,'Azaloth - Cast Rain of Fire'),
--(2150606,21506,0,0,100,1,6000,6000,14000,14000,11,38750,1,3,0,0,0,0,0,0,0,0,'Azaloth - Cast War Stomp');

--DELETE FROM creature_ai_texts WHERE entry=-21506;
--INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
--(-21506,'Illidan\s lapdogs! You will pay for my imprisonment with your lives!',1,'Azaloth yell1');

-- not finished with this
