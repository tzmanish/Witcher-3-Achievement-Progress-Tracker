# Achievement Progress Tracker

Tired of guessing when your counterattack streak broke?

Still wondering how many headshots stand between you and that elusive achievement?

No more guesswork - this mod turns grind into minigame, making every achievement a satisfying challenge to conquer.

## Supported achievements 
|Achievement |Description|
|-|-|
|Bombardier |Collect the formulae for 6 different bomb types. |
|Bookworm |Read 30 books, journals or other documents. |
|Can Quit Anytime I Want |Be under the influence of 7 potions or decoctions at the same time. |
|Can’t Touch This! |Kill 5 foes in a fight without taking damage (except for Toxicity) and without using the Quen Sign. |
|Environmentally Unfriendly |Kill 50 opponents using the environment (e.g. swamp gas, insects or objects). |
|Even Odds |Kill 2 monsters you have a contract on without using Signs, potions, mutagens, oils or bombs. |
|Fire in the Hole |Destroy 10 monster nests using bombs. |
|Humpty Dumpty |Kill 10 opponents by knocking them off somewhere high with the Aard Sign. |
|Kaer Morhen Trained |Perform 10 effective counterattacks in a row without getting hit or parrying. |
|Let’s Cook! |Learn 12 potion formulae. |
|Master Marksman |Kill 50 human and nonhuman opponents by striking them in the head with a crossbow bolt. |
|Moo-rderer |<details><summary>Spoiler</summary>Kill 20 cows.</details> |
|Overkill |Make an opponent suffer from bleeding, poisoning and burning simultaneously. Do this 10 times. |
|Rad Steez, Bro! |<details><summary>Spoiler</summary>Slide downhill uninterrupted for at least 10 seconds.</details> |
|Return to Sender |Kill 3 opponents with their own arrows. |
|That Is the Evilest Thing… |Ignite the gas produced by a Dragon’s Dream bomb using a burning opponent. Do this 10 times. |
|The Enemy of My Enemy |Use the Axii Sign to force one opponent to kill another. Do this 20 times. |
|Globetrotter |Discover 100 fast travel points. |

## Installation
### Option-A: Install using W3 mod manager.  
### Option-B: Manually -
1. Create a directory named `mods` in your Witcher 3 directory if you don't already have one.
2. Download and extract the mod archive.
3. Put the modAPT directory in your mods directory.
4. Copy `bin\config\r4game\user_config_matrix\pc\modAptConfig.xml`  
   Into `<W3 directory>\bin\config\r4game\user_config_matrix\pc\`
5. In the same directory, open your `dx11filelist.txt` (or `dx12filelist.txt`, whichever you are using), and add the following as a new line at the very end of the file:
    ```
    modAptConfig.xml;
    ```
6. Run Script Merger if you have any other mods installed.

## How to use this mod?
 1. Enable the mod in mod menu.
 2. Select the achievement you wish to Track.

## Localization
See `localization\readme.localization.md` for instructions on translating this mod into your language.

## Uninstallation
### Option-A: Uninstall using W3 mod manager.  
### Option-B: Manually -
1. Delete the `<W3 directory>\mods\modAPT` directory.
2. Delete `<W3 directory>\bin\config\r4game\user_config_matrix\pc\modAptConfig.xml`
3. In the same directory, remove `modAptConfig.xml;` from your filelists (`dx11filelist.txt` and `dx12filelist.txt`).

## Changelog
### 2.0_alpha
- Ported to 4.04.
- Alpha build - tested on a clean system (no other mods installed); your results may vary.
- Code cleanups and performance improvements.
- Uses script overrides to minimize merge conflicts with other mods.
- Added Globetrotter achievement support.
- Added debug messages to logs.

### 1.1_beta
- Secret achievements' descriptions hidden/removed.

### 1.0_beta
- Initial release.
