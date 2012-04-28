Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNwVr-0002zN-6t
 for linux-mtd@lists.infradead.org; Sat, 28 Apr 2012 01:31:52 +0000
Received: by dadn15 with SMTP id n15so2141518dad.16
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 18:31:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 02/10] mtd: nand: pass proper 'oob_required' parameter
Date: Fri, 27 Apr 2012 18:29:46 -0700
Message-Id: <1335576594-25267-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
Cc: Li Yang <leoli@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
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
parameter can improve performance for NAND HW and SW that can simply avoid
transferring the OOB data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 96d950e..13a6355 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1469,7 +1469,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 	struct nand_chip *chip = mtd->priv;
 	struct mtd_ecc_stats stats;
 	int blkcheck = (1 << (chip->phys_erase_shift - chip->page_shift)) - 1;
-	int sndcmd = 1;
+	int sndcmd = 1, oob_required;
 	int ret = 0;
 	uint32_t readlen = ops->len;
 	uint32_t oobreadlen = ops->ooblen;
@@ -1490,6 +1490,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 	buf = ops->datbuf;
 	oob = ops->oobbuf;
+	oob_required = oob ? 1 : 0;
 
 	while (1) {
 		bytes = min(mtd->writesize - col, readlen);
@@ -1507,13 +1508,14 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			/* Now read the page into the buffer */
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
@@ -1536,7 +1538,6 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			buf += bytes;
 
 			if (unlikely(oob)) {
-
 				int toread = min(oobreadlen, max_oobsize);
 
 				if (toread) {
@@ -2216,6 +2217,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	uint8_t *oob = ops->oobbuf;
 	uint8_t *buf = ops->datbuf;
 	int ret, subpage;
+	int oob_required = oob ? 1 : 0;
 
 	ops->retlen = 0;
 	if (!writelen)
@@ -2278,8 +2280,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
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
