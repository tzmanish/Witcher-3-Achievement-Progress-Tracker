@addMethod(CR4Player)
private function aptInit() {
    var igconfig : CInGameConfigWrapper;
    igconfig = theGame.GetInGameConfigWrapper();

    if (
        !igconfig.GetVarValue('APTConfig', 'APTVersion') ||
        StringToFloat(igconfig.GetVarValue('APTConfig', 'APTVersion')) != 2.1f
    ) {
        igconfig.SetVarValue('APTConfig', 'APTEnabled', 2);
        igconfig.SetVarValue('APTConfig', 'APTTargetSelector', 3);
        igconfig.SetVarValue('APTConfig', 'APTIcon', 2);
        igconfig.SetVarValue('APTConfig', 'APTVersion', "2.1");
    }

    AddEffectDefault(EET_APT, NULL, 'modAPT');
}

@wrapMethod(CR4Player)
function OnSpawned( spawnData : SEntitySpawnData ) {
    wrappedMethod(spawnData);
    aptInit();
    LogApt("INITIALIZED");
}

@wrapMethod(W3GameEffectManager)
function HACK_NO_MEMORY_TO_COMPILE_CacheEffect_Part2(effect : EEffectType) : bool {
    var found: bool;

    found = wrappedMethod(effect);
    if(!found) {
        if(effect == EET_APT) {
            effects[effect] = new W3Effect_APT in this;
            found = true;
        }
    }

    return found;
}

@addMethod(W3GamerProfile)
public final function GetAchievementStatus(achievement: EAchievement): SAPTAchievementStatus {
    var i, j : int;
    var foundFTs: array<SAvailableFastTravelMapPin>;
    var response: SAPTAchievementStatus;

    response.achievement = achievement;
    response.achievementName = AchievementEnumToName(achievement);
    response.complete = theGame.IsAchievementUnlocked(response.achievementName);

    if(achievement == EA_Explorer) {
        foundFTs = theGame.GetCommonMapManager().GetFastTravelPoints(true, false, false, true, true);
        response.progress = foundFTs.Size();
        response.target = 100;
        return response;
    }
    
    for(i=0; i<statistics.Size(); i+=1) {
        for(j=0; j<statistics[i].registeredAchievements.Size(); j+=1) {
            if(statistics[i].registeredAchievements[j].type != achievement) continue;

            response.statName = StatisticEnumToName(statistics[i].statType);
            response.progress = FactsQuerySum(response.statName);
            response.target = CeilF(statistics[i].registeredAchievements[j].requiredValue);
            return response;
        }
    }

    return response;
}

@addMethod(CR4HudModuleBuffs)
public function APTUpdateBuffs() { 
    UpdateBuffs(); 
}
