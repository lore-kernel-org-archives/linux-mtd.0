Received: from mail-by2on0110.outbound.protection.outlook.com
 ([207.46.100.110] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aCOHM-0001BH-Ef
 for linux-mtd@lists.infradead.org; Fri, 25 Dec 2015 09:03:17 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>
CC: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
Subject: [PATCH v2 2/2] mtd: m25p80: Add Power Management support
Date: Fri, 25 Dec 2015 16:55:07 +0800
Message-ID: <1451033707-44170-2-git-send-email-Zhiqiang.Hou@freescale.com>
In-Reply-To: <1451033707-44170-1-git-send-email-Zhiqiang.Hou@freescale.com>
References: <1451033707-44170-1-git-send-email-Zhiqiang.Hou@freescale.com>
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

From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
---
V2:
 - Call spi_nor_suspend/resume instead of spi_nor_scan.

 drivers/mtd/devices/m25p80.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index fe9ceb7..9f07f94 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -243,6 +243,26 @@ static int m25p_remove(struct spi_device *spi)
 	return mtd_device_unregister(&flash->spi_nor.mtd);
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int m25p_suspend(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+	struct spi_nor *nor = &flash->spi_nor;
+
+	return spi_nor_suspend(nor);
+}
+
+static int m25p_resume(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+	struct spi_nor *nor = &flash->spi_nor;
+
+	return spi_nor_resume(nor);
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
+
 /*
  * Do NOT add to this array without reading the following:
  *
@@ -302,6 +322,7 @@ static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
 		.of_match_table = m25p_of_table,
+		.pm	= &m25p_pm_ops,
 	},
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
-- 
2.1.0.27.g96db324
