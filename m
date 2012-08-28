Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6ICo-0005Ks-QS
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 09:35:33 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix problem with unlocking timeout
Date: Tue, 28 Aug 2012 11:34:13 +0200
Message-Id: <1346146453-30196-1-git-send-email-sr@denx.de>
Cc: dedekind@infradead.org, Andreas Friesen <andreas.friesen@hbm.com>,
 Stephan Gatzka <stephan.gatzka@hbm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Unlocking may take up to 1.4 seconds on some Intel flashes. So
lets use a max. of 1.5 seconds (1500ms) as timeout.

See "Clear Block Lock-Bits Time" on page 40 in
"3 Volt Intel StrataFlash Memory" 28F128J3,28F640J3,28F320J3 manual
from February 2003

This patch also fixes some other problems with this timeout:

- Don't use HZ in timeout "calculation"!
  While testing we noticed that an unlocking timeout occured with
  HZ=1000 and didn't occur with HZ=300. This was because the
  timeout parameter was calculated differently depending on the
  HZ value. Now a fixed value of 1500ms is used.

- The last parameter of WAIT_TIMEOUT (defined to
  inval_cache_and_wait_for_operation) has to be passed in
  micro-seconds. So multiply the ms value with 1000 and not 100
  to calculate this value.

- Use variable name "mdelay" instead of misleading "udelay".

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Stephan Gatzka <stephan.gatzka@hbm.com>
Cc: Andreas Friesen <andreas.friesen@hbm.com>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index dbbd2ed..7751443 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2043,7 +2043,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-	int udelay;
+	int mdelay;
 	int ret;
 
 	adr += chip->start;
@@ -2072,9 +2072,17 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 	 * If Instant Individual Block Locking supported then no need
 	 * to delay.
 	 */
-	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
+	/*
+	 * Unlocking may take up to 1.4 seconds on some Intel flashes. So
+	 * lets use a max of 1.5 seconds (1500ms) as timeout.
+	 *
+	 * See "Clear Block Lock-Bits Time" on page 40 in
+	 * "3 Volt Intel StrataFlash Memory" 28F128J3,28F640J3,28F320J3 manual
+	 * from February 2003
+	 */
+	mdelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1500 : 0;
 
-	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
+	ret = WAIT_TIMEOUT(map, chip, adr, mdelay, mdelay * 1000);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
-- 
1.7.12
