Received: from hauke-m.de ([5.39.93.123])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF6oC-0000SA-AZ
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 21:32:41 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com,
	richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v5 4/8] mtd: nand: xway: remove manual reset
Date: Mon, 20 Jun 2016 23:32:10 +0200
Message-Id: <1466458334-10830-5-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
References: <1466458334-10830-1-git-send-email-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_scan() already resets the NAND flash chip, this driver does not
have to call it manually. The xway_reset_chip() functions does the same
as the normal NAND reset function. The waiting for the NAND_WAIT_WR_C
is done in xway_cmd_ctrl().

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/xway_nand.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
index 6028edb..ab93b353 100644
--- a/drivers/mtd/nand/xway_nand.c
+++ b/drivers/mtd/nand/xway_nand.c
@@ -35,7 +35,6 @@
 #define NAND_CMD_CS		BIT(4) /* chip select */
 #define NAND_CMD_SE		BIT(5) /* spare area access latch */
 #define NAND_CMD_WP		BIT(6) /* write protect */
-#define NAND_WRITE_CMD_RESET	0xff
 #define NAND_WRITE_CMD		(NAND_CMD_CS | NAND_CMD_CLE)
 #define NAND_WRITE_ADDR		(NAND_CMD_CS | NAND_CMD_ALE)
 #define NAND_WRITE_DATA		(NAND_CMD_CS)
@@ -68,22 +67,6 @@ struct xway_nand_data {
 	struct nand_chip	chip;
 };
 
-static void xway_reset_chip(struct nand_chip *chip)
-{
-	unsigned long nandaddr = (unsigned long) chip->IO_ADDR_W;
-	unsigned long flags;
-
-	nandaddr &= ~NAND_WRITE_ADDR;
-	nandaddr |= NAND_WRITE_CMD;
-
-	/* finish with a reset */
-	spin_lock_irqsave(&ebu_lock, flags);
-	writeb(NAND_WRITE_CMD_RESET, (void __iomem *) nandaddr);
-	while ((ltq_ebu_r32(EBU_NAND_WAIT) & NAND_WAIT_WR_C) == 0)
-		;
-	spin_unlock_irqrestore(&ebu_lock, flags);
-}
-
 static void xway_select_chip(struct mtd_info *mtd, int chip)
 {
 
@@ -199,9 +182,6 @@ static int xway_nand_probe(struct platform_device *pdev)
 		| NAND_CON_SE_P | NAND_CON_WP_P | NAND_CON_PRE_P
 		| cs_flag, EBU_NAND_CON);
 
-	/* finish with a reset */
-	xway_reset_chip(&data->chip);
-
 	/* Scan to find existence of the device */
 	err = nand_scan(mtd, 1);
 	if (err)
-- 
2.8.1
