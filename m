Received: from conuserg-10.nifty.com ([210.131.2.77])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1M6-0003vV-Mz
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:24:18 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 22/23] mtd: nand: denali: use non-managed kmalloc() for DMA
 buffer
Date: Tue,  6 Jun 2017 08:22:01 +0900
Message-Id: <1496704922-12261-23-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
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

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index e4ab397..f2b1592 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/mtd/mtd.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -1402,13 +1403,6 @@ int denali_init(struct denali_nand_info *denali)
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
 
@@ -1492,17 +1486,30 @@ int denali_init(struct denali_nand_info *denali)
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
 
@@ -1516,6 +1523,7 @@ void denali_remove(struct denali_nand_info *denali)
 	struct mtd_info *mtd = nand_to_mtd(&denali->nand);
 
 	nand_release(mtd);
+	kfree(denali->buf);
 	denali_disable_irq(denali);
 }
 EXPORT_SYMBOL(denali_remove);
-- 
2.7.4
