Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZpRG-0007Bp-DA
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 22:33:19 +0000
Date: Tue, 15 Apr 2014 00:32:05 +0200
From: Christian Engelmayer <cengelma@gmx.at>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: omap: fix compile warning on =?UTF-8?B?4oCY?=
 =?UTF-8?B?ZXJhc2VkX3NlY3Rvcl9iaXRmbGlwc+KAmQ==?=
Message-ID: <20140415003205.0bb2cf44@spike>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/YwI7xoFi+9LkH9H.x7TJ02J"; protocol="application/pgp-signature"
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/YwI7xoFi+9LkH9H.x7TJ02J
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Commit 2c9f2365 (mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_=
bch4
in omap_calculate_ecc_bch) introduced minor compile warning
"=E2=80=98erased_sector_bitflips=E2=80=99 defined but not used [-Wunused-fu=
nction]" when
compiling without CONFIG_MTD_NAND_OMAP_BCH. Move function
erased_sector_bitflips() into the same ifdef section as the only caller.

Signed-off-by: Christian Engelmayer <cengelma@gmx.at>
---
 drivers/mtd/nand/omap2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1ff49b8..1b800bc 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1237,6 +1237,7 @@ static int __maybe_unused omap_calculate_ecc_bch(stru=
ct mtd_info *mtd,
 	return 0;
 }
=20
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * erased_sector_bitflips - count bit flips
  * @data:	data sector buffer
@@ -1276,7 +1277,6 @@ static int erased_sector_bitflips(u_char *data, u_cha=
r *oob,
 	return flip_bits;
 }
=20
-#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
--=20
1.8.3.2

--Sig_/YwI7xoFi+9LkH9H.x7TJ02J
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTTGHlAAoJEKssnEpaPQKEk7sP/i1eh6vmkiWAYSv5ZZkwX6vx
SbIJK+X6Y0nWgNskPRMh+tRGxogKL5QPELXgZZUYpMSMLLqwu1FLLOeZk6p2hGRB
BYIvOSg52deiiF2+cLgrUcPysOas78qzBGt3LvJGcnj/r1N0eXIFOM9FPdaxD7W3
1S7YSh6CeJi1LWi81xzeo6vylj6j4OOfylroy7HsF71EYdxw00wh0bJcoMi7uX4G
4bXB9H3jZxnKQVcCT9b2wByxpji2qgF70h8Td6DBplVRB+PyWMKegh+TVACDRRLh
7L1U3cbU5o4gDito47e3rycRDZDhHtet1HuhDSyFcebZhseYWw+P2VZ8IBpc6264
W7fbn4a/Td94zIyBAMDUlcMdn1uIm2/jD6BKL6C7fu9rqsuwZQFN3yujTkYBgWJ6
FmPMHmihVSk74ptACY19igI+lZKSRzrqoX9xXSymRf+N6xEwO9UnemgSIUrTnt9F
rw2jp5qLjxAncMHfSEgznmk+yb27vZlzhaeVFQ3mm3s+0v7zXDNnV/AhFGm9LVPJ
OU5NFJ7OySaxyCfYJ+wGbbb8sjmSIQHnKI4GWv727oHX+gpb2tJYuGHjdXjOD1jB
R2vzqK4wDPYyRRyincBLKD1MiWh3Sx1xV0apUCwnuQu8NE7AFX4uHS2SlUvF3zJA
Aq30Fvpdr3Kt1G+gnFJF
=QSrD
-----END PGP SIGNATURE-----

--Sig_/YwI7xoFi+9LkH9H.x7TJ02J--
