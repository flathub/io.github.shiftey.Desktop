Flatpak manifest for GitHub Desktop app
=======================================

This repository contains the files to create a Flatpak version of the [GitHub Desktop](https://desktop.github.com/) Git client.

It is based on [this fork](https://github.com/shiftkey/desktop) which contains extra work for better Linux integration, that is, for now, not official.

Installation
------------

To build and install this Flatpak, you have to [install Flatpak, Flatpak builder and the Flathub repo](https://flatpak.org/setup/). Don't forget to initialize this repo submodules. Then run:

```sh
flatpak-builder build io.github.shiftey.Desktop.yaml --repo=repo --install --force-clean --install-deps-from=flathub
```

Once installed, launch GitHub Desktop by running:

```sh
flatpak run io.github.shiftey.Desktop
```

Updating `desktop` repo and dependencies
----------------------------------------

Flatpak builder doesn't allow the build scripts to access the internet, so you have to download all the required dependencies beforehand. These dependencies are listed in the `generated-sources.json` file. That's the reason we have a fixed commit for building `desktop` repo, since that can guarantee that `generated-sources.json` dependencies match with the version of `desktop` we are building.

To update `desktop` repo to its latest commit and update the dependencies, you have to:

1. Clone [https://github.com/shiftkey/desktop](https://github.com/shiftkey/desktop) inside this repo.
2. Change the commit in `io.github.shiftey.Desktop.yaml` to the desired one:

    ```yaml
    ...
          - type: git
            url: https://github.com/shiftkey/desktop.git
            commit: <put the commit here>
    ...
    ```

3. Run `generate-sources` script to update `generated-sources.json`.

4. Make sure the patches in the `patches` directory still apply.

5. Once you are sure it works, make a PR with the changes.

Known Issues
------------

- `Show in your File Manager` does not open the file manager

    This happens because the default manager is not set in your environment. You need to add a default file manager to your `~/.config/mimeapps.list` file. If you are using nautilus, this can be done by adding `inode/directory=org.gnome.Nautilus.desktop` to the end of the `[Default Applications]` section.
