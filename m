Received: from smtp-vbr5.xs4all.nl ([194.109.24.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NB4mW-0003uz-6O
	for linux-mtd@lists.infradead.org; Thu, 19 Nov 2009 11:02:36 +0000
Date: Thu, 19 Nov 2009 12:01:58 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Message-Id: <200911191101.nAJB1wwH000784@linpc062.aimsys.nl>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] enable erase-suspend-program for CFI cmdset_0002
Cc: nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


erase-suspend for writing is required to avoid blocking applications that wish
to write some data (to a NOR block other than the one being erased).
Particularly, it solves some huge delays that an application (which writes to a
UBIFS) will experience if UBI attaches to empty NOR flash. In this case the
UBI background thread will erase a lot of blocks and the application can be blocked
for minutes because of the "MTD/CFI chip lock".
This feature has been disabled for years. Maybe this was because the old code
turned it on for erase-suspend read-only chips also (cfip->EraseSuspend & 0x1).
This is wrong and corrected now.
I tested this patch and it seems to work fine.

Signed-off-by: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   16 +++-------------
 1 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 94bb61e..1d49e18 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -490,10 +490,6 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 	}
 #endif
 
-	/* FIXME: erase-suspend-program is broken.  See
-	   http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html */
-	printk(KERN_NOTICE "cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.\n");
-
 	__module_get(THIS_MODULE);
 	return mtd;
 
@@ -589,15 +585,9 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		return 0;
 
 	case FL_ERASING:
-		if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
-			goto sleep;
-
-		if (!(   mode == FL_READY
-		      || mode == FL_POINT
-		      || !cfip
-		      || (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))
-		      || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1)
-		    )))
+		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
+		    !(mode == FL_READY || mode == FL_POINT ||
+		    (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))
 			goto sleep;
 
 		/* We could check to see if we're trying to access the sector
-- 
1.5.2.2
