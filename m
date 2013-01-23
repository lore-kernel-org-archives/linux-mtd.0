From: Philip Avinash <avinashphilip@ti.com>
To: <khilman@ti.com>, <tony@atomide.com>, <linux@arm.linux.org.uk>,
 <dwmw2@infradead.org>
Subject: [PATCH 4/4] mtd: nand: omap2: Low power transition support
Date: Wed, 23 Jan 2013 15:15:46 +0530
Message-ID: <1358934346-16822-5-git-send-email-avinashphilip@ti.com>
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

Add support for Low power transition support in nand driver. Also
ensures the current transaction finishes before going to low power mode
with _suspend support in mtd layer.

Signed-off-by: Philip Avinash <avinashphilip@ti.com>
---
 drivers/mtd/nand/omap2.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 8e820dd..790215b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -2103,9 +2103,28 @@ static int omap_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int omap_nand_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct mtd_info *mtd = platform_get_drvdata(pdev);
+
+	mtd->_suspend(mtd);
+	return 0;
+}
+
+static int omap_nand_resume(struct platform_device *pdev)
+{
+	return 0;
+}
+#endif
+
 static struct platform_driver omap_nand_driver = {
 	.probe		= omap_nand_probe,
 	.remove		= omap_nand_remove,
+#ifdef CONFIG_PM
+	.suspend	= omap_nand_suspend,
+	.resume		= omap_nand_resume,
+#endif
 	.driver		= {
 		.name	= DRIVER_NAME,
 		.owner	= THIS_MODULE,
-- 
1.7.9.5
