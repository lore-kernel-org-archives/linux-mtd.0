Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWA6C-00053e-5U
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 07:44:25 -0400
Subject: [PATCH] Speed up mount for cfi_cmdset_0001 users
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 27 Mar 2007 13:44:01 +0200
Message-Id: <1174995841.26465.431.camel@gentoo-jocke.transmode.se>
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

This will speed up mount greatly for users of point/unpoint method
like cfi_cmdset_0001. Please Apply.

 Jocke

>From bcd1aa987ab786c526e225269775a557a1bcbe1f Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Tue, 27 Mar 2007 13:32:09 +0200
Subject: [PATCH] Speed up mount for cfi_cmdset_0001 users
Remove excessive scanning of empty flash after a clean
marker for users of the point/unpoint method. cfi_cmdset_0001
uses point/unpoint by default iff flash mapping is linear.
The speedup is several orders of magnitude if FS is less than
half full.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/scan.c |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b98661a..4679abe 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -632,16 +632,17 @@ scan_more:
 
 		if (*(uint32_t *)(&buf[ofs-buf_ofs]) == 0xffffffff) {
 			uint32_t inbuf_ofs;
-			uint32_t empty_start;
+			uint32_t empty_start, scan_end;
 
 			empty_start = ofs;
 			ofs += 4;
+			scan_end = min_t(uint32_t, EMPTY_SCAN_SIZE(c->sector_size)/8, buf_len);
 
 			D1(printk(KERN_DEBUG "Found empty flash at 0x%08x\n", ofs));
 		more_empty:
 			inbuf_ofs = ofs - buf_ofs;
-			while (inbuf_ofs < buf_len) {
-				if (*(uint32_t *)(&buf[inbuf_ofs]) != 0xffffffff) {
+			while (inbuf_ofs < scan_end) {
+				if (unlikely(*(uint32_t *)(&buf[inbuf_ofs]) != 0xffffffff)) {
 					printk(KERN_WARNING "Empty flash at 0x%08x ends at 0x%08x\n",
 					       empty_start, ofs);
 					if ((err = jffs2_scan_dirty_space(c, jeb, ofs-empty_start)))
@@ -662,7 +663,11 @@ scan_more:
 				D1(printk(KERN_DEBUG "%d bytes at start of block seems clean... assuming all clean\n", EMPTY_SCAN_SIZE(c->sector_size)));
 				return BLK_STATE_CLEANMARKER;
 			}
-
+			if (!buf_size && (scan_end != buf_len)) {/* XIP/point case */
+				scan_end = buf_len;
+				goto more_empty;
+			}
+			
 			/* See how much more there is to read in this eraseblock... */
 			buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
 			if (!buf_len) {
@@ -672,6 +677,8 @@ scan_more:
 					  empty_start));
 				break;
 			}
+			/* point never reaches here */
+			scan_end = buf_len;
 			D1(printk(KERN_DEBUG "Reading another 0x%x at 0x%08x\n", buf_len, ofs));
 			err = jffs2_fill_scan_buf(c, buf, ofs, buf_len);
 			if (err)
-- 
1.4.4.4
