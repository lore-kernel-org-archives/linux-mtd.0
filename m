Received: from mail-qt0-f195.google.com ([209.85.216.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZnLn-0004pD-A1
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 23:33:09 +0000
Received: by mail-qt0-f195.google.com with SMTP id s58so7709770qtc.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 15:32:46 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v1 4/5] mtd: m25p80: Check if the spi flash device has pm
 support
Date: Fri,  3 Feb 2017 18:31:15 -0500
Message-Id: <1486164676-12912-5-git-send-email-kdasu.kdev@gmail.com>
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

Call the spi_nor_rescan() only if the controller driver needs this
support. This way SoCs that need this feature can use it.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4528e33..ffdec60 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -328,8 +328,13 @@ static int m25p_suspend(struct device *dev)
 static int m25p_resume(struct device *dev)
 {
 	struct m25p *flash = dev_get_drvdata(dev);
+	struct spi_device *spi = flash->spi;
+	int ret = 0;
+
+	if (spi_flash_pm_supported(spi))
+		ret = spi_nor_pm_rescan(&flash->spi_nor, NULL);
 
-	return spi_nor_pm_rescan(&flash->spi-nor, NULL);
+	return ret;
 }
 #endif
 static SIMPLE_DEV_PM_OPS(m25p_pm_ops, m25p_suspend, m25p_resume);
-- 
1.9.1
