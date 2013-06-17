Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoeSV-0001Xl-5J
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 18:47:19 +0000
From: Pekon Gupta <pekon@ti.com>
To: <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v5 1/3] ARM: OMAP2+: gpmc: Converts GPMC driver to pm_runtime
 capable
Date: Tue, 18 Jun 2013 00:16:37 +0530
Message-ID: <1371494799-11876-2-git-send-email-pekon@ti.com>
In-Reply-To: <1371494799-11876-1-git-send-email-pekon@ti.com>
References: <1371494799-11876-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tony@atomide.com, khilman@linaro.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: avinash philip <avinashphilip@ti.com>

Support for pm_runtime add to GPMC driver.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
Signed-off-by: Pekon Gupta <pekon@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/gpmc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index fb6f241..1380cee 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -30,6 +30,7 @@
 #include <linux/of_mtd.h>
 #include <linux/of_device.h>
 #include <linux/mtd/nand.h>
+#include <linux/pm_runtime.h>
 
 #include <linux/platform_data/mtd-nand-omap2.h>
 
@@ -1594,7 +1595,8 @@ static int gpmc_probe(struct platform_device *pdev)
 		return PTR_ERR(gpmc_l3_clk);
 	}
 
-	clk_prepare_enable(gpmc_l3_clk);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 
 	gpmc_dev = &pdev->dev;
 
@@ -1634,7 +1636,7 @@ static int gpmc_probe(struct platform_device *pdev)
 
 	rc = gpmc_probe_dt(pdev);
 	if (rc < 0) {
-		clk_disable_unprepare(gpmc_l3_clk);
+		pm_runtime_put_sync(&pdev->dev);
 		clk_put(gpmc_l3_clk);
 		dev_err(gpmc_dev, "failed to probe DT parameters\n");
 		return rc;
@@ -1647,6 +1649,8 @@ static int gpmc_remove(struct platform_device *pdev)
 {
 	gpmc_free_irq();
 	gpmc_mem_exit();
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 	gpmc_dev = NULL;
 	return 0;
 }
-- 
1.8.1
