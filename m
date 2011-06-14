Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWUzE-0005jZ-5r
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2011 14:53:01 +0000
Received: from FRMRSSXCHHUB04.dc-m.alcatel-lucent.com
	(FRMRSSXCHHUB04.dc-m.alcatel-lucent.com [135.120.45.64])
	by smail2.alcatel.fr (8.14.3/8.14.3/ICT) with ESMTP id p5EEqABk017768
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2011 16:52:57 +0200
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 14 Jun 2011 16:52:38 +0200
Subject: [PATCH upstream] nand: nand_base: Always initialise oob_poi before
	writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059AACE12D@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

In nand_do_write_ops() code it is possible for a caller to provide
ops.oobbuf populated and ops.mode =3D=3D MTD_OOB_AUTO, which currently
means that the chip->oob_poi buffer isn't initialised to all 0xFF.
The nand_fill_oob() method then carries out the task of copying
the provided OOB data to oob_poi, but with MTD_OOB_AUTO it skips
areas marked as unavailable by the layout struct, including the
bad block marker bytes.

An example of this causing issues is when the last OOB data read
was from the start of a bad block where the markers are not 0xFF,
and the caller wishes to write new OOB data at the beginning of
another block. In this scenario the caller would provide OOB data,
but nand_fill_oob() would skip the bad block marker bytes in
oob_poi before copying the OOB data provided by the caller.
This means that when the OOB data is written back to NAND,
the block is inadvertently marked as bad without the caller knowing.
This has been witnessed when using YAFFS2 where tags are stored
in the OOB.

To avoid this oob_poi is always initialised to 0xFF to make sure
no left over data is inadvertently written back to the OOB area.

Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>
---

Applies to: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.=
6.git
Tested on: ARM based board with Hynix 256MB NAND chip

 drivers/mtd/nand/nand_base.c |   21 +++++++++++----------
 1 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..0815a3d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2098,13 +2098,20 @@ static int nand_write_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
 /**
  * nand_fill_oob - [Internal] Transfer client buffer to oob
  * @chip:	nand chip structure
+ * @mtd:	MTD device structure
  * @oob:	oob data buffer
  * @len:	oob data write length
  * @ops:	oob ops structure
  */
-static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t=
 len,
-						struct mtd_oob_ops *ops)
+static uint8_t *nand_fill_oob(struct nand_chip *chip, struct mtd_info *mtd=
,
+			      uint8_t *oob, size_t len,	struct mtd_oob_ops *ops)
 {
+	/*
+	 * Initialise to all 0xFF, to avoid the possibility of
+	 * left over OOB data from a previous OOB read.
+	 */
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+
 	switch (ops->mode) {
=20
 	case MTD_OOB_PLACE:
@@ -2201,10 +2208,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, l=
off_t to,
 	    (chip->pagebuf << chip->page_shift) < (to + ops->len))
 		chip->pagebuf =3D -1;
=20
-	/* If we're not given explicit OOB data, let it be 0xFF */
-	if (likely(!oob))
-		memset(chip->oob_poi, 0xff, mtd->oobsize);
-
 	/* Don't allow multipage oob writes with offset */
 	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
 		return -EINVAL;
@@ -2226,7 +2229,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, lo=
ff_t to,
=20
 		if (unlikely(oob)) {
 			size_t len =3D min(oobwritelen, oobmaxlen);
-			oob =3D nand_fill_oob(chip, oob, len, ops);
+			oob =3D nand_fill_oob(chip, mtd, oob, len, ops);
 			oobwritelen -=3D len;
 		}
=20
@@ -2401,10 +2404,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, l=
off_t to,
 	if (page =3D=3D chip->pagebuf)
 		chip->pagebuf =3D -1;
=20
-	memset(chip->oob_poi, 0xff, mtd->oobsize);
-	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
+	nand_fill_oob(chip, mtd, ops->oobbuf, ops->ooblen, ops);
 	status =3D chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
-	memset(chip->oob_poi, 0xff, mtd->oobsize);
=20
 	if (status)
 		return status;
--=20
1.7.5.4
