Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqgJT-0004qr-Iq
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 09:42:40 +0000
From: Hou Zhiqiang <b48286@freescale.com>
To: <linux-mtd@lists.infradead.org>, <linuxppc-dev@ozlabs.org>
Subject: [PATCH] mtd: m25p80: Add Power Management support
Date: Wed, 11 Dec 2013 16:19:30 +0800
Message-ID: <1386749970-22021-1-git-send-email-b48286@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: grant.likely@secretlab.ca, scottwood@freescale.com,
 Mingkai.Hu@freescale.com, Hou Zhiqiang <b48286@freescale.com>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add PM support using callback function suspend and resume in .driver of
spi_driver.

Signed-off-by: Hou Zhiqiang <b48286@freescale.com>
---
 drivers/mtd/devices/m25p80.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7eda71d..b0c2b8c 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -66,6 +66,8 @@
 
 /* Used for Spansion flashes only. */
 #define	OPCODE_BRWR		0x17	/* Bank register write */
+#define	OPCODE_DP		0xb9	/* Enter deep power down mode */
+#define	OPCODE_RES		0xab	/* Exit deep power down mode */
 
 /* Status Register bits. */
 #define	SR_WIP			1	/* Write in progress */
@@ -1128,11 +1130,46 @@ static int m25p_remove(struct spi_device *spi)
 	return mtd_device_unregister(&flash->mtd);
 }
 
+#ifdef CONFIG_PM
+static int m25p_suspend(struct device *dev, pm_message_t mesg)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+	int ret;
+
+	flash->command[0] = OPCODE_DP;
+	mutex_lock(&flash->lock);
+	/* Wait until finished previous write/erase command. */
+	ret = wait_till_ready(flash);
+	if (ret) {
+		mutex_unlock(&flash->lock);
+		return ret;
+	}
+	ret = spi_write(flash->spi, flash->command, 1);
+	mutex_unlock(&flash->lock);
+
+	return ret;
+}
+
+static int m25p_resume(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+	int ret;
+
+	flash->command[0] = OPCODE_RES;
+	ret = spi_write(flash->spi, flash->command, 1);
+
+	return ret;
+}
+#endif /* CONFIG_PM */
 
 static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
 		.owner	= THIS_MODULE,
+#ifdef CONFIG_PM
+		.suspend = m25p_suspend,
+		.resume = m25p_resume,
+#endif
 	},
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
-- 
1.8.4.1
