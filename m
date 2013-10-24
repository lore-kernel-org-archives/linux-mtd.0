Received: from mail-ob0-x230.google.com ([2607:f8b0:4003:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZB8o-00044h-5c
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 02:59:19 +0000
Received: by mail-ob0-f176.google.com with SMTP id uy5so1722757obc.21
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 19:58:57 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] mtd: m25p80: re-align ID entries
Date: Wed, 23 Oct 2013 19:58:21 -0700
Message-Id: <1382583503-13748-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, sourav.poddar@ti.com,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No change in the table data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7c4cbad..7e3ec7a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -740,19 +740,19 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16, SECT_4K) },
 
 	/* EON -- en25xxx */
-	{ "en25f32", INFO(0x1c3116, 0, 64 * 1024,  64, SECT_4K) },
-	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
-	{ "en25q32b", INFO(0x1c3016, 0, 64 * 1024,  64, 0) },
-	{ "en25p64", INFO(0x1c2017, 0, 64 * 1024, 128, 0) },
-	{ "en25q64", INFO(0x1c3017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "en25qh256", INFO(0x1c7019, 0, 64 * 1024, 512, 0) },
+	{ "en25f32",    INFO(0x1c3116, 0, 64 * 1024,   64, SECT_4K) },
+	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
+	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
+	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
+	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64, SECT_4K) },
 
 	/* Everspin */
-	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2, M25P_NO_ERASE | M25P_NO_FR) },
-	{ "mr25h10", CAT25_INFO(128 * 1024, 1, 256, 3, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, M25P_NO_ERASE | M25P_NO_FR) },
+	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, M25P_NO_ERASE | M25P_NO_FR) },
 
 	/* GigaDevice */
 	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
@@ -777,16 +777,16 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, 0) },
 
 	/* Micron */
-	{ "n25q064",  INFO(0x20ba17, 0, 64 * 1024, 128, 0) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024, 256, 0) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
-	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
-	{ "n25q512a", INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
+	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
+	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
 
 	/* PMC */
-	{ "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
-	{ "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
-	{ "pm25lq032", INFO(0x7f9d46, 0, 64 * 1024,  64, SECT_4K) },
+	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
+	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
+	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
 
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
-- 
1.8.4
