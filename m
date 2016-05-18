Received: from chaos.universe-factory.net ([37.72.148.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b31bI-0002mR-3i
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 13:33:25 +0000
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/2] mtd: spi-nor: disable software protection for Macronix
 flash at startup
Date: Wed, 18 May 2016 15:32:33 +0200
Message-Id: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch has been tested in OpenWrt for a few months and seems to work
correctly.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841d..d681003 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1304,6 +1304,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	if (JEDEC_MFR(info) == SNOR_MFR_ATMEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
+	    JEDEC_MFR(info) == SNOR_MFR_MACRONIX ||
 	    JEDEC_MFR(info) == SNOR_MFR_SST ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
 		write_enable(nor);
-- 
2.8.2
