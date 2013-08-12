Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8vik-0007so-Tb
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 17:15:59 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 11/14] mtd: nand: pxa3xx: Make dma code dependent on dma
 capable platforms
Date: Mon, 12 Aug 2013 14:14:56 -0300
Message-Id: <1376327699-7973-12-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376327699-7973-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a macro ARCH_HAS_DMA to compile-out arch specific
dma code, namely pxa_request_dma() and pxa_free_dma(). These symbols
are available only in pxa, which makes impossible to build the driver in
other platforms than ARCH_PXA.

In order to handle non-dma capable platforms, we implement a fallbacks that
allocate buffers as if 'use_dma=false', putting the dma related code
under the ARCH_HAS_DMA conditional.

Please note that the correct way to handle this is to migrate the
dma code to use of the mmp_pdma dmaengine driver. However, currently
this is not possible because the two dmaengine drivers can't work together.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index ea8e048..c8f7d87 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -25,7 +25,14 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 
+#if defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP)
+#define ARCH_HAS_DMA
+#endif
+
+#ifdef ARCH_HAS_DMA
 #include <mach/dma.h>
+#endif
+
 #include <linux/platform_data/mtd-nand-pxa3xx.h>
 
 #define	CHIP_DELAY_TIMEOUT	(2 * HZ/10)
@@ -381,6 +388,7 @@ static void handle_data_pio(struct pxa3xx_nand_info *info)
 	}
 }
 
+#ifdef ARCH_HAS_DMA
 static void start_data_dma(struct pxa3xx_nand_info *info)
 {
 	struct pxa_dma_desc *desc = info->data_desc;
@@ -427,6 +435,10 @@ static void pxa3xx_nand_data_dma_irq(int channel, void *data)
 	enable_int(info, NDCR_INT_MASK);
 	nand_writel(info, NDSR, NDSR_WRDREQ | NDSR_RDDREQ);
 }
+#else
+static void start_data_dma(struct pxa3xx_nand_info *info)
+{}
+#endif
 
 static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
 {
@@ -905,6 +917,7 @@ static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
  */
 #define MAX_BUFF_SIZE	PAGE_SIZE
 
+#ifdef ARCH_HAS_DMA
 static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
 {
 	struct platform_device *pdev = info->pdev;
@@ -950,6 +963,20 @@ static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
 		kfree(info->data_buff);
 	}
 }
+#else
+static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
+{
+	info->data_buff = kmalloc(MAX_BUFF_SIZE, GFP_KERNEL);
+	if (info->data_buff == NULL)
+		return -ENOMEM;
+	return 0;
+}
+
+static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
+{
+	kfree(info->data_buff);
+}
+#endif
 
 static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 {
@@ -1258,6 +1285,13 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	struct pxa3xx_nand_info *info;
 	int ret, cs, probe_success;
 
+#ifndef ARCH_HAS_DMA
+	if (use_dma) {
+		use_dma = 0;
+		dev_warn(&pdev->dev,
+			 "This platform can't do DMA on this device\n");
+	}
+#endif
 	ret = pxa3xx_nand_probe_dt(pdev);
 	if (ret)
 		return ret;
-- 
1.8.1.5
