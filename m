Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdf6X-00015W-94
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 15:33:24 +0000
Received: by mail-ot0-x241.google.com with SMTP id t47so2223960ota.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Feb 2017 07:33:03 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v4 2/2] mtd: m25p80: Added pm ops support
Date: Tue, 14 Feb 2017 10:32:48 -0500
Message-Id: <1487086368-4118-3-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
References: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
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
 drivers/mtd/devices/m25p80.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c4df3b1..3ab30b2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -324,10 +324,21 @@ static int m25p_remove(struct spi_device *spi)
 };
 MODULE_DEVICE_TABLE(of, m25p_of_table);
 
+#ifdef CONFIG_PM_SLEEP
+static int m25p_resume(struct device *dev)
+{
+	struct m25p *flash = dev_get_drvdata(dev);
+
+	return spi_nor_init(&flash->spi_nor);
+}
+#endif
+static SIMPLE_DEV_PM_OPS(m25p_pm_ops, NULL, m25p_resume);
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
