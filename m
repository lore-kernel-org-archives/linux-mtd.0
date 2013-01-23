From: Philip Avinash <avinashphilip@ti.com>
To: <khilman@ti.com>, <tony@atomide.com>, <linux@arm.linux.org.uk>,
 <dwmw2@infradead.org>
Subject: [PATCH 3/4] arm: gpmc: Low power transition support
Date: Wed, 23 Jan 2013 15:15:45 +0530
Message-ID: <1358934346-16822-4-git-send-email-avinashphilip@ti.com>
In-Reply-To: <1358933176-12409-1-git-send-email-avinashphilip@ti.com>
References: <1358933176-12409-1-git-send-email-avinashphilip@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: afzal@ti.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 gururaja.hebbar@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With GPMC converted to platform driver recently, adds low power
transition support in driver itself.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
---
 arch/arm/mach-omap2/gpmc.c |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
index aed958a..af10617 100644
--- a/arch/arm/mach-omap2/gpmc.c
+++ b/arch/arm/mach-omap2/gpmc.c
@@ -1357,9 +1357,29 @@ static __devexit int gpmc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int gpmc_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	omap3_gpmc_save_context();
+	clk_disable_unprepare(gpmc_l3_clk);
+	return 0;
+}
+
+static int gpmc_resume(struct platform_device *pdev)
+{
+	clk_prepare_enable(gpmc_l3_clk);
+	omap3_gpmc_restore_context();
+	return 0;
+}
+#endif
+
 static struct platform_driver gpmc_driver = {
 	.probe		= gpmc_probe,
 	.remove		= __devexit_p(gpmc_remove),
+#ifdef CONFIG_PM
+	.suspend	= gpmc_suspend,
+	.resume		= gpmc_resume,
+#endif
 	.driver		= {
 		.name	= DEVICE_NAME,
 		.owner	= THIS_MODULE,
-- 
1.7.9.5
