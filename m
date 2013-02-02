Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1aJ7-0006QU-9B
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2013 10:26:50 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0002: Fix compilation warnings introduced by
 PPB patch
Date: Sat,  2 Feb 2013 11:26:33 +0100
Message-Id: <1359800793-17914-1-git-send-email-sr@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes the compilation warnings introduced with this patch:

"mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking":

In file included from drivers/mtd/chips/cfi_cmdset_0002.c:36:0:
include/linux/of_platform.h:107:13: warning: 'struct of_device_id' declared inside parameter list [enabled by default]
include/linux/of_platform.h:107:13: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/of_platform.h:107:13: warning: 'struct device_node' declared inside parameter list [enabled by default]
drivers/mtd/chips/cfi_cmdset_0002.c: In function 'cfi_cmdset_0002':
drivers/mtd/chips/cfi_cmdset_0002.c:504:22: warning: unused variable 'np' [-Wunused-variable]
drivers/mtd/chips/cfi_cmdset_0002.c: At top level:
drivers/mtd/chips/cfi_cmdset_0002.c:2279:12: warning: 'cfi_ppb_lock' defined but not used [-Wunused-function]
drivers/mtd/chips/cfi_cmdset_0002.c:2285:12: warning: 'cfi_ppb_unlock' defined but not used [-Wunused-function]
drivers/mtd/chips/cfi_cmdset_0002.c:2382:12: warning: 'cfi_ppb_is_locked' defined but not used [-Wunused-function]

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 5d5ed93..fff665d 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -33,6 +33,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
@@ -501,7 +502,7 @@ static void cfi_fixup_m29ew_delay_after_resume(struct cfi_private *cfi)
 struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	struct device_node *np = map->device_node;
+	struct device_node __maybe_unused *np = map->device_node;
 	struct mtd_info *mtd;
 	int i;
 
@@ -2205,8 +2206,9 @@ struct ppb_lock {
 #define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *)2)
 #define DO_XXLOCK_ONEBLOCK_GETLOCK	((void *)3)
 
-static int do_ppb_xxlock(struct map_info *map, struct flchip *chip,
-			 unsigned long adr, int len, void *thunk)
+static int __maybe_unused do_ppb_xxlock(struct map_info *map,
+					struct flchip *chip,
+					unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo;
@@ -2276,13 +2278,15 @@ static int do_ppb_xxlock(struct map_info *map, struct flchip *chip,
 	return ret;
 }
 
-static int cfi_ppb_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int __maybe_unused cfi_ppb_lock(struct mtd_info *mtd, loff_t ofs,
+				       uint64_t len)
 {
 	return cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
 				DO_XXLOCK_ONEBLOCK_LOCK);
 }
 
-static int cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
+					 uint64_t len)
 {
 	struct mtd_erase_region_info *regions = mtd->eraseregions;
 	struct map_info *map = mtd->priv;
@@ -2379,7 +2383,8 @@ static int cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int cfi_ppb_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int __maybe_unused cfi_ppb_is_locked(struct mtd_info *mtd, loff_t ofs,
+					    uint64_t len)
 {
 	return cfi_varsize_frob(mtd, do_ppb_xxlock, ofs, len,
 				DO_XXLOCK_ONEBLOCK_GETLOCK) ? 1 : 0;
-- 
1.8.1.2
