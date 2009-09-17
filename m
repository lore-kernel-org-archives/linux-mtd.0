Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoFyR-0008TS-EJ
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 12:20:36 +0000
Received: from vaebh106.NOE.Nokia.com (vaebh106.europe.nokia.com
	[10.160.244.32])
	by mgw-mx06.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	n8HCJvnR027881
	for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2009 15:20:13 +0300
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <Adrian.Hunter@nokia.com>
Subject: [PATCH 2/5] UBIFS: improve journal head debugging prints
Date: Thu, 17 Sep 2009 15:19:53 +0300
Message-Id: <1253189996-14191-3-git-send-email-dedekind@infradead.org>
In-Reply-To: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
References: <1253189996-14191-1-git-send-email-dedekind@infradead.org>
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

Convert the journal head integers into the names when printing
debugging information.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c   |   19 +++++++++++++++++--
 fs/ubifs/debug.h   |    2 ++
 fs/ubifs/io.c      |   29 +++++++++++++++--------------
 fs/ubifs/journal.c |   13 ++++++++-----
 fs/ubifs/log.c     |   15 ++++++++-------
 5 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 8183ee0..9690004 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -210,6 +210,20 @@ const char *dbg_cstate(int cmt_state)
 	}
 }
 
+const char *dbg_jhead(int jhead)
+{
+	switch (jhead) {
+	case GCHD:
+		return "0 (GC)";
+	case BASEHD:
+		return "1 (base)";
+	case DATAHD:
+		return "2 (data)";
+	default:
+		return "unknown journal head";
+	}
+}
+
 static void dump_ch(const struct ubifs_ch *ch)
 {
 	printk(KERN_DEBUG "\tmagic          %#x\n", le32_to_cpu(ch->magic));
@@ -623,8 +637,9 @@ void dbg_dump_budg(struct ubifs_info *c)
 	/* If we are in R/O mode, journal heads do not exist */
 	if (c->jheads)
 		for (i = 0; i < c->jhead_cnt; i++)
-			printk(KERN_DEBUG "\tjhead %d\t LEB %d\n",
-			       c->jheads[i].wbuf.jhead, c->jheads[i].wbuf.lnum);
+			printk(KERN_DEBUG "\tjhead %s\t LEB %d\n",
+			       dbg_jhead(c->jheads[i].wbuf.jhead),
+			       c->jheads[i].wbuf.lnum);
 	for (rb = rb_first(&c->buds); rb; rb = rb_next(rb)) {
 		bud = rb_entry(rb, struct ubifs_bud, rb);
 		printk(KERN_DEBUG "\tbud LEB %d\n", bud->lnum);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index fe2c927..29d9601 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -271,6 +271,7 @@ void ubifs_debugging_exit(struct ubifs_info *c);
 /* Dump functions */
 const char *dbg_ntype(int type);
 const char *dbg_cstate(int cmt_state);
+const char *dbg_jhead(int jhead);
 const char *dbg_get_key_dump(const struct ubifs_info *c,
 			     const union ubifs_key *key);
 void dbg_dump_inode(const struct ubifs_info *c, const struct inode *inode);
@@ -427,6 +428,7 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 
 #define dbg_ntype(type)                        ""
 #define dbg_cstate(cmt_state)                  ""
+#define dbg_jhead(jhead)                       ""
 #define dbg_get_key_dump(c, key)               ({})
 #define dbg_dump_inode(c, inode)               ({})
 #define dbg_dump_node(c, node)                 ({})
diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 762a7d6..e589fed 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -297,7 +297,7 @@ static enum hrtimer_restart wbuf_timer_callback_nolock(struct hrtimer *timer)
 {
 	struct ubifs_wbuf *wbuf = container_of(timer, struct ubifs_wbuf, timer);
 
-	dbg_io("jhead %d", wbuf->jhead);
+	dbg_io("jhead %s", dbg_jhead(wbuf->jhead));
 	wbuf->need_sync = 1;
 	wbuf->c->need_wbuf_sync = 1;
 	ubifs_wake_up_bgt(wbuf->c);
@@ -314,7 +314,8 @@ static void new_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
 
 	if (wbuf->no_timer)
 		return;
-	dbg_io("set timer for jhead %d, %llu-%llu millisecs", wbuf->jhead,
+	dbg_io("set timer for jhead %s, %llu-%llu millisecs",
+	       dbg_jhead(wbuf->jhead),
 	       div_u64(ktime_to_ns(wbuf->softlimit), USEC_PER_SEC),
 	       div_u64(ktime_to_ns(wbuf->softlimit) + wbuf->delta,
 		       USEC_PER_SEC));
@@ -351,8 +352,8 @@ int ubifs_wbuf_sync_nolock(struct ubifs_wbuf *wbuf)
 		/* Write-buffer is empty or not seeked */
 		return 0;
 
-	dbg_io("LEB %d:%d, %d bytes, jhead %d",
-	       wbuf->lnum, wbuf->offs, wbuf->used, wbuf->jhead);
+	dbg_io("LEB %d:%d, %d bytes, jhead %s",
+	       wbuf->lnum, wbuf->offs, wbuf->used, dbg_jhead(wbuf->jhead));
 	ubifs_assert(!(c->vfs_sb->s_flags & MS_RDONLY));
 	ubifs_assert(!(wbuf->avail & 7));
 	ubifs_assert(wbuf->offs + c->min_io_size <= c->leb_size);
@@ -401,7 +402,7 @@ int ubifs_wbuf_seek_nolock(struct ubifs_wbuf *wbuf, int lnum, int offs,
 {
 	const struct ubifs_info *c = wbuf->c;
 
-	dbg_io("LEB %d:%d, jhead %d", lnum, offs, wbuf->jhead);
+	dbg_io("LEB %d:%d, jhead %s", lnum, offs, dbg_jhead(wbuf->jhead));
 	ubifs_assert(lnum >= 0 && lnum < c->leb_cnt);
 	ubifs_assert(offs >= 0 && offs <= c->leb_size);
 	ubifs_assert(offs % c->min_io_size == 0 && !(offs & 7));
@@ -508,9 +509,9 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	struct ubifs_info *c = wbuf->c;
 	int err, written, n, aligned_len = ALIGN(len, 8), offs;
 
-	dbg_io("%d bytes (%s) to jhead %d wbuf at LEB %d:%d", len,
-	       dbg_ntype(((struct ubifs_ch *)buf)->node_type), wbuf->jhead,
-	       wbuf->lnum, wbuf->offs + wbuf->used);
+	dbg_io("%d bytes (%s) to jhead %s wbuf at LEB %d:%d", len,
+	       dbg_ntype(((struct ubifs_ch *)buf)->node_type),
+	       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs + wbuf->used);
 	ubifs_assert(len > 0 && wbuf->lnum >= 0 && wbuf->lnum < c->leb_cnt);
 	ubifs_assert(wbuf->offs >= 0 && wbuf->offs % c->min_io_size == 0);
 	ubifs_assert(!(wbuf->offs & 7) && wbuf->offs <= c->leb_size);
@@ -535,8 +536,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 		memcpy(wbuf->buf + wbuf->used, buf, len);
 
 		if (aligned_len == wbuf->avail) {
-			dbg_io("flush jhead %d wbuf to LEB %d:%d",
-			       wbuf->jhead, wbuf->lnum, wbuf->offs);
+			dbg_io("flush jhead %s wbuf to LEB %d:%d",
+			       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
 			err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf,
 					    wbuf->offs, c->min_io_size,
 					    wbuf->dtype);
@@ -564,8 +565,8 @@ int ubifs_wbuf_write_nolock(struct ubifs_wbuf *wbuf, void *buf, int len)
 	 * minimal I/O unit. We have to fill and flush write-buffer and switch
 	 * to the next min. I/O unit.
 	 */
-	dbg_io("flush jhead %d wbuf to LEB %d:%d",
-	       wbuf->jhead, wbuf->lnum, wbuf->offs);
+	dbg_io("flush jhead %s wbuf to LEB %d:%d",
+	       dbg_jhead(wbuf->jhead), wbuf->lnum, wbuf->offs);
 	memcpy(wbuf->buf + wbuf->used, buf, wbuf->avail);
 	err = ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
 			    c->min_io_size, wbuf->dtype);
@@ -698,8 +699,8 @@ int ubifs_read_node_wbuf(struct ubifs_wbuf *wbuf, void *buf, int type, int len,
 	int err, rlen, overlap;
 	struct ubifs_ch *ch = buf;
 
-	dbg_io("LEB %d:%d, %s, length %d, jhead %d", lnum, offs,
-	       dbg_ntype(type), len, wbuf->jhead);
+	dbg_io("LEB %d:%d, %s, length %d, jhead %s", lnum, offs,
+	       dbg_ntype(type), len, dbg_jhead(wbuf->jhead));
 	ubifs_assert(wbuf && lnum >= 0 && lnum < c->leb_cnt && offs >= 0);
 	ubifs_assert(!(offs & 7) && offs < c->leb_size);
 	ubifs_assert(type >= 0 && type < UBIFS_NODE_TYPES_CNT);
diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 64b5f3a..d321bae 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -158,7 +158,7 @@ again:
 	 * some. But the write-buffer mutex has to be unlocked because
 	 * GC also takes it.
 	 */
-	dbg_jnl("no free space  jhead %d, run GC", jhead);
+	dbg_jnl("no free space in jhead %s, run GC", dbg_jhead(jhead));
 	mutex_unlock(&wbuf->io_mutex);
 
 	lnum = ubifs_garbage_collect(c, 0);
@@ -173,7 +173,8 @@ again:
 		 * because we dropped @wbuf->io_mutex, so try once
 		 * again.
 		 */
-		dbg_jnl("GC couldn't make a free LEB for jhead %d", jhead);
+		dbg_jnl("GC couldn't make a free LEB for jhead %s",
+			dbg_jhead(jhead));
 		if (retries++ < 2) {
 			dbg_jnl("retry (%d)", retries);
 			goto again;
@@ -184,7 +185,7 @@ again:
 	}
 
 	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
-	dbg_jnl("got LEB %d for jhead %d", lnum, jhead);
+	dbg_jnl("got LEB %d for jhead %s", lnum, dbg_jhead(jhead));
 	avail = c->leb_size - wbuf->offs - wbuf->used;
 
 	if (wbuf->lnum != -1 && avail >= len) {
@@ -255,7 +256,8 @@ static int write_node(struct ubifs_info *c, int jhead, void *node, int len,
 	*lnum = c->jheads[jhead].wbuf.lnum;
 	*offs = c->jheads[jhead].wbuf.offs + c->jheads[jhead].wbuf.used;
 
-	dbg_jnl("jhead %d, LEB %d:%d, len %d", jhead, *lnum, *offs, len);
+	dbg_jnl("jhead %s, LEB %d:%d, len %d",
+		dbg_jhead(jhead), *lnum, *offs, len);
 	ubifs_prepare_node(c, node, len, 0);
 
 	return ubifs_wbuf_write_nolock(wbuf, node, len);
@@ -285,7 +287,8 @@ static int write_head(struct ubifs_info *c, int jhead, void *buf, int len,
 
 	*lnum = c->jheads[jhead].wbuf.lnum;
 	*offs = c->jheads[jhead].wbuf.offs + c->jheads[jhead].wbuf.used;
-	dbg_jnl("jhead %d, LEB %d:%d, len %d", jhead, *lnum, *offs, len);
+	dbg_jnl("jhead %s, LEB %d:%d, len %d",
+		dbg_jhead(jhead), *lnum, *offs, len);
 
 	err = ubifs_wbuf_write_nolock(wbuf, buf, len);
 	if (err)
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index 60dcf6c..c345e12 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -169,8 +169,8 @@ void ubifs_add_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 	 */
 	c->bud_bytes += c->leb_size - bud->start;
 
-	dbg_log("LEB %d:%d, jhead %d, bud_bytes %lld", bud->lnum,
-		bud->start, bud->jhead, c->bud_bytes);
+	dbg_log("LEB %d:%d, jhead %s, bud_bytes %lld", bud->lnum,
+		bud->start, dbg_jhead(bud->jhead), c->bud_bytes);
 	spin_unlock(&c->buds_lock);
 }
 
@@ -355,16 +355,16 @@ static void remove_buds(struct ubifs_info *c)
 			 * heads (non-closed buds).
 			 */
 			c->cmt_bud_bytes += wbuf->offs - bud->start;
-			dbg_log("preserve %d:%d, jhead %d, bud bytes %d, "
+			dbg_log("preserve %d:%d, jhead %s, bud bytes %d, "
 				"cmt_bud_bytes %lld", bud->lnum, bud->start,
-				bud->jhead, wbuf->offs - bud->start,
+				dbg_jhead(bud->jhead), wbuf->offs - bud->start,
 				c->cmt_bud_bytes);
 			bud->start = wbuf->offs;
 		} else {
 			c->cmt_bud_bytes += c->leb_size - bud->start;
-			dbg_log("remove %d:%d, jhead %d, bud bytes %d, "
+			dbg_log("remove %d:%d, jhead %s, bud bytes %d, "
 				"cmt_bud_bytes %lld", bud->lnum, bud->start,
-				bud->jhead, c->leb_size - bud->start,
+				dbg_jhead(bud->jhead), c->leb_size - bud->start,
 				c->cmt_bud_bytes);
 			rb_erase(p1, &c->buds);
 			/*
@@ -429,7 +429,8 @@ int ubifs_log_start_commit(struct ubifs_info *c, int *ltail_lnum)
 		if (lnum == -1 || offs == c->leb_size)
 			continue;
 
-		dbg_log("add ref to LEB %d:%d for jhead %d", lnum, offs, i);
+		dbg_log("add ref to LEB %d:%d for jhead %s",
+			lnum, offs, dbg_jhead(i));
 		ref = buf + len;
 		ref->ch.node_type = UBIFS_REF_NODE;
 		ref->lnum = cpu_to_le32(lnum);
-- 
1.6.2.5
