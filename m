Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hu74a-00035i-6j
	for linux-mtd@lists.infradead.org; Fri, 01 Jun 2007 09:21:51 -0400
Subject: [PATCH] Use point(), if available, to check newly erased blocks
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Jun 2007 15:21:39 +0200
Message-Id: <1180704100.1468.283.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This optimizes checking newly erased blocks. point() is available in
cfi_cmdset_0001.

 Jocke

>From b89f30f31cfdd2e925f029154b5398027653cf8a Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Fri, 1 Jun 2007 15:14:09 +0200
Subject: [PATCH] Use point(), if available, to check newly erased blocks.
Faster and won't trash the D-cache.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/erase.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 6d4b7ce..5b5c291 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -324,6 +324,33 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 	size_t retlen;
 	int ret = -EIO;
 
+	if (c->mtd->point) {
+		unsigned long *wordebuf;
+
+		ret = c->mtd->point(c->mtd, jeb->offset, c->sector_size, &retlen, (unsigned char **)&ebuf);
+		if (ret) {
+			D1(printk(KERN_DEBUG "MTD point failed %d\n", ret));
+			goto do_flash_read;
+		}
+		if (retlen < c->sector_size) {
+			/* Don't muck about if it won't let us point to the whole erase sector */
+			D1(printk(KERN_DEBUG "MTD point returned len too short: 0x%zx\n", retlen));
+			c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
+			goto do_flash_read;
+		}
+		wordebuf = ebuf-sizeof(*wordebuf);
+		retlen /= sizeof(*wordebuf);
+		do {
+		   if (*++wordebuf != ~0)
+			   break;
+		} while(--retlen);
+		c->mtd->unpoint(c->mtd, ebuf, jeb->offset, c->sector_size);
+		if (retlen)
+			printk(KERN_WARNING "Newly-erased block contained word 0x%lx at offset 0x%08x\n",
+			       *wordebuf, jeb->offset + c->sector_size-retlen*sizeof(*wordebuf));
+		return 0;
+	}
+ do_flash_read:
 	ebuf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!ebuf) {
 		printk(KERN_WARNING "Failed to allocate page buffer for verifying erase at 0x%08x. Refiling\n", jeb->offset);
-- 
1.5.1.3
