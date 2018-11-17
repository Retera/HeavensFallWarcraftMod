
function HornOfHonroHeroFilter takes nothing returns boolean
    return IsUnitEnemy(GetFilterUnit(),GetOwningPlayer(GetSpellAbilityUnit())) and IsUnitType(GetFilterUnit(),UNIT_TYPE_HERO)
endfunction

function HornOfHonroFilter takes nothing returns boolean
    return GetOwningPlayer(GetFilterUnit()) == GetOwningPlayer(GetSpellAbilityUnit())
endfunction

function HornOfHonroEnum takes nothing returns nothing
    call IssueTargetOrder(GetEnumUnit(),"attack",bj_lastCreatedUnit)
endfunction

function HornOfHonro takes nothing returns nothing
local unit cast = GetSpellAbilityUnit()
local group eHeroes = CreateGroup()
local group allies = CreateGroup()
local boolexpr b = Filter(function HornOfHonroFilter)
local boolexpr bh = Filter(function HornOfHonroHeroFilter)
call GroupEnumUnitsInRange(eHeroes,GetUnitX(cast),GetUnitY(cast),1200,bh)
call GroupEnumUnitsInRange(allies,GetUnitX(cast),GetUnitY(cast),1200,b)
set bj_lastCreatedUnit = FirstOfGroup(eHeroes)
call ForGroup(allies,function HornOfHonroEnum)
call CasterCastAbility(GetOwningPlayer(cast),'A0UH',"acidbomb",bj_lastCreatedUnit,true)

call DestroyGroup(eHeroes)
call DestroyGroup(allies)
call DestroyBoolExpr(b)
call DestroyBoolExpr(bh)

set cast = null
set eHeroes = null
set allies = null
set b = null
set bh = null 
endfunction

function initHornOfHonro takes nothing returns nothing
    call OnAbilityEffect('A0UI',"HornOfHonro")
endfunction
