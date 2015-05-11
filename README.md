#devpi-formula

Salt Formula for installing and configuring devpi.

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

Included debian package may be built by deb_helper with `dpkg-buildpackage -us -uc`


##Available states

###devpi

Installs the devpi package, and starts the associated devpi service.