Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPd9y-0002jb-5x
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 17:16:15 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so1447669pbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 10:16:13 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 02/10] mtd: nand: pass proper 'oob_required' parameter
Date: Wed,  2 May 2012 10:14:56 -0700
Message-Id: <1335978904-8005-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
References: <1335978904-8005-1-git-send-email-computersforpeace@gmail.com>
Cc: Li Yang <leoli@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, Florian Fainelli <ffainelli@freebox.fr>,
 Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We now have an interface for notifying the nand_ecc_ctrl functions when OOB
data must be returned to the upper layers and when it may be left untouched.
This patch fills in the 'oob_required' parameter properly from
nand_do_{read,write}_ops. When utilized properly in the lower layers, this
parameter can improve performance and/or reduce complexity for NAND HW and SW
that can simply avoid transferring the OOB data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Acked-by: Jiandong Zheng <jdzheng@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 6d4894a..464b742 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1480,7 +1480,7 @@ static uint8_t *nand_transfer_oob(struct nand_chip *chip, uint8_t *oob,
 static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
-	int chipnr, page, realpage, col, bytes, aligned;
+	int chipnr, page, realpage, col, bytes, aligned, oob_required;
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_ecc_stats stats;
 	int ret = 0;
@@ -1504,6 +1504,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
+	oob_required = oob ? 1 : 0;
 
 	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
@@ -1521,13 +1522,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			 */
 			if (unlikely(ops->mode == MTD_OPS_RAW))
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
-							      1, page);
+							      oob_required,
+							      page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
-							  1, page);
+							  oob_required, page);
 			if (ret < 0) {
 				if (!aligned)
 					/* Invalidate page cache */
@@ -1554,7 +1556,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 
 			if (unlikely(oob)) {
-
 				int toread = min(oobreadlen, max_oobsize);
 
 				if (toread) {
@@ -2213,6 +2214,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
+	int oob_required = oob ? 1 : 0;
 
 	ops->retlen = 0;
 	if (!writelen)
@@ -2275,8 +2277,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
-		ret = chip->write_page(mtd, chip, wbuf, 1, page, cached,
-				       (ops->mode == MTD_OPS_RAW));
+		ret = chip->write_page(mtd, chip, wbuf, oob_required, page,
+				       cached, (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
 
-- 
1.7.5.4.2.g519b1
