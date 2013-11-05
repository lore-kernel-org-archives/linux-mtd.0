Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdfJV-0006vC-3H
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 12:00:54 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] mtd: nand: Allow bad block markers to be found in the
 data region
Date: Tue,  5 Nov 2013 09:00:21 -0300
Message-Id: <1383652821-3557-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383652821-3557-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some NAND controllers provide its own unique view of a flash device's page,
where the page is partitioned into several DATA,OOB regions.
In other words, a flash that's specified by the manufacturer as:

|-------------------------|
|         DATA      | OOB |
|-------------------------|

is actually handled by the driver/controller as:

|-------------------------|
| DATA | OOB | DATA | OOB |
|-------------------------|

This has a peculiar side-effect: the bad block marker is located at a position
that is regarded as the data region in the controller's view.

Therefore, when the device is scanned for bad blocks (for the first
time) and the bad block table is built using the factory-marked blocks,
these markers are never found.

To address this case, we introduce a new option NAND_BBT_DATA_BBM.
Such option is used to read the data region of a a given page, instead
of the oob region, in the scan_block_fast() function. The page is read
as usual, using the length and offset parameters set in the bad block pattern.

Given drivers can customize the bad block pattern to match its specific
requirements, the new option allows to search for a bad block marker at
*any* position within a page.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/nand_bbt.c | 11 +++++++++--
 include/linux/mtd/bbm.h     |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index c0615d1..3f712cc 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -419,10 +419,17 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	struct mtd_oob_ops ops;
 	int j, ret;
 
+	if (bd->options & NAND_BBT_DATA_BBM) {
+		ops.oobbuf = (buf + mtd->writesize);
+		ops.datbuf = buf;
+		ops.len = mtd->writesize;
+	} else {
+		ops.oobbuf = buf;
+		ops.datbuf = NULL;
+		ops.len = 0;
+	}
 	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = buf;
 	ops.ooboffs = 0;
-	ops.datbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 
 	for (j = 0; j < numpages; j++) {
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 36bb6a5..75d590d 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -114,6 +114,10 @@ struct nand_bbt_descr {
  * entire spare area. Must be used with NAND_BBT_USE_FLASH.
  */
 #define NAND_BBT_NO_OOB_BBM	0x00080000
+/*
+ * Search for bad block marker in the data region, instead of the OOB.
+ */
+#define NAND_BBT_DATA_BBM	0x00100000
 
 /*
  * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
-- 
1.8.1.5
