Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8jrb-00057p-B3
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 03:31:44 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: Disable 4K erase for s25sl032p, s25sl064p
Date: Tue,  4 Sep 2012 05:31:36 +0200
Message-Id: <1346729496-3303-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoting from the datasheet for S25FL064P, rev. 05, Nov 18 2011,
section 9.17:

A 64 kB sector erase (D8h) command issued on 4 kB or 8 kB erase
sectors will erase all sectors in the specified 64 kB region.
However, please note that a 4 kB sector erase (20h) or 8 kB
sector erase (40h) command will not work on a 64 kB sector.

Refering further to Table 8.1 and Table 8.2, it is clearly seen
that most of the sectors are 64kB, therefore disable this 4K
erase support since it's valid only on first/last sectors.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <david.woodhouse@intel.com>
---
 drivers/mtd/devices/m25p80.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c433051..9930e23 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -661,8 +661,8 @@ static const struct spi_device_id m25p_ids[] = {
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SECT_4K) },
-	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SECT_4K) },
+	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
+	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
-- 
1.7.10.4
