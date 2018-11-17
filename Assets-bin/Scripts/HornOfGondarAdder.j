
function RetTrig_HornOfHonroGet_Conditions takes nothing returns boolean
    
    return IsUnitIdType(GetTrainedUnitType(),UNIT_TYPE_HERO)
endfunction

function RetTrig_HornOfHonroGet_Actions takes nothing returns nothing
    call UnitAddAbility(GetTrainedUnit(),'A0UI')
endfunction

function RetTrig_HornOfHonroGet2_Conditions takes nothing returns boolean
    
    return IsUnitType(GetSoldUnit(),UNIT_TYPE_HERO)
endfunction

function RetTrig_HornOfHonroGet2_Actions takes nothing returns nothing
    call UnitAddAbility(GetSoldUnit(),'A0UI')
endfunction

//==== Init Trigger HornOfHonroGet ====
function InitRetTrig_HornOfHonroGet takes nothing returns nothing
    local trigger trg_HornOfHonroGet = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trg_HornOfHonroGet, EVENT_PLAYER_UNIT_TRAIN_FINISH)
    call TriggerAddCondition(trg_HornOfHonroGet, Condition(function RetTrig_HornOfHonroGet_Conditions))
    call TriggerAddAction(trg_HornOfHonroGet, function RetTrig_HornOfHonroGet_Actions)
    set trg_HornOfHonroGet = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(trg_HornOfHonroGet, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(trg_HornOfHonroGet, Condition(function RetTrig_HornOfHonroGet2_Conditions))
    call TriggerAddAction(trg_HornOfHonroGet, function RetTrig_HornOfHonroGet2_Actions)
    set trg_HornOfHonroGet = null
endfunction

