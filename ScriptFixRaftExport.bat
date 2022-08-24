@echo off

set /p raftgamepath=Where is Raft installed?
set /p exportedgamepath=Where are the game files exported?

set "monoscriptpath=%exportedgamepath%\Assets\MonoScript"
echo removing exported scripts from %monoscriptpath%. Hit enter to continue!

pause

RMDIR /S /Q "%monoscriptpath%\Autodesk.Fbx"
RMDIR /S /Q "%monoscriptpath%\com.unity.multiplayer-hlapi.Runtime"
RMDIR /S /Q "%monoscriptpath%\MeshExtension"
RMDIR /S /Q "%monoscriptpath%\Mono.Posix"
RMDIR /S /Q "%monoscriptpath%\NavMeshComponents"
RMDIR /S /Q "%monoscriptpath%\PathCreator"
RMDIR /S /Q "%monoscriptpath%\Sirenix.OdinInspector.Attributes"
RMDIR /S /Q "%monoscriptpath%\Tayx.Graphy"
RMDIR /S /Q "%monoscriptpath%\Unity.Analytics.DataPrivacy"
RMDIR /S /Q "%monoscriptpath%\Unity.Analytics.StandardEvents"
RMDIR /S /Q "%monoscriptpath%\Unity.Analytics.Tracker"
RMDIR /S /Q "%monoscriptpath%\Unity.Formats.Fbx.Runtime"
RMDIR /S /Q "%monoscriptpath%\Unity.Recorder"
RMDIR /S /Q "%monoscriptpath%\Unity.RemoteConfig"
RMDIR /S /Q "%monoscriptpath%\Unity.TextMeshPro"
RMDIR /S /Q "%monoscriptpath%\Unity.Timeline"

set "raftgamedatapath=%raftgamepath%\Raft_Data\Managed
echo COPYING FILES FROM %raftgamedatapath%

ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Autodesk.Fbx.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "com.unity.multiplayer-hlapi.Runtimed.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "MeshExtension.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Mono.Posix.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "NavMeshComponents.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "PathCreator.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Sirenix.OdinInspector.Attributes.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Tayx.Graphy.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.Analytics.DataPrivacy.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.Analytics.StandardEvents.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.Analytics.Tracker.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.Formats.Fbx.Runtime.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.Recorder.dll"
ROBOCOPY "%raftgamedatapath%" "%monoscriptpath%" "Unity.RemoteConfig.dll"
pause