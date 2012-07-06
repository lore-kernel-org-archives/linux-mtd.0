Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn1kq-000279-71
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 06:11:10 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: m25p80: Fix the Spansion chip detection
Date: Fri,  6 Jul 2012 08:10:26 +0200
Message-Id: <1341555027-17462-2-git-send-email-marex@denx.de>
In-Reply-To: <1341555027-17462-1-git-send-email-marex@denx.de>
References: <1341555027-17462-1-git-send-email-marex@denx.de>
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

Due to the implementation of the following loop at the end
of jedec_probe():

776         for (tmp = 0; tmp < ARRAY_SIZE(m25p_ids) - 1; tmp++) {
777                 info = (void *)m25p_ids[tmp].driver_data;
778                 if (info->jedec_id == jedec) {
779                         if (info->ext_id != 0 && info->ext_id != ext_jedec)
780                                 continue;
781                         return &m25p_ids[tmp];
782                 }
783         }

In particular line 779 in the above numbering, the chips with ext_id != 0 must
be ordered first in the list of chips (m25p_ids[]).

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <david.woodhouse@intel.com>
---
 drivers/mtd/devices/m25p80.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d8d4672..28e841d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -665,12 +665,7 @@ static const struct spi_device_id m25p_ids[] = {
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
-	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
-	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SECT_4K) },
-	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
@@ -680,6 +675,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
+	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
+	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
+	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
+	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
+	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 
-- 
1.7.10
