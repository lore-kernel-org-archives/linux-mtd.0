Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkG5B-0003XE-28
 for linux-mtd@lists.infradead.org; Tue, 22 Aug 2017 20:47:31 +0000
Received: by mail-wr0-x244.google.com with SMTP id f8so18506302wrf.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Aug 2017 13:47:08 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v8 2/2] mtd: spi-nor: Add spi-nor mtd resume handler
Date: Tue, 22 Aug 2017 16:45:22 -0400
Message-Id: <1503434722-5429-3-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
References: <1503434722-5429-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implemented and populated spi-nor mtd PM handlers for resume ops.
spi-nor resume op re-initializes spi-nor flash to its probed
state by calling the newly implemented spi_nor_init() function.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ab98ecff..69164bc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1871,6 +1871,19 @@ static int spi_nor_init(struct spi_nor *nor)
 	return 0;
 }
 
+/* mtd resume handler */
+static void spi_nor_resume(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct device *dev = nor->dev;
+	int ret;
+
+	/* re-initialize the nor chip */
+	ret = spi_nor_init(nor);
+	if (ret)
+		dev_err(dev, "resume() failed\n");
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -1947,6 +1960,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->size = params.size;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
+	mtd->_resume = spi_nor_resume;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
1.9.1
