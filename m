Received: from mail-qt0-f193.google.com ([209.85.216.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZnLp-0004pE-2B
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 23:33:12 +0000
Received: by mail-qt0-f193.google.com with SMTP id s58so7709954qtc.2
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2017 15:32:49 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v1 5/5] spi: bcm-qspi: Implement the master
 flash_pm_supported() call
Date: Fri,  3 Feb 2017 18:31:16 -0500
Message-Id: <1486164676-12912-6-git-send-email-kdasu.kdev@gmail.com>
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

The Broadcom SoCs needs pm rescan support for the flash device to
to be cofgured in the probed state on pm resume. Implement
flash_pm_supported() spi core interface to return true.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/spi/spi-bcm-qspi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-bcm-qspi.c b/drivers/spi/spi-bcm-qspi.c
index 14f9dea..0abcde6 100644
--- a/drivers/spi/spi-bcm-qspi.c
+++ b/drivers/spi/spi-bcm-qspi.c
@@ -958,6 +958,11 @@ static int bcm_qspi_transfer_one(struct spi_master *master,
 	return 0;
 }
 
+static bool bcm_qspi_flash_pm_supported(struct spi_device *spi)
+{
+	return true;
+}
+
 static void bcm_qspi_cleanup(struct spi_device *spi)
 {
 	struct bcm_qspi_parms *xp = spi_get_ctldata(spi);
@@ -1194,6 +1199,7 @@ int bcm_qspi_probe(struct platform_device *pdev,
 	master->setup = bcm_qspi_setup;
 	master->transfer_one = bcm_qspi_transfer_one;
 	master->spi_flash_read = bcm_qspi_flash_read;
+	master->flash_pm_supported = bcm_qspi_flash_pm_supported;
 	master->cleanup = bcm_qspi_cleanup;
 	master->dev.of_node = dev->of_node;
 	master->num_chipselect = NUM_CHIPSELECT;
-- 
1.9.1
