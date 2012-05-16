Message-ID: <1337159858.24809.21.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 0/3] Add PMECC support for at91 nand flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 16 May 2012 12:17:38 +0300
In-Reply-To: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mibLHQV5MWQ9Py1pW2l5"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mibLHQV5MWQ9Py1pW2l5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-15 at 22:47 +0800, Josh Wu wrote:
> Changes since v6,
> 	split into 3 patches.
> 	remove of_flat_dt_is_compatible() function. use additional dt parameter =
"has-pmecc".
> 	refine the error handling code.
> 	refine original atmel_nand_init_params() function.
>=20
> Changes since v5,
> 	add has_pmecc field to replace cpu_has_pmecc() function. Use compatible =
check in when proble.
> 	simplify the pmecc_get_ecc_bytes() function.
>=20
> Changes since v4,
> 	fix typo and checkpatch warnings.
> 	fix according to JC's suggestion. replace cpu_is_xxx() with DT
> 	modify dt binding atmel nand document to add pmecc support.
> 	tested in sam9263 without break hw ecc.
> 	add ecc.strength.

Hi,

Aiaiai identified the following issues with your patch-set - could you
please take a look?

---------------------------------------------------------------------------=
-----

Successfully built configuration "arm-at91cap9_defconfig,arm,arm-unknown-li=
nux-gnueabi-", results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/atmel_nand.c: In function 'atmel_pmecc_nand_init_params':
+drivers/mtd/nand/atmel_nand.c:910:29: warning: assignment from incompatibl=
e pointer type [enabled by default]
+drivers/mtd/nand/atmel_nand.c:910:50: warning: incorrect type in assignmen=
t (different argument counts) [sparse]
+drivers/mtd/nand/atmel_nand.c:910:50:    expected int ( *read_page )( ... =
) [sparse]
+drivers/mtd/nand/atmel_nand.c:910:50:    got int ( static [toplevel] *<noi=
dent> )( ... ) [sparse]
+drivers/mtd/nand/atmel_nand.c:912:30: warning: assignment from incompatibl=
e pointer type [enabled by default]
+drivers/mtd/nand/atmel_nand.c:912:51: warning: incorrect type in assignmen=
t (different argument counts) [sparse]
+drivers/mtd/nand/atmel_nand.c:912:51:    expected void ( *write_page )( ..=
. ) [sparse]
+drivers/mtd/nand/atmel_nand.c:912:51:    got void ( static [toplevel] *<no=
ident> )( ... ) [sparse]

---------------------------------------------------------------------------=
-----

checkpatch.pl has some complaints:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH 3/3] MTD: atmel_nand: Update driver=
 to support Programmable  Multibit ECC controller"

WARNING:LONG_LINE: line over 80 characters
#60: FILE: drivers/mtd/nand/atmel_nand.c:115:
+       int16_t                 smu[AT_NB_ERROR_MAX + 2][2 * AT_NB_ERROR_MA=
X + 1];

WARNING:LONG_LINE: line over 80 characters
#326: FILE: drivers/mtd/nand/atmel_nand.c:567:
+                               a =3D readw_relaxed(alpha_to + tmp % host->=
cw_len);

WARNING:LONG_LINE: line over 80 characters
#348: FILE: drivers/mtd/nand/atmel_nand.c:589:
+                               a =3D readw_relaxed(index_of + host->smu[i =
+ 1][k]);

total: 0 errors, 3 warnings, 879 lines checked

---------------------------------------------------------------------------=
-----

checkpatch.pl results for the entire squashed patch-set

WARNING:LONG_LINE: line over 80 characters
#376: FILE: drivers/mtd/nand/atmel_nand.c:115:
+       int16_t                 smu[AT_NB_ERROR_MAX + 2][2 * AT_NB_ERROR_MA=
X + 1];

WARNING:LONG_LINE: line over 80 characters
#642: FILE: drivers/mtd/nand/atmel_nand.c:567:
+                               a =3D readw_relaxed(alpha_to + tmp % host->=
cw_len);

WARNING:LONG_LINE: line over 80 characters
#664: FILE: drivers/mtd/nand/atmel_nand.c:589:
+                               a =3D readw_relaxed(index_of + host->smu[i =
+ 1][k]);

total: 0 errors, 3 warnings, 1136 lines checked

---------------------------------------------------------------------------=
-----

--=20
Best Regards,
Artem Bityutskiy

--=-mibLHQV5MWQ9Py1pW2l5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs3CyAAoJECmIfjd9wqK0izwP/i9m0Ok5YE8pcE8PM3hAUCSi
ZtEzD1qBIhL+TmWoflMmx5DjCTTMXUVePHsHNlf24reaHw4m70sMQFo3DcWVPODa
7eM3DFELO9To5K/RAjnZpTXWZ6ZyhIUGVhC3Mh1TfwsgCwKuUZr2/ePNEGK2Ymhl
wTm5+WW7PGE18vrJL04MvfYJb9wHsbGwKpoyOWILymBFyifoKgPO4hYImCUB0ya5
W/E7R84HOCE/R9gUpDrk8XwoDdKJyI58VUSBviW0lBd/R+mDRr3LXhvB5Ni1MFFS
+jYSe8CxyWthob4IrTy4+NCTR7fRryqZs/jLlubNNfQsqCUPqo1n8MCwXzs56gy2
t8vtqj73zZP5Lonq0vy/NRrZjeSDGLeGh+YUuPKktaljAZskR9MIqH1hVxeBd4AE
Ot2t7r/bPc66gqqRcUb1AVbHCsI+/9BXBd6z66v8ryG1FC5ZCVco3lfE5c7mVi8R
ch0bCR3hETfdtI8plVQG23IysjFm1Pzspa6oqPyXKFxlPRuP19YU9JBlT5h6QHS5
mDDK+aPVstwtAg3z8whvoJh7tviN635nYi6OUFTmvzEDYad9hKZt7h5/S80vyKPm
7jXUbUxPr3WAK6o4ZxoWvxpvFdB9IpvlQb7jAfUZAEJJOegROZKwRFfLs58Fc4P+
pMUWzemiVbDLFw2epyI5
=ipO3
-----END PGP SIGNATURE-----

--=-mibLHQV5MWQ9Py1pW2l5--
