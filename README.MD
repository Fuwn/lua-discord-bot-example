# A Lua Discord bot
A Discord bot made in Lua using the Discordia library.

## What is this?
This is a simple example of a Discord bot written in Lua using the [Discordia](https://github.com/SinisterRectus/Discordia) library.

## Usage
1. Clone repository.
2. Install [Luvit](https://luvit.io/).

Personally, I had some issues whilst trying to install Luvit. For whatever reason, when trying to install it via CMD, Powershell or Bash, all had their fair share of problems. Eventually, the way I installed it is opening the Powershell script file in from it's URL and inspecting what was going on.

First, the versions are declared to variables, at the time, the Luvi and Lit versions were **2.10.1** and **3.8.1** respectively. This will come in handy later. Then a check is performed;

```ps
if (test-path env:LUVI_ARCH) {
  $LUVI_ARCH = $env:LUVI_ARCH
} else {
  if ([System.Environment]::Is64BitProcess) {
    $LUVI_ARCH = "Windows-amd64"
  } else {
    $LUVI_ARCH = "Windows-ia32"
  }
}
```

Basically, this is checking for the correct distributable version depending on your operating system. I knew that my system corresponds with the amd64 architecture so I knew that the `$LUVI_ARCH` variable is equal to `Windows-amd64`.

Then an variable is set Luvi's download URL, the URL being https://github.com/luvit/luvi/releases/download/v$LUVI_VERSION/luvi-regular-$LUVI_ARCH.exe. However, the versions and my system discriminator comes in handy here, I can just replace those values in the URL so it would be safe to assume that my proper distributable would be https://github.com/luvit/luvi/releases/download/v2.10.1/luvi-regular-Windows-amd64.exe.

Directly after, a variable is also set for Lit's URL, that being https://lit.luvit.io/packages/luvit/lit/v$LIT_VERSION.zip, once again we can do a simple swap and we get out URL; https://lit.luvit.io/packages/luvit/lit/v3.8.1.zip.

Next, a function is created that will rename the downloaded files, we can just manually do this. Below you can see the renamed files in operation order;
1. **luvi-regular-Windows-amd64.exe** is renamed to **luvi.exe**.
2. **lit-3.8.1.zip** is renamed to **lit.zip**.

Finally, the last few steps are Powershell processes, these can also be executed manually. You can see them listed below in order;
1. `Start-Process ".\luvi.exe" -ArgumentList "lit.zip -- make lit.zip lit.exe luvi.exe" -Wait -NoNewWindow`
2. `Remove-Item "lit.zip"`
3. `Start-Process ".\lit.exe" -ArgumentList "make lit://luvit/luvit luvit.exe luvi.exe" -Wait -NoNewWindow`

However, if you don't want to go through this process, please just follow the install steps listed over at https://luvit.io/install.html according to your operating system. 🙂

3. Add the installed Luvit to your PATH.

Personally, (bare with me here) I made myself a folder called **luvit-2.17.0** then a folder called **/bin** within the initial folder and moved all the executables into that folder, finally, adding the **/bin**'s path to my PATH.

4. Install [Discordia](https://github.com/SinisterRectus/Discordia) library via `lit install SinisterRectus/discordia` inside the cloned repository's folder.
5. Replace the `PUT_TOKEN_HERE` field at the end of the file with your Discord Application's Bot token.
5. Run bot via `luvit bot.lua`!
6. Have fun.

### License
MIT