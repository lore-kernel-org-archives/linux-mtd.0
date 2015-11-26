Received: from static.88-198-24-112.clients.your-server.de ([88.198.24.112]
 helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1zOJ-0005s8-VR
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 16:27:28 +0000
From: Felix Fietkau <nbd@openwrt.org>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com
Subject: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond flash at
 startup"
Date: Thu, 26 Nov 2015 17:27:01 +0100
Message-Id: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.

This commit is breaking read access on at least s25fl064k, but also
possibly other Spansion flash chips.

Any mtd read seems to succeed, but simply returns a zero-filled buffer.

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4988390..8b8842e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1194,14 +1194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	mutex_init(&nor->lock);
 
 	/*
-	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
-	 * with the software protection bits set
+	 * Atmel, SST and Intel/Numonyx serial nor tend to power
+	 * up with the software protection bits set
 	 */
 
 	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
-	    JEDEC_MFR(info) == SNOR_MFR_SST ||
-	    JEDEC_MFR(info) == SNOR_MFR_WINBOND) {
+	    JEDEC_MFR(info) == SNOR_MFR_SST) {
 		write_enable(nor);
 		write_sr(nor, 0);
 	}
-- 
2.2.2
