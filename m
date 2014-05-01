Received: from mail-we0-f170.google.com ([74.125.82.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkV-0002ea-97
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:51 +0000
Received: by mail-we0-f170.google.com with SMTP id w61so2894735wes.29
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:28 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/47] mtd: nand: stm_nand_bch: initialise the Hamming
 Controller
Date: Thu,  1 May 2014 10:56:18 +0100
Message-Id: <1398938214-17847-12-git-send-email-lee.jones@linaro.org>
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

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 19d090c..0c6aad2 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -365,6 +365,41 @@ static struct clk *nandi_clk_setup(struct nandi_controller *nandi,
 	return clk;
 }
 
+static void nandi_init_hamming(struct nandi_controller *nandi, int emi_bank)
+{
+	dev_dbg(nandi->dev, "%s\n", __func__);
+
+	emiss_nandi_select(STM_NANDI_HAMMING);
+
+	/* Reset and disable boot-mode controller */
+	writel(BOOT_CFG_RESET, nandi->base + NANDHAM_BOOTBANK_CFG);
+	udelay(1);
+	writel(0x00000000, nandi->base + NANDHAM_BOOTBANK_CFG);
+
+	/* Reset controller */
+	writel(CFG_RESET, nandi->base + NANDHAM_FLEXMODE_CFG);
+	udelay(1);
+	writel(0x00000000, nandi->base + NANDHAM_FLEXMODE_CFG);
+
+	/* Set EMI Bank */
+	writel(0x1 << emi_bank, nandi->base + NANDHAM_FLEX_MUXCTRL);
+
+	/* Enable FLEX mode */
+	writel(CFG_ENABLE_FLEX, nandi->base + NANDHAM_FLEXMODE_CFG);
+
+	/* Configure FLEX_DATA_READ/WRITE for 1-byte access */
+	writel(FLEX_DATA_CFG_BEATS_1 | FLEX_DATA_CFG_CSN,
+	       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+	writel(FLEX_DATA_CFG_BEATS_1 | FLEX_DATA_CFG_CSN,
+	       nandi->base + NANDHAM_FLEX_DATAREAD_CONFIG);
+
+	/* RBn interrupt on rising edge */
+	writel(NAND_EDGE_CFG_RBN_RISING, nandi->base + NANDHAM_INT_EDGE_CFG);
+
+	/* Enable interrupts */
+	nandi_enable_interrupts(nandi, NAND_INT_ENABLE);
+}
+
 static void nandi_init_bch(struct nandi_controller *nandi, int emi_bank)
 {
 	dev_dbg(nandi->dev, "%s\n", __func__);
@@ -413,6 +448,7 @@ static void nandi_init_controller(struct nandi_controller *nandi,
 				  int emi_bank)
 {
 	nandi_init_bch(nandi, emi_bank);
+	nandi_init_hamming(nandi, emi_bank);
 }
 
 static int remap_named_resource(struct platform_device *pdev,
-- 
1.8.3.2
