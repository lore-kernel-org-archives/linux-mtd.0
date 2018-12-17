Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYv8y-0003gl-Pb
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 15:49:25 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Schrempf
 Frieder" <frieder.schrempf@kontron.de>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/3] mtd: rawnand: Support bad block markers in first, second
 or last page
Date: Mon, 17 Dec 2018 15:49:07 +0000
Message-ID: <1545061693-29216-2-git-send-email-frieder.schrempf@kontron.de>
References: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
In-Reply-To: <1545061693-29216-1-git-send-email-frieder.schrempf@kontron.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Currently supported bad block marker positions within the block are:
* in first page only
* in last page only
* in first or second page

Some ESMT NANDs are known to have been shipped by the manufacturer
with bad block markers in the first or last page, instead of the
first or second page.

Also the datasheets for Cypress/Spansion/AMD NANDs claim that the
first, second *and* last page needs to be checked.

Therefore we make it possible to set NAND_BBT_SCAN2NDPAGE and
NAND_BBT_SCANLASTPAGE at the same time to scan/set all three pages.

To simplify the code, the logic to evaluate the flags is moved to a
a new function nand_bbm_page_offset().

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/raw/internals.h |  1 +
 drivers/mtd/nand/raw/nand_base.c | 72 ++++++++++++++++++++++++++---------
 drivers/mtd/nand/raw/nand_bbt.c  | 30 +++++++--------
 3 files changed, 68 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/intern=
als.h
index 04c2cf7..8e4b168 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -76,6 +76,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_ma=
nuf_ops;
=20
 /* Core functions */
 const struct nand_manufacturer *nand_get_manufacturer(u8 id);
+int nand_bbm_page_offset(struct nand_chip *chip, int index);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_b=
ase.c
index 71050a0..388d9ed 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -253,6 +253,45 @@ static void nand_release_device(struct mtd_info *mtd)
 }
=20
 /**
+ * nand_bbm_page_offset - Get the page offsets for bad block markers
+ * @chip: NAND chip object
+ * @index: Index for the page offset
+ *
+ * Returns an integer that corresponds to the page offset within a block, =
for
+ * a page that is used to store bad block markers. If no more page offsets=
 are
+ * available, -1 is returned.
+ */
+int nand_bbm_page_offset(struct nand_chip *chip, int index)
+{
+	struct mtd_info *mtd =3D nand_to_mtd(chip);
+	int last_page =3D ((mtd->erasesize - mtd->writesize) >>
+			 chip->page_shift) & chip->pagemask;
+
+	switch (index) {
+	case 0:
+		if ((chip->bbt_options & NAND_BBT_SCANLASTPAGE) &&
+		    !(chip->bbt_options & NAND_BBT_SCAN2NDPAGE))
+			return last_page;
+		else
+			return 0;
+		break;
+	case 1:
+		if (chip->bbt_options & NAND_BBT_SCAN2NDPAGE)
+			return 1;
+		break;
+	case 2:
+		if ((chip->bbt_options & NAND_BBT_SCANLASTPAGE) &&
+		    (chip->bbt_options & NAND_BBT_SCAN2NDPAGE))
+			return last_page;
+		break;
+	default:
+		break;
+	}
+
+	return -1;
+}
+
+/**
  * nand_block_bad - [DEFAULT] Read bad block marker from the chip
  * @chip: NAND chip object
  * @ofs: offset from device start
@@ -261,18 +300,14 @@ static void nand_release_device(struct mtd_info *mtd)
  */
 static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 {
-	struct mtd_info *mtd =3D nand_to_mtd(chip);
-	int page, page_end, res;
+	int page_offset, i =3D 0;
+	int res, first_page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
 	u8 bad;
=20
-	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
-		ofs +=3D mtd->erasesize - mtd->writesize;
+	page_offset =3D nand_bbm_page_offset(chip, 0);
=20
-	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
-	page_end =3D page + (chip->bbt_options & NAND_BBT_SCAN2NDPAGE ? 2 : 1);
-
-	for (; page < page_end; page++) {
-		res =3D chip->ecc.read_oob(chip, page);
+	do {
+		res =3D chip->ecc.read_oob(chip, first_page + page_offset);
 		if (res < 0)
 			return res;
=20
@@ -284,7 +319,9 @@ static int nand_block_bad(struct nand_chip *chip, loff_=
t ofs)
 			res =3D hweight8(bad) < chip->badblockbits;
 		if (res)
 			return res;
-	}
+
+		page_offset =3D nand_bbm_page_offset(chip, ++i);
+	} while (page_offset !=3D -1);
=20
 	return 0;
 }
@@ -303,7 +340,7 @@ static int nand_default_block_markbad(struct nand_chip =
*chip, loff_t ofs)
 	struct mtd_info *mtd =3D nand_to_mtd(chip);
 	struct mtd_oob_ops ops;
 	uint8_t buf[2] =3D { 0, 0 };
-	int ret =3D 0, res, i =3D 0;
+	int ret =3D 0, res, i =3D 0, page_offset;
=20
 	memset(&ops, 0, sizeof(ops));
 	ops.oobbuf =3D buf;
@@ -316,17 +353,16 @@ static int nand_default_block_markbad(struct nand_chi=
p *chip, loff_t ofs)
 	}
 	ops.mode =3D MTD_OPS_PLACE_OOB;
=20
-	/* Write to first/last page(s) if necessary */
-	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
-		ofs +=3D mtd->erasesize - mtd->writesize;
+	page_offset =3D nand_bbm_page_offset(chip, 0);
+
 	do {
-		res =3D nand_do_write_oob(mtd, ofs, &ops);
+		res =3D nand_do_write_oob(mtd, ofs + page_offset * mtd->writesize,
+					&ops);
 		if (!ret)
 			ret =3D res;
=20
-		i++;
-		ofs +=3D mtd->writesize;
-	} while ((chip->bbt_options & NAND_BBT_SCAN2NDPAGE) && i < 2);
+		page_offset =3D nand_bbm_page_offset(chip, ++i);
+	} while (page_offset !=3D -1);
=20
 	return ret;
 }
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bb=
t.c
index 98a8268..b1424b3 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -412,10 +412,11 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8=
_t *buf,
=20
 /* Scan a given block partially */
 static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd=
,
-			   loff_t offs, uint8_t *buf, int numpages)
+			   loff_t offs, uint8_t *buf)
 {
+	struct nand_chip *chip =3D mtd_to_nand(mtd);
 	struct mtd_oob_ops ops;
-	int j, ret;
+	int i =3D 0, ret, page_offset;
=20
 	ops.ooblen =3D mtd->oobsize;
 	ops.oobbuf =3D buf;
@@ -423,12 +424,15 @@ static int scan_block_fast(struct mtd_info *mtd, stru=
ct nand_bbt_descr *bd,
 	ops.datbuf =3D NULL;
 	ops.mode =3D MTD_OPS_PLACE_OOB;
=20
-	for (j =3D 0; j < numpages; j++) {
+	page_offset =3D nand_bbm_page_offset(chip, 0);
+
+	do {
 		/*
 		 * Read the full oob until read_oob is fixed to handle single
 		 * byte reads for 16 bit buswidth.
 		 */
-		ret =3D mtd_read_oob(mtd, offs, &ops);
+		ret =3D mtd_read_oob(mtd, offs + page_offset * mtd->writesize,
+				   &ops);
 		/* Ignore ECC errors when checking for BBM */
 		if (ret && !mtd_is_bitflip_or_eccerr(ret))
 			return ret;
@@ -436,8 +440,9 @@ static int scan_block_fast(struct mtd_info *mtd, struct=
 nand_bbt_descr *bd,
 		if (check_short_pattern(buf, bd))
 			return 1;
=20
-		offs +=3D mtd->writesize;
-	}
+		page_offset =3D nand_bbm_page_offset(chip, ++i);
+	} while (page_offset !=3D -1);
+
 	return 0;
 }
=20
@@ -456,17 +461,11 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *=
buf,
 	struct nand_bbt_descr *bd, int chip)
 {
 	struct nand_chip *this =3D mtd_to_nand(mtd);
-	int i, numblocks, numpages;
-	int startblock;
+	int i, numblocks, startblock;
 	loff_t from;
=20
 	pr_info("Scanning device for bad blocks\n");
=20
-	if (bd->options & NAND_BBT_SCAN2NDPAGE)
-		numpages =3D 2;
-	else
-		numpages =3D 1;
-
 	if (chip =3D=3D -1) {
 		numblocks =3D mtd->size >> this->bbt_erase_shift;
 		startblock =3D 0;
@@ -483,15 +482,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *=
buf,
 		from =3D (loff_t)startblock << this->bbt_erase_shift;
 	}
=20
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
-		from +=3D mtd->erasesize - (mtd->writesize * numpages);
-
 	for (i =3D startblock; i < numblocks; i++) {
 		int ret;
=20
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
=20
-		ret =3D scan_block_fast(mtd, bd, from, buf, numpages);
+		ret =3D scan_block_fast(mtd, bd, from, buf);
 		if (ret < 0)
 			return ret;
=20
--=20
2.7.4
