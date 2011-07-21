Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QjpwI-0001jw-Iz
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 09:53:10 +0000
From: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: davinci: Add cpufreq support
Date: Thu, 21 Jul 2011 15:09:23 +0530
Message-ID: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: davinci-linux-open-source@linux.davincidsp.com, "Rajashekhara,
	Sudhakar" <sudhakar.raj@ti.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds cpufreq support for NAND driver. During cpufreq
transition, 'davinci_aemif_setup_timing()' function will be called
to reconfigure that AEMIF timings for the new frequency.

Tested on TI DA850/OMAP-L138 EVM.

Signed-off-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>
---
 drivers/mtd/nand/davinci_nand.c |   54 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 1f34951..7e764af 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -33,6 +33,7 @@
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
+#include <linux/cpufreq.h>
 
 #include <mach/nand.h>
 #include <mach/aemif.h>
@@ -74,6 +75,9 @@ struct davinci_nand_info {
 	uint32_t		core_chipsel;
 
 	struct davinci_aemif_timing	*timing;
+#ifdef CONFIG_CPU_FREQ
+	struct notifier_block	freq_transition;
+#endif
 };
 
 static DEFINE_SPINLOCK(davinci_nand_lock);
@@ -519,6 +523,47 @@ static struct nand_ecclayout hwecc4_2048 __initconst = {
 	},
 };
 
+#ifdef CONFIG_CPU_FREQ
+static int nand_davinci_cpufreq_transition(struct notifier_block *nb,
+		unsigned long val, void *data)
+{
+	struct davinci_nand_info *info;
+
+	info = container_of(nb, struct davinci_nand_info, freq_transition);
+
+	if (val == CPUFREQ_POSTCHANGE)
+		davinci_aemif_setup_timing(info->timing, info->base,
+				info->core_chipsel);
+
+	return 0;
+}
+
+static inline int nand_davinci_cpufreq_register(struct davinci_nand_info *info)
+{
+	info->freq_transition.notifier_call = nand_davinci_cpufreq_transition;
+
+	return cpufreq_register_notifier(&info->freq_transition,
+			CPUFREQ_TRANSITION_NOTIFIER);
+}
+
+static inline void nand_davinci_cpufreq_deregister(struct davinci_nand_info
+		*info)
+{
+	cpufreq_unregister_notifier(&info->freq_transition,
+			CPUFREQ_TRANSITION_NOTIFIER);
+}
+#else
+static inline int nand_davinci_cpufreq_register(struct davinci_nand_info *info)
+{
+	return 0;
+}
+
+static inline void nand_davinci_cpufreq_deregister(struct davinci_nand_info
+		*info)
+{
+}
+#endif
+
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata = pdev->dev.platform_data;
@@ -782,12 +827,19 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
+	ret = nand_davinci_cpufreq_register(info);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register cpufreq\n");
+		goto err_cpu_freq_fail;
+	}
+
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
 	       (val >> 8) & 0xff, val & 0xff);
 
 	return 0;
 
+err_cpu_freq_fail:
 err_scan:
 err_timing:
 	clk_disable(info->clk);
@@ -818,6 +870,8 @@ static int __exit nand_davinci_remove(struct platform_device *pdev)
 	struct davinci_nand_info *info = platform_get_drvdata(pdev);
 	int status;
 
+	nand_davinci_cpufreq_deregister(info);
+
 	status = mtd_device_unregister(&info->mtd);
 
 	spin_lock_irq(&davinci_nand_lock);
-- 
1.7.1
