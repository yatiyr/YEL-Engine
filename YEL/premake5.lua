project "OP"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "Precomp.h"
    pchsource "source/Config/Precomp.cpp"

    files
    {
        "source/**.h",
        "source/**.cpp",
        "source/**.hpp",
        "source/**.cpp",
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS",
        "GLFW_INCLUDE_VULKAN"
    }

    includedirs
    {
        "source",
        "source/Config",
        "%{IncludeDir.Spdlog}",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.ImGuiNodeEditor}",        
        "%{IncludeDir.Implot}",
        "%{IncludeDir.ImGuizmo}",        
        "%{IncludeDir.stb_image}",
        "%{IncludeDir.tinyexr}",
        "%{IncludeDir.entt}",
        "%{IncludeDir.yaml_cpp}",
        "%{IncludeDir.VK_SDK}"
    }

    links
    {
        "GLFW",
        "ImGui",
        "yaml-cpp",
        "%{Library.VK}"
    }

    filter "files:thirdParty/**.cpp"
    flags { "NoPCH" }

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

        links
        {
            "%{Library.ShaderC_DBG}",
            "%{Library.SPIRV_CROSS_DBG}",
            "%{Library.SPIRV_CROSS_GLSL_DBG}",
        }

    filter "configurations:Release"
        defines "YEL_RELEASE"
        runtime "Release"
        optimize "speed"

        links
        {
            "%{Library.ShaderC_REL}",
            "%{Library.SPIRV_CROSS_REL}",
            "%{Library.SPIRV_CROSS_GLSL_REL}",
        }        

    filter "configurations:Dist"
        defines "YEL_DIST"
        runtime "Release"
        optimize "on"

        links
        {
            "%{Library.ShaderC_REL}",
            "%{Library.SPIRV_CROSS_REL}",
            "%{Library.SPIRV_CROSS_GLSL_REL}"
        }                 