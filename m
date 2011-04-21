Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCssB-0001ZZ-Lr
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 12:20:42 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3LCKZHO002185
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2011 15:20:36 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] UBIFS: fix false assertion warning in case of I/O failures
Date: Thu, 21 Apr 2011 15:23:53 +0300
Message-Id: <1303388635-28296-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

When UBIFS switches to R/O mode because it detects I/O failures, then
when we unmount, we still may have allocated budget, and the assertions
which verify that we have not budget will fire. But it is expected to
have the budget in case of I/O failures, so the assertion warnings will
be false. Suppress them for the I/O failure case.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 339bdfc..459d8c6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1773,10 +1773,12 @@ static void ubifs_put_super(struct super_block *sb)
 	 * of the media. For example, there will be dirty inodes if we failed
 	 * to write them back because of I/O errors.
 	 */
-	ubifs_assert(atomic_long_read(&c->dirty_pg_cnt) == 0);
-	ubifs_assert(c->bi.idx_growth == 0);
-	ubifs_assert(c->bi.dd_growth == 0);
-	ubifs_assert(c->bi.data_growth == 0);
+	if (!c->ro_error) {
+		ubifs_assert(atomic_long_read(&c->dirty_pg_cnt) == 0);
+		ubifs_assert(c->bi.idx_growth == 0);
+		ubifs_assert(c->bi.dd_growth == 0);
+		ubifs_assert(c->bi.data_growth == 0);
+	}
 
 	/*
 	 * The 'c->umount_lock' prevents races between UBIFS memory shrinker
-- 
1.7.2.3
