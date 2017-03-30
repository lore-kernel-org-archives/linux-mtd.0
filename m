Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVG5-0003uH-CW
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:16:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH v3 36/37] mtd: nand: denali: use non-managed kmalloc() for DMA
 buffer
Date: Thu, 30 Mar 2017 17:15:07 +0900
Message-Id: <1490861708-27813-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As Russell and Lars stated in the discussion [1], using
devm_k*alloc() with DMA is not a good idea.

Let's use kmalloc (not kzalloc because no need for zero-out).
Also, allocate the buffer as late as possible because it must be
freed for any error that follows.

[1] https://lkml.org/lkml/2017/3/8/693

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Acked-by: Robin Murphy <robin.murphy@arm.com>
---

Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 87e5f0f..d10702d 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -1388,13 +1389,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
-	denali->buf = devm_kzalloc(denali->dev, mtd->writesize + mtd->oobsize,
-				   GFP_KERNEL);
-	if (!denali->buf) {
-		ret = -ENOMEM;
-		goto disable_irq;
-	}
-
 	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__DMA)
 		denali->dma_avail = 1;
 
@@ -1514,17 +1508,30 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
+	/*
+	 * This buffer is DMA-mapped by denali_{read,write}_page_raw.  Do not
+	 * use devm_kmalloc() because the memory allocated by devm_ does not
+	 * guarantee DMA-safe alignment.
+	 */
+	denali->buf = kmalloc(mtd->writesize + mtd->oobsize, GFP_KERNEL);
+	if (!denali->buf) {
+		ret = -ENOMEM;
+		goto disable_irq;
+	}
+
 	ret = nand_scan_tail(mtd);
 	if (ret)
-		goto disable_irq;
+		goto free_buf;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto disable_irq;
+		goto free_buf;
 	}
 	return 0;
 
+free_buf:
+	kfree(denali->buf);
 disable_irq:
 	denali_disable_irq(denali);
 
@@ -1544,6 +1551,7 @@ void denali_remove(struct denali_nand_info *denali)
 	int bufsize = mtd->writesize + mtd->oobsize;
 
 	nand_release(mtd);
+	kfree(denali->buf);
 	denali_disable_irq(denali);
 	dma_unmap_single(denali->dev, denali->dma_addr, bufsize,
 			 DMA_BIDIRECTIONAL);
-- 
2.7.4
