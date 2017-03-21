Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqGf7-0000Qb-Rt
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 10:05:20 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Stefan Roese <sr@denx.de>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH 09/13] mtd: nand: fsmc: remove duplicate nand_set_flash_node()
Date: Tue, 21 Mar 2017 11:04:01 +0100
Message-Id: <1490090645-8576-10-git-send-email-thomas.petazzoni@free-electrons.com>
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

It is already done a few lines before.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/nand/fsmc_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8342c39..990c83a 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -1024,7 +1024,6 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	nand->ecc.size = 512;
 	nand->options = pdata->options;
 	nand->badblockbits = 7;
-	nand_set_flash_node(nand, np);
 	nand->setup_data_interface = fsmc_setup_data_interface;
 
 	switch (host->mode) {
-- 
2.7.4
