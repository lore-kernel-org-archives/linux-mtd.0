Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1Yv0-0007UB-Vb
 for linux-mtd@lists.infradead.org; Mon, 30 Jun 2014 10:34:40 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 2/2] mtd: nand: refactor nand_write_subpage_hwecc to write
 only relevant subpage data
Date: Mon, 30 Jun 2014 16:04:01 +0530
Message-ID: <1404124441-26038-3-git-send-email-pekon@ti.com>
In-Reply-To: <1404124441-26038-1-git-send-email-pekon@ti.com>
References: <1404124441-26038-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current nand_write_subpage_hwecc() code extends the subpage data to page-sized
one by padding it with 0xff. And then whole chunk is written to NAND device
using normal PAGE_PROGRAM sequence as below.
  <NAND_CMD_SEQIN(0x80)>
       <row-addr>
       <column-addr>
       <data1>
       <data2>
       ...
       <dataN>
       <OOB-data>
  <NAND_CMD_PAGEPROG(0x10)>

However many NAND devices support NAND_CMD_RNDIN(0x85) 'Random Input' command
which allows changing the column-address during PAGE_PROGRAM operation and write
only relevant data to NAND device, thereby avoiding the need for padding. This
patch uses below sequence to optimizes data writes for devices supporting subpages.
  <NAND_CMD_SEQIN(0x80)>
       <row-addr>
    <NAND_CMD_RNDIN(0x85)>
       <column-addr = subpageX>
       <data1>
       <data2>
       ...
       <dataN>
    <NAND_CMD_RNDIN(0x85)>
       <column-addr = subpageY>
       <data1>
       <data2>
       ...
       <dataM>
       ...
    <NAND_CMD_RNDIN(0x85)>
       <column-addr = oob-offset>
       <OOB-data>
  <NAND_CMD_PAGEPROG(0x10)>

*Note*
 nand_chip-ecc->size may be different from nand_chip->subpagesize. That means
 a single subpage can be further divided into more than one ECC sectors, as per
 capacity of ECC engine. nand_chip->ecc->size is an attribute of ECC engine and
 not NAND device. However same is not take care for reads in nand_read_subpage()

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index fdbd8c6..41b844d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2110,40 +2110,35 @@ static int nand_write_subpage_hwecc(struct mtd_info *mtd,
 	uint32_t *eccpos  = chip->ecc.layout->eccpos;
 	uint32_t start_step = offset / ecc->size;
 	uint32_t end_step   = (offset + data_len - 1) / ecc->size;
-	int oob_bytes       = mtd->oobsize / ecc->steps;
 	int step, i;
 
-	for (step = 0; step < ecc->steps; step++) {
+	buf		+= (start_step * ecc->size);
+	ecc_calc	+= (start_step * ecc->bytes);
+	eccpos		+= (start_step * ecc->bytes);
+	for (step = start_step; step < end_step; step++) {
 		/* configure controller for WRITE access */
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
 
-		/* write data (untouched subpages already masked by 0xFF) */
+		/* write data */
+		chip->cmdfunc(mtd, NAND_CMD_RNDIN, (step * ecc->size), -1);
 		chip->write_buf(mtd, buf, ecc->size);
 
-		/* mask ECC of un-touched subpages by padding 0xFF */
-		if ((step < start_step) || (step > end_step))
-			memset(ecc_calc, 0xff, ecc->bytes);
-		else
-			chip->ecc.calculate(mtd, buf, ecc_calc);
+		/* calculate ECC */
+		chip->ecc.calculate(mtd, buf, ecc_calc);
 
-		/* mask OOB of un-touched subpages by padding 0xFF */
-		/* if oob_required, preserve OOB metadata of written subpage */
-		if (!oob_required || (step < start_step) || (step > end_step))
-			memset(oob_buf, 0xff, oob_bytes);
+		/* copy calculated ECC to OOB buffer as per ecc-layout */
+		for (i = 0; i < ecc->bytes; i++)
+			oob_buf[eccpos[i]] = ecc_calc[i];
 
 		buf		+= ecc->size;
 		ecc_calc	+= ecc->bytes;
-		oob_buf		+= oob_bytes;
+		eccpos		+= ecc->bytes;
 	}
 
-	/* copy calculated ECC for whole page to chip->buffer->oob */
-	/* this include masked-value(0xFF) for unwritten subpages */
-	ecc_calc = chip->buffers->ecccalc;
-	for (i = 0; i < chip->ecc.total; i++)
-		chip->oob_poi[eccpos[i]] = ecc_calc[i];
-
-	/* write OOB buffer to NAND device */
-	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	/* write _complete_ OOB buffer to NAND device,
+	 * unused OOB bytes are already padded with 0xFF */
+	chip->cmdfunc(mtd, NAND_CMD_RNDIN, mtd->writesize, -1);
+	chip->write_buf(mtd, oob_buf, mtd->oobsize);
 
 	return 0;
 }
-- 
1.8.5.1.163.gd7aced9
