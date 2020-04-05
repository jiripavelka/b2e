# Box To Eclipse

> Manage multiple source folders in one Eclipse project

This script copies project source files from a synced Box folder into an Eclipse project. It keeps track of individual source folders using git branches and automatic committing.

## Requirements

 - Bash, version 3.2 and later
 - Git, version 1.8.0 and later

## Installation

1) Download the script or clone repository into your file system, e.g. into `~/box2eclipse`.

2) You may place a link to the script into your `$PATH`, e.g. into `~/bin`.

   ```
   { ~ } » ln -s ~/box2eclipse/b2e ~/bin
   ```

## Prerequisites

1) Make sure your Box folders are synced into your local drive, say into `~/box`.

2) Create a new project in Eclipse workspace, say `~/eclipse-workspace/csc220`.

3) There is no need to manually initialize Git repository in project folder.

## Basic Usage

To sync `joja220` folder from Box folder into Eclipse project (see Prerequisites above), simply run the script with source and destination folder parameters:

   ```
   { ~ } » b2e ~/box/joja220 ~/eclipse-workspace/csc220
   ```

Note: You can omit the destination folder parameter if running the script from it:

   ```
   { ~ } » cd ~/eclipse-workspace/csc220
   { csc220 } » b2e ~/box/joja220
   ```

## Usage with Parent Folder

Assuming you want to sync a specific sub-folder, e.g. `joja220/prog08`, simply add the folder into the source path and set parent folder argument to `2` like this:

   ```
   { csc220 } » b2e -p2 ~/box/joja220/prog08
   ```

## Use-case: Compare student's solution to lab solution

To compare two folders from different sources, e.g. `joja220/prog08` with  `sols/prog08`, use following series of commands:

1) Make sure your lab solution is up to date.

   ```
   { csc220 } » b2e -p2 ~/box/csc220/sols/prog08
   ```

2) Make sure the student's solution is up to date.

   ```
   { csc220 } » b2e -p2 ~/box/joja220/prog08
   ```

3) Compare the current (last synced) solution to the one from `sols/prog08` using Git command.

   ```
   { csc220 } » git diff sols-prog08
   ```

Note: Branch names `sols-prog08` (with dashes) are derived from source folders `sols/prog08` (with slashes). To display more information about the script process, use verbose argument. To explore the repository, use standard Git functions.

## Contributing

Pull requests are welcome, don't hesitate to contribute.
