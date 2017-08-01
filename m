Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcfry-0005nL-Kq
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 22:42:40 +0000
Received: by mail-qk0-x242.google.com with SMTP id d136so3019052qkg.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 15:42:10 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: cyrille.pitchen@wedev4u.fr,
	marek.vasut@gmail.com
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [PATCH v7 2/2] mtd: spi-nor: Add spi-nor mtd resume handler
Date: Tue,  1 Aug 2017 18:41:16 -0400
Message-Id: <1501627276-4567-3-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1501627276-4567-1-git-send-email-kdasu.kdev@gmail.com>
References: <1501627276-4567-1-git-send-email-kdasu.kdev@gmail.com>
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
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 10033ed..64c131d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1863,6 +1863,18 @@ static int spi_nor_init(struct spi_nor *nor)
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
 
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
@@ -1946,6 +1958,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	mtd->size = params.size;
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
+	mtd->_resume = spi_nor_resume;
 
 	/* NOR protection support for STmicro/Micron chips and similar */
 	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
-- 
1.9.1
