Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBgmm-0004j3-Fl
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2013 07:55:30 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/3] mtd: m25p80: make CONFIG_M25PXX_USE_FAST_READ safe to
 enable
Date: Tue, 20 Aug 2013 09:54:40 +0200
Message-Id: <1376985281-16293-3-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
References: <1376985281-16293-1-git-send-email-s.hauer@pengutronix.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a flag to struct flash_info indicating that
fast_read is not supported. This now gives the following logic
when determing whether to enable fastread:

If the flash chip does not support fast_read, then disable it.
Otherwise:
1) enable fast_read if device node contains m25p,fast-read
2) enable fast_read if forced in Kconfig

This makes enabling CONFIG_M25PXX_USE_FAST_READ a safe option
since we no longer enable the fast_read option unconditionally.

For now fast_read is disabled for the everspin mr25h256 and the
catalyst devices. Others may need the flag aswell.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 0b8672b..6f93d32 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -691,6 +691,7 @@ struct flash_info {
 #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
 #define	M25P_NO_ERASE	0x02		/* No erase command needed */
 #define	SST_WRITE	0x04		/* use SST byte programming */
+#define	M25P_NO_FR	0x08		/* Can't do fastread */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -741,7 +742,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
 
 	/* Everspin */
-	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE) },
+	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE | M25P_NO_FR) },
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
@@ -856,11 +857,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, M25P_NO_ERASE) },
-	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, M25P_NO_ERASE) },
-	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, M25P_NO_ERASE) },
-	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, M25P_NO_ERASE) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, M25P_NO_ERASE) },
+	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, M25P_NO_ERASE | M25P_NO_FR) },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
@@ -1044,6 +1045,8 @@ static int m25p_probe(struct spi_device *spi)
 #ifdef CONFIG_M25PXX_USE_FAST_READ
 	flash->fast_read = true;
 #endif
+	if (info->flags & M25P_NO_FR)
+		flash->fast_read = false;
 
 	/* Default commands */
 	if (flash->fast_read)
-- 
1.8.4.rc3
