Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkQ-0002d5-Vb
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:47 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi5so447856wib.4
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:24 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/47] mtd: nand: stm_nand_bch: supply clock support
Date: Thu,  1 May 2014 10:56:16 +0100
Message-Id: <1398938214-17847-10-git-send-email-lee.jones@linaro.org>
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

Add support for clocks when, and only when, they are supplied. It is
not yet compulsory to provide the BCH and EMI clocks, as Common Clk isn't
supported Mainline yet. Until an implementation lands upstream all clocks
located on STM boards default to always-on.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 49 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 62a41de..8e28da0 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/interrupt.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
@@ -28,6 +29,9 @@
 struct nandi_controller {
 	void __iomem		*base;		/* Controller base*/
 	void __iomem		*dma;		/* DMA control base */
+
+	struct clk		*bch_clk;
+	struct clk		*emi_clk;
 						/* IRQ-triggered Completions: */
 	struct completion	seq_completed;	/*   SEQ Over */
 	struct completion	rbn_completed;	/*   RBn */
@@ -270,6 +274,44 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
 	writel(val, nandi->base + NANDBCH_INT_EN);
 }
 
+static void nandi_clk_enable(struct nandi_controller *nandi)
+{
+	if (nandi->emi_clk)
+		clk_prepare_enable(nandi->emi_clk);
+	if (nandi->bch_clk)
+		clk_prepare_enable(nandi->bch_clk);
+}
+
+static void nandi_clk_disable(struct nandi_controller *nandi)
+{
+	if (nandi->emi_clk)
+		clk_disable_unprepare(nandi->emi_clk);
+	if (nandi->bch_clk)
+		clk_disable_unprepare(nandi->bch_clk);
+}
+
+static struct clk *nandi_clk_setup(struct nandi_controller *nandi,
+				   char *clkname)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = clk_get(nandi->dev, clkname);
+	if (IS_ERR_OR_NULL(clk)) {
+		dev_warn(nandi->dev, "Failed to get %s clock\n", clkname);
+		return NULL;
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_warn(nandi->dev, "Failed to enable %s clock\n", clkname);
+		clk_put(clk);
+		return NULL;
+	}
+
+	return clk;
+}
+
 static void nandi_init_bch(struct nandi_controller *nandi, int emi_bank)
 {
 	dev_dbg(nandi->dev, "%s\n", __func__);
@@ -384,6 +426,9 @@ nandi_init_resources(struct platform_device *pdev)
 		return ERR_PTR(err);
 	}
 
+	nandi->emi_clk = nandi_clk_setup(nandi, "emi_clk");
+	nandi->bch_clk = nandi_clk_setup(nandi, "bch_clk");
+
 	platform_set_drvdata(pdev, nandi);
 
 	return nandi;
@@ -413,6 +458,10 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
 static int stm_nand_bch_remove(struct platform_device *pdev)
 {
+	struct nandi_controller *nandi = platform_get_drvdata(pdev);
+
+	nandi_clk_disable(nandi);
+
 	return 0;
 }
 
-- 
1.8.3.2
