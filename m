Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1chMJ6-0001q2-2g
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2017 20:17:39 +0000
Received: by mail-qk0-x243.google.com with SMTP id n127so4260115qkf.2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Feb 2017 12:17:18 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-spi@vger.kernel.org, cyrille.pitchen@atmel.com, marex@denx.de,
 broonie@kernel.org
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v6 3/3] mtd: spi-nor: Add spi-nor mtd suspend and resume
 handlers
Date: Fri, 24 Feb 2017 15:16:39 -0500
Message-Id: <1487967399-28967-4-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1487967399-28967-1-git-send-email-kdasu.kdev@gmail.com>
References: <1487967399-28967-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implemented and populated spi-nor mtd PM handlers for suspend and resume ops.
spi-nor suspend op set's the flash state to FL_PM_SUSPENDED state and resume
op re-initializes spi-nor flash and set's flash state to FL_READY. The handlers
ensures synchronization between the spi-nor and the mtd layer by calling
spi_nor_get/release_device() and setting respective flash states.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5363807..8e38895 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1629,6 +1629,28 @@ int spi_nor_init(struct spi_nor *nor)
 }
 EXPORT_SYMBOL_GPL(spi_nor_init);
 
+/* mtd suspend handler */
+static int spi_nor_suspend(struct mtd_info *mtd)
+{
+	return spi_nor_get_device(mtd, FL_PM_SUSPENDED);
+}
+
+/* mtd resume handler */
+static void spi_nor_resume(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct device *dev = nor->dev;
+
+	if (nor->state == FL_PM_SUSPENDED) {
+		/* re-initialize the nor chip */
+		spi_nor_init(nor);
+		/* mtd can resume transfers */
+		spi_nor_release_device(mtd);
+	} else {
+	       dev_err(dev, "resume() called, chip not in suspended state\n");
+	}
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 {
 	const struct flash_info *info = NULL;
@@ -1695,6 +1717,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->size = info->sector_size * info->n_sectors;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
+	mtd->_suspend = spi_nor_suspend;
+	mtd->_resume = spi_nor_resume;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
1.9.1
