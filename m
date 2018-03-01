Received: from smtp.transmode.se ([31.15.61.139])
 by merlin.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erORK-00038g-7x
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2018 13:40:08 +0000
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Subject: [PATCH 3/3] cfi_cmdset_0002: Do not allow read/write to suspend erase
 block.
Date: Thu,  1 Mar 2018 14:39:41 +0100
Message-Id: <20180301133941.19660-4-joakim.tjernlund@infinera.com>
In-Reply-To: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
References: <20180301133941.19660-1-joakim.tjernlund@infinera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently it is possible to read and/or write to suspend EB's.
Writing /dev/mtdX or /dev/mtdblockX from several processes may
break the flash state machine.

Taken from cfi_cmdset_0001 driver.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: <stable@vger.kernel.org>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 56aa6b75213d..d524a64ed754 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -816,9 +816,10 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		    (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
 			goto sleep;
 
-		/* We could check to see if we're trying to access the sector
-		 * that is currently being erased. However, no user will try
-		 * anything like that so we just wait for the timeout. */
+		/* Do not allow suspend iff read/write to EB address */
+		if ((adr & chip->in_progress_block_mask) ==
+		    chip->in_progress_block_addr)
+			goto sleep;
 
 		/* Erase suspend */
 		/* It's harmless to issue the Erase-Suspend and Erase-Resume
@@ -2267,6 +2268,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 	chip->in_progress_block_addr = adr;
+	chip->in_progress_block_mask = ~(map->size - 1);
 
 	INVALIDATE_CACHE_UDELAY(map, chip,
 				adr, map->size,
@@ -2356,6 +2358,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 	chip->in_progress_block_addr = adr;
+	chip->in_progress_block_mask = ~(len - 1);
 
 	INVALIDATE_CACHE_UDELAY(map, chip,
 				adr, len,
-- 
2.13.6
