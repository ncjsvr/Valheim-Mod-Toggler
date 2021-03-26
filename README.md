# Valheim-Mod-Toggler
Simple Windows app (powershell) to quickly enable or disable Valheim mods.<br>
It edits the doorstop_config.ini file which is used to load mods when valheim launches.<br>
Mods can be enabled/disabled manually but this just speeds the process up a little bit.<br>
It is also useful for people who perhaps aren't confident in manually doing it.<br>

![image](https://user-images.githubusercontent.com/6819907/112623876-ca5d2180-8e24-11eb-925b-2df1ff157757.png)


<h1>Instructions</h1>
Usage depends on where your game is installed.<br>
If it is in the default location (C:\Program Files (x86)\Steam\steamapps\common\Valheim), you can go ahead and just run the exe from anywhere.<br>

If it is in a different location, i.e. another steam library. Follow these instructions:
<ul>
<li>Fork this repository or download as a zip.</li>
<li>Edit ValheimModToggler.ps1, change line 11 to where the Valheim folder is located on your PC.</li>
<li>Save the file, then either run CompiletoEXE.ps1 to create a simple exe to run, or you could run it by right clicking ValheimModToggler.ps1 and choosing "run with powershell".</li>
</ul>
