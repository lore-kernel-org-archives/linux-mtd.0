Received: from eu1sys200aog111.obsmtp.com ([207.126.144.131])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7hXa-0002o0-9f
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 06:18:31 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>, <dedekind1@gmail.com>
Subject: [PATCH v2 07/13] mtd/fsmc_nand: add pm callbacks to support
 hibernation
Date: Wed, 14 Mar 2012 11:47:13 +0530
Message-ID: <612429607c7489f32fa6c031cff6e1a44ecefb59.1331705527.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331705527.git.vipin.kumar@st.com>
References: <cover.1331705527.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: sr@denx.de, Shiraz Hashim <shiraz.hashim@st.com>, linus.walleij@linaro.org,
 spear-devel@list.st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shiraz Hashim <shiraz.hashim@st.com>

Signed-off-by: Shiraz Hashim <shiraz.hashim@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index bfc924f..5433856 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -382,7 +382,7 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  * This routine initializes timing parameters related to NAND memory access in
  * FSMC registers
  */
-static void __init fsmc_nand_setup(struct fsmc_regs *regs, uint32_t bank,
+static void fsmc_nand_setup(struct fsmc_regs *regs, uint32_t bank,
 				   uint32_t busw)
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
@@ -976,15 +976,15 @@ static int fsmc_nand_suspend(struct device *dev)
 static int fsmc_nand_resume(struct device *dev)
 {
 	struct fsmc_nand_data *host = dev_get_drvdata(dev);
-	if (host)
+	if (host) {
 		clk_enable(host->clk);
+		fsmc_nand_setup(host->regs_va, host->bank,
+				host->nand.options & NAND_BUSWIDTH_16);
+	}
 	return 0;
 }
 
-static const struct dev_pm_ops fsmc_nand_pm_ops = {
-	.suspend = fsmc_nand_suspend,
-	.resume = fsmc_nand_resume,
-};
+static SIMPLE_DEV_PM_OPS(fsmc_nand_pm_ops, fsmc_nand_suspend, fsmc_nand_resume);
 #endif
 
 static struct platform_driver fsmc_nand_driver = {
-- 
1.7.0.4
