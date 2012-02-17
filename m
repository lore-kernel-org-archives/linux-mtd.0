From: Bernhard Walle <walle@corscience.de>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: omap2: Release memory region in .remove function
Date: Fri, 17 Feb 2012 15:49:32 +0100
Message-Id: <1329490172-8043-1-git-send-email-walle@corscience.de>
Cc: tony@atomide.com, Artem.Bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, vimal.newwork@gmail.com, s-ghorai@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When the driver is compiled as module, it's not possible to unload and
reload the driver again:

    omap2-nand: probe of omap2-nand.0 failed with error -16

This patch fixes the problem because it releases the memory region, so
that it can be requested again.

Signed-off-by: Bernhard Walle <walle@corscience.de>
---
 drivers/mtd/nand/omap2.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index b3a883e..7dfcf68 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1132,6 +1132,7 @@ static int omap_nand_remove(struct platform_device *pdev)
 	/* Release NAND device, its internal structures and partitions */
 	nand_release(&info->mtd);
 	iounmap(info->nand.IO_ADDR_R);
+	release_mem_region(info->phys_base, NAND_IO_SIZE);
 	kfree(&info->mtd);
 	return 0;
 }
-- 
1.7.9.1
