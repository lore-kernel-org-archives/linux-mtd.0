Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NasC3-0000zj-PV
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 14:51:36 +0000
Received: by mail-bw0-f212.google.com with SMTP id 4so1893128bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 06:51:31 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/16] MTD: nand: fix bug that prevented write of more that
	one page by ->write_oob
Date: Fri, 29 Jan 2010 16:50:57 +0200
Message-Id: <1264776663-7042-11-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
References: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Although nand_do_write_ops intends to allow such mode, it fails do do so
Probably this was never tested

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8ff36be..29e986e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1879,11 +1879,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
  * @oob:	oob data buffer
  * @ops:	oob ops structure
  */
-static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob,
-				  struct mtd_oob_ops *ops)
+static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
+						struct mtd_oob_ops *ops)
 {
-	size_t len = ops->ooblen;
-
 	switch(ops->mode) {
 
 	case MTD_OOB_PLACE:
@@ -1938,6 +1936,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	int chipnr, realpage, page, blockmask, column;
 	struct nand_chip *chip = mtd->priv;
 	uint32_t writelen = ops->len;
+	uint32_t oobwritelen = ops->ooblen;
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
@@ -1994,8 +1993,11 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			wbuf = chip->buffers->databuf;
 		}
 
-		if (unlikely(oob))
-			oob = nand_fill_oob(chip, oob, ops);
+		if (unlikely(oob)) {
+			size_t len = min(oobwritelen, mtd->oobsize);
+			oob = nand_fill_oob(chip, oob, len, ops);
+			oobwritelen -= len;
+		}
 
 		ret = chip->write_page(mtd, chip, wbuf, page, cached,
 				       (ops->mode == MTD_OOB_RAW));
@@ -2169,7 +2171,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		chip->pagebuf = -1;
 
 	memset(chip->oob_poi, 0xff, mtd->oobsize);
-	nand_fill_oob(chip, ops->oobbuf, ops);
+	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
 	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
 	memset(chip->oob_poi, 0xff, mtd->oobsize);
 
-- 
1.6.3.3
