project "OP_VulkanSandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "source/**.h",
	    "source/**.hpp",
        "source/**.cpp",        
        "source/**.c"
    }

    includedirs
    {
        "%{wks.location}/YEL/external/spdlog/include",
        "%{wks.location}/YEL/source/Config",
        "%{wks.location}/YEL/external",
        "%{wks.location}/YEL/src",
        "%{IncludeDir.ImGuizmo}",
        "%{IncludeDir.entt}",
        "source"
    }

    links
    {
        "YEL"
    }

    postbuildcommands
	{
	   '{COPY} "%{wks.location}/YELApps/YEL_Sandbox/resources" "%{cfg.targetDir}/resources"',
       '{COPY} "%{wks.location}/YELApps/YEL_Sandbox/assets" "%{cfg.targetdir}/assets"',
	}

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "YEL_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "YEL_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "YEL_RELEASE"
        runtime "Release"
        optimize "speed"

    filter "configurations:Dist"
        defines "YEL_DIST"
        runtime "Release"
        optimize "on"