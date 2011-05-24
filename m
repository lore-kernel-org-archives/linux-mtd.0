Received: from smail3.alcatel.fr ([64.208.49.56])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOriu-00084C-T1
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 13:32:38 +0000
Received: from FRMRSSXCHHUB04.dc-m.alcatel-lucent.com
	(FRMRSSXCHHUB04.dc-m.alcatel-lucent.com [135.120.45.64])
	by smail3.alcatel.fr (8.14.3/8.14.3/ICT) with ESMTP id p4ODVoCn001711
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 24 May 2011 15:32:32 +0200
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 24 May 2011 15:32:25 +0200
Subject: [PATCH] nand: nand_base: Always initialise oob_poi before writing
	OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF29E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
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

This patch changes the code so that oob_poi is always initialised
to 0xFF to make sure no left over data is inadvertently written
back to OOB data.

Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>
---
 drivers/mtd/nand/nand_base.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8c21b89..cb1dec1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1843,9 +1843,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, lo=
ff_t to,
 	    (chip->pagebuf << chip->page_shift) < (to + ops->len))
 		chip->pagebuf =3D -1;
=20
-	/* If we're not given explicit OOB data, let it be 0xFF */
-	if (likely(!oob))
-		memset(chip->oob_poi, 0xff, mtd->oobsize);
+	/* Initialise to all 0xFF, to avoid the possibility of
+	   left over OOB data from a previous OOB read. */
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
=20
 	while(1) {
 		int bytes =3D mtd->writesize;
--=20
1.7.5.1=
