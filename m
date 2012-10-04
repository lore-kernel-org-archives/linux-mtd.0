Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJpPT-00083h-SZ
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2012 17:40:32 +0000
Received: by mail-wg0-f49.google.com with SMTP id gg4so449023wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2012 10:40:23 -0700 (PDT)
From: Michal Simek <monstr@monstr.eu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: m25p80: Add support for Numonyx N25Q128
Date: Thu,  4 Oct 2012 19:40:16 +0200
Message-Id: <1349372416-16925-1-git-send-email-monstr@monstr.eu>
Cc: Michal Simek <monstr@monstr.eu>, Mike Frysinger <vapier@gentoo.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Wendy Liang <wendy.liang@petalogix.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wendy Liang <wendy.liang@petalogix.com>

Add the id and sector mappings for SPI flash chips.

Signed-off-by: Wendy Liang <wendy.liang@petalogix.com>
Signed-off-by: Michal Simek <monstr@monstr.eu>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
CC: Mike Frysinger <vapier@gentoo.org>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/m25p80.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5d0d68c..cad89f1 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -722,6 +722,9 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
 	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
 
+	/* Numonyx -- n25q */
+	{ "n25q128",    INFO(0x20ba18,  0, 64 * 1024, 256, 0) },
+
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
 	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
-- 
1.7.0.4
