Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yf7-0004zk-Bq
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:55:34 +0000
Message-ID: <1346310033.2848.536.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] Test for multi-bit error correction
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Thu, 30 Aug 2012 10:00:33 +0300
In-Reply-To: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Y7ZAVaeJXe23uZMZguPo"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Y7ZAVaeJXe23uZMZguPo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-29 at 17:26 +1000, Iwo Mergler wrote:
> This tests ECC biterror recovery on a single NAND page. Mostly intended
> to test ECC hardware and low-level NAND driver.
>=20
> There are two test modes:
>=20
>     0 - artificially inserting bit errors until the ECC fails
>         This is the default method and fairly quick. It should
>         be independent of the quality of the FLASH.
>=20
>     1 - re-writing the same pattern repeatedly until the ECC fails.
>         This method relies on the physics of NAND FLASH to eventually
>         generate '0' bits if '1' has been written sufficient times. Depen=
ding
>         on the NAND, the first bit errors will appear after 1000 or
>         more writes and then will usually snowball, reaching the limits
>         of the ECC quickly.

Aiaiai! [1] [2]

dedekind $ ~/git/maintaining$ ./verify ../l2-mtd/ gen < ~/tmp/iwo.mbox=20
Tested the patch(es) on top of the following commits:
6936e9d Quick fixes - applied by aiaiai
994b677 mtd: nand: Added a device flag for subpage read support
c2e1dbb mtd: orion_nand: remove <mach/hardware.h> include
d314b3b mtd: bcm47part driver for BCM47XX chipsets

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "arm-omap2plus_defco=
nfig" (architecture arm)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undeclared=
 (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "i386_defconfig" (ar=
chitecture i386)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function =E2=80=98rewrite_page=E2=
=80=99:
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: =E2=80=98MTD_OOB_RAW=E2=
=80=99 undeclared (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ia64_defconfig" (ar=
chitecture ia64)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undeclared=
 (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----

Successfully built configuration "m68k-m5208evb_defconfig,m68k,m68k-linux-"=
, no issues

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "mips64_defconfig" (=
architecture mips)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undeclared=
 (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----

Successfully built configuration "mips-bcm63xx_defconfig,mips,mips-linux-",=
 no issues

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ppc32_defconfig" (a=
rchitecture powerpc)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undeclared=
 (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ppc64_defconfig" (a=
rchitecture powerpc)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c: In function 'rewrite_page':
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: 'MTD_OOB_RAW' undeclared=
 (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "x86_64_defconfig" (=
architecture x86_64)":

049c1f5 Test for multi-bit error correction

drivers/mtd/tests/mtd_nandbiterrs.c:152:18: error: =E2=80=98MTD_OOB_RAW=E2=
=80=99 undeclared (first use in this function)
drivers/mtd/tests/mtd_nandbiterrs.c:152:18: note: each undeclared identifie=
r is reported only once for each function it appears in
make[4]: *** [drivers/mtd/tests/mtd_nandbiterrs.o] Error 1

---------------------------------------------------------------------------=
-----

checkpatch.pl has some complaints:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH] Test for multi-bit error correctio=
n"

WARNING:LONG_LINE: line over 80 characters
#320: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:270:
+                       msg("After %d biterrors per subpage, read reported =
error %d\n",

WARNING:LONG_LINE: line over 80 characters
#328: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:278:
+                       msg("ECC failure, read data is incorrect despite re=
ad success\n");

WARNING:LONG_LINE: line over 80 characters
#382: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:332:
+                               msg("Implausible number of bit errors corre=
cted\n");

WARNING:LONG_LINE: line over 80 characters
#401: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:351:
+                       msg("ECC failure, read data is incorrect despite re=
ad success\n");

total: 0 errors, 4 warnings, 464 lines checked

---------------------------------------------------------------------------=
-----
WARNING:LONG_LINE: line over 80 characters
#320: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:270:
+                       msg("After %d biterrors per subpage, read reported =
error %d\n",

WARNING:LONG_LINE: line over 80 characters
#328: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:278:
+                       msg("ECC failure, read data is incorrect despite re=
ad success\n");

WARNING:LONG_LINE: line over 80 characters
#382: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:332:
+                               msg("Implausible number of bit errors corre=
cted\n");

WARNING:LONG_LINE: line over 80 characters
#401: FILE: drivers/mtd/tests/mtd_nandbiterrs.c:351:
+                       msg("ECC failure, read data is incorrect despite re=
ad success\n");

total: 0 errors, 4 warnings, 464 lines checked

---------------------------------------------------------------------------=
-----

References:

1. http://git.infradead.org/users/dedekind/aiaiai.git
2. http://git.infradead.org/users/dedekind/maintaining.git

--=20
Best Regards,
Artem Bityutskiy

--=-Y7ZAVaeJXe23uZMZguPo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPw+RAAoJECmIfjd9wqK0nHAP/2l+vq3k+Dtv1Pl9xQ1eeUbj
8rf4JYp/JNLYgsIDETvEMtsSonrG5EzdsIkkBvJhru4/j3YcVuX9fZ0cOlLw2BIU
BAd64NOddCpZN3G/efExIueXmPNTMe1GaeQF5Ck5tqtUTOdgHTZXh13KcshryNln
9VuT2U6Qux5GvzbwblY7nPH6RiMwyCtR1irKNMvtCXFkwtsUVi8hAdlTc9bFJM32
Ak1OAQ+aYWQ46c0udvcPFU10IYfnIORe6cuhHHCurgkMw5t5/I4hiqs0jJOv0JR/
EOqRd+TrDZ3t346bjAfCc5QrEJFohC1ipF06x9SQo9mEcG4o1RuBONUU1m0aEQ7U
VhMJwXDUfl1+/aPDB0C+3KAKsGajJWkPySsUUexqlkfJ2LRD4INTkEsA8mqbnY/E
H97I8W2RuVbA69759Y0P0KpTXBpi34E5CzpjAOeLqatAxLHJDhEfOkAahoNkxmYD
qfKbpjT+MI7Xd1JjGp3Uhzq3fb3EAMcuVmt5f1DVvsQF7i5aB2rdnuqeWl0SpXcJ
iqOit9UTMvimOh77uDQBZR/BDbdbq/dIv4lwAz5GjomMHjTYuuobe0+GukXo6C3z
oHJlFOvhworufcvBiM8LLCkBQhbmcvJwijoyd/N41czbH/UPLbBGqdqyJL+xMAGg
Az6RbnH4Lu1puwZkJniG
=Pwi1
-----END PGP SIGNATURE-----

--=-Y7ZAVaeJXe23uZMZguPo--
