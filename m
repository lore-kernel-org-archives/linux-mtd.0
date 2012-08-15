Received: from smtp2.mail.ru ([94.100.176.130])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1gS6-0000gx-I2
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 16:28:15 +0000
From: Alexander Shiyan <shc_work@mail.ru>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RESEND 1/2] MTD: autcpu12-nvram: Fix compile breakage
Date: Wed, 15 Aug 2012 20:28:05 +0400
Message-Id: <1345048086-15709-1-git-send-email-shc_work@mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update driver autcpu12-nvram.c so it compiles. map_read32/map_write32
are no longer exist in the kernel so the driver is totally broken.
Additionally, map_info name passed to simple_map_init is incorrect.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/mtd/maps/autcpu12-nvram.c |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/autcpu12-nvram.c b/drivers/mtd/maps/autcpu12-nvram.c
index e5bfd0e..0598d52 100644
--- a/drivers/mtd/maps/autcpu12-nvram.c
+++ b/drivers/mtd/maps/autcpu12-nvram.c
@@ -43,7 +43,8 @@ struct map_info autcpu12_sram_map = {
 
 static int __init init_autcpu12_sram (void)
 {
-	int err, save0, save1;
+	map_word tmp, save0, save1;
+	int err;
 
 	autcpu12_sram_map.virt = ioremap(0x12000000, SZ_128K);
 	if (!autcpu12_sram_map.virt) {
@@ -51,7 +52,7 @@ static int __init init_autcpu12_sram (void)
 		err = -EIO;
 		goto out;
 	}
-	simple_map_init(&autcpu_sram_map);
+	simple_map_init(&autcpu12_sram_map);
 
 	/*
 	 * Check for 32K/128K
@@ -61,20 +62,22 @@ static int __init init_autcpu12_sram (void)
 	 * Read	and check result on ofs 0x0
 	 * Restore contents
 	 */
-	save0 = map_read32(&autcpu12_sram_map,0);
-	save1 = map_read32(&autcpu12_sram_map,0x10000);
-	map_write32(&autcpu12_sram_map,~save0,0x10000);
+	save0 = map_read(&autcpu12_sram_map, 0);
+	save1 = map_read(&autcpu12_sram_map, 0x10000);
+	tmp.x[0] = ~save0.x[0];
+	map_write(&autcpu12_sram_map, tmp, 0x10000);
 	/* if we find this pattern on 0x0, we have 32K size
 	 * restore contents and exit
 	 */
-	if ( map_read32(&autcpu12_sram_map,0) != save0) {
-		map_write32(&autcpu12_sram_map,save0,0x0);
+	tmp = map_read(&autcpu12_sram_map, 0);
+	if (!map_word_equal(&autcpu12_sram_map, tmp, save0)) {
+		map_write(&autcpu12_sram_map, save0, 0x0);
 		goto map;
 	}
 	/* We have a 128K found, restore 0x10000 and set size
 	 * to 128K
 	 */
-	map_write32(&autcpu12_sram_map,save1,0x10000);
+	map_write(&autcpu12_sram_map, save1, 0x10000);
 	autcpu12_sram_map.size = SZ_128K;
 
 map:
-- 
1.7.8.6
