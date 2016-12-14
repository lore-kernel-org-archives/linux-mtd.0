Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHCi4-0002mm-8I
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 16:47:18 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.0.0-rc2 is released
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 Richard Weinberger <richard@sigma-star.at>
Message-ID: <597d84af-8fd7-23d3-45ee-868d4b21b41a@sigma-star.at>
Date: Wed, 14 Dec 2016 17:45:33 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SHKWlNKCUgTs9Q1njEfVwe4lxsslj6x0R"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SHKWlNKCUgTs9Q1njEfVwe4lxsslj6x0R
Content-Type: multipart/mixed; boundary="WrW4aMR33pdbjnxUhpqbCgSKSCWXEnRL6";
 protected-headers="v1"
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 Richard Weinberger <richard@sigma-star.at>
Message-ID: <597d84af-8fd7-23d3-45ee-868d4b21b41a@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.0.0-rc2 is released

--WrW4aMR33pdbjnxUhpqbCgSKSCWXEnRL6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

mtd-utils-2.0.0-rc2 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
0.0-rc2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.=
0.0-rc2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v2.0.0-rc2


This is a release candidate. Assuming all goes well, the final release of=

mtd-utils-2.0.0 will be next week.

We are doing this, along with the major version number bump, because ther=
e
were some greater changes to mtd-utils. Most notably, there was a complet=
e
restructuring and cleanup of the source tree and the hand written Makefil=
e
got replaced with an autotools based build system.

This way, we hope to get some feedback on the new build system and other
changes before the final release.


For the near future, we do not have plans for similarly drastic changes, =
so
we do not anticipate another version with a release candidate any time so=
on.


Below is a brief summary of the changes since the last release candidate:=
=20
 - Correct casting for final status report in flashcp
 - Fix packaging of unit test files
 - nandwrite: Factor out buffer checking code


Below is a brief summary of the changes from version 1.5.2 up to version
2.0.0-rc1. Fixes for the build system superseded by the build system upgr=
ade
or fixes for features added after 1.5.2 are omitted:


Features:
 - libmissing with stubs for functions not present in libraries like musl=

 - unittests for libmtd and libubi
 - port most kernel space mtd test modules to userspace
 - mkfs.ubifs: extended attribute support
 - ubinize: Move lengthy help text to a man page
 - nandwrite: Add skip-all-ff-pages option
 - flash_{un,}lock: support for MEMISLOCKED
 - nandtest: support hex/dec/oct for --offset and --length

Fixes:
 - common: Fix 'unchecked return code' warnings
 - common: Fix PRI{x,d}off definitions for x86_64 platform
 - common: include sys/sysmacros.h for major/minor/makedev
 - common: fix wrong format specifiers on mips32
 - libmtd: Fix uninitialized buffers
 - libmtd: Eliminate warnings about implicit non-const casting
 - libmtd: Fix return status in mtd_torture test function
 - libmtd: mtd_read: Take the buffer offset into account when reading
 - mkfs.ubifs: use gid from table instead 2x uid
 - mkfs.ubifs: fix compiler warning for WITHOUT_LZO
 - mkfs.ubifs: fix build when WITHOUT_LZO is set
 - mkfs.ubifs: correct the size of nnode in memset
 - mkfs.jffs2: initialize lzo decompression buffer size
 - mkfs.jffs2: Fix scanf() formatstring for modern C version
 - nanddump: check write function result for errors
 - nanddump: write requested length only
 - flash_{un,}lock: don't allow "last byte + 1"
 - flash_{un,}lock: improve strtol() error handling
 - ubinize: Always return error code (at least -1) in case of an error
 - recv_image: fix build warnings w/newer glibc & _BSD_SOURCE
 - serve_image: use proper POSIX_C_SOURCE value
 - flashcp: Use %llu to print filestat.st_size
 - mtd_debug: check amount of data read.
 - fs-tests: integrity: don't include header <bits/stdio_lim.h>
 - tests: Fix endian issue with CRC generation algorithm
 - make_a_release.sh: fix MTD spelling

Cleanup:
 - autotools based build system
 - complete restructuring of the source tree
 - cleanup of some utilities
 - removal of some very old, unused or duplicated files from the source t=
ree
 - libmtd: removal of very old, completely unused and broken functions


Raw short log since the 1.5.2 release:


Boris Brezillon (2):
      common: Fix PRI{x,d}off definitions for x86_64 platform
      common: Fix 'unchecked return code' warnings

Brian Norris (17):
      make_a_release.sh: fix MTD spelling
      autogenerated dependency files are not being utilized properly
      don't include system headers in dependency files
      nandtest: support hex/dec/oct for --offset and --length
      flash_{un,}lock: nest optional parameters in help message
      flash_{un,}lock: switch to getopt library
      flash_{un,}lock: support --version flag
      flash_{un,}lock: document option flags
      flash_{un,}lock: abstract the argument positions
      flash_{un,}lock: move args processing to its own function
      flash_{un,}lock: support both lock/unlock in the same binary
      flash_{un,}lock: add MEMISLOCKED support
      flash_{un,}lock: improve strtol() error handling
      flash_{un,}lock: don't allow "last byte + 1"
      flash_{un,}lock: document block count =3D=3D -1
      mkfs.ubifs: <sys/xattr.h>, not <attr/xattr.h>
      Makefile: install: don't look for scripts in BUILDDIR

Daniel Walter (9):
      Fix scanf() formatstring for modern C version
      mkfs.ubifs: fix compiler warning for WITHOUT_LZO
      Fix uninitialized buffers
      Add unit test helpers
      Add support for sysfs mocking
      Add sysfs tree for unittests
      Add unittest for libmtd
      Add unittests for libubi
      Add Makefile for unittests

David Gstir (1):
      Add -lrt for clock_gettime() in glibc < 2.17.

David Oberhollenzer (32):
      libmtd: Fix return status in mtd_torture test function
      mtd-utils: mkfs.jffs2: initialize lzo decompression buffer size
      Eliminate warnings about implicit non-const casting in libmtd
      Remove jffs-dump.c
      Remove unused legacy_libmtd_open internal libmtd function
      Remove unused and broken mtd_write_img function from libmtd
      Remove RPM spec file
      Remove duplicate copies of GPLv2 license text
      Remove feature-removal-schedule.txt
      Integrate tests into autotools build system
      Unify version string printing
      Fix paths in .gitignore and add autotools generated files
      Fix make_a_release script
      Add libmissing
      mtd-utils: Add multi-block erase function
      mtd-utils: Add flash torture test utility
      mtd-utils: Add flash stress test utility
      mtd-utils: Add flash speed test utility
      mtd-utils: Add nand flash bit errors test
      mtd-utils: Add flash read test utility
      mtd-utils: Add nand page test utility
      mtd-utils: Add nand sub-page test utility
      Add ubinize manpage
      Remove unused ubiutils_print_text from ubi-utils common
      Merge rest of ubiutils-common into libmtd common
      Move ubi-utils libraries to common library location
      Allow version string to have a release candidate suffix
      Define WITHOUT_XATTR if sys/acl.h or sys/xattr.h is missing
      Release mtd-utils-2.0.0-rc1
      Fix packaging of unit test files
      Enable tests so they are included in the make dist target
      Release mtd-utils-2.0.0-rc2

Dongsheng Yang (2):
      ubifs: correct the size of nnode in memset
      mtd-utils: Restructure the mtd-utils source.

Enrico Jorns (1):
      mtd-utils: ubinize: Always return error code (at least -1) in case =
of an error

Fabien Proriol (1):
      flashcp: Use %llu to print filestat.st_size

Gary Bisson (1):
      mtd-utils: nanddump: write requested length only

Jonathan Fether (1):
      mtd-utils: Correct casting for final status report in flashcp

Kees Trommel (1):
      nandwrite: add skip-all-ff-pages-option

Kirill Smirnov (1):
      mtd-utils: serve_image: use proper POSIX_C_SOURCE value

Marcus Prebble (1):
      libmtd: mtd_read: Take the buffer offset into account when reading

Marek Vasut (1):
      nandwrite: Factor out buffer checking code

Mathias Kresin (1):
      mtd-utils: fix wrong format specifiers on mips32

Michal Suchanek (1):
      mtd-utils: mtd_debug: check amount of data read.

Mike Frysinger (2):
      include sys/sysmacros.h for major/minor/makedev
      fix build warnings w/newer glibc & _BSD_SOURCE

Paul McGougan (1):
      mtd: tests: Fix endian issue with CRC generation algorithm

Rafa=C5=82 Mi=C5=82ecki (1):
      nanddump: check write function result for errors

Rahul Bedarkar (1):
      fs-tests: integrity: don't include header <bits/stdio_lim.h>

Richard Weinberger (1):
      Change build system to autotools

Rolf Eike Beer (1):
      fix build when WITHOUT_LZO is set

Sascha Hauer (5):
      mkfs.ubifs: change add_directory argument to 'existing'
      mkfs.ubifs: use xmalloc/xzalloc for allocating memory
      mkfs.ubifs: simplify make_path with xasprintf
      mkfs.ubifs: Add extended attribute support
      mkfs.ubifs: Optionally create extended attribute with inode number

Sebastian Andrzej Siewior (1):
      mkfs.ubifs: use gid from table instead 2x uid



Regards,

David


--WrW4aMR33pdbjnxUhpqbCgSKSCWXEnRL6--

--SHKWlNKCUgTs9Q1njEfVwe4lxsslj6x0R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEEwY/cjyeWErqzVubvOXcPHQaAtEFAlhRdzEACgkQvOXcPHQa
AtE4qAf+KEtpJC8uO6lYq5cBG8Lwi0v3bpkFwLnfXqFJcpM108qYJIq9N62FlN/B
TKTa/uA4AsmzbjoM2aYfC/A1QQ05xIXf0FQDNfs/NG6uCAUmHekYLWsBeCtyOGuh
tb1SdT/vIhLv15FoC101i0T9yaGG5iFw7l7JUHmIwJFejj/itaNPz9GCoSmpPBKD
+HnWNJR7nfVmNYTCJc4RngHVgAPEXjkEcQczqDlzVxMsHnJcEokk6W+M/mBzfLWE
eSaxnx1HZ8oxEmE4RDV7KejXOuewXpPooQDnBQlbJKsl6xFdGwVZYq8q32/x+ePT
JafWToITMyimU5e/5BnqJFwcqI8QUA==
=U4Jv
-----END PGP SIGNATURE-----

--SHKWlNKCUgTs9Q1njEfVwe4lxsslj6x0R--
