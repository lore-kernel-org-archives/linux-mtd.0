Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fixQd-0000bL-Fj
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 07:44:50 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 2/2] mtd: rawnand: Add the nand_wait_rdy_op() helper and use it
Date: Fri, 27 Jul 2018 09:44:18 +0200
Message-Id: <20180727074418.32384-3-boris.brezillon@bootlin.com>
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

In order to make sure we use ->exec_op() to wait for chip readiness
when it's available we provide an helper that does the selection
between ->exec_op(), udelay(chip->chip_delay) and nand_wait_ready()
based on what's implemented by the controller driver.

We then use it in nand_wait_readrdy().

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 21a04b7b918c..e591410cddc9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2246,6 +2246,28 @@ static int nand_get_features_op(struct nand_chip *chip, u8 feature,
 	return 0;
 }
 
+static int nand_wait_rdy_op(struct nand_chip *chip, unsigned int timeout_ms,
+			    unsigned int delay_ns)
+{
+	if (chip->exec_op) {
+		struct nand_op_instr instrs[] = {
+			NAND_OP_WAIT_RDY(PSEC_TO_MSEC(timeout_ms),
+					 PSEC_TO_NSEC(delay_ns)),
+		};
+		struct nand_operation op = NAND_OPERATION(instrs);
+
+		return nand_exec_op(chip, &op);
+	}
+
+	/* Apply delay or wait for ready/busy pin */
+	if (!chip->dev_ready)
+		udelay(chip->chip_delay);
+	else
+		nand_wait_ready(nand_to_mtd(chip));
+
+	return 0;
+}
+
 /**
  * nand_reset_op - Do a reset operation
  * @chip: The NAND chip
@@ -3526,14 +3548,13 @@ static int nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
 
 static void nand_wait_readrdy(struct nand_chip *chip)
 {
+	const struct nand_sdr_timings *sdr;
+
 	if (!(chip->options & NAND_NEED_READRDY))
 		return;
 
-	/* Apply delay or wait for ready/busy pin */
-	if (!chip->dev_ready)
-		udelay(chip->chip_delay);
-	else
-		nand_wait_ready(nand_to_mtd(chip));
+	sdr = nand_get_sdr_timings(&chip->data_interface);
+	WARN_ON(nand_wait_rdy_op(chip, PSEC_TO_MSEC(sdr->tR_max), 0));
 }
 
 /**
-- 
2.14.1
