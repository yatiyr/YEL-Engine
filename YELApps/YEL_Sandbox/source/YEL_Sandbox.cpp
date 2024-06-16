#include <Yel.h>
#include <EntryPoint.h>


namespace YEL
{
    class YelSandbox : public Application
    {
    public:
        YelSandbox(AppCommandLineArguments args) : Application("Yel Sandbox", args)
        {

        }

        ~YelSandbox()
        {

        }
    };

    Application* CreateApplication(AppCommandLineArguments args)
    {
        return new YelSandbox(args);
    }
}