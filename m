Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEP14-0000fG-S4
	for linux-mtd@lists.infradead.org; Mon, 25 Apr 2011 16:52:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3PGq38C027157
	for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2011 19:52:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: do not free write-buffers when in R/O mode
Date: Mon, 25 Apr 2011 19:55:30 +0300
Message-Id: <1303750531-13800-1-git-send-email-dedekind1@gmail.com>
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

Currently UBIFS has a small optimization - it frees write-buffers when it is
re-mounted from R/W mode to R/O mode. Of course, when it is mounted R/O, it
does not allocate write-buffers as well.

This optimization is nice but it leads to subtle problems and complications
in recovery. Namely, I've noticed them when trying to fix and clean-up the
monster 'ubifs_rcvry_gc_commit()' function.

When mounting R/W, the reply process sets journal heads to some buds, but when
mounting R/O - it does not, because the write-buffers are not allocated. So
'ubifs_rcvry_gc_commit()' works completely differently for the following 2
cases:

1. mounting R/W after a power cut and recover
2. mounting R/O after a power cut, re-mounting R/W and run deferred recovery

In the first case, we have journal heads seeked to some buds, in the second
case, they are always non-seeked (wbuf->lnum == -1).

And this is an obstacle for me to fix 'ubifs_rcvry_gc_commit()' because things
are already quite complicated there, and this additional subtle difference
causes more complications.

Thus, let's remove this small nice optimization and always allocate
write-buffers. This should not make too big difference - we have only 3
of them, each of max. write unit size, which is usually 2KiB. So this is
about 6KiB of RAM for the typical case, and only when mounted R/O.

This patch is actually a preparation for further 'ubifs_rcvry_gc_commit()'
fixes and clean-ups.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/log.c   |   20 --------------------
 fs/ubifs/super.c |   15 ++++-----------
 2 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 4d0cb12..40fa780 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -175,26 +175,6 @@ void ubifs_add_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 }
 
 /**
- * ubifs_create_buds_lists - create journal head buds lists for remount rw.
- * @c: UBIFS file-system description object
- */
-void ubifs_create_buds_lists(struct ubifs_info *c)
-{
-	struct rb_node *p;
-
-	spin_lock(&c->buds_lock);
-	p = rb_first(&c->buds);
-	while (p) {
-		struct ubifs_bud *bud = rb_entry(p, struct ubifs_bud, rb);
-		struct ubifs_jhead *jhead = &c->jheads[bud->jhead];
-
-		list_add_tail(&bud->list, &jhead->buds_list);
-		p = rb_next(p);
-	}
-	spin_unlock(&c->buds_lock);
-}
-
-/**
  * ubifs_add_bud_to_log - add a new bud to the log.
  * @c: UBIFS file-system description object
  * @jhead: journal head the bud belongs to
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 459d8c6..1f049ae 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1257,12 +1257,12 @@ static int mount_ubifs(struct ubifs_info *c)
 		goto out_free;
 	}
 
+	err = alloc_wbufs(c);
+	if (err)
+		goto out_cbuf;
+
 	sprintf(c->bgt_name, BGT_NAME_PATTERN, c->vi.ubi_num, c->vi.vol_id);
 	if (!c->ro_mount) {
-		err = alloc_wbufs(c);
-		if (err)
-			goto out_cbuf;
-
 		/* Create background thread */
 		c->bgt = kthread_create(ubifs_bg_thread, c, "%s", c->bgt_name);
 		if (IS_ERR(c->bgt)) {
@@ -1632,12 +1632,6 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	if (err)
 		goto out;
 
-	err = alloc_wbufs(c);
-	if (err)
-		goto out;
-
-	ubifs_create_buds_lists(c);
-
 	/* Create background thread */
 	c->bgt = kthread_create(ubifs_bg_thread, c, "%s", c->bgt_name);
 	if (IS_ERR(c->bgt)) {
@@ -1745,7 +1739,6 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 	if (err)
 		ubifs_ro_mode(c, err);
 
-	free_wbufs(c);
 	vfree(c->orph_buf);
 	c->orph_buf = NULL;
 	kfree(c->write_reserve_buf);
-- 
1.7.2.3
