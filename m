Received: from mail-bl2on0105.outbound.protection.outlook.com ([65.55.169.105]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMXvv-0002Pa-EV
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 09:23:08 +0000
From: Zhiqiang Hou <Zhiqiang.Hou@freescale.com>
To: <linux-mtd@lists.infradead.org>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <jteki@openedev.com>, <marex@denx.de>
CC: <Mingkai.Hu@freescale.com>, Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
Subject: [PATCHv3 2/2] mtd: m25p80: Add Power Management support
Date: Fri, 22 Jan 2016 17:14:27 +0800
Message-ID: <1453454067-32534-2-git-send-email-Zhiqiang.Hou@freescale.com>
In-Reply-To: <1453454067-32534-1-git-send-email-Zhiqiang.Hou@freescale.com>
References: <1453454067-32534-1-git-send-email-Zhiqiang.Hou@freescale.com>
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
V3:
 - No change.
V2:
 - Call spi_nor_suspend/resume instead of spi_nor_scan.

 drivers/mtd/devices/m25p80.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..016fe94 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -224,6 +224,26 @@ static int m25p_remove(struct spi_device *spi)
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
@@ -290,6 +310,7 @@ static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
 		.of_match_table = m25p_of_table,
+		.pm	= &m25p_pm_ops,
 	},
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
-- 
2.1.0.27.g96db324
