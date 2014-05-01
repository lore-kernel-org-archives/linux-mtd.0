Received: from mail-we0-f181.google.com ([74.125.82.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkK-0002Zc-Me
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:41 +0000
Received: by mail-we0-f181.google.com with SMTP id q58so2829733wes.40
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 06/47] mtd: nand: stm_nand_bch: IRQ support for ST's BCH NAND
 Controller driver
Date: Thu,  1 May 2014 10:56:13 +0100
Message-Id: <1398938214-17847-7-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Obtain IRQ number and request IRQ resource via the usual methods. We're
also registering an IRQ handler to inform us of any completed tasks.
Notice that we're starting to make use of the device struct that we
defined before. In keeping with the subject of the patch, we're also
adding the related local enable_irq() and disable_irq() methods. Again,
these will be utilised in a greater capacity in latter commits.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 62 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 2d6a81f..d73568c 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -15,11 +15,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/completion.h>
 #include <linux/mtd/stm_nand.h>
 
+#include "stm_nand_regs.h"
+
 /* NANDi Controller (Hamming/BCH) */
 struct nandi_controller {
 	void __iomem		*base;		/* Controller base*/
@@ -221,6 +224,51 @@ const struct nand_timing_spec st_nand_onfi_timing_specs[] = {
 	}
 };
 
+/*
+ * NANDi Interrupts (shared by Hamming and BCH controllers)
+ */
+static irqreturn_t nandi_irq_handler(int irq, void *dev)
+{
+	struct nandi_controller *nandi = dev;
+	unsigned int status;
+
+	status = readl(nandi->base + NANDBCH_INT_STA);
+
+	if (status & NANDBCH_INT_SEQNODESOVER) {
+		/* BCH */
+		writel(NANDBCH_INT_CLR_SEQNODESOVER,
+		       nandi->base + NANDBCH_INT_CLR);
+		complete(&nandi->seq_completed);
+	}
+	if (status & NAND_INT_RBN) {
+		/* Hamming */
+		writel(NAND_INT_CLR_RBN, nandi->base + NANDHAM_INT_CLR);
+		complete(&nandi->rbn_completed);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void nandi_enable_interrupts(struct nandi_controller *nandi,
+				    uint32_t irqs)
+{
+	uint32_t val;
+
+	val = readl(nandi->base + NANDBCH_INT_EN);
+	val |= irqs;
+	writel(val, nandi->base + NANDBCH_INT_EN);
+}
+
+static void nandi_disable_interrupts(struct nandi_controller *nandi,
+				     uint32_t irqs)
+{
+	uint32_t val;
+
+	val = readl(nandi->base + NANDBCH_INT_EN);
+	val &= ~irqs;
+	writel(val, nandi->base + NANDBCH_INT_EN);
+}
+
 static int remap_named_resource(struct platform_device *pdev,
 				char *name,
 				void __iomem **io_ptr)
@@ -252,6 +300,7 @@ static struct nandi_controller *
 nandi_init_resources(struct platform_device *pdev)
 {
 	struct nandi_controller *nandi;
+	int irq;
 	int err;
 
 	nandi = devm_kzalloc(&pdev->dev, sizeof(*nandi), GFP_KERNEL);
@@ -271,6 +320,19 @@ nandi_init_resources(struct platform_device *pdev)
 	if (err)
 		return ERR_PTR(err);
 
+	irq = platform_get_irq_byname(pdev, "nand_irq");
+	if (irq < 0) {
+		dev_err(&pdev->dev, "failed to find IRQ resource\n");
+		return ERR_PTR(irq);
+	}
+
+	err = devm_request_irq(&pdev->dev, irq, nandi_irq_handler,
+			       IRQF_DISABLED, dev_name(&pdev->dev), nandi);
+	if (err) {
+		dev_err(&pdev->dev, "irq request failed\n");
+		return ERR_PTR(err);
+	}
+
 	platform_set_drvdata(pdev, nandi);
 
 	return nandi;
-- 
1.8.3.2
