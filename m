Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn1l0-000278-QF
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 06:11:31 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/3] mtd: m25p80: add support for Spansion s25sl064p chip
Date: Fri,  6 Jul 2012 08:10:25 +0200
Message-Id: <1341555027-17462-1-git-send-email-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: David Woodhouse <david.woodhouse@intel.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index b4dbcef..d8d4672 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -671,6 +671,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "s25sl032a",  INFO(0x010215,      0,  64 * 1024,  64, 0) },
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SECT_4K) },
 	{ "s25sl064a",  INFO(0x010216,      0,  64 * 1024, 128, 0) },
+	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, 0) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
-- 
1.7.10
