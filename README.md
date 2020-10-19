## Usage

First, change settings in CONFIG.local to match your addon's use case. You should also change src/addon.json.

To build a GMA archive from your addon's sources (located in src/), run `make dist`

To upload the addon to the workshop for the first time, run `make upload`

To update the addon, run `make publish`. Make sure to add your change notes to RELEASE.

To create a link in your gmod folder, run `make install`.
