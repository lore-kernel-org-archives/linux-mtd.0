Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjdDP-00045i-0h
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 18:41:16 +0000
Received: by mail-fx0-f214.google.com with SMTP id 6so5097065fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 10:41:06 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 09/15] MTD: nand: cleanup the nand_do_write_ops
Date: Mon, 22 Feb 2010 20:39:36 +0200
Message-Id: <1266863982-5258-10-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
References: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Vitaly Wool <vitalywool@gmail.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, stanley.miao@windriver.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_do_write_ops have broken in regard to writing several pages,
 each with its own oob.

Although nand_do_write_ops intends to allow such mode, it fails do do so
Probably this was never tested.

Also add missing checks for attemts to write at illegal offsets.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index cada4cf..1386741 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2072,11 +2072,9 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2131,6 +2129,11 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	int chipnr, realpage, page, blockmask, column;
 	struct nand_chip *chip = mtd->priv;
 	uint32_t writelen = ops->len;
+
+	uint32_t oobwritelen = ops->ooblen;
+	uint32_t oobmaxlen = ops->mode == MTD_OOB_AUTO ?
+				mtd->oobavail : mtd->oobsize;
+
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
@@ -2172,6 +2175,10 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	if (likely(!oob))
 		memset(chip->oob_poi, 0xff, mtd->oobsize);
 
+	/* Don't allow multipage oob writes with offset */
+	if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
+		return -EINVAL;
+
 	while(1) {
 		int bytes = mtd->writesize;
 		int cached = writelen > bytes && page != blockmask;
@@ -2187,8 +2194,11 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			wbuf = chip->buffers->databuf;
 		}
 
-		if (unlikely(oob))
-			oob = nand_fill_oob(chip, oob, ops);
+		if (unlikely(oob)) {
+			size_t len = min(oobwritelen, oobmaxlen);
+			oob = nand_fill_oob(chip, oob, len, ops);
+			oobwritelen -= len;
+		}
 
 		ret = chip->write_page(mtd, chip, wbuf, page, cached,
 				       (ops->mode == MTD_OOB_RAW));
@@ -2362,7 +2372,7 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 		chip->pagebuf = -1;
 
 	memset(chip->oob_poi, 0xff, mtd->oobsize);
-	nand_fill_oob(chip, ops->oobbuf, ops);
+	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
 	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
 	memset(chip->oob_poi, 0xff, mtd->oobsize);
 
-- 
1.6.3.3
