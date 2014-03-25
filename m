Received: from mail-wg0-f42.google.com ([74.125.82.42])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbS-0007BQ-0Z
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:00 +0000
Received: by mail-wg0-f42.google.com with SMTP id y10so75340wgg.13
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 08/47] mtd: nand: stm_nand_bch: supply clock support
Date: Tue, 25 Mar 2014 08:19:25 +0000
Message-Id: <1395735604-26706-9-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index 1a93f8d..cc0159e 100644
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
@@ -103,6 +107,44 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
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
@@ -217,6 +259,9 @@ nandi_init_resources(struct platform_device *pdev)
 		return ERR_PTR(err);
 	}
 
+	nandi->emi_clk = nandi_clk_setup(nandi, "emi_clk");
+	nandi->bch_clk = nandi_clk_setup(nandi, "bch_clk");
+
 	platform_set_drvdata(pdev, nandi);
 
 	return nandi;
@@ -251,6 +296,10 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 
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
