Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4nVg-0002DC-AT
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 06:36:49 +0000
Message-ID: <1345790488.2848.252.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Fri, 24 Aug 2012 09:41:28 +0300
In-Reply-To: <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kRLsx/b3lOyK/5/V2o68"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
 b32955@freescale.com, linux-mtd@lists.infradead.org, marex.vasut@denx.de,
 kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kRLsx/b3lOyK/5/V2o68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 11:36 -0400, Huang Shijie wrote:
> On Thu, Aug 23, 2012 at 11:08 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> > On Sat, 2012-07-28 at 19:29 -0300, Fabio Estevam wrote:
> >> From: Fabio Estevam <fabio.estevam@freescale.com>
> >>
> >> When building MTD_NAND_GPMI_NAND as module, the following error shows =
up:
> >>
> >> ERROR: "nand_update_bbt" [drivers/mtd/nand/gpmi-nand/gpmi_nand.ko] und=
efined!
> >>
> >> Export nand_update_bbt to fix it
> >>
> >> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> >
> > Why this driver redefined ->block_markbad() at all, it is not supposed
> For hardware reason, in mx23, the bad block mark is stored in the
> first byte of the nand page;
> in mx28/mx50/mx6q, the bad block mark is stored in the first byte of the =
OOB.
>=20
> That's why the driver redefined the ->block_markbad().

The default function seem to do the same as your function does. You
select where you keep your OOB using chip options, and the default
function does the right thing, no?

=46rom 5cdff78da6dde1e2eef472dcbbe7ca8f7fd64061 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 24 Aug 2012 09:26:29 +0300
Subject: [PATCH] gpmi-nand: use the default implementation of block_markbad

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   46 ----------------------------=
----
 1 file changed, 46 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi=
-nand/gpmi-nand.c
index 8c0d2f0..8e193fb 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1179,51 +1179,6 @@ gpmi_ecc_write_oob(struct mtd_info *mtd, struct nand=
_chip *chip, int page)
 	return -EPERM;
 }
=20
-static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
-{
-	struct nand_chip *chip =3D mtd->priv;
-	struct gpmi_nand_data *this =3D chip->priv;
-	int block, ret =3D 0;
-	uint8_t *block_mark;
-	int column, page, status, chipnr;
-
-	/* Get block number */
-	block =3D (int)(ofs >> chip->bbt_erase_shift);
-	if (chip->bbt)
-		chip->bbt[block >> 2] |=3D 0x01 << ((block & 0x03) << 1);
-
-	/* Do we have a flash based bad block table ? */
-	if (chip->bbt_options & NAND_BBT_USE_FLASH)
-		ret =3D nand_update_bbt(mtd, ofs);
-	else {
-		chipnr =3D (int)(ofs >> chip->chip_shift);
-		chip->select_chip(mtd, chipnr);
-
-		column =3D this->swap_block_mark ? mtd->writesize : 0;
-
-		/* Write the block mark. */
-		block_mark =3D this->data_buffer_dma;
-		block_mark[0] =3D 0; /* bad block marker */
-
-		/* Shift to get page */
-		page =3D (int)(ofs >> chip->page_shift);
-
-		chip->cmdfunc(mtd, NAND_CMD_SEQIN, column, page);
-		chip->write_buf(mtd, block_mark, 1);
-		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-
-		status =3D chip->waitfunc(mtd, chip);
-		if (status & NAND_STATUS_FAIL)
-			ret =3D -EIO;
-
-		chip->select_chip(mtd, -1);
-	}
-	if (!ret)
-		mtd->ecc_stats.badblocks++;
-
-	return ret;
-}
-
 static int nand_boot_set_geometry(struct gpmi_nand_data *this)
 {
 	struct boot_rom_geometry *geometry =3D &this->rom_geometry;
@@ -1562,7 +1517,6 @@ static int __devinit gpmi_nfc_init(struct gpmi_nand_d=
ata *this)
 	chip->ecc.write_oob	=3D gpmi_ecc_write_oob;
 	chip->scan_bbt		=3D gpmi_scan_bbt;
 	chip->badblock_pattern	=3D &gpmi_bbt_descr;
-	chip->block_markbad	=3D gpmi_block_markbad;
 	chip->options		|=3D NAND_NO_SUBPAGE_WRITE;
 	chip->ecc.mode		=3D NAND_ECC_HW;
 	chip->ecc.size		=3D 1;
--=20
1.7.10.4

--=20
Best Regards,
Artem Bityutskiy

--=-kRLsx/b3lOyK/5/V2o68
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNyIYAAoJECmIfjd9wqK0KikQAL0Q63yEwGRSNQOTDALqdNt2
nQALgxKPX+m/uWM9kxm/eWJ/zCs2cRKl+N9PuHaLPX3O36YEcB6APFX4q6zea8gs
C4Z2W5czHPP4zyOfQP5bXvTOkwg7LlJjvmsmmdA4rkppLV+17DaZaFQ54JrTvCTa
5SWGtKOkE/oEtcxDcZ4HxSdPlLRSRnBLJ+G/0b1aUkzwS+30NEDn2LOxgNfNCoCl
ZmIfiBjr69NOrda7uhnNQJfemMAMvCVVSptP9TWno1oHHMsxoGwLVP3zhdZ/ypqm
KzS5EO6nWDh9+TfW0VIEMI9WPw8kWny2KeQikuTggnePRk7x9An/ZM/247j6yYyc
2YUi/qDHjfBjqaROxrFIbePgDzX6LmXZ7eHqxDreoQcYJJlBkk6qDL6SZELYdT23
xwU1lRLpXZsMSVqOBrlNa7J9RT5JLrgpS+qn2k8wdwCWDpIcAoiQ5tF0WskZBAEi
rzWf1rgYHM1VqX84/I5MJhqOYjBfqmvjB7MogAVwrrpfCwf+sRSTDQfvIA5Dhfd7
8GH54h90L/6of+BUQ9hyAOROxp8zLX+6TL96bpfrNPRs1w370oxTvYvgLb9DZRN8
YbYe2dIiv04cICb1uZgl8z8mQ5WiaQLf6vaZ2UJlZZCGzNMeXajjugeZeN1E313y
bN9fgSm64xTURSEVPdZA
=oAuD
-----END PGP SIGNATURE-----

--=-kRLsx/b3lOyK/5/V2o68--
