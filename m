Received: from chaos.universe-factory.net ([2a02:2918:505:100::22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b31bI-0002mS-C3
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 13:33:25 +0000
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 2/2] mtd: spi-nor: disable software protection for Winbond
 flash at startup (again)
Date: Wed, 18 May 2016 15:32:34 +0200
Message-Id: <1be3216ae9a70f5c9914fd69042b13dc09a6c7cd.1463578354.git.mschiffer@universe-factory.net>
In-Reply-To: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
In-Reply-To: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
References: <e4b01b739197bd4556617b70553093c58d3b1497.1463578353.git.mschiffer@universe-factory.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Support for unlocking Winbond flash had been originally added in c6fc217
("mtd: spi-nor: disable protection for Winbond flash at startup"), but was
reverted in 67b9bcd ("mtd: spi-nor: fix Spansion regressions (aliased with
Winbond)"), as some Spansion chips using the Winbond manufacturer ID
weren't working correctly with it.

The actual issue has been fixed meanwhile in 32321e9 ("mtd: spi-nor: wait
until lock/unlock operations are ready") and edf891e ("mtd: spi-nor: wait
for SR_WIP to clear on initial unlock"). After this fix, the Winbond flash
can be unlocked without causing havoc for Spansion chips.

We have verified that everything is working correctly on some Winbond chips
(like the w25q64, which is aliased with the Spansion s25fl064k) and
Spansion chips.

As an additional test, I also tried enabling the initial unlocking code for
the Spansion manufacturer ID. All tested Spansion flash chips showed the
same behaviour: without 32321e9 and edf891e, subsequent reads only returned
zeros (as reported by Felix Fietkau, leading to 67b9bcd), but with 32321e9
and edf891e, the chip continued to work correctly.

Cc: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d681003..a834e66 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1306,6 +1306,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	    JEDEC_MFR(info) == SNOR_MFR_INTEL ||
 	    JEDEC_MFR(info) == SNOR_MFR_MACRONIX ||
 	    JEDEC_MFR(info) == SNOR_MFR_SST ||
+	    JEDEC_MFR(info) == SNOR_MFR_WINBOND ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
 		write_enable(nor);
 		write_sr(nor, 0);
-- 
2.8.2
