Received: from mail1.navico.com ([194.19.84.105])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUYJK-0005Rj-21
	for linux-mtd@lists.infradead.org; Wed, 04 Feb 2009 03:20:25 +0000
Received: from exch-oslno.SIMRAD.NET.INT (unverified [157.237.5.27]) by
	mail1.navico.com
	(Vircom SMTPRS 4.5.654.13) with ESMTP id <B0007813724@mail1.navico.com>
	for <linux-mtd@lists.infradead.org>; Wed, 4 Feb 2009 04:20:16 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] MTD: NAND Add support for MLC nand with alternate BB marker
	locations
Date: Wed, 4 Feb 2009 16:20:14 +1300
Message-ID: <70F6AAAFDC054F41B9994A9BCD3DF64E08611EC4@exch01-aklnz.MARINE.NET.INT>
From: "Reuben Dowle" <Reuben.Dowle@navico.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support for some MLC NAND flashes that place the BB
marker in the LAST page of the bad block rather than the FIRST page used
for SLC NAND and other types of MLC nand.

Lifted from Samsung datasheet for K9LG8G08U0A (1Gbyte MLC NAND):
"
Identifying Initial Invalid Block(s)
All device locations are erased(FFh) except locations where the initial
invalid block(s) information is written prior to shipping. The initial
invalid block(s) status is defined by the 1st byte in the spare area.
Samsung makes sure that the last page of every initial invalid block has
non-FFh data at the column address of 2,048.
...
"

As far as I can tell, this is the same for all Samsung MLC nand, and in
fact the samsung bsp for the processor used in our project (s3c6410)
actually contained a hack similar to this patch but less portable to
enable use of their NAND parts. I discovered this problem when trying to
use a Micron NAND which does not used this layout - I wish samsung would
put their stuff in main-line to avoid this type of problem.

Currently this patch causes all MLC nand with manufacturer codes from
Samsung and ST(Numonyx) to use this alternative location, since these
are the manufactures that I know of that use this layout.

Signed-off-by: Reuben Dowle <reuben.dowle at navico.com>
---
 drivers/mtd/nand/nand_base.c |   12 ++++++++++++
 drivers/mtd/nand/nand_bbt.c  |    3 +++
 include/linux/mtd/nand.h     |    3 ++-
 3 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
old mode 100644
new mode 100755
index 0c3afcc..a76ff7b
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -306,6 +306,9 @@ static int nand_block_bad(struct mtd_info *mtd,
loff_t ofs, int getchip)
=20
 	page =3D (int)(ofs >> chip->page_shift) & chip->pagemask;
=20
+	if( chip->options & NAND_BB_LAST_PAGE )
+		ofs +=3D (mtd->erasesize - mtd->writesize);
+
 	if (getchip) {
 		chipnr =3D (int)(ofs >> chip->chip_shift);
=20
@@ -358,6 +361,9 @@ static int nand_default_block_markbad(struct
mtd_info *mtd, loff_t ofs)
 	if (chip->options & NAND_USE_FLASH_BBT)
 		ret =3D nand_update_bbt(mtd, ofs);
 	else {
+		if( chip->options & NAND_BB_LAST_PAGE )
+			ofs +=3D (mtd->erasesize - mtd->writesize);
+
 		/* We write two bytes, so we dont have to mess with 16
bit
 		 * access
 		 */
@@ -2450,6 +2456,12 @@ static struct nand_flash_dev
*nand_get_flash_type(struct mtd_info *mtd,
 	if (*maf_id !=3D NAND_MFR_SAMSUNG && !type->pagesize)
 		chip->options &=3D ~NAND_SAMSUNG_LP_OPTIONS;
=20
+	/* Check if the device is an MLC nand with alternative bb marker
location.=20
+         * At this stage, I only know that this is the case for Samsung
and ST/Numonyx,=20
+         * and is NOT the case for Micron */
+	if( (*maf_id =3D=3D NAND_MFR_SAMSUNG || *maf_id =3D=3D NAND_MFR_ST)  =
&&
((chip->cellinfo >> 2) & 0x3) !=3D 0 )
+		chip->options |=3D NAND_BB_LAST_PAGE;
+
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
 		chip->erase_cmd =3D multi_erase_cmd;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
old mode 100644
new mode 100755
index 55c23e5..4c2edcf
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -414,6 +414,9 @@ static int create_bbt(struct mtd_info *mtd, uint8_t
*buf,
 		from =3D (loff_t)startblock << (this->bbt_erase_shift -
1);
 	}
=20
+	if( this->options & NAND_BB_LAST_PAGE )
+		from +=3D (mtd->erasesize - (mtd->writesize * len));
+
 	for (i =3D startblock; i < numblocks;) {
 		int ret;
=20
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
old mode 100644
new mode 100755
index db5b63d..dd7a6ae
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -166,7 +166,8 @@ typedef enum {
 #define NAND_NO_READRDY		0x00000100
 /* Chip does not allow subpage writes */
 #define NAND_NO_SUBPAGE_WRITE	0x00000200
-
+/* Chip holds bad-block marker in last page instead of first page (eg.
on samsung MLC) */
+#define NAND_BB_LAST_PAGE	0x00000400
=20
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
