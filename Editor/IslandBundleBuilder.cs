﻿using System.IO;
using System;
using UnityEditor;
using UnityEngine;


//ASSET BUNDLE FOR CUSTOM ISLANDS BY FRANZFISCHER

public class BuildIslandBundleWindow : EditorWindow
{
	SceneAsset sceneSelector;

	// Add menu named "My Window" to the Window menu
	[MenuItem("Assets/Custom Islands/Build island bundle")]
	static void Init()
	{
		// Get existing open window or if none, make a new one:
		BuildIslandBundleWindow window = (BuildIslandBundleWindow)EditorWindow.GetWindow(typeof(BuildIslandBundleWindow));
		window.Show();
	}

	void OnGUI()
	{
		GUILayout.Label("Island bundle builder", EditorStyles.boldLabel);
		sceneSelector = (SceneAsset)EditorGUILayout.ObjectField("Select scene to export:", sceneSelector, typeof(SceneAsset), true);
		if (GUILayout.Button("Create Bundle!"))
		{
			if (sceneSelector == null)
			{
				Debug.LogError("FAILED TO BUILD BUNDLE. No Scene selected!");
				return;
			}

			Debug.Log("Building bundle from " + AssetDatabase.GetAssetOrScenePath(sceneSelector));
			AssetImporter assetImporter = AssetImporter.GetAtPath(AssetDatabase.GetAssetOrScenePath(sceneSelector));
			assetImporter.SetAssetBundleNameAndVariant(sceneSelector.name, "assets");
			assetImporter.SaveAndReimport();

			Debug.Log("BUILD BUNDLE");

			string assetBundleDirectory = "Assets/AssetBundles";
			if (!Directory.Exists(assetBundleDirectory))
			{
				Directory.CreateDirectory(assetBundleDirectory);
			}
			try
			{
				BuildPipeline.BuildAssetBundles(assetBundleDirectory, BuildAssetBundleOptions.StrictMode, BuildTarget.StandaloneWindows);
				DirectoryInfo d = new DirectoryInfo(assetBundleDirectory);
				File.Delete("Assets/AssetBundles/AssetBundles");
				foreach (var file in d.GetFiles("*.manifest"))
				{
					file.Delete();
				}
				foreach (var file in d.GetFiles("*.manifest.meta"))
				{
					file.Delete();
				}
				AssetDatabase.Refresh();
				EditorGUIUtility.PingObject(AssetImporter.GetAtPath("Assets/AssetBundles/" + sceneSelector.name + ".assets"));
				Debug.Log("<b>✔️ SUCCESSFULLY BUILT ASSETBUNDLES ✔️</b>");
			}
			catch (Exception e)
			{
				Debug.LogError("AN ERROR OCCURED WHILE BUILDING THE ASSETBUNDLES!\n" + e.ToString());
			}
		}
	}
}