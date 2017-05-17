Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dB5AQ-0003RT-PH
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 20:03:34 +0000
Date: Wed, 17 May 2017 22:03:05 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.marshall@omicronenergy.com, b44839@freescale.com,
 prabhakar@freescale.com
Subject: [PATCH] mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Message-ID: <20170517200305.GA12537@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170419221507.GA24914@amd> <20170420002748.5c76c9b9@bbrezillon>
 <20170420114057.GA4705@amd> <20170421105107.GA7259@amd>
 <20170517122224.GB583@amd> <20170517143211.205ff5de@bbrezillon>
 <20170517130059.GA3437@amd> <20170517152548.6d52c41b@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <20170517152548.6d52c41b@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If we see unrecoverable ECC error, we need to count number of bitflips
=66rom all-ones and report correctable/uncorrectable according to
that. Otherwise we report ECC failed on erased flash with single bit error.

Signed-off-by: Pavel Machek <pavel@denx.de>

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nan=
d.c
index d1570f5..1c66696 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -171,34 +171,6 @@ static void set_addr(struct mtd_info *mtd, int column,=
 int page_addr, int oob)
 		ifc_nand_ctrl->index +=3D mtd->writesize;
 }
=20
-static int is_blank(struct mtd_info *mtd, unsigned int bufnum)
-{
-	struct nand_chip *chip =3D mtd_to_nand(mtd);
-	struct fsl_ifc_mtd *priv =3D nand_get_controller_data(chip);
-	u8 __iomem *addr =3D priv->vbase + bufnum * (mtd->writesize * 2);
-	u32 __iomem *mainarea =3D (u32 __iomem *)addr;
-	u8 __iomem *oob =3D addr + mtd->writesize;
-	struct mtd_oob_region oobregion =3D { };
-	int i, section =3D 0;
-
-	for (i =3D 0; i < mtd->writesize / 4; i++) {
-		if (__raw_readl(&mainarea[i]) !=3D 0xffffffff)
-			return 0;
-	}
-
-	mtd_ooblayout_ecc(mtd, section++, &oobregion);
-	while (oobregion.length) {
-		for (i =3D 0; i < oobregion.length; i++) {
-			if (__raw_readb(&oob[oobregion.offset + i]) !=3D 0xff)
-				return 0;
-		}
-
-		mtd_ooblayout_ecc(mtd, section++, &oobregion);
-	}
-
-	return 1;
-}
-
 /* returns nonzero if entire page is blank */
 static int check_read_ecc(struct mtd_info *mtd, struct fsl_ifc_ctrl *ctrl,
 			  u32 *eccstat, unsigned int bufnum)
@@ -274,16 +246,13 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
 			if (errors =3D=3D 15) {
 				/*
 				 * Uncorrectable error.
-				 * OK only if the whole page is blank.
+				 * We'll check for blank pages later.
 				 *
 				 * We disable ECCER reporting due to...
 				 * erratum IFC-A002770 -- so report it now if we
 				 * see an uncorrectable error in ECCSTAT.
 				 */
-				if (!is_blank(mtd, bufnum))
-					ctrl->nand_stat |=3D
-						IFC_NAND_EVTER_STAT_ECCER;
-				break;
+				ctrl->nand_stat |=3D IFC_NAND_EVTER_STAT_ECCER;
 			}
=20
 			mtd->ecc_stats.corrected +=3D errors;
@@ -678,6 +648,39 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct n=
and_chip *chip)
 	return nand_fsr | NAND_STATUS_WP;
 }
=20
+/*
+ * The controller does not check for bitflips in erased pages,
+ * therefore software must check instead.
+ */
+static int check_erased_page(struct nand_chip *chip, u8 *buf)
+{
+	struct mtd_info *mtd =3D nand_to_mtd(chip);
+	u8 *ecc =3D chip->oob_poi;
+	const int ecc_size =3D chip->ecc.bytes;
+	const int pkt_size =3D chip->ecc.size;
+	int i, res, bitflips =3D 0;
+	struct mtd_oob_region oobregion;
+
+	mtd_ooblayout_ecc(mtd, 0, &oobregion);
+	ecc +=3D oobregion.offset;
+
+	for (i =3D 0; i < chip->ecc.steps; ++i) {
+		res =3D nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc_size,
+						  NULL, 0,
+						  chip->ecc.strength);
+		if (res < 0)
+			mtd->ecc_stats.failed++;
+		else
+			mtd->ecc_stats.corrected +=3D res;
+
+		bitflips =3D max(res, bitflips);
+		buf +=3D pkt_size;
+		ecc +=3D ecc_size;
+	}
+
+	return bitflips;
+}
+
 static int fsl_ifc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			     uint8_t *buf, int oob_required, int page)
 {
@@ -689,11 +695,18 @@ static int fsl_ifc_read_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
 	if (oob_required)
 		fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
=20
-	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER)
-		dev_err(priv->dev, "NAND Flash ECC Uncorrectable Error\n");
-
 	if (ctrl->nand_stat !=3D IFC_NAND_EVTER_STAT_OPC)
 		mtd->ecc_stats.failed++;
+
+	if (ctrl->nand_stat & IFC_NAND_EVTER_STAT_ECCER) {
+		int res;
+
+		if (!oob_required)
+			fsl_ifc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+
+		res =3D check_erased_page(chip, buf);
+		return res;
+	}
=20
 	return nctrl->max_bitflips;
 }


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkcrHkACgkQMOfwapXb+vIMggCgq4FhVjBCQpnXvRZPXlkQa4xE
yEgAoJuFGegVCLxQkfcfO/dVL7NEC8V/
=daF6
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
