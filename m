Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bqRHr-0003cY-QX
 for linux-mtd@lists.infradead.org; Sat, 01 Oct 2016 20:53:37 +0000
Date: Sat, 1 Oct 2016 22:53:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Richard Weinberger <richard@nod.at>
cc: kernel-janitors@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/15 v2] UBIFS: improve function-level documentation
Message-ID: <alpine.DEB.2.10.1610012252190.3445@hadrien>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix various inconsistencies in the documentation associated with various
functions.

In the case of fs/ubifs/lprops.c, the second parameter of
ubifs_get_lp_stats was renamed from st to lst in commit 84abf972ccff
("UBIFS: add re-mount debugging checks")

In the case of fs/ubifs/lpt_commit.c, the excess variables have never
existed in the associated functions since the code was introduced into the
kernel.

The others appear to be straightforward typos.

Issues detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: improve reference to earlier commit

 fs/ubifs/file.c       |    2 +-
 fs/ubifs/gc.c         |    2 +-
 fs/ubifs/lprops.c     |    2 +-
 fs/ubifs/lpt_commit.c |    4 +---
 fs/ubifs/replay.c     |    2 +-
 5 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b0a6a53..629c719 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1397,7 +1397,7 @@ int ubifs_update_time(struct inode *inode, struct timespec *time,
 #endif

 /**
- * update_ctime - update mtime and ctime of an inode.
+ * update_mctime - update mtime and ctime of an inode.
  * @inode: inode to update
  *
  * This function updates mtime and ctime of the inode if it is not equivalent to
diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
index 821b348..e845c64 100644
--- a/fs/ubifs/gc.c
+++ b/fs/ubifs/gc.c
@@ -113,7 +113,7 @@ static int switch_gc_head(struct ubifs_info *c)
  * data_nodes_cmp - compare 2 data nodes.
  * @priv: UBIFS file-system description object
  * @a: first data node
- * @a: second data node
+ * @b: second data node
  *
  * This function compares data nodes @a and @b. Returns %1 if @a has greater
  * inode or block number, and %-1 otherwise.
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index a0011aa..6c3a1ab 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -636,7 +636,7 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
 /**
  * ubifs_get_lp_stats - get lprops statistics.
  * @c: UBIFS file-system description object
- * @st: return statistics
+ * @lst: return statistics
  */
 void ubifs_get_lp_stats(struct ubifs_info *c, struct ubifs_lp_stats *lst)
 {
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index ce89bdc..235654c 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -34,7 +34,6 @@

 /**
  * first_dirty_cnode - find first dirty cnode.
- * @c: UBIFS file-system description object
  * @nnode: nnode at which to start
  *
  * This function returns the first dirty cnode or %NULL if there is not one.
@@ -1623,7 +1622,6 @@ static int dbg_is_node_dirty(struct ubifs_info *c, int node_type, int lnum,
  * dbg_check_ltab_lnum - check the ltab for a LPT LEB number.
  * @c: the UBIFS file-system description object
  * @lnum: LEB number where node was written
- * @offs: offset where node was written
  *
  * This function returns %0 on success and a negative error code on failure.
  */
@@ -1870,7 +1868,7 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 }

 /**
- * ubifs_dump_lpt_leb - dump an LPT LEB.
+ * dump_lpt_leb - dump an LPT LEB.
  * @c: UBIFS file-system description object
  * @lnum: LEB number to dump
  *
diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 3ca4540..fb0f44c 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -267,7 +267,7 @@ static int apply_replay_entry(struct ubifs_info *c, struct replay_entry *r)
  * replay_entries_cmp - compare 2 replay entries.
  * @priv: UBIFS file-system description object
  * @a: first replay entry
- * @a: second replay entry
+ * @b: second replay entry
  *
  * This is a comparios function for 'list_sort()' which compares 2 replay
  * entries @a and @b by comparing their sequence numer.  Returns %1 if @a has
