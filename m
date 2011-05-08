Received: from [69.28.251.93] (helo=b32.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJ8LZ-0005lP-Pt
	for linux-mtd@lists.infradead.org; Sun, 08 May 2011 18:04:50 +0000
From: Kevin Cernekee <cernekee@gmail.com>
To: <dedekind@infradead.org>, <dwmw2@infradead.org>
Subject: [PATCH 1/4] mtd: m25p80: Add Numonyx m25px32 family
Date: Sun, 08 May 2011 10:47:59 -0700
Message-Id: <657440bd74a74686279e691d39337f21@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 drivers/mtd/devices/m25p80.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3fb981d..09c342d 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -729,7 +729,10 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
 	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
 
-	{ "m25px64", INFO(0x207117,  0, 64 * 1024, 128, 0) },
+	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
+	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
+	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
+	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
-- 
1.7.5
