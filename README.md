# pplpy conda recipes

Anaconda recipes for pplpy and it's dependencies

----

## Build recipes

* run `conda build <receipe-folder>` to build the receipe. Available Receipes are:
    * [gmpy](gmpy/)
    * [ppl](ppl/)
    * [pplpy](pplpy/) (depends on gmpy and ppl)
* you can find the built packages inside the Anaconda installation folder in `conda-bld\win-64`

## Install recipes

* either [build recipes](#build-recipes) and install them by:
    * `conda install -c local gmpy2 libppl pplpy`
*  …or [download](#downloads) and install each prebuilt file with
    * `conda install <package-filename>`
    * (make sure you install gmpy and ppl before pplpy)

## Downloads

* testbuilds for windows and python3.7 can be found [here](https://the-cake-is-a-lie.net/nextcloud/index.php/s/fBfoHdtj5pYwNEd)

## Developer Notes

* see [here](developer_notes.md)  

