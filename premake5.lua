workspace "YEL"
    architecture "x86_64"
    startproject "YEL_Sandbox"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

    flags
    {
        "MultiProcessorCompile"
    }

    outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

    group "YELCore"
        include "YEL"
    group ""

    group "YELApps"
        include "YELApps/YEL_Sandbox"
    group ""

    group "ThirdParty"
        include "YEL/thirdparty/glfw"
        include "YEL/thirdparty/imgui"
        include "YEL/thirdparty/stb_image"
        include "YEL/thirdparty/tinyexr"
        include "YEL/thirdparty/yaml-cpp"
    group ""

