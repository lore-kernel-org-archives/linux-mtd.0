Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8pH6-0005FN-BO
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 10:22:57 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: m25p80: Pass flags through CAT25_INFO macro
Date: Mon, 12 Aug 2013 12:22:23 +0200
Message-Id: <1376302946-11534-2-git-send-email-s.hauer@pengutronix.de>
In-Reply-To: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
References: <1376302946-11534-1-git-send-email-s.hauer@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The flags may have to be overwritten, so add them to the CAT25_INFO
macro.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..75d4391 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -694,13 +694,13 @@ struct flash_info {
 		.flags = (_flags),					\
 	})
 
-#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width)	\
+#define CAT25_INFO(_sector_size, _n_sectors, _page_size, _addr_width, _flags)	\
 	((kernel_ulong_t)&(struct flash_info) {				\
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
 		.addr_width = (_addr_width),				\
-		.flags = M25P_NO_ERASE,					\
+		.flags = (_flags),					\
 	})
 
 /* NOTE: double check command sets and memory organization when you add
@@ -732,7 +732,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
 
 	/* Everspin */
-	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
+	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE) },
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
@@ -846,11 +846,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1) },
-	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2) },
-	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2) },
-	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2) },
-	{ "cat25128", CAT25_INFO(2048, 8, 64, 2) },
+	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, M25P_NO_ERASE) },
+	{ "cat25c03", CAT25_INFO(  32, 8, 16, 2, M25P_NO_ERASE) },
+	{ "cat25c09", CAT25_INFO( 128, 8, 32, 2, M25P_NO_ERASE) },
+	{ "cat25c17", CAT25_INFO( 256, 8, 32, 2, M25P_NO_ERASE) },
+	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, M25P_NO_ERASE) },
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
-- 
1.8.4.rc1
