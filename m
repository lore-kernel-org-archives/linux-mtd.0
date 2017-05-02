Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d5aT3-0007YU-NB
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 16:16:04 +0000
Date: Tue, 2 May 2017 18:15:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: free vendor-specific resources in init
 failure paths
Message-ID: <20170502181539.5db45986@bbrezillon>
In-Reply-To: <20170502095230.2cd20b1c@bbrezillon>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-4-computersforpeace@gmail.com>
 <20170502095230.2cd20b1c@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2 May 2017 09:52:30 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Mon,  1 May 2017 17:04:53 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
>=20
> > If we fail any time after calling nand_detect(), then we don't call the
> > vendor-specific ->cleanup() callback, and we'll leak any resources the
> > vendor-specific code might have allocated.
> >=20
> > Mark the "fix" against the first commit that started allocating anything
> > in ->init(). =20
>=20
> Yep, I noticed this leak while reviewing/applying Masahiro's series
> [1], and forgot to send a fix for this bug.
>=20
> Actually, I'm not sure we should keep nand_manufacturer_init() in
> nand_scan_ident(), especially if we consider that nand_scan_ident() is
> not supposed to allocate resources and does not require a
> nand_cleanup() when something fails between nand_scan_ident() and
> nand_scan_tail().
>=20

Just for the record, this is the kind of fix I had in mind, but it can
still be applied on top of your patch.

--->8---
=46rom fd918ec7ed960792f020227b675838fee6f710d9 Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 2 May 2017 18:10:18 +0200
Subject: [PATCH] mtd: nand: Fix various memory leaks in core

The nand_scan_ident() function is not expected to allocate resources,
and people are usually not calling nand_cleanup() if something fails
between nand_scan_ident() and nand_scan_tail().

Move all functions that may allocate resource to the nand_scan_tail()
path to prevent such resource leaks.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Only compile tested.
---
 drivers/mtd/nand/nand_base.c | 79 ++++++++++++++++++++++++----------------=
----
 1 file changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ed49a1d634b0..6ba03921eddb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3939,7 +3939,7 @@ static int nand_detect(struct nand_chip *chip, struct=
 nand_flash_dev *type)
 	const struct nand_manufacturer *manufacturer;
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
 	int busw;
-	int i, ret;
+	int i;
 	u8 *id_data =3D chip->id.data;
 	u8 maf_id, dev_id;
=20
@@ -4080,10 +4080,6 @@ static int nand_detect(struct nand_chip *chip, struc=
t nand_flash_dev *type)
 	if (mtd->writesize > 512 && chip->cmdfunc =3D=3D nand_command)
 		chip->cmdfunc =3D nand_command_lp;
=20
-	ret =3D nand_manufacturer_init(chip);
-	if (ret)
-		return ret;
-
 	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
 		maf_id, dev_id);
=20
@@ -4290,23 +4286,6 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchi=
ps,
 		return ret;
 	}
=20
-	/* Initialize the ->data_interface field. */
-	ret =3D nand_init_data_interface(chip);
-	if (ret)
-		return ret;
-
-	/*
-	 * Setup the data interface correctly on the chip and controller side.
-	 * This explicit call to nand_setup_data_interface() is only required
-	 * for the first die, because nand_reset() has been called before
-	 * ->data_interface and ->default_onfi_timing_mode were set.
-	 * For the other dies, nand_reset() will automatically switch to the
-	 * best mode for us.
-	 */
-	ret =3D nand_setup_data_interface(chip);
-	if (ret)
-		return ret;
-
 	nand_maf_id =3D chip->id.data[0];
 	nand_dev_id =3D chip->id.data[1];
=20
@@ -4502,7 +4481,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
 	struct nand_buffers *nbuf =3D NULL;
-	int ret;
+	int ret, i;
=20
 	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
 	if (WARN_ON((chip->bbt_options & NAND_BBT_NO_OOB_BBM) &&
@@ -4522,20 +4501,20 @@ int nand_scan_tail(struct mtd_info *mtd)
 		nbuf->ecccalc =3D kmalloc(mtd->oobsize, GFP_KERNEL);
 		if (!nbuf->ecccalc) {
 			ret =3D -ENOMEM;
-			goto err_free;
+			goto err_free_nbuf;
 		}
=20
 		nbuf->ecccode =3D kmalloc(mtd->oobsize, GFP_KERNEL);
 		if (!nbuf->ecccode) {
 			ret =3D -ENOMEM;
-			goto err_free;
+			goto err_free_nbuf;
 		}
=20
 		nbuf->databuf =3D kmalloc(mtd->writesize + mtd->oobsize,
 					GFP_KERNEL);
 		if (!nbuf->databuf) {
 			ret =3D -ENOMEM;
-			goto err_free;
+			goto err_free_nbuf;
 		}
=20
 		chip->buffers =3D nbuf;
@@ -4544,6 +4523,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 			return -ENOMEM;
 	}
=20
+	ret =3D nand_manufacturer_init(chip);
+	if (ret)
+		goto err_free_nbuf;
+
 	/* Set the internal oob buffer location, just after the page data */
 	chip->oob_poi =3D chip->buffers->databuf + mtd->writesize;
=20
@@ -4565,7 +4548,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			WARN(1, "No oob scheme defined for oobsize %d\n",
 				mtd->oobsize);
 			ret =3D -EINVAL;
-			goto err_free;
+			goto err_nand_manuf_cleanup;
 		}
 	}
=20
@@ -4580,7 +4563,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
 			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
 			ret =3D -EINVAL;
-			goto err_free;
+			goto err_nand_manuf_cleanup;
 		}
 		if (!ecc->read_page)
 			ecc->read_page =3D nand_read_page_hwecc_oob_first;
@@ -4612,7 +4595,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     ecc->write_page =3D=3D nand_write_page_hwecc)) {
 			WARN(1, "No ECC functions supplied; hardware ECC not possible\n");
 			ret =3D -EINVAL;
-			goto err_free;
+			goto err_nand_manuf_cleanup;
 		}
 		/* Use standard syndrome read/write page function? */
 		if (!ecc->read_page)
@@ -4632,7 +4615,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			if (!ecc->strength) {
 				WARN(1, "Driver must set ecc.strength when using hardware ECC\n");
 				ret =3D -EINVAL;
-				goto err_free;
+				goto err_nand_manuf_cleanup;
 			}
 			break;
 		}
@@ -4645,7 +4628,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		ret =3D nand_set_ecc_soft_ops(mtd);
 		if (ret) {
 			ret =3D -EINVAL;
-			goto err_free;
+			goto err_nand_manuf_cleanup;
 		}
 		break;
=20
@@ -4665,7 +4648,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	default:
 		WARN(1, "Invalid NAND_ECC_MODE %d\n", ecc->mode);
 		ret =3D -EINVAL;
-		goto err_free;
+		goto err_nand_manuf_cleanup;
 	}
=20
 	/* For many systems, the standard OOB write also works for raw */
@@ -4686,7 +4669,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	if (ecc->steps * ecc->size !=3D mtd->writesize) {
 		WARN(1, "Invalid ECC parameters\n");
 		ret =3D -EINVAL;
-		goto err_free;
+		goto err_nand_manuf_cleanup;
 	}
 	ecc->total =3D ecc->steps * ecc->bytes;
=20
@@ -4769,13 +4752,39 @@ int nand_scan_tail(struct mtd_info *mtd)
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold =3D DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
=20
+	/* Initialize the ->data_interface field. */
+	ret =3D nand_init_data_interface(chip);
+	if (ret)
+		goto err_nand_manuf_cleanup;
+
+	/* Enter fastest possible mode on all dies. */
+	for (i =3D 0; i < chip->numchips; i++) {
+		chip->select_chip(mtd, i);
+		ret =3D nand_setup_data_interface(chip);
+		chip->select_chip(mtd, -1);
+
+		if (ret)
+			goto err_nand_data_iface_cleanup;
+	}
+
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
 		return 0;
=20
 	/* Build bad block table */
-	return chip->scan_bbt(mtd);
-err_free:
+	ret =3D chip->scan_bbt(mtd);
+	if (ret)
+		goto err_nand_data_iface_cleanup;
+
+	return 0;
+
+err_nand_data_iface_cleanup:
+	nand_release_data_interface(chip);
+
+err_nand_manuf_cleanup:
+	nand_manufacturer_cleanup(chip);
+
+err_free_nbuf:
 	if (nbuf) {
 		kfree(nbuf->databuf);
 		kfree(nbuf->ecccode);
