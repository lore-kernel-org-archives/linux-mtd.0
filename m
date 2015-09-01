Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriJ-0003Hn-PY
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:28 +0000
Received: by pary6 with SMTP id y6so975441par.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:59:04 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 10/10] mtd: spi-nor: disable protection for Winbond flash at
 startup
Date: Tue,  1 Sep 2015 12:57:15 -0700
Message-Id: <1441137435-52862-11-git-send-email-computersforpeace@gmail.com>
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

In case the flash was locked at boot time.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6999ef34b597..d69a6c7f11a1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1159,13 +1159,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mutex_init(&nor->lock);
 
 	/*
-	 * Atmel, SST and Intel/Numonyx serial nor tend to power
-	 * up with the software protection bits set
+	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
+	 * with the software protection bits set
 	 */
 
 	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST) {
+	    JEDEC_MFR(info) == SNOR_MFR_SST ||
+	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
-- 
2.5.0.457.gab17608
