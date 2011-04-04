Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6l8l-0003bo-AU
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:52:31 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBIFS: fix debugging failure in dbg_check_space_info
Date: Mon,  4 Apr 2011 17:55:29 +0300
Message-Id: <1301928929-8429-1-git-send-email-dedekind1@gmail.com>
Cc: Caizhiyong <caizhiyong@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes a debugging failure with which looks like this:
UBIFS error (pid 32313): dbg_check_space_info: free space changed from 6019344 to 6022654

The reason for this failure is described in the comment this patch adds
to the code. But in short - 'c->freeable_cnt' may be different before
and after re-mounting, and this is normal. So the debugging code should
make sure that free space calculations do not depend on 'c->freeable_cnt'.

A similar issue has been reported here:
http://lists.infradead.org/pipermail/linux-mtd/2011-April/034647.html

This patch should fix it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   47 +++++++++++++++++++++++++++++++++++++++--------
 1 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c04efa8..e5d81b4 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -972,12 +972,40 @@ void dbg_dump_index(struct ubifs_info *c)
 void dbg_save_space_info(struct ubifs_info *c)
 {
 	struct ubifs_debug_info *d = c->dbg;
+	int freeable_cnt;
 
-	ubifs_get_lp_stats(c, &d->saved_lst);
+ 	spin_lock(&c->space_lock);
+ 	memcpy(&d->saved_lst, &c->lst, sizeof(struct ubifs_lp_stats));
 
-	spin_lock(&c->space_lock);
+	/*
+	 * We use a dirty hack here and zero out @c->freeable_cnt, because it
+	 * affects the free space calculations, and UBIFS might not know about
+	 * all freeable eraseblocks. Indeed, we know about freeable eraseblocks
+	 * only when we read their lprops, and we do this only lazily, upon the
+	 * need. So at any given point of time @c->freeable_cnt might be not
+	 * exactly accurate.
+	 *
+	 * Just one example about the issue we hit when we did not zero
+	 * @c->freeable_cnt.
+	 * 1. The file-system is mounted R/O, c->freeable_cnt is %0. We save the
+	 *    amount of free space in @d->saved_free
+	 * 2. We re-mount R/W, which makes UBIFS to read the "lsave"
+	 *    information from flash, where we cache LEBs from various
+	 *    categories ('ubifs_remount_fs()' -> 'ubifs_lpt_init()'
+	 *    -> 'lpt_init_wr()' -> 'read_lsave()' -> 'ubifs_lpt_lookup()'
+	 *    -> 'ubifs_get_pnode()' -> 'update_cats()'
+	 *    -> 'ubifs_add_to_cat()').
+	 * 3. Lsave contains a freeable eraseblock, and @c->freeable_cnt
+	 *    becomes %1.
+	 * 4. We calculate the amount of free space when the re-mount is
+	 *    finished in 'dbg_check_space_info()' and it does not match
+	 *    @d->saved_free.
+	 */
+	freeable_cnt = c->freeable_cnt;
+	c->freeable_cnt = 0;
 	d->saved_free = ubifs_get_free_space_nolock(c);
-	spin_unlock(&c->space_lock);
+	c->freeable_cnt = freeable_cnt;
+ 	spin_unlock(&c->space_lock);
 }
 
 /**
@@ -993,12 +1021,15 @@ int dbg_check_space_info(struct ubifs_info *c)
 {
 	struct ubifs_debug_info *d = c->dbg;
 	struct ubifs_lp_stats lst;
-	long long avail, free;
+	long long free;
+	int freeable_cnt;
 
 	spin_lock(&c->space_lock);
-	avail = ubifs_calc_available(c, c->min_idx_lebs);
+	freeable_cnt = c->freeable_cnt;
+	c->freeable_cnt = 0;
+	free = ubifs_get_free_space_nolock(c);
+	c->freeable_cnt = freeable_cnt;
 	spin_unlock(&c->space_lock);
-	free = ubifs_get_free_space(c);
 
 	if (free != d->saved_free) {
 		ubifs_err("free space changed from %lld to %lld",
-- 
1.7.2.3
