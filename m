Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e1uel-00083Q-0G
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 13:33:16 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23992338AbdJJNcqTgAAm (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Tue, 10 Oct 2017 15:32:46 +0200
Date: Tue, 10 Oct 2017 15:32:45 +0200
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-omap@vger.kernel.org
Subject: [PATCH] mtd: nand: omap2: Do not assign omap_nand_info to platform
 drvdata
Message-ID: <20171010133245.jlwto3gpmin5bmtw@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 67ce04bf2746 ("mtd: nand: add OMAP2/OMAP3 NAND driver") assigned
pointer to omap_nand_info to the platform drvdata in probe function
just to be reasigned later to the pointer to mtd_info, which is
what remove function expects it to be. Remove useless assignment.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 drivers/mtd/nand/omap2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 01368a8f9e3f..a97c1aeed55e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1823,7 +1823,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	platform_set_drvdata(pdev, info);
 	info->ops = gpmc_omap_get_nand_ops(&info->reg, info->gpmc_cs);
 	if (!info->ops) {
 		dev_err(&pdev->dev, "Failed to get GPMC->NAND interface\n");
-- 
2.11.0
