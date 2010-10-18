Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P7iXQ-0001ks-4L
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 05:45:37 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx03.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o9I5jVjM004228
	for <linux-mtd@lists.infradead.org>; Mon, 18 Oct 2010 08:45:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH 1/2] UBIFS: remove a bit of unneeded code
Date: Mon, 18 Oct 2010 08:46:08 +0300
Message-Id: <1287380769-8250-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is a clean-up patch which:

1. Removes explicite 'hrtimer_cancel()' after 'ubifs_wbuf_sync()' in
   'ubifs_remount_ro()', because the timers will be canceled by
   'ubifs_wbuf_sync()', no need to cancel them for the second time.
2. Remove "if (c->jheads)" check from 'ubifs_put_super()', because
   at journal heads must always be allocated there, since we checked
   earlier that we were mounted R/W, and the olny situation when
   journal heads are not allocated is when mounter or re-mounted R/O.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index bb6ed5d..6ff2f80 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1686,10 +1686,8 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 
 	dbg_save_space_info(c);
 
-	for (i = 0; i < c->jhead_cnt; i++) {
+	for (i = 0; i < c->jhead_cnt; i++)
 		ubifs_wbuf_sync(&c->jheads[i].wbuf);
-		hrtimer_cancel(&c->jheads[i].wbuf.timer);
-	}
 
 	c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_DIRTY);
 	c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
@@ -1754,9 +1752,8 @@ static void ubifs_put_super(struct super_block *sb)
 			int err;
 
 			/* Synchronize write-buffers */
-			if (c->jheads)
-				for (i = 0; i < c->jhead_cnt; i++)
-					ubifs_wbuf_sync(&c->jheads[i].wbuf);
+			for (i = 0; i < c->jhead_cnt; i++)
+				ubifs_wbuf_sync(&c->jheads[i].wbuf);
 
 			/*
 			 * We are being cleanly unmounted which means the
-- 
1.7.2.3
