Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hf-QF
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:03 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqg013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/10] UBIFS: amend ubifs_recover_leb interface
Date: Fri,  3 Jun 2011 16:49:54 +0300
Message-Id: <1307109001-19761-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Instead of passing "grouped" parameter to 'ubifs_recover_leb()' which tells
whether the nodes are grouped in the LEB to recover, pass the journal head
number and let 'ubifs_recover_leb()' look at the journal head's 'grouped' flag.

This patch is a preparation to a further fix where we'll need to know the
journal head number for other purposes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/orphan.c   |    2 +-
 fs/ubifs/recovery.c |   10 ++++++----
 fs/ubifs/replay.c   |    3 +--
 fs/ubifs/ubifs.h    |    2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index bd644bf..a5422ff 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -674,7 +674,7 @@ static int kill_orphans(struct ubifs_info *c)
 		if (IS_ERR(sleb)) {
 			if (PTR_ERR(sleb) == -EUCLEAN)
 				sleb = ubifs_recover_leb(c, lnum, 0,
-							 c->sbuf, 0);
+							 c->sbuf, -1);
 			if (IS_ERR(sleb)) {
 				err = PTR_ERR(sleb);
 				break;
diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 95e2418..6adb532 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -604,7 +604,8 @@ static int drop_last_node(struct ubifs_scan_leb *sleb, int *offs, int grouped)
  * @lnum: LEB number
  * @offs: offset
  * @sbuf: LEB-sized buffer to use
- * @grouped: nodes may be grouped for recovery
+ * @jhead: journal head number this LEB belongs to (%-1 if the LEB does not
+ *         belong to any journal head)
  *
  * This function does a scan of a LEB, but caters for errors that might have
  * been caused by the unclean unmount from which we are attempting to recover.
@@ -612,13 +613,14 @@ static int drop_last_node(struct ubifs_scan_leb *sleb, int *offs, int grouped)
  * found, and a negative error code in case of failure.
  */
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
-					 int offs, void *sbuf, int grouped)
+					 int offs, void *sbuf, int jhead)
 {
 	int ret = 0, err, len = c->leb_size - offs, start = offs, min_io_unit;
+	int grouped = jhead == -1 ? 0 : c->jheads[jhead].grouped;
 	struct ubifs_scan_leb *sleb;
 	void *buf = sbuf + offs;
 
-	dbg_rcvry("%d:%d", lnum, offs);
+	dbg_rcvry("%d:%d, jhead %d, grouped %d", lnum, offs, jhead, grouped);
 
 	sleb = ubifs_start_scan(c, lnum, offs, sbuf);
 	if (IS_ERR(sleb))
@@ -881,7 +883,7 @@ struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 		}
 		ubifs_scan_destroy(sleb);
 	}
-	return ubifs_recover_leb(c, lnum, offs, sbuf, 0);
+	return ubifs_recover_leb(c, lnum, offs, sbuf, -1);
 }
 
 /**
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 6617280..5e97161 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -557,8 +557,7 @@ static int replay_bud(struct ubifs_info *c, struct bud_entry *b)
 		 * these LEBs could possibly be written to at the power cut
 		 * time.
 		 */
-		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf,
-					 b->bud->jhead != GCHD);
+		sleb = ubifs_recover_leb(c, lnum, offs, c->sbuf, b->bud->jhead);
 	else
 		sleb = ubifs_scan(c, lnum, offs, c->sbuf, 0);
 	if (IS_ERR(sleb))
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index adeca14..f79983d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1744,7 +1744,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum);
 int ubifs_recover_master_node(struct ubifs_info *c);
 int ubifs_write_rcvrd_mst_node(struct ubifs_info *c);
 struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
-					 int offs, void *sbuf, int grouped);
+					 int offs, void *sbuf, int jhead);
 struct ubifs_scan_leb *ubifs_recover_log_leb(struct ubifs_info *c, int lnum,
 					     int offs, void *sbuf);
 int ubifs_recover_inl_heads(const struct ubifs_info *c, void *sbuf);
-- 
1.7.2.3
