Received: from mail-qt0-f193.google.com ([209.85.216.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZnLf-0004p3-DN
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 23:33:01 +0000
Received: by mail-qt0-f193.google.com with SMTP id h53so7674673qth.3
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 15:32:38 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v1 2/5] mtd: m25p80: Added pm ops support
Date: Fri,  3 Feb 2017 18:31:13 -0500
Message-Id: <1486164676-12912-3-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added power management ops for resume to be able to resan spi-nor
device and set it to right transfer modes in its probed state after
poweron. Some SoC implementations might  power down the spi-nor flash
and loose its initial settings on suspend. A resume should retore the
part to its probed state.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd..4528e33 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -319,10 +319,26 @@ static int m25p_remove(struct spi_device *spi)
 };
 MODULE_DEVICE_TABLE(of, m25p_of_table);
 
+#ifdef CONFIG_PM_SLEEP
+static int m25p_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int m25p_resume(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+
+	return spi_nor_pm_rescan(&flash->spi-nor, NULL);
+}
+#endif
+static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
+
 static struct spi_driver m25p80_driver = {
 	.driver = {
 		.name	= "m25p80",
 		.of_match_table = m25p_of_table,
+		.pm     = &m25p_pm_ops,
 	},
 	.id_table	= m25p_ids,
 	.probe	= m25p_probe,
-- 
1.9.1
