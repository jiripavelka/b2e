# Box To Eclipse

> Manage multiple source folders in one Eclipse project

This script copies project source files from a synced Box folder into an Eclipse project. It keeps track of individual source folders using git branches and automatic committing.

## Requirements

 - Bash, version 3.2 and later
 - Git, version 1.8.0 and later

## Installation

1) Download the script or clone repository into your file system.

   Tip: Place the script into your `$PATH` (e.g. into `~/bin`).

## Setup and Usage

1) Make sure your Box folders are synced into your local drive, e.g. `hngu220` (source folder).

2) Create a new project in Eclipse, say `csc220` (destination folder).

3) Run the script whenever you need your project to contain current files from a Box folder.

   ```
   { ~ } » cd ~/eclipse-workspace/csc220
   { csc220 } » b2e ~/Box/hngu220
   ```

4) Refresh your Eclipse Package Explorer (F5)

## Contributing

Pull requests are welcome, don't hesitate to contribute.
