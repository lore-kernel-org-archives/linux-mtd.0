Received: from smtp.transmode.se ([31.15.61.139])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQVSH-0003vy-3K
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 10:14:16 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/4] mtd: cfi_cmdset_0002: fix SEGV unlocking multiple chips
Date: Wed,  6 Jun 2018 12:13:28 +0200
Message-Id: <20180606101330.11071-2-joakim.tjernlund@infinera.com>
In-Reply-To: <20180606101330.11071-1-joakim.tjernlund@infinera.com>
References: <20180605172607.50acb34f@bbrezillon>
 <20180606101330.11071-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cfi_ppb_unlock() tries to relock all sectors that was locked before
unlocking the whole chip.
This locking used the chip start address + the FULL offset from the
first flash chip, thereby forming an illegal address. Correct by using
the chip offset(adr).

Fixes: 1648eaaa1575 ("mtd: cfi_cmdset_0002: Support Persistent Protection Bits (PPB) locking")
Cc: stable@vger.kernel.org
Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---

 v2 - Spilt into several patches
 
 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 8648b1adccd5..cb85cccc48c1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2536,7 +2536,7 @@ static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 struct ppb_lock {
 	struct flchip *chip;
-	loff_t offset;
+	unsigned long adr;
 	int locked;
 };
 
@@ -2672,7 +2672,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 		 */
 		if ((adr < ofs) || (adr >= (ofs + len))) {
 			sect[sectors].chip = &cfi->chips[chipnum];
-			sect[sectors].offset = offset;
+			sect[sectors].adr = adr;
 			sect[sectors].locked = do_ppb_xxlock(
 				map, &cfi->chips[chipnum], adr, 0,
 				DO_XXLOCK_ONEBLOCK_GETLOCK);
@@ -2716,7 +2716,7 @@ static int __maybe_unused cfi_ppb_unlock(struct mtd_info *mtd, loff_t ofs,
 	 */
 	for (i = 0; i < sectors; i++) {
 		if (sect[i].locked)
-			do_ppb_xxlock(map, sect[i].chip, sect[i].offset, 0,
+			do_ppb_xxlock(map, sect[i].chip, sect[i].adr, 0,
 				      DO_XXLOCK_ONEBLOCK_LOCK);
 	}
 
-- 
2.13.6
