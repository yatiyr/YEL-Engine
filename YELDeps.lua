VK_SDK = os.getenv("VULKAN_SDK")

-- Directories we need to include
IncludeDir = {}
IncludeDir["VK_SDK"]          = "%{VK_SDK}/Include"
IncludeDir["GLFW"]            = "%{wks.location}/YEL/thirdparty/GLFW/include"
IncludeDir["stb_image"]       = "%{wks.location}/YEL/thirdparty/stb_image"
IncludeDir["tinyexr"]         = "%{wks.location}/YEL/thirdparty/tinyexr"
IncludeDir["entt"]            = "%{wks.location}/YEL/thirdparty/entt/include"
IncludeDir["yaml_cpp"]        = "%{wks.location}/YEL/thirdparty/yaml-cpp/include"
IncludeDir["ImGui"]           = "%{wks.location}/YEL/thirdparty/imgui"
IncludeDir["Implot"]          = "%{wks.location}/YEL/thirdparty/implot"
IncludeDir["ImGuizmo"]        = "%{wks.location}/YEL/thirdparty/ImGuizmo"
IncludeDir["ImGuiNodeEditor"] = "%{wks.location}/YEL/thirdparty/imgui-node-editor"
IncludeDir["Spdlog"]          = "%{wks.location}/YEL/thirdparty/spdlog"
 
-- Library directories to be linked
LibraryDir = {}
LibraryDir["VK_SDK"] = "%{VK_SDK}/Lib"

-- Libraries to be linked
Library = {}
Library["VK"]       = "%{LibraryDir.VK_SDK}/vulkan-1.lib"
Library["VK_UTILS"] = "%{LibraryDir.VK_SDK}/VkLayer_utils.lib"

Library["ShaderC_DBG"]          = "%{LibraryDir.VK_SDK}/shaderc_sharedd.lib"
Library["SPIRV_CROSS_DBG"]      = "%{LibraryDir.VK_SDK}/spirv-cross-cored.lib"
Library["SPIRV_CROSS_GLSL_DBG"] = "%{LibraryDir.VK_SDK}/spirv-cross-glsld.lib"
Library["SPIRV_TOOLS_DBG"]      = "%{LibraryDir.VK_SDK}/SPIRV-Toolsd.lib"

Library["ShaderC_REL"]          = "%{LibraryDir.VK_SDK}/shaderc_shared.lib"
Library["SPIRV_CROSS_REL"]      = "%{LibraryDir.VK_SDK}/spirv-cross-core.lib"
Library["SPIRV_CROSS_GLSL_REL"] = "%{LibraryDir.VK_SDK}/spirv-cross-glsl.lib"
Library["SPIRV_TOOLS_DBG"]      = "%{LibraryDir.VK_SDK}/SPIRV-Tools.lib"
