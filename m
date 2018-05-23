From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] mtd: atmel-quadspi: add suspend/resume hooks
Date: Wed, 23 May 2018 19:08:48 +0300
Message-ID: <1527091728-19895-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement suspend/resume hooks.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/mtd/spi-nor/atmel-quadspi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
index 6c5708bacad8..85d7610fb920 100644
--- a/drivers/mtd/spi-nor/atmel-quadspi.c
+++ b/drivers/mtd/spi-nor/atmel-quadspi.c
@@ -737,6 +737,28 @@ static int atmel_qspi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int atmel_qspi_suspend(struct device *dev)
+{
+	struct atmel_qspi *aq = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(aq->clk);
+
+	return 0;
+}
+
+static int atmel_qspi_resume(struct device *dev)
+{
+	struct atmel_qspi *aq = dev_get_drvdata(dev);
+
+	clk_prepare_enable(aq->clk);
+
+	return atmel_qspi_init(aq);
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(atmel_qspi_pm_ops, atmel_qspi_suspend,
+			 atmel_qspi_resume);
 
 static const struct of_device_id atmel_qspi_dt_ids[] = {
 	{ .compatible = "atmel,sama5d2-qspi" },
@@ -749,6 +771,7 @@ static struct platform_driver atmel_qspi_driver = {
 	.driver = {
 		.name	= "atmel_qspi",
 		.of_match_table	= atmel_qspi_dt_ids,
+		.pm	= &atmel_qspi_pm_ops,
 	},
 	.probe		= atmel_qspi_probe,
 	.remove		= atmel_qspi_remove,
-- 
2.7.4
