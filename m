Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7aU2-0006ty-4O
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 00:23:10 +0000
Received: by mail-ob0-f176.google.com with SMTP id uz19so5695496obc.7
 for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2013 17:22:48 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fixup kerneldoc, rename parameter
Date: Thu,  8 Aug 2013 17:22:22 -0700
Message-Id: <1376007742-19392-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, "Gupta, Pekon" <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First, the function argument is 'offset' not 'column'.

Second, the 'data_buf' name is inconsistent with the rest of this file.
Just use 'buf'.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Gupta, Pekon <pekon@ti.com>
---
 drivers/mtd/nand/nand_base.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f04fb0..49ca737 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1980,13 +1980,14 @@ static int nand_write_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * nand_write_subpage_hwecc - [REPLACABLE] hardware ECC based subpage write
  * @mtd:	mtd info structure
  * @chip:	nand chip info structure
- * @column:	column address of subpage within the page
+ * @offset:	column address of subpage within the page
  * @data_len:	data length
+ * @buf:	data buffer
  * @oob_required: must write chip->oob_poi to OOB
  */
 static int nand_write_subpage_hwecc(struct mtd_info *mtd,
 				struct nand_chip *chip, uint32_t offset,
-				uint32_t data_len, const uint8_t *data_buf,
+				uint32_t data_len, const uint8_t *buf,
 				int oob_required)
 {
 	uint8_t *oob_buf  = chip->oob_poi;
@@ -2005,20 +2006,20 @@ static int nand_write_subpage_hwecc(struct mtd_info *mtd,
 		chip->ecc.hwctl(mtd, NAND_ECC_WRITE);
 
 		/* write data (untouched subpages already masked by 0xFF) */
-		chip->write_buf(mtd, data_buf, ecc_size);
+		chip->write_buf(mtd, buf, ecc_size);
 
 		/* mask ECC of un-touched subpages by padding 0xFF */
 		if ((step < start_step) || (step > end_step))
 			memset(ecc_calc, 0xff, ecc_bytes);
 		else
-			chip->ecc.calculate(mtd, data_buf, ecc_calc);
+			chip->ecc.calculate(mtd, buf, ecc_calc);
 
 		/* mask OOB of un-touched subpages by padding 0xFF */
 		/* if oob_required, preserve OOB metadata of written subpage */
 		if (!oob_required || (step < start_step) || (step > end_step))
 			memset(oob_buf, 0xff, oob_bytes);
 
-		data_buf += ecc_size;
+		buf += ecc_size;
 		ecc_calc += ecc_bytes;
 		oob_buf  += oob_bytes;
 	}
-- 
1.8.1.2
