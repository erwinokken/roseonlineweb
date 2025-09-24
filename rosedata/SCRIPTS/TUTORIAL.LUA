-- functions

-- eDialogType
-- {
-- 	DLG_TYPE_MENU
-- 	DLG_TYPE_CHAR
-- 	DLG_TYPE_ITEM
-- 	DLG_TYPE_SKILL
-- 	DLG_TYPE_QUEST
-- 	DLG_TYPE_COMMUNITY
-- 	DLG_TYPE_CLAN
-- 	DLG_TYPE_HELP
-- 	DLG_TYPE_OPTION
-- }
-- eButton
-- {
--	MENU_BTN_CHAR
--	MENU_BTN_ITEM
--	MENU_BTN_SKILL
--	MENU_BTN_QUEST
--	MENU_BTN_COMMUNITY
--	MENU_BTN_CLAN
--	MENU_BTN_HELP
--	MENU_BTN_INFO
--	MENU_BTN_OPTION
--	MENU_BTN_EXIT
-- }
--
-- SC_OpenDialog ( eDialogType )
-- SC_SetButtonBlink( eDialogType, eButton )
-- SC_AddNpcIndicator ( npcno, auto_remove ) --npcno(중복 가능), auto_remove: 1(대화시도시 자동삭제:중복된모든), 0(스크립트 호출로 수동삭제)
-- SC_RemoveNpcIndicator ( npcno ) -- 중복시 중복 개수만큼 호출 필요
-- SC_AddCoordinatesIndicator ( index, zoneno, x, y ) -- index 중복불가
-- SC_RemoveCoordinatesIndicator ( index ) -- Add시 설정된 index


-- Tutorial 02
-- 2 레벨로 승급
function Tutorial02( iOwnerIndex )	
	SC_ShowTutorialImage("3Ddata/Tutorial/11.dds", 180, 123, 0.3, 2.5, 3, 0);
	SC_ShowNotifyMessage( 2 );
	SC_OpenDialog ( DLG_TYPE_MENU )
	SC_SetButtonBlink( DLG_TYPE_MENU, MENU_BTN_CHAR )
end

-- Tutorial 03
-- 2레벨 경험치 150 이상이 되었을때
function Tutorial03( iOwnerIndex )	
	SC_ShowNotifyMessage( 3 );
end

-- Tutorial 04
-- 2레벨 경험치 220 이상이 되었을때
function Tutorial04( iOwnerIndex )	
	SC_ShowTutorialImage("3Ddata/Tutorial/12.dds", 180, 150, 0.3, 2.5, 3, 0);
	SC_ShowNotifyMessage( 4 );
	SC_OpenDialog ( DLG_TYPE_MENU )
	SC_SetButtonBlink( DLG_TYPE_MENU, MENU_BTN_SKILL )
end

-- Tutorial 05
-- 3레벨로 승급
function Tutorial05( iOwnerIndex )	
	SC_ShowNotifyMessage( 5 );
end

-- Tutorial 06
-- 3레벨 경험치 100 이상이 되었을때
function Tutorial06( iOwnerIndex )	
	SC_ShowNotifyMessage( 6 );
end

-- 5051 퀘스트를 받았을때 버튼 생성
function Tutorial07button()
	SC_ShowTutorialImage("3Ddata/Tutorial/08.dds", 6, 125, 0.3, 6.5, 7, 0);	
	SC_CreateEventButton( 7 )
end

-- Tutorial 07
-- 5051 퀘스트를 받았을때
function Tutorial07( iOwnerIndex )	
	SC_ShowTutorialImage("3Ddata/Tutorial/09.dds", 180, 183, 0.3, 2.5, 3, 0);
	SC_ShowNotifyMessage( 7 );
	SC_OpenDialog ( DLG_TYPE_MENU )
	SC_SetButtonBlink( DLG_TYPE_MENU, MENU_BTN_QUEST )
end

-- Tutorial 08
-- 4레벨로 승급
function Tutorial08( iOwnerIndex )	
	SC_ShowNotifyMessage( 8 );
end

-- T-warp 트리거 수행후 버튼 생성
function Tutorial09button()	
	SC_ShowTutorialImage("3Ddata/Tutorial/10.dds", 6, 125, 0.3, 14.5, 15, 0);
-- 처음 모험가 마을로 갔을 때 부활 위치 지정
	SC_GF_setRevivePosition(); 
-- 부활 위치 지정이 되었는지 월드스위치로 체크
        SC_QF_doQuestTrigger( "t-warp-check" )

end

-- Notify 01
function Notify01( iOwnerIndex )	
	SC_ShowNotifyMessage( 3 );
end

-- HeroQuest01
-- 1-Hero-01 퀘스트 시작(아루아의 요정 대화)
function HeroQuest01( iOwnerIndex )	
      if SC_QF_checkQuestCondition( "201-00" ) == 1 then
  	 	SC_QF_doQuestTrigger( "201-00" )
      end 
end

-- HeroQuest01
-- 1-Hero-01 퀘스트 종료(다음 알림버튼 호출)
function HeroQuest01Button( iOwnerIndex )	
     SC_CreateEventButton( 21 ) 
end

-- HeroQuest02
-- 1-Hero-02 퀘스트 시작(아루아의 요정 대화)
function HeroQuest02( iOwnerIndex )	
      if SC_QF_checkQuestCondition( "100-00" ) == 1 then
  	 	SC_QF_doQuestTrigger( "100-00" )
      end 
end

-- HeroQuest02
-- 1-Hero-02 퀘스트 종료(다음 알림버튼 호출)
function HeroQuest02Button( iOwnerIndex )	
     SC_CreateEventButton( 22 ) 
end

-- HeroQuest03
-- 1-Hero-03 퀘스트 시작(아루아의 요정 대화)
function HeroQuest03( iOwnerIndex )	
      if SC_QF_checkQuestCondition( "222-00" ) == 1 then
  	 	SC_QF_doQuestTrigger( "222-00" )
      end 
end

-- HeroQuest03
-- 1-Hero-02 퀘스트 종료(최종 알림버튼 호출)
function HeroQuest03Button( iOwnerIndex )	
     SC_CreateEventButton( 23 ) 
end

-- HeroQuest03
-- 1-Hero-03 퀘스트 종료(아루아의 요정 대화)
function HeroQuest03end( iOwnerIndex )	
      if SC_QF_checkQuestCondition( "233-03" ) == 1 then
  	 	SC_QF_doQuestTrigger( "233-03" )
      end 
end

function InitTutorialEvent()
	
end


iPrevEXP = 0;
iPrevLevel = 0;
iInitPrevEXP = 0;
iStartLevel1Event = 0;	-- 1렙 경험치0 일때 이벤트를 여러번 발생시키지 않기 위해.
iStartHeroQuest = 0;    -- 히어로 퀘스트 시작 이벤트를 여러번 발생하지 않기 위해. 

-- CheckTutorialEvent
function CheckTutorialEvent()

	if iInitPrevEXP == 0 then
		iPrevEXP = SC_GetAvatarEXP();
		iPrevLevel = SC_GetAvatarLEVEL();
		iInitPrevEXP = 1;
	end

	iAvatarExp 	= SC_GetAvatarEXP();
	iAvatarLEVEL 	= SC_GetAvatarLEVEL();

	-- 히어로 퀘스트 시작 체크(1-Hero-01)
	if (iStartHeroQuest == 0) and (SC_QF_checkQuestCondition( "201-00" ) == 1) 
	then
		SC_CreateEventButton( 20 ) -- 히어로 퀘스트 시작 알림버튼 생성	 	
	
		iStartHeroQuest = 1
	end

	-- 처음 접속시( 1레벨 경험치 0 )일경우
	if ( iStartLevel1Event == 0 ) and ( iAvatarLEVEL == 1 ) and ( iAvatarExp == 0 ) then	
		SC_ShowTutorialImage("3Ddata/Tutorial/01.dds", 6, 125, 0.3, 4.5, 5, 0);
		SC_ShowTutorialImage("3Ddata/Tutorial/02.dds", 6, 125, 0.3, 9.5, 10, 1);

		SC_GF_setRevivePosition() -- 처음 시작시 현재 위치(탄생의 섬)로 부활 위치 지정

		iStartLevel1Event = 1
	end

	--2 레벨이 되었을 때
	if ( iAvatarLEVEL == 2 ) and ( iPrevLevel < 2 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/08.dds", 6, 125, 0.3, 14.5, 15, 0);
	end
	
	--2 레벨 경험치 150 이상 되었을때
	if ( iAvatarLEVEL == 2 ) and ( iAvatarExp >= 150 ) and ( iPrevEXP < 150 ) then
		SC_CreateEventButton( 3 )
	end
	
	--2 레벨 경험치 220 이상 되었을때
	if ( iAvatarLEVEL == 2 ) and ( iAvatarExp >= 220 ) and ( iPrevEXP < 220 ) then
		SC_CreateEventButton( 4 )
	end
	
	--3 레벨 경험치 100 이상 되었을때
	if ( iAvatarLEVEL == 3 ) and ( iAvatarExp >= 100 ) and ( iPrevEXP < 100 ) then
		SC_CreateEventButton( 6 );
	end

	
	--4 레벨이 되었을 때
	if ( iAvatarLEVEL == 4 ) and ( iPrevLevel < 4 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);
		
		-- 3번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_3" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_3" )
		  end
	end
	
	--5 레벨이 되었을 때
	if ( iAvatarLEVEL == 5 ) and ( iPrevLevel < 5 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);

		-- 4번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_4" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_4" )
		  end
	end
	
	--6 레벨이 되었을 때
	if ( iAvatarLEVEL == 6 ) and ( iPrevLevel < 6 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);
	
		-- 5번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_5" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_5" )
		  end
	end
	
	--7 레벨이 되었을 때
	if ( iAvatarLEVEL == 7 ) and ( iPrevLevel < 7 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);

		-- 6번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_6" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_6" )
		  end
	end
		
	--8 레벨이 되었을 때
	if ( iAvatarLEVEL == 8 ) and ( iPrevLevel < 8 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);

		-- 7번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_7" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_7" )
		  end
	end
		
	--9 레벨이 되었을 때
	if ( iAvatarLEVEL == 9 ) and ( iPrevLevel < 9 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/13.dds", 6, 125, 0.3, 14.5, 15, 0);

		-- 8번 튜토리얼 퀘스트 실행
		  if SC_QF_checkQuestCondition( "Tutorial_8" ) == 1 then
		  SC_QF_doQuestTrigger( "Tutorial_8" )
		  end
	end
	
	--10 레벨이 되었을 때
	if ( iAvatarLEVEL == 10 ) and ( iPrevLevel < 10 ) then
		SC_ShowTutorialImage("3Ddata/Tutorial/14.dds", 6, 125, 0.3, 14.5, 15, 0);
	end
		
	
	-- 모든 처리후 iPrevEXP를 현재 경험치로 세팅해서 다음 프레임에서 경험치의 변화를 관찰한다.
	iPrevEXP = SC_GetAvatarEXP();
 	iPrevLevel = SC_GetAvatarLEVEL(); 
end




--SC_RunEvent : NPC 대화창
--SC_RunEventFieldWarp : Warp gate
--SC_RunEventObjectEvent


-- 메인에피소드 퀘스트 이벤트 오브젝트

-- 버섯 앞 이벤트
function mushroom( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object002.con", -1 );
end

-- 모래시계 이벤트
function sandglass( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object003.con", -1 );
end

-- 무서운 책 이벤트
function horriblebook( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object004.con", -1 );
end

-- 피라미드 이벤트01
function piramid01( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object005.con", -1 );	
end

-- 피라미드 이벤트02
function piramid02( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object006.con", -1 );
end

-- 올빼미의 눈
function owl( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object007.con", -1 );
end

-- 피라미드 이벤트03
function piramid03( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object005.con", -1 );
end

-- 고요한 협곡 마나
function mana( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object008.con", -1 );
end

-- 겐지스톤
function genzistone( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object009.con", -1 );
end

-- 정화된 래키
function purgerackie( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object010.con", -1 );
end

-- 버섯앞 이벤트 2(1-hero-03 : 정체불명의 남자 퀘스트)
function mushroom2( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 2200, "3Ddata\\Event\\Object011.con", -1 );
end

-----------------------------------------------------------------------------
-------------------------- 튜토리얼 관련 스크립트 시작 ----------------------
-----------------------------------------------------------------------------

-- 탄생의 섬 사냥 튜토리얼 시작 이벤트

function Tutorial_Move( iObject, iState, bJustEnd )
	SC_ShowTutorialImage("3Ddata/Tutorial/03.dds", 6, 125, 0.3, 6.5, 7, 0);
	SC_ShowTutorialImage("3Ddata/Tutorial/04.dds", 6, 125, 0.3, 9, 10, 1);
end

-- 탄생의 섬 사냥 튜토리얼 완료 이벤트

function Tutorial_Hunt( iObject, iState, bJustEnd )
	SC_ShowTutorialImage("3Ddata/Tutorial/05.dds", 6, 125, 0.3, 6.5, 7, 0);
	SC_ShowTutorialImage("3Ddata/Tutorial/06.dds", 6, 125, 0.3, 9, 10, 1);
end

-- 탄생의 섬 아루아의 요정과 대화 튜토리얼 완료 이벤트

function Tutorial_talk( iObject, iState, bJustEnd )
	SC_ShowTutorialImage("3Ddata/Tutorial/07.dds", 6, 125, 0.3, 14.5, 15, 0);
end


-----------------------------------------------------------------------------
------------------------ 히어로 퀘스트 관련 스크립트 시작 -------------------
-----------------------------------------------------------------------------

-- 1-hero-01 시작 아루아 이벤트

function start_1_hero_01( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 1030, "3Ddata\\Event\\EM99-001.con", -1 );
end

-- 1-hero-02 시작 아루아 이벤트

function start_1_hero_02( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 1030, "3Ddata\\Event\\EM99-002.con", -1 );
end

-- 1-hero-03 시작 아루아 이벤트

function start_1_hero_03( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 1030, "3Ddata\\Event\\EM99-003.con", -1 );
end

-- 1-hero-03 완료 아루아 이벤트

function start_1_hero_03end( iObject, iState, bJustEnd )
	iIndex = SC_GetEventObjectIndex( iObject );
	SC_RunEventObjectEvent( 1030, "3Ddata\\Event\\EM99-004.con", -1 );
end
