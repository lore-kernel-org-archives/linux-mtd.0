From: anders.grafstrom@netinsight.net (Anders Grafström)
Date: Mon, 17 May 2010 15:23:08 +0200
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix timeout for locking operations
Message-ID: <mailman.456.1274117234.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

The lock/unlock timeout is currently way too short for some flash chips.
This patch increases it to 10 seconds. The typical delay remains unchanged.

Specification change #11 in '5 Volt Intel StrataFlash Memory Specification Update'
(297848-15) specifies an increase of Clear Block Lock-Bit Time Max to 7 sec.
This is contradicted by the table in Specification Change #8 which says .70 sec
but a 10 sec timeout doesn't hurt so play it safe.

Signed-off-by: Anders Grafstr??m <anders.grafstrom@netinsight.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 62f3ea9..3a22f47 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2045,7 +2045,8 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-	int udelay;
+	unsigned int udelay = 0;
+	unsigned int udelay_max = 0;
 	int ret;
 
 	adr += chip->start;
@@ -2071,12 +2072,15 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 		BUG();
 
 	/*
-	 * If Instant Individual Block Locking supported then no need
-	 * to delay.
+	 * If Instant Individual Block Locking is unsupported then use
+	 * the tick period as the typical delay and 10 seconds for the timeout.
 	 */
-	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
+	if (!extp || !(extp->FeatureSupport & (1 << 5))) {
+		udelay = 1000000 / HZ;
+		udelay_max = 10000000;
+	}
 
-	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay_max);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
-- 
1.7.1
