Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Pk-Rv
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:27 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 06/13] mtd: nand: fsmc: remove fsmc_select_chip()
Date: Tue, 21 Mar 2017 11:03:58 +0100
Message-Id: <1490090645-8576-7-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1490090645-8576-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

host->select_chip used to point to the ->select_bank() function provided
by the platform data, but the latter no longer exists. Therefore
host->select_chip is always NULL.

Due to this, the fsmc_select_chip() does nothing, except:

  chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);

when chipnr is -1, which is exactly what the default implementation of
->select_chip() does in the NAND framework. So, this commit kills
fsmc_select_chip() entirely.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 928ff98..1c9744b 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -203,8 +203,6 @@ struct fsmc_nand_data {
 	void __iomem		*cmd_va;
 	void __iomem		*addr_va;
 	void __iomem		*regs_va;
-
-	void			(*select_chip)(uint32_t bank, uint32_t busw);
 };
 
 static int fsmc_ecc1_ooblayout_ecc(struct mtd_info *mtd, int section,
@@ -296,32 +294,6 @@ static inline struct fsmc_nand_data *mtd_to_fsmc(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct fsmc_nand_data, nand);
 }
 
-/* Assert CS signal based on chipnr */
-static void fsmc_select_chip(struct mtd_info *mtd, int chipnr)
-{
-	struct nand_chip *chip = mtd_to_nand(mtd);
-	struct fsmc_nand_data *host;
-
-	host = mtd_to_fsmc(mtd);
-
-	switch (chipnr) {
-	case -1:
-		chip->cmd_ctrl(mtd, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
-		break;
-	case 0:
-	case 1:
-	case 2:
-	case 3:
-		if (host->select_chip)
-			host->select_chip(chipnr,
-					chip->options & NAND_BUSWIDTH_16);
-		break;
-
-	default:
-		dev_err(host->dev, "unsupported chip-select %d\n", chipnr);
-	}
-}
-
 /*
  * fsmc_cmd_ctrl - For facilitaing Hardware access
  * This routine allows hardware specific access to control-lines(ALE,CLE)
@@ -1061,7 +1033,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.hwctl = fsmc_enable_hwecc;
 	nand->ecc.size = 512;
 	nand->options = pdata->options;
-	nand->select_chip = fsmc_select_chip;
 	nand->badblockbits = 7;
 	nand_set_flash_node(nand, np);
 	nand->setup_data_interface = fsmc_setup_data_interface;
-- 
2.7.4
