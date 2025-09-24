-- 여기에 새로운 루아파일을 실행하게 하세요..
iEventObject = SC_DoScript( "scripts\\EventObject_01.lua" );
if iEventObject ~= 0 then
	SC_LogString( "SC_DoScript Error[EventObject_01.lua]" );
end

iMovePlanet = SC_DoScript( "scripts\\MovePlanet.lua" );
if iMovePlanet ~= 0 then
	SC_LogString( "SC_DoScript Error[MovePlanet.lua]" );
end

-- Tutorial script
iTutorialEvent = SC_DoScript( "scripts\\Tutorial.lua" );
if iMovePlanet ~= 0 then
	SC_LogString( "SC_DoScript Error[Tutorial.lua]" );
end

-----------------------------------------------


hAVT = 0;
hCamera = 0;
hMotion = 0;
hCreateAvatarMotion = nil
hSelectedAvatarMotion = nil
hWaitDeleteAvatarMotion = nil
function EnterLogin( seed )
	randomseed( seed )	
	hMotion = SC_LoadMotion( "LoginCameraMotion", "3DData\\Title\\Camera01_intro01.zmo", 1, 4, 3, 1, 0 )
	camera  = SC_FindNode( "motion_camera")
	SC_AttachMotion( camera,hMotion );
	SC_ControlAnimation( camera, 1 );
	SC_SetCameraDefault( camera );
end

function LeaveLogin()
end

function EnterLoadSelectAvatar()
end

--아바타 선택창에 들어가기전의 Data Loading이 끝날때 불려지는 function
function LeaveLoadSelectAvatar()
	hCamera  = SC_FindNode( "motion_camera")
	hMotion  = SC_GetMotion( hCamera )
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );

	hMotion = SC_LoadMotion( "SelectAvatarCameraMotion", "3DData\\Title\\Camera01_inSelect01.zmo", 1, 4, 3, 1, 0 )

	SC_AttachMotion( hCamera,hMotion );
	SC_SetRepeatCount( hCamera, 1 );
	SC_ControlAnimation( hCamera, 1 );
	SC_SetCameraDefault( hCamera );
end

function EnterSelectAvatar()
	if hSelectedAvatarMotion == nil then
		hSelectedAvatarMotion = SC_LoadMotion( "empty_walk_m","3DData\\Motion\\Avatar\\event_select_m1.zmo" , 1, 4, 3, 1, 0 )
	end
	
	if hWaitDeleteAvatarMotion == nil then
		hWaitDeleteAvatarMotion = SC_LoadMotion( "DeleteMotion", "3DData\\Motion\\Avatar\\event_creat_m1.zmo", 1, 4, 3, 1, 0 )
	end
end

function LeaveSelectAvatar()
end

function LeaveLoginVirtual()
	hCamera  = SC_FindNode( "motion_camera")
	hMotion  = SC_GetMotion( hCamera )
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );

	hMotion = SC_LoadMotion( "LoginCameraMotion", "3DData\\Title\\Camera01_intro01.zmo", 1, 4, 3, 1, 0 )
	camera  = SC_FindNode( "motion_camera")
	SC_AttachMotion( camera,hMotion );
	SC_ControlAnimation( camera, 1 );
	SC_SetCameraDefault( camera );
end

function EnterMoveMain()
	hCamera  = SC_FindNode( "motion_camera")
	hMotion  = SC_GetMotion( hCamera )
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );

	hMotion = SC_LoadMotion( "SelectAvatarCameraMotion", "3DData\\Title\\Camera01_inGame01.ZMO", 1, 4, 3, 1, 0 )

	SC_AttachMotion( hCamera,hMotion );
	SC_SetRepeatCount( hCamera, 1 );
	SC_ControlAnimation( hCamera, 1 );
	SC_SetCameraDefault( hCamera );
end

function LeaveMoveMain()
	hCamera  = SC_FindNode( "motion_camera")
	hMotion  = SC_GetMotion( hCamera )
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );
end

function EnterCreateAvatar()
	hCamera  = SC_FindNode( "motion_camera")
	hMotion  = SC_GetMotion( hCamera )
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );

	--Camera Setting
	hMotion = SC_LoadMotion( "CreateAvatarCameraMotion", "3DData\\Title\\Camera01_Create01.zmo", 1, 4, 3, 1, 0 )
	SC_AttachMotion( hCamera,hMotion );
	SC_SetRepeatCount( hCamera, 1 );	
	SC_ControlAnimation( hCamera, 1 );
	SC_SetCameraDefault( hCamera );
	
	-- Avatar Model Setting(남자기본)
	-- name,race+sex,face,hair,helmet, armor,gauntlet,boots,faceitem,knapsack,rweapon, lweapon
	hAVT = SC_AddCreateAVT( "Default", 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 );	
	hCreateAvatarMotion = SC_LoadMotion( "CreateMotion","3DData\\Motion\\Avatar\\event_creat_m1.zmo", 1, 4, 3, 1, 0 )
	SC_AttachMotion( hAVT, hCreateAvatarMotion )
	SC_SetScale( hAVT, 1.5, 1.5, 1.5 );
	SC_SetModelPosition( hAVT, 520005, 520018, 747 );
	SC_SetModelDirection( hAVT, 180 );
	
	--Interface Setting

	--sex
	SC_AddSelectItem4CreateAvatar( 0 , "Male", 0);
	SC_AddSelectItem4CreateAvatar( 0 , "Female", 1);
	SC_SelectItem4CreateAvatar( 0 ,0 );	
	--face
	SC_AddSelectItem4CreateAvatar( 1 , "1", 1);
	SC_AddSelectItem4CreateAvatar( 1 , "2", 8);
	SC_AddSelectItem4CreateAvatar( 1 , "3", 15);
	SC_AddSelectItem4CreateAvatar( 1 , "4", 22);
	SC_AddSelectItem4CreateAvatar( 1 , "5", 29);	
	SC_AddSelectItem4CreateAvatar( 1 , "6", 36);
	SC_AddSelectItem4CreateAvatar( 1 , "7", 43);	

	SC_SelectItem4CreateAvatar( 1 ,0 );			
	

	--hair
	SC_AddSelectItem4CreateAvatar( 2 , "1", 0);
	SC_AddSelectItem4CreateAvatar( 2 , "2", 5);
	SC_AddSelectItem4CreateAvatar( 2 , "3", 10);	
	SC_AddSelectItem4CreateAvatar( 2 , "4", 15);
	SC_AddSelectItem4CreateAvatar( 2 , "5", 20);
	SC_SelectItem4CreateAvatar( 2 ,0 );		
	
	

	SC_AddSelectItem4CreateAvatar( 3 , "Brave", 0);
	SC_AddSelectItem4CreateAvatar( 3 , "Wisdom", 1);
	SC_AddSelectItem4CreateAvatar( 3 , "Faith", 2);	
	SC_AddSelectItem4CreateAvatar( 3 , "Justice", 3);	
	SC_AddSelectItem4CreateAvatar( 3 , "Liberty", 4);			
	SC_SelectItem4CreateAvatar( 3 ,random( 0 , 4) );		

	--bonestone
	SC_AddSelectItem4CreateAvatar( 4 , "Garnet", 0);
	SC_AddSelectItem4CreateAvatar( 4 , "Amethyst", 1);
	SC_AddSelectItem4CreateAvatar( 4 , "Aquamarine", 2);
	SC_AddSelectItem4CreateAvatar( 4 , "Diamond", 3);
	SC_AddSelectItem4CreateAvatar( 4 , "Emerald", 4);
	SC_AddSelectItem4CreateAvatar( 4 , "Pearl", 5);
	SC_AddSelectItem4CreateAvatar( 4 , "Rubi", 6);
	SC_AddSelectItem4CreateAvatar( 4 , "Peridot", 7);
	SC_AddSelectItem4CreateAvatar( 4 , "Sapphire", 8);
	SC_AddSelectItem4CreateAvatar( 4 , "Opal", 9);
	SC_AddSelectItem4CreateAvatar( 4 , "Topaz", 10);
	SC_AddSelectItem4CreateAvatar( 4 , "Turquoise", 11);
	
	SC_SelectItem4CreateAvatar( 4 ,0 );	
end

function LeaveCreateAvatar()
	hCamera = SC_FindNode("motion_camera")
	hMotion = SC_GetMotion( hCamera )	
	SC_AttachMotion( hCamera, 0 );
	SC_UnloadNode( hMotion );
	
	
	hModel = SC_FindNode("Default")
	hMotion = SC_GetMotion( hModel )
	SC_AttachMotion( hModel, 0 )
	SC_UnloadNode( hMotion )
	
	
	hMotion = SC_LoadMotion( "LeaveCreateAvatarCameraMotion","3DData\\Title\\Camera01_OutCreate01.zmo", 1, 4, 3, 1, 0 )
	SC_AttachMotion( hCamera, hMotion );
	SC_SetRepeatCount( hCamera, 1 );	
	SC_ControlAnimation( hCamera, 1 );
    	SC_SetCameraDefault( hCamera );
	
	SC_RemoveCreateAVT("Default")
end

-- 이벤트 핸들러
function OnChangeRace()
end

function OnChangeSex( sex )
	SC_RemoveCreateAVT( "Default" );

	hAVT = SC_AddCreateAVT( "Default", sex, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 )	
	SC_SetModelPosition( hAVT, 520005, 520018, 747 )
	SC_SetModelDirection( hAVT, 180 )
	SC_SetScale( hAVT, 1.5, 1.5, 1.5 )
	SC_AttachMotion( hAVT, hCreateAvatarMotion )
	--hair의 경우 남녀 개수가 다르다
	--SC_ClearSelectItem4CreateAvatar( 2 );
	--if sex == 0 then
	--	SC_AddSelectItem4CreateAvatar( 2 , "1", 0)
	--	SC_AddSelectItem4CreateAvatar( 2 , "2", 5)
	--	SC_AddSelectItem4CreateAvatar( 2 , "3", 10)	
	--else
	--	SC_AddSelectItem4CreateAvatar( 2 , "1", 0)
	--	SC_AddSelectItem4CreateAvatar( 2 , "2", 5)
	--end
	--sex만 빼고 다른 것들은 맨위로 
	SC_SelectItem4CreateAvatar( 1 ,0 );				
	SC_SelectItem4CreateAvatar( 2 ,0 );			
	--SC_SelectItem4CreateAvatar( 4 ,0 );			
				
end


function OnChangeHair( hair )
	SC_SetAvatarHair( "Default", hair );
end

function OnChangeFace( face )
	SC_SetAvatarFace( "Default", face );
end

AvatarPositions = {}
AvatarPos1 = { 520500, 520500, 100 }
AvatarPos2 = { 520270, 520653, 100 }
AvatarPos3 = { 520000, 520707, 100 }
AvatarPos4 = { 519730, 520653, 100 }
AvatarPos5 = { 519500, 520500, 100 }

AvatarPositions[1] = AvatarPos1
AvatarPositions[2] = AvatarPos2	
AvatarPositions[3] = AvatarPos3
AvatarPositions[4] = AvatarPos4
AvatarPositions[5] = AvatarPos5

function OnCreateSelectAvatar( index, name, sex, face, hair, helmet, armor,gauntlet,boots,faceitem,knapsack,rweapon, lweapon, deleteRemainTime )
	hAVT = SC_AddCreateAVT( name, sex, face, hair, helmet, armor, gauntlet, boots, faceitem, knapsack, 0 , 0 )
	SC_SetModelPosition( hAVT, AvatarPositions[index+1][1], AvatarPositions[index+1][2], AvatarPositions[index+1][3] );
	SC_SetScale( hAVT, 1.5, 1.5, 1.5 )
	SC_SetModelDirection( hAVT, 180 )
	if deleteRemainTime == 1 then
		SC_SetAvatarMotionByIndex( name, 6 )
	end
end

--prev :기존에 선택되었던 아바타가 있을경우 그 아바타의 이름
--now  :지금 선택된 아바타의 이름
function OnSelectAvatar( index, now, sex, prev , prevdeleteState,nowdeleteState )
	index = index + 1
	if prev ~= 0 and prevdeleteState == 0 then
		SC_SetAvatarMotionByIndex( prev, 1 );
	end
	
	if nowdeleteState == 0 then
		hModel = SC_FindNode( now )
		SC_AttachMotion( hModel, hSelectedAvatarMotion )
		SC_SetRepeatCount( hModel, 1 )	
	end
end

function OnSelectAvatarMotionEnd( name )
	SC_SetAvatarMotionByIndex( name, 1 )
end


-- 퀘스트 상태 리턴하는 함수
-- @return 0 : 해당 퀘스트 없음
--         1 : 수행할수 있는 퀘스트가 있다
--	   2 : 수행중인 퀘스트가 있다
--	   3 : 완료한 퀘스트가 있다
function SC_QF_GetNpcQuestStatus( npcindex )

--코넬
	if npcindex == 1001 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 202 ) >= 0 then
		    return 2	
		end

		-- 사라진 아이들 종료
		if SC_QF_findQuest( 212 ) >= 0 then
		    return 3
		end

		-- 영혼의 결정석 최초 시작
		if SC_QF_getEpisodeVAR(1) == 3 then
		    return 1	
		end

		-- 영혼의 결정석 재시작
		if SC_QF_findQuest( 215 ) == -1
		  and SC_QF_findQuest( 216 ) == -1
		  and SC_QF_findQuest( 217 ) == -1
		  and SC_QF_findQuest( 218 ) == -1
		  and SC_QF_findQuest( 219 ) == -1
		  and SC_QF_findQuest( 220 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 6  then
			    return 1
		end

		-- 영혼의 결정석 종료
		if SC_QF_findQuest( 218 ) >= 0 then
		    return 3
		end
	
		return 0
	end


--레나
	if npcindex == 1014 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 202 ) >= 0 then
		    return 2	
		end

		-- 사라진 아이들 종료
		if SC_QF_findQuest( 213 ) >= 0 then
		    return 3
		end

		-- 영혼의 결정석 최초 시작
		if SC_QF_getEpisodeVAR(1) == 4 then
		    return 1	
		end

		-- 영혼의 결정석 재시작
		if SC_QF_findQuest( 215 ) == -1
		  and SC_QF_findQuest( 216 ) == -1
		  and SC_QF_findQuest( 217 ) == -1
		  and SC_QF_findQuest( 218 ) == -1
		  and SC_QF_findQuest( 219 ) == -1
		  and SC_QF_findQuest( 220 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 7  then
			    return 1
		end
		-- 영혼의 결정석 종료
		if SC_QF_findQuest( 219 ) >= 0 then
		    return 3
		end

		return 0
	end
	
--키누	
	if npcindex == 1010 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 202 ) >= 0 then
		    return 2	
		end

		-- 사라진 아이들 종료
		if SC_QF_findQuest( 214 ) >= 0 then
		    return 3
		end

		-- 영혼의 결정석 최초 시작
		if SC_QF_getEpisodeVAR(1) == 5 then
		    return 1	
		end

		-- 영혼의 결정석 재시작
		if SC_QF_findQuest( 215 ) == -1
		  and SC_QF_findQuest( 216 ) == -1
		  and SC_QF_findQuest( 217 ) == -1
		  and SC_QF_findQuest( 218 ) == -1
		  and SC_QF_findQuest( 219 ) == -1
		  and SC_QF_findQuest( 220 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 8  then
			    return 1
		end
		-- 영혼의 결정석 종료
		if SC_QF_findQuest( 220 ) >= 0 then
		    return 3
		end

		return 0
	end

--람파	
	if npcindex == 1016 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 203 ) >= 0 or 
	           SC_QF_findQuest( 204 ) >= 0 or
	           SC_QF_findQuest( 205 ) >= 0 then
		    return 2	
		end

		return 0
	end

--스페로
	if npcindex == 1011 then
		-- 영혼의 결정석 진행중
		if SC_QF_findQuest( 215 ) >= 0 then
		    return 2	
		end

		return 0
	end

--트리테
	if npcindex == 1006 then
		-- 영혼의 결정석 진행중
		if SC_QF_findQuest( 216 ) >= 0 or
		   SC_QF_checkQuestCondition( "218_00" ) == 1 or 
		   SC_QF_checkQuestCondition( "217_03" ) == 1 then
		    return 2	
		end

		return 0
	end

--체니
	if npcindex == 1018 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 206 ) >= 0 then
		    return 2	
		end

		return 0
	end

--샤리
	if npcindex == 1019 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 207 ) >= 0 then
		    return 2	
		end

		return 0
	end

--아리사
	if npcindex == 1020 then
		-- 사라진 아이들 진행중
		if SC_QF_findQuest( 208 ) >= 0 then
		    return 2	
		end

		return 0
	end

-- 프란시
	if npcindex == 1003 then
	        -- 사라진 아이들 최초 시작
		if SC_QF_checkQuestCondition( "202-00" ) == 1 then
			 return 1	
		end
	
		-- 사라진 아이들 재시작
		if SC_QF_findQuest( 202 ) == -1
		  and SC_QF_findQuest( 203 ) == -1
		  and SC_QF_findQuest( 204 ) == -1
		  and SC_QF_findQuest( 205 ) == -1
		  and SC_QF_findQuest( 206 ) == -1
		  and SC_QF_findQuest( 207 ) == -1
		  and SC_QF_findQuest( 208 ) == -1
		  and SC_QF_findQuest( 209 ) == -1
		  and SC_QF_findQuest( 210 ) == -1
		  and SC_QF_findQuest( 211 ) == -1
		  and SC_QF_findQuest( 212 ) == -1
		  and SC_QF_findQuest( 213 ) == -1
		  and SC_QF_findQuest( 214 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 2  then
			return 1
		end

		return 0
	end

--란크
	if npcindex == 1034 then
		-- 치유의 손 진행중
		if SC_QF_checkQuestCondition( "107-01" ) == 1 then
			 return 2	
		end

		return 0
	end

--포니
	if npcindex == 1035 then
		-- 치유의 손 진행중
		if SC_QF_checkQuestCondition( "107-02" ) == 1 then
			 return 2	
		end

		return 0
	end

--세이온
	if npcindex == 1036 then
		-- 공포의 전염병 진행중
		if SC_QF_findQuest( 101 ) >= 0 then
			 return 2	
		end

		return 0
	end

--마에드
	if npcindex == 1037 then
		-- 공포의 전염병 시작
		if SC_QF_findQuest( 101 ) == -1
		    and SC_QF_checkQuestCondition( "101-01" ) == 1 then
			 return 1	
		end

		-- 공포의 전염병 재시작
		if SC_QF_findQuest( 101 ) == -1
		  and SC_QF_findQuest( 102 ) == -1
		  and SC_QF_findQuest( 103 ) == -1
		  and SC_QF_findQuest( 104 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 10  then
			    return 1
		  end

		-- 공포의 전염병 진행중
		if SC_QF_findQuest( 103 ) >= 0 or
		   SC_QF_checkQuestCondition( "106-01" ) == 1 or 
		   SC_QF_findQuest( 228 ) >= 0 then 
			 return 2	
		end

		-- 공포의 전염병 완료		
		if SC_QF_checkQuestCondition( "107-03" ) == 1 or 
		   SC_QF_checkQuestCondition( "107-05" ) == 1 or 
	           SC_QF_findQuest( 230 ) >= 0 then  
			 return 3	
		end
	
		-- 이카네스교의 흔적 재시작
		if SC_QF_findQuest( 231 ) == -1   
		  and SC_QF_findQuest( 232 ) == -1
		  and SC_QF_findQuest( 233 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 14  then
		    return 1
		end

		return 0
	end

--카리테
	if npcindex == 1053 then
		-- 공포의 전염병 완료
		if SC_QF_findQuest( 104 ) >= 0 then 		   
			 return 3	
		end

		-- 치유의 손 재시작
		  if SC_QF_findQuest( 105 ) == -1   
		  and SC_QF_findQuest( 106 ) == -1
		  and SC_QF_findQuest( 107 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 11  then
	               return 1
		  end

		-- 치유의 손 진행중
		if SC_QF_findQuest( 104 ) >= 0 or
	   	   SC_QF_checkQuestCondition( "106-02" ) == 1 or 
		   SC_QF_checkQuestCondition( "105-01" ) == 1 or 
		   SC_QF_findQuest( 223 ) >= 0 or    
		   SC_QF_findQuest( 225 ) >= 0 or 
                   SC_QF_findQuest( 227 ) >= 0 then
			 return 2	
		end

		return 0
	end

--마에라드
	if npcindex == 1032 then
		-- 이카네스교의 흔적 진행중
		if SC_QF_findQuest( 231 ) >= 0 then
			 return 2	
		end
		
		-- 이카네스교의 흔적 완료
		if SC_QF_findQuest( 233 ) >= 0 then
			 return 3	
		end

		return 0
	end

--패론
	if npcindex == 1511 then
		-- 이카네스교의 흔적 진행중
		if SC_QF_findQuest( 232 ) >= 0 then
			 return 2	
		end

		return 0
	end

--이츠
	if npcindex == 1100 then
		-- 이카네스교의 흔적 진행중
		if SC_QF_findQuest( 233 ) >= 0 then
			 return 2	
		end

		return 0
	end

--고다인
	if npcindex == 1109 then
		-- 이카네스교의 흔적 진행중
		if SC_QF_findQuest( 232 ) >= 0 then
			 return 2	
		end

		return 0
	end

--샤링
	if npcindex == 1013 then
		-- 붉은 복장의 남자 시작
		if SC_QF_checkQuestCondition( "223-01" ) == 1 then
		    return 1	
		end

		-- 붉은 복장의 남자 재시작  
		if SC_QF_findQuest( 223 ) == -1   
		  and SC_QF_findQuest( 224 ) == -1
		  and SC_QF_findQuest( 225 ) == -1
		  and SC_QF_findQuest( 226 ) == -1
		  and SC_QF_findQuest( 227 ) == -1
		  and SC_QF_findQuest( 228 ) == -1
		  and SC_QF_findQuest( 229 ) == -1
		  and SC_QF_findQuest( 230 ) == -1
		  and SC_QF_getEpisodeVAR(1) == 13  then
		    return 1
		end
	
		return 0
	end

	return 0

end