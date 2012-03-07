Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F6Q-0006dc-Ag
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:20 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 14/18] fsmc/nand: Modify fsmc driver to accept nand timing
 parameters via platform
Date: Wed, 7 Mar 2012 17:01:02 +0530
Message-ID: <074f5f888413522a7f81d2c0178dcb8ba4a4fb52.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

FSMC controllers provide registers to program the required timing values for
attached NAND device. The timing values used until now are relaxed and should
work for all devices.

Although, for read/write performance improvements, the fsmc nand driver should
accept nand timings as a platform data and program the timing parameters into
fsmc registers accordingly.

This patch implements this modification. Additionally, it programs the default
timing parameters if these are not passed via platform data.

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   41 +++++++++++++++++++++++++++++++++--------
 include/linux/mtd/fsmc.h     |   34 ++++++++++++++++++++++++++++------
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 51add35..7b2e66c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -471,6 +471,8 @@ struct fsmc_nand_data {
 	struct resource		*resaddr;
 	struct resource		*resdata;
 
+	struct fsmc_nand_timings *dev_timings;
+
 	void __iomem		*data_va;
 	void __iomem		*cmd_va;
 	void __iomem		*addr_va;
@@ -551,21 +553,41 @@ static void fsmc_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
  * FSMC registers
  */
 static void fsmc_nand_setup(struct fsmc_regs *regs, uint32_t bank,
-				   uint32_t busw)
+			   uint32_t busw, struct fsmc_nand_timings *timings)
 {
 	uint32_t value = FSMC_DEVTYPE_NAND | FSMC_ENABLE | FSMC_WAITON;
+	uint32_t tclr, tar, thiz, thold, twait, tset;
+	struct fsmc_nand_timings *tims;
+	struct fsmc_nand_timings default_timings = {
+		.tclr	= FSMC_TCLR_1,
+		.tar	= FSMC_TAR_1,
+		.thiz	= FSMC_THIZ_1,
+		.thold	= FSMC_THOLD_4,
+		.twait	= FSMC_TWAIT_6,
+		.tset	= FSMC_TSET_0,
+	};
+
+	if (timings)
+		tims = timings;
+	else
+		tims = &default_timings;
+
+	tclr = (tims->tclr & FSMC_TCLR_MASK) << FSMC_TCLR_SHIFT;
+	tar = (tims->tar & FSMC_TAR_MASK) << FSMC_TAR_SHIFT;
+	thiz = (tims->thiz & FSMC_THIZ_MASK) << FSMC_THIZ_SHIFT;
+	thold = (tims->thold & FSMC_THOLD_MASK) << FSMC_THOLD_SHIFT;
+	twait = (tims->twait & FSMC_TWAIT_MASK) << FSMC_TWAIT_SHIFT;
+	tset = (tims->tset & FSMC_TSET_MASK) << FSMC_TSET_SHIFT;
 
 	if (busw)
 		writel(value | FSMC_DEVWID_16, &regs->bank_regs[bank].pc);
 	else
 		writel(value | FSMC_DEVWID_8, &regs->bank_regs[bank].pc);
 
-	writel(readl(&regs->bank_regs[bank].pc) | FSMC_TCLR_1 | FSMC_TAR_1,
+	writel(readl(&regs->bank_regs[bank].pc) | tclr | tar,
 	       &regs->bank_regs[bank].pc);
-	writel(FSMC_THIZ_1 | FSMC_THOLD_4 | FSMC_TWAIT_6 | FSMC_TSET_0,
-	       &regs->bank_regs[bank].comm);
-	writel(FSMC_THIZ_1 | FSMC_THOLD_4 | FSMC_TWAIT_6 | FSMC_TSET_0,
-	       &regs->bank_regs[bank].attrib);
+	writel(thiz | thold | twait | tset, &regs->bank_regs[bank].comm);
+	writel(thiz | thold | twait | tset, &regs->bank_regs[bank].attrib);
 }
 
 /*
@@ -951,6 +973,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 
 	host->bank = pdata->bank;
 	host->select_chip = pdata->select_bank;
+	host->dev_timings = pdata->nand_timings;
 	regs = host->regs_va;
 
 	/* Link all private pointers */
@@ -975,7 +998,8 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (pdata->width == FSMC_NAND_BW16)
 		nand->options |= NAND_BUSWIDTH_16;
 
-	fsmc_nand_setup(regs, host->bank, nand->options & NAND_BUSWIDTH_16);
+	fsmc_nand_setup(regs, host->bank, nand->options & NAND_BUSWIDTH_16,
+			host->dev_timings);
 
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		nand->ecc.read_page = fsmc_read_page_hwecc;
@@ -1178,7 +1202,8 @@ static int fsmc_nand_resume(struct device *dev)
 	if (host) {
 		clk_enable(host->clk);
 		fsmc_nand_setup(host->regs_va, host->bank,
-				host->nand.options & NAND_BUSWIDTH_16);
+				host->nand.options & NAND_BUSWIDTH_16,
+				host->dev_timings);
 	}
 	return 0;
 }
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index e877325..c4ac07a 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -90,17 +90,29 @@ struct fsmc_regs {
 #define FSMC_ECCEN		(1 << 6)
 #define FSMC_ECCPLEN_512	(0 << 7)
 #define FSMC_ECCPLEN_256	(1 << 7)
-#define FSMC_TCLR_1		(1 << 9)
-#define FSMC_TAR_1		(1 << 13)
+#define FSMC_TCLR_1		(1)
+#define FSMC_TCLR_SHIFT		(9)
+#define FSMC_TCLR_MASK		(0xF)
+#define FSMC_TAR_1		(1)
+#define FSMC_TAR_SHIFT		(13)
+#define FSMC_TAR_MASK		(0xF)
 
 /* sts register definitions */
 #define FSMC_CODE_RDY		(1 << 15)
 
 /* comm register definitions */
-#define FSMC_TSET_0		(0 << 0)
-#define FSMC_TWAIT_6		(6 << 8)
-#define FSMC_THOLD_4		(4 << 16)
-#define FSMC_THIZ_1		(1 << 24)
+#define FSMC_TSET_0		0
+#define FSMC_TSET_SHIFT		0
+#define FSMC_TSET_MASK		0xFF
+#define FSMC_TWAIT_6		6
+#define FSMC_TWAIT_SHIFT	8
+#define FSMC_TWAIT_MASK		0xFF
+#define FSMC_THOLD_4		4
+#define FSMC_THOLD_SHIFT	16
+#define FSMC_THOLD_MASK		0xFF
+#define FSMC_THIZ_1		1
+#define FSMC_THIZ_SHIFT		24
+#define FSMC_THIZ_MASK		0xFF
 
 /*
  * There are 13 bytes of ecc for every 512 byte block in FSMC version 8
@@ -120,6 +132,15 @@ struct fsmc_eccplace {
 	struct fsmc_nand_eccplace eccplace[MAX_ECCPLACE_ENTRIES];
 };
 
+struct fsmc_nand_timings {
+	uint8_t tclr;
+	uint8_t tar;
+	uint8_t thiz;
+	uint8_t thold;
+	uint8_t twait;
+	uint8_t tset;
+};
+
 /**
  * fsmc_nand_platform_data - platform specific NAND controller config
  * @partitions: partition table for the platform, use a default fallback
@@ -133,6 +154,7 @@ struct fsmc_eccplace {
  * this may be set to NULL
  */
 struct fsmc_nand_platform_data {
+	struct fsmc_nand_timings *nand_timings;
 	struct mtd_partition	*partitions;
 	unsigned int		nr_partitions;
 	unsigned int		options;
-- 
1.7.0.4
