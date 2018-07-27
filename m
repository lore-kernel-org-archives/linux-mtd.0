Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fixQd-0000bK-Fl
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 07:44:49 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/2] mtd: rawnand: Add the nand_wait_readrdy() helper and use
 it
Date: Fri, 27 Jul 2018 09:44:17 +0200
Message-Id: <20180727074418.32384-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180727074418.32384-1-boris.brezillon@bootlin.com>
References: <20180727074418.32384-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The logic to wait for chip readiness after a page read has been
duplicated in nand_do_read_ops() and nand_do_read_oob(). Provide an
helper that does the right thing and call it where appropriate.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d527e448ce19..21a04b7b918c 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3524,6 +3524,18 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 	return chip->setup_read_retry(mtd, retry_mode);
 }
 
+static void nand_wait_readrdy(struct nand_chip *chip)
+{
+	if (!(chip->options & NAND_NEED_READRDY))
+		return;
+
+	/* Apply delay or wait for ready/busy pin */
+	if (!chip->dev_ready)
+		udelay(chip->chip_delay);
+	else
+		nand_wait_ready(nand_to_mtd(chip));
+}
+
 /**
  * nand_do_read_ops - [INTERN] Read data with ECC
  * @mtd: MTD device structure
@@ -3631,13 +3643,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				}
 			}
 
-			if (chip->options & NAND_NEED_READRDY) {
-				/* Apply delay or wait for ready/busy pin */
-				if (!chip->dev_ready)
-					udelay(chip->chip_delay);
-				else
-					nand_wait_ready(mtd);
-			}
+			nand_wait_readrdy(chip);
 
 			if (mtd->ecc_stats.failed - ecc_failures) {
 				if (retry_mode + 1 < chip->read_retries) {
@@ -3908,13 +3914,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 		len = min(len, readlen);
 		buf = nand_transfer_oob(mtd, buf, ops, len);
 
-		if (chip->options & NAND_NEED_READRDY) {
-			/* Apply delay or wait for ready/busy pin */
-			if (!chip->dev_ready)
-				udelay(chip->chip_delay);
-			else
-				nand_wait_ready(mtd);
-		}
+		nand_wait_readrdy(chip);
 
 		max_bitflips = max_t(unsigned int, max_bitflips, ret);
 
-- 
2.14.1
