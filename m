Received: from ns.vscht.cz ([2001:718:3:15::5])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9wrv-0000pD-HV
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 10:00:17 +0000
From: Jiri Pinkava <jiri.pinkava@vscht.cz>
To: <dedekind1@gmail.com>
Subject: [PATCH 1/2] nand: Fix S3C NAND clock stop
Date: Wed, 13 Apr 2011 11:59:30 +0200
Message-ID: <1302688771-17252-1-git-send-email-jiri.pinkava@vscht.cz>
In-Reply-To: <1302665784.14691.5.camel@koala>
References: <1302665784.14691.5.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Jiri Pinkava <jiri.pinkava@vscht.cz>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current implementation of s3c2410_nand_select_chip call
clk_disable every time when chip = -1 (de-select). This happend
multiple times even if chip was already de-selected. This causes
disabling clock even if they are already disabled and due to
nature of clock subsytem implementation this causes nand clock
to be disabled and newer enabled again.

Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
---
 drivers/mtd/nand/s3c2410.c |   59 ++++++++++++++++++++++++++++++++------------
 1 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 33d832d..cea775a 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -55,7 +55,7 @@ static int hardware_ecc = 0;
 #endif
 
 #ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
-static int clock_stop = 1;
+static const int clock_stop = 1;
 #else
 static const int clock_stop = 0;
 #endif
@@ -96,6 +96,12 @@ enum s3c_cpu_type {
 	TYPE_S3C2440,
 };
 
+enum s3c_nand_clk_state {
+	CLOCK_DISABLE	= 0,
+	CLOCK_ENABLE,
+	CLOCK_SUSPEND,
+};
+
 /* overview of the s3c2410 nand state */
 
 /**
@@ -111,6 +117,7 @@ enum s3c_cpu_type {
  * @mtd_count: The number of MTDs created from this controller.
  * @save_sel: The contents of @sel_reg to be saved over suspend.
  * @clk_rate: The clock rate from @clk.
+ * @clk_state: The current clock state.
  * @cpu_type: The exact type of this controller.
  */
 struct s3c2410_nand_info {
@@ -129,6 +136,7 @@ struct s3c2410_nand_info {
 	int				mtd_count;
 	unsigned long			save_sel;
 	unsigned long			clk_rate;
+	enum s3c_nand_clk_state		clk_state;
 
 	enum s3c_cpu_type		cpu_type;
 
@@ -159,11 +167,33 @@ static struct s3c2410_platform_nand *to_nand_plat(struct platform_device *dev)
 	return dev->dev.platform_data;
 }
 
-static inline int allow_clk_stop(struct s3c2410_nand_info *info)
+static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
 {
 	return clock_stop;
 }
 
+/**
+ * s3c2410_nand_clk_set_state - Enable, disable or suspend NAND clock.
+ * @info: The controller instance.
+ * @new_state: State to which clock should be set.
+ */
+static void s3c2410_nand_clk_set_state(struct s3c2410_nand_info *info,
+		enum s3c_nand_clk_state new_state)
+{
+	if (!allow_clk_suspend(info) && new_state == CLOCK_SUSPEND)
+		return;
+
+	if (info->clk_state == CLOCK_ENABLE) {
+		if (new_state != CLOCK_ENABLE)
+			clk_disable(info->clk);
+	} else {
+		if (new_state == CLOCK_ENABLE)
+			clk_enable(info->clk);
+	}
+
+	info->clk_state = new_state;
+}
+
 /* timing calculations */
 
 #define NS_IN_KHZ 1000000
@@ -333,8 +363,8 @@ static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 	nmtd = this->priv;
 	info = nmtd->info;
 
-	if (chip != -1 && allow_clk_stop(info))
-		clk_enable(info->clk);
+	if (chip != -1)
+		s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
 
 	cur = readl(info->sel_reg);
 
@@ -356,8 +386,8 @@ static void s3c2410_nand_select_chip(struct mtd_info *mtd, int chip)
 
 	writel(cur, info->sel_reg);
 
-	if (chip == -1 && allow_clk_stop(info))
-		clk_disable(info->clk);
+	if (chip == -1)
+		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
 }
 
 /* s3c2410_nand_hwcontrol
@@ -694,8 +724,7 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 	/* free the common resources */
 
 	if (info->clk != NULL && !IS_ERR(info->clk)) {
-		if (!allow_clk_stop(info))
-			clk_disable(info->clk);
+		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
 		clk_put(info->clk);
 	}
 
@@ -947,7 +976,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 		goto exit_error;
 	}
 
-	clk_enable(info->clk);
+	s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
 
 	/* allocate and map the resource */
 
@@ -1026,9 +1055,9 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 		goto exit_error;
 	}
 
-	if (allow_clk_stop(info)) {
+	if (allow_clk_suspend(info)) {
 		dev_info(&pdev->dev, "clock idle support enabled\n");
-		clk_disable(info->clk);
+		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
 	}
 
 	pr_debug("initialised ok\n");
@@ -1059,8 +1088,7 @@ static int s3c24xx_nand_suspend(struct platform_device *dev, pm_message_t pm)
 
 		writel(info->save_sel | info->sel_bit, info->sel_reg);
 
-		if (!allow_clk_stop(info))
-			clk_disable(info->clk);
+		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
 	}
 
 	return 0;
@@ -1072,7 +1100,7 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 	unsigned long sel;
 
 	if (info) {
-		clk_enable(info->clk);
+		s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
 		s3c2410_nand_inithw(info);
 
 		/* Restore the state of the nFCE line. */
@@ -1082,8 +1110,7 @@ static int s3c24xx_nand_resume(struct platform_device *dev)
 		sel |= info->save_sel & info->sel_bit;
 		writel(sel, info->sel_reg);
 
-		if (allow_clk_stop(info))
-			clk_disable(info->clk);
+		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
 	}
 
 	return 0;
-- 
1.7.4.4
