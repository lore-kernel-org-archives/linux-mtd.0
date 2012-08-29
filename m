Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6jYp-00031f-NA
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 14:48:04 +0000
Message-ID: <1346251980.2848.488.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V4] mtd: bcm47part driver for BCM47XX chipsets
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 29 Aug 2012 17:53:00 +0300
In-Reply-To: <1346242803-18748-1-git-send-email-zajec5@gmail.com>
References: <1346242803-18748-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GKkuN18QlzEb75tsXOOS"
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


--=-GKkuN18QlzEb75tsXOOS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-29 at 14:20 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> This driver provides parser detecting partitions on BCM47XX flash
> memories. It has many differences in comparison to BCM63XX, like:
> 1) Different CFE with no more trivial MAGICs
> 2) More partitions types (board_data, ML, POT)
> 3) Supporting more than 1 flash on a device
> which resulted in decision of writing new parser.

Aiaiai! [1] [2]

$:~/git/maintaining$ ./verify ../l2-mtd/ mips-bcm47xx_defconfig < ~/tmp/raf=
al.mbox=20
Tested the patch(es) on top of the following commits:
1f7fb90 Quick fixes - applied by aiaiai
340b100 mtd: mtd_nandecctest: make module_init() return an error code if te=
st fails
ef3b0f6 mtd: mtd_nandecctest: remove unnecessary srandom32() call
0f06219 mtd: m25p80: add support for the EON EN25Q64 chip

---------------------------------------------------------------------------=
-----

Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-",=
 results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/bcm47xxpart.c:178 bcm47xxpart_parse() warn: possible memory le=
ak of 'buf' [smatch]

---------------------------------------------------------------------------=
-----

checkpatch.pl has some complaints:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH] mtd: bcm47part driver for BCM47XX =
chipsets"

WARNING:CONFIG_DESCRIPTION: please write a paragraph that describes the con=
fig symbol fully
#35: FILE: drivers/mtd/Kconfig:151:
+config MTD_BCM47XX_PARTS

total: 0 errors, 1 warnings, 218 lines checked

---------------------------------------------------------------------------=
-----

References:

1. http://git.infradead.org/users/dedekind/aiaiai.git
2. http://git.infradead.org/users/dedekind/maintaining.git

--=20
Best Regards,
Artem Bityutskiy

--=-GKkuN18QlzEb75tsXOOS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPizMAAoJECmIfjd9wqK03nwP/1wKm7vH/BPMPQC1+XCS7idM
4DkvuLJVSFuOft0q/Yko4TeOXIO3+eXyji1pG2bmrrd7ZUWtRplMmrUmazcjzan7
deS2IylLYIewf2try0VZo5vUdqt96G9iKrw+B/qBUTlCXN8EZPCHxyyl2Z8MiMBF
f15CVbc/FFk+hIdwq/AEIl2qppY6AIRLXnnP+Af3S5GrFZDUYklr8BMOzj/W6GGa
tjZwFVO6UVUJbXdjE6yskNUDpc3IJ6FXnFWXhdT5lfRyeBPzeDn5GnrZdL2pRFrd
okfT2tiOhtcWVtFzgME48kfyRB/QgdPt2K9rGXHNey1Bf/8PhJkCbImIEWMr49a3
3ztNEaRkjDuh4HUgYfosWomS51Fi4wtSak4J9lyrvhHNOcDeoQw+u23x8LYCAm2A
H7sHa/X1F1+M+5U2zggDfkTnlCLUlyZDcTGqgQb1THWFzYQrVR8ekTWvprVHntUo
y9S0Ce8dvI0FyyxPD0qBXvQD+Il2l/zgtLHazil/OUGCYIvGxTKlxyne/lRXoazK
hsceP+21G2fsb/zScFtIhgD+lTGdunHILaWn6L5XlXMBelo99WNgxT+V4UXVqnU+
yzUbV9oownAQC4rVBJzCt0VkmN/P+TMSJb1oBXCPsAnyIaD+CG6o+LRGI8OlumxQ
iqRnByw5gbollCqvjoGJ
=Fw1z
-----END PGP SIGNATURE-----

--=-GKkuN18QlzEb75tsXOOS--
