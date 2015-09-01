Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriD-00030n-NB
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:22 +0000
Received: by pary6 with SMTP id y6so975103par.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:59:03 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 09/10] mtd: spi-nor: support lock/unlock/is_locked for Winbond
Date: Tue,  1 Sep 2015 12:57:14 -0700
Message-Id: <1441137435-52862-10-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Many other flash share the same features as ST Micro. I've tested some
Winbond flash, so add them.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c05ee8340e5e..6999ef34b597 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1180,8 +1180,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mtd->_erase = spi_nor_erase;
 	mtd->_read = spi_nor_read;
 
-	/* NOR protection support for STmicro/Micron chips */
-	if (JEDEC_MFR(info) == SNOR_MFR_MICRON) {
+	/* NOR protection support for STmicro/Micron chips and similar */
+	if (JEDEC_MFR(info) == SNOR_MFR_MICRON ||
+	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
 		nor->flash_is_locked = stm_is_locked;
-- 
2.5.0.457.gab17608
