function LogApt(str: string) {
    LogChannel('APT', str);
}

function NotifyApt(str: string) {
    theGame.GetGuiManager().ClearNotificationsQueue();
    theGame.GetGuiManager().ShowNotification("[APT]" + str);
}

function BannerApt(str: string) {
    GetWitcherPlayer().DisplayHudMessage("[APT]" + str);
}

function GetAchievementLocalizedName(a : EAchievement): string {
    if(a == EA_FundamentalsFirst) return GetLocStringByKeyExt("EA_Ghost");
    return GetLocStringByKeyExt(NameToString(AchievementEnumToName(a)));
}

@addMethod(W3GamerProfile)
public final function GetProgressOfAllAchievements(): array<SAPTAchievementStatus> {
    var i, j : int;
    var foundFTs: array<SAvailableFastTravelMapPin>;
    var status: SAPTAchievementStatus;
    var response: array<SAPTAchievementStatus>;
    
    for(i=0; i<statistics.Size(); i+=1) {
        for(j=0; j<statistics[i].registeredAchievements.Size(); j+=1) {
            status.achievement = statistics[i].registeredAchievements[j].type;				
            status.progress = FactsQuerySum(StatisticEnumToName(statistics[i].statType));
            status.target = CeilF(statistics[i].registeredAchievements[j].requiredValue);
            status.achievementName = AchievementEnumToName(status.achievement);
            status.complete = theGame.IsAchievementUnlocked(status.achievementName);
            response.PushBack(status);
        }
    }
    
    status.achievement = EA_Explorer;
    foundFTs = theGame.GetCommonMapManager().GetFastTravelPoints(true, false, false, true, true);
    status.progress = foundFTs.Size();
    status.target = 100;
    status.achievementName = AchievementEnumToName(status.achievement);
    status.complete = theGame.IsAchievementUnlocked(status.achievementName);
    response.PushBack(status);

    return response;
}

exec function APT_PrintAll() {
    var i: int;
    var displayname: string;
    var notification: string;
    var status: array<SAPTAchievementStatus>;

    status = theGame.GetGamerProfile().GetProgressOfAllAchievements();
    LogApt("progress: ");
    for(i = 0; i < status.Size(); i += 1) {
        displayname = GetAchievementLocalizedName(status[i].achievement);
        notification = SpaceFill(displayname + " (" + status[i].achievement + ")", 60, ESFM_JustifyLeft) + ": " + NoTrailZeros(status[i].progress) + "/" + NoTrailZeros(status[i].target);
        if (status[i].complete) notification += " DONE!";
        LogApt(notification);
    }
}

// @wrapMethod(W3GamerProfile)
// function NoticeAchievementProgress(a : EAchievement, countNew : int, optional towards : int ) {
//     var notification: string;
    
//     notification = "progress: " + GetAchievementLocalizedName(a) + " (" + countNew + (towards? "/" + towards : "") + ")";
//     LogApt(notification);
//     NotifyApt(notification);
//     BannerApt(notification);
//     wrappedMethod(a, countNew, towards);
// }