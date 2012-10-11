Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TMFQQ-0007IX-Uh
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 09:51:32 +0000
Message-ID: <1349949104.20594.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/6] bcma: export PLL reading function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 11 Oct 2012 12:51:44 +0300
In-Reply-To: <1348746947-2349-1-git-send-email-zajec5@gmail.com>
References: <1348746947-2349-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/ERsYY/r3VV3Gfe3RCFW"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/ERsYY/r3VV3Gfe3RCFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-27 at 13:55 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This is required by NAND flash driver for initializing wait counters.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> 0001-bcma-export-PLL-reading-function.patch                          =20
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-=
", no issues

I think you did not enable the driver in the defconfig.

Tested the patch(es) on top of the following commits:
e3134a5 Quick fixes - applied by aiaiai
a7c1993 mtd: fsl_elbc_nand: remove unnecessary badblock_pattern
03ba2bf mtd: ofpart: Fix incorrect NULL check in parse_ofoldpart_partitions=
()
c525349 mtd: m25p80: add support for the windbond w25q256 chip

---------------------------------------------------------------------------=
-----

Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-",=
 results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c: In function 'bcm47xxnflash_o=
ps_bcm4706_init':
+drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c:253:6: warning: variable 'col=
_mask' set but not used [-Wunused-but-set-variable]

---------------------------------------------------------------------------=
-----

checkpatch.pl has some complaints:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH 2/6] mtd: prepare place for BCMA NA=
ND flash driver(s)"

WARNING:CONFIG_DESCRIPTION: please write a paragraph that describes the con=
fig symbol fully
#33: FILE: drivers/mtd/nand/Kconfig:449:
+config MTD_NAND_BCM47XXNFLASH

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably =
be static const char * const
#113: FILE: drivers/mtd/nand/bcm47xxnflash/main.c:24:
+static const char *probes[] =3D { "bcm47xxpart", NULL };

total: 0 errors, 2 warnings, 145 lines checked

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH 4/6] mtd: bcm47xxnflash: support fo=
r NAND_CMD_READID command"

WARNING:LONG_LINE: line over 80 characters
#120: FILE: drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c:106:
+                       b47n->id_data[i] =3D bcma_cc_read32(b47n->cc, BCMA_=
CC_NFLASH_DATA) & 0xFF;

total: 0 errors, 1 warnings, 134 lines checked

---------------------------------------------------------------------------=
-----

--=20
Best Regards,
Artem Bityutskiy

--=-/ERsYY/r3VV3Gfe3RCFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdpawAAoJECmIfjd9wqK0DOkP/3n9iHm+xrtzXNCNA4SIZ8ku
SaPzMbiZ3J4bWzsHB0XHhiuN1748ivoyMOvCJkuPhTMmtXwTAR6FabhIPzET0SRM
Hq4lwuoc78Beu+sIDoLUfE6yzx9K8LaYDkpQ0QhFu/6OellrIS1wjD8VTDdJCiaq
ixHLykHcXJhsHF2CLZ38Se24AQgozAqC0Hjf+osZGuj7fhe/Z/5GMZ8lHnwKOb7K
6ZMtgs835rmLwuEdLyw0lJ2bG8Rgfl5KLETkL4IgoAoEERbLCNMMx8C7O/bc3fvA
3gUu2gEWkRxNyX6FPOw/7KgcFkc42U3TSfHQ84RHK/X4+PCgjh+sEbk2mgaYeoXG
cThJcyqXxkhF1tQO+plbNp5GVNyvmu8o9eW1gYpWBoQxo8ezA8q6/cmAISD0pBjC
ocwmziU2vVQFx8Gh1VCneUpVStRgxaJIzveEFkRM0M7SLHXM1NT3fHweBIuOc3dn
8xJ7tSUUNxMN1m7Eme5lHKIRAEu0WJe60/CcU5frNxK6tTguQbnlmQWLY/2ymH6+
ZSjcB43st/m2mVe5Nvl7nR7AcAP6jem8sLlbunPeHimKsgL9FCt77oHQnezbVS9k
5qgzap0Y+15cVhHK/K/jqEcrJ287M4arRTEj/4RFYUeum2LLMzTGWn66aY6lYoFz
OijL0TDA++BQagqk+7Z3
=2KiW
-----END PGP SIGNATURE-----

--=-/ERsYY/r3VV3Gfe3RCFW--
