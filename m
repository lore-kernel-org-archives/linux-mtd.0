Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1FLC-0001mo-AJ
 for linux-mtd@lists.infradead.org; Sun, 29 Jun 2014 13:40:23 +0000
Message-ID: <1404049196.3954.35.camel@sauron.fi.intel.com>
Subject: Re: ubifs: replay log error
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Sun, 29 Jun 2014 16:39:56 +0300
In-Reply-To: <53A2A615.7070607@huawei.com>
References: <5396CCA8.7060303@huawei.com> <53A2A615.7070607@huawei.com>
Content-Type: multipart/mixed; boundary="=-69hyiOhH9lV6ea02BNCF"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-69hyiOhH9lV6ea02BNCF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-06-19 at 16:57 +0800, hujianyang wrote:
> I found there might be a race in do_commit(). If we perform
> ubifs_log_end_commit() before write master node, another
> process which run ubifs_add_bud_to_log() may destroy the
> old cs_node in the next or latter leb. Because log_end_commit()
> will change @c->ltail_lnum by new @ltail_lnum. If power off
> happens before we write either master node, we will read the
> old master nodes and find no cs node exist in the leb which
> master node indicate in the next mount.
> 
> Am I right?

Frankly, I did not fully understand your explanation, but after spending
some time looking at the code and trying to recall what is going on
there, I see the race condition.

Excellent analysis, well done, thank you!

> Now I would like to show the undone patch.

Not sure this patch is the best way to fix the issue.

How about the following patch (also attached), which I did not test, and
did not even compile-check.

>From 31c07463f4c475976723986d7ec46bf961ed46e5 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Sun, 29 Jun 2014 16:32:21 +0300
Subject: [PATCH] UBIFS: fix fatal race condition

Hu (hujianyang@huawei.com) discovered a race condition which leads to a
situation when UBIFS is unable to mount the file-system after an unclean
reboot. On top of that, Hu analysed it and proposed a solution. This patch
is based on his work, but solves the problem a little bit differently.

Here is an attempt to shed some light on the problem.

In UBIFS, we have the log, which basically a set of LEBs in a certain area. The
log has the tail and the head.

Every time user writes data to the file-system, the UBIFS journal grows, and
the log grows as well, because we append new reference nodes to the head of the
log. So the head moves forward all the time, while the log tail stays at the
same position.

At any time, the UBIFS master node points to the tail of the log. When we mount
the file-system, we scan the log, and we always start from its tail, because
this is where the master node points to. The only occasion when the tail of the
log changes is the commit operation.

The commit operation has 2 phases - "commit start" and "commit end". The former
is relatively short, and does not involve much I/O. During this phase we mostly
just build various in-memory lists of the things which have to be written to
the flash media during "commit end" phase.

During the commit start phase, what we do is we "clean" the log. Indeed, the
commit operation will index all the data in the journal, so the entire journal
"disappears", and therefore the data in the log become unneeded. So we just
move the head of the log to the next LEB, and write the CS node there. This LEB
will be the tail of the new log when the commit operation finishes.

When the "commit start" phase finishes, users may write more data to the
file-system, in parallel with the ongoing "commit end" operation. At this point
the log tail was not changed yet, it is the same as it had been before we
started the commit. The log head keeps moving forward, though.

The commit operation now needs to write the new master node, and the new master
node should point to the new log tail. After this the LEBs between the old log
tail and the new log tail can be unmapped and re-used again.

And here is the problem. We do 2 operations: (a) We first update the log tail
position in memory (see 'ubifs_log_end_commit()'). (b) And then we write the
master node (see the big lock of code in 'do_commit()').

But nothing prevents the log head from moving forward between (a) and (b), and
the log head may "wrap" now to the old log tail. And when the "wrap" happens,
the contends of the log tail gets erased. Now a power cut happens and we are in
trouble. We end up with the old master node pointing to the old tail, which was
erased. And replay fails because it expects the master node to point to the
correct log tail at all times.

The symptoms of the mount failure are:

UBIFS: background thread "ubifs_bgt0_0" started, PID 2222
UBIFS: recovery needed
UBIFS error (pid 2220): replay_log_leb: first log node at LEB 4:0 is not CS node
UBIFS error (pid 2220): replay_log_leb: log error detected while replaying the log at LEB 4:0
 magic          0x6101831
 crc            0x81e22cd5
 node_type      8 (reference node)
 group_type     0 (no node group)
 sqnum          2375337
 len            64
 lnum           5273
 offs           122880
 jhead          2
UBIFS: background thread "ubifs_bgt0_0" stops

This fix merges the abovementioned (a) and (b) operations by moving the master
node change code to the 'ubifs_log_end_commit()' function, so that it runs with
the log mutex locked, which will prevent the log from being changed benween
operations (a) and (b).

Reported-by: hujianyang <hujianyang@huawei.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/commit.c | 37 ++-----------------------------------
 fs/ubifs/log.c    | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index ff82293..51a673c 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -166,45 +166,12 @@ static int do_commit(struct ubifs_info *c)
 	err = ubifs_orphan_end_commit(c);
 	if (err)
 		goto out;
-	old_ltail_lnum = c->ltail_lnum;
-	err = ubifs_log_end_commit(c, new_ltail_lnum);
-	if (err)
-		goto out;
 	err = dbg_check_old_index(c, &zroot);
 	if (err)
 		goto out;
 
-	mutex_lock(&c->mst_mutex);
-	c->mst_node->cmt_no      = cpu_to_le64(c->cmt_no);
-	c->mst_node->log_lnum    = cpu_to_le32(new_ltail_lnum);
-	c->mst_node->root_lnum   = cpu_to_le32(zroot.lnum);
-	c->mst_node->root_offs   = cpu_to_le32(zroot.offs);
-	c->mst_node->root_len    = cpu_to_le32(zroot.len);
-	c->mst_node->ihead_lnum  = cpu_to_le32(c->ihead_lnum);
-	c->mst_node->ihead_offs  = cpu_to_le32(c->ihead_offs);
-	c->mst_node->index_size  = cpu_to_le64(c->bi.old_idx_sz);
-	c->mst_node->lpt_lnum    = cpu_to_le32(c->lpt_lnum);
-	c->mst_node->lpt_offs    = cpu_to_le32(c->lpt_offs);
-	c->mst_node->nhead_lnum  = cpu_to_le32(c->nhead_lnum);
-	c->mst_node->nhead_offs  = cpu_to_le32(c->nhead_offs);
-	c->mst_node->ltab_lnum   = cpu_to_le32(c->ltab_lnum);
-	c->mst_node->ltab_offs   = cpu_to_le32(c->ltab_offs);
-	c->mst_node->lsave_lnum  = cpu_to_le32(c->lsave_lnum);
-	c->mst_node->lsave_offs  = cpu_to_le32(c->lsave_offs);
-	c->mst_node->lscan_lnum  = cpu_to_le32(c->lscan_lnum);
-	c->mst_node->empty_lebs  = cpu_to_le32(lst.empty_lebs);
-	c->mst_node->idx_lebs    = cpu_to_le32(lst.idx_lebs);
-	c->mst_node->total_free  = cpu_to_le64(lst.total_free);
-	c->mst_node->total_dirty = cpu_to_le64(lst.total_dirty);
-	c->mst_node->total_used  = cpu_to_le64(lst.total_used);
-	c->mst_node->total_dead  = cpu_to_le64(lst.total_dead);
-	c->mst_node->total_dark  = cpu_to_le64(lst.total_dark);
-	if (c->no_orphs)
-		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
-	else
-		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
-	err = ubifs_write_master(c);
-	mutex_unlock(&c->mst_mutex);
+	old_ltail_lnum = c->ltail_lnum;
+	err = ubifs_log_end_commit(c, new_ltail_lnum);
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index a902c59..29225bd 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -447,9 +447,9 @@ out:
  * @ltail_lnum: new log tail LEB number
  *
  * This function is called on when the commit operation was finished. It
- * moves log tail to new position and unmaps LEBs which contain obsolete data.
- * Returns zero in case of success and a negative error code in case of
- * failure.
+ * moves log tail to new position and updates the master node so that it stores
+ * the new log tail LEB number. Returns zero in case of success and a negative
+ * error code in case of failure.
  */
 int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
 {
@@ -477,7 +477,51 @@ int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
 	spin_unlock(&c->buds_lock);
 
 	err = dbg_check_bud_bytes(c);
+	if (err)
+		goto out_unlock;
 
+	/*
+	 * Update the master node. It is important to make sure that
+	 * the log does not grow between the 'c->ltail_lnum' and the master
+	 * node update. Otherwise the log head may move to the old journal
+	 * tail, and if an power cut happens before the master node is written,
+	 * we end up with old master node pointing to the log tail which was
+	 * erased.
+	 */
+	mutex_lock(&c->mst_mutex);
+	c->mst_node->cmt_no      = cpu_to_le64(c->cmt_no);
+	c->mst_node->log_lnum    = cpu_to_le32(new_ltail_lnum);
+	c->mst_node->root_lnum   = cpu_to_le32(zroot.lnum);
+	c->mst_node->root_offs   = cpu_to_le32(zroot.offs);
+	c->mst_node->root_len    = cpu_to_le32(zroot.len);
+	c->mst_node->ihead_lnum  = cpu_to_le32(c->ihead_lnum);
+	c->mst_node->ihead_offs  = cpu_to_le32(c->ihead_offs);
+	c->mst_node->index_size  = cpu_to_le64(c->bi.old_idx_sz);
+	c->mst_node->lpt_lnum    = cpu_to_le32(c->lpt_lnum);
+	c->mst_node->lpt_offs    = cpu_to_le32(c->lpt_offs);
+	c->mst_node->nhead_lnum  = cpu_to_le32(c->nhead_lnum);
+	c->mst_node->nhead_offs  = cpu_to_le32(c->nhead_offs);
+	c->mst_node->ltab_lnum   = cpu_to_le32(c->ltab_lnum);
+	c->mst_node->ltab_offs   = cpu_to_le32(c->ltab_offs);
+	c->mst_node->lsave_lnum  = cpu_to_le32(c->lsave_lnum);
+	c->mst_node->lsave_offs  = cpu_to_le32(c->lsave_offs);
+	c->mst_node->lscan_lnum  = cpu_to_le32(c->lscan_lnum);
+	c->mst_node->empty_lebs  = cpu_to_le32(lst.empty_lebs);
+	c->mst_node->idx_lebs    = cpu_to_le32(lst.idx_lebs);
+	c->mst_node->total_free  = cpu_to_le64(lst.total_free);
+	c->mst_node->total_dirty = cpu_to_le64(lst.total_dirty);
+	c->mst_node->total_used  = cpu_to_le64(lst.total_used);
+	c->mst_node->total_dead  = cpu_to_le64(lst.total_dead);
+	c->mst_node->total_dark  = cpu_to_le64(lst.total_dark);
+	if (c->no_orphs)
+		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
+	else
+		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
+
+	err = ubifs_write_master(c);
+
+	mutex_unlock(&c->mst_mutex);
+out_unlock:
 	mutex_unlock(&c->log_mutex);
 	return err;
 }
-- 
1.9.3


-- 
Best Regards,
Artem Bityutskiy

--=-69hyiOhH9lV6ea02BNCF
Content-Disposition: attachment; filename="0001-UBIFS-fix-fatal-race-condition.patch"
Content-Type: text/x-patch; name="0001-UBIFS-fix-fatal-race-condition.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 31c07463f4c475976723986d7ec46bf961ed46e5 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Sun, 29 Jun 2014 16:32:21 +0300
Subject: [PATCH] UBIFS: fix fatal race condition

Hu (hujianyang@huawei.com) discovered a race condition which leads to a
situation when UBIFS is unable to mount the file-system after an unclean
reboot. On top of that, Hu analysed it and proposed a solution. This patch
is based on his work, but solves the problem a little bit differently.

Here is an attempt to shed some light on the problem.

In UBIFS, we have the log, which basically a set of LEBs in a certain area. The
log has the tail and the head.

Every time user writes data to the file-system, the UBIFS journal grows, and
the log grows as well, because we append new reference nodes to the head of the
log. So the head moves forward all the time, while the log tail stays at the
same position.

At any time, the UBIFS master node points to the tail of the log. When we mount
the file-system, we scan the log, and we always start from its tail, because
this is where the master node points to. The only occasion when the tail of the
log changes is the commit operation.

The commit operation has 2 phases - "commit start" and "commit end". The former
is relatively short, and does not involve much I/O. During this phase we mostly
just build various in-memory lists of the things which have to be written to
the flash media during "commit end" phase.

During the commit start phase, what we do is we "clean" the log. Indeed, the
commit operation will index all the data in the journal, so the entire journal
"disappears", and therefore the data in the log become unneeded. So we just
move the head of the log to the next LEB, and write the CS node there. This LEB
will be the tail of the new log when the commit operation finishes.

When the "commit start" phase finishes, users may write more data to the
file-system, in parallel with the ongoing "commit end" operation. At this point
the log tail was not changed yet, it is the same as it had been before we
started the commit. The log head keeps moving forward, though.

The commit operation now needs to write the new master node, and the new master
node should point to the new log tail. After this the LEBs between the old log
tail and the new log tail can be unmapped and re-used again.

And here is the problem. We do 2 operations: (a) We first update the log tail
position in memory (see 'ubifs_log_end_commit()'). (b) And then we write the
master node (see the big lock of code in 'do_commit()').

But nothing prevents the log head from moving forward between (a) and (b), and
the log head may "wrap" now to the old log tail. And when the "wrap" happens,
the contends of the log tail gets erased. Now a power cut happens and we are in
trouble. We end up with the old master node pointing to the old tail, which was
erased. And replay fails because it expects the master node to point to the
correct log tail at all times.

The symptoms of the mount failure are:

UBIFS: background thread "ubifs_bgt0_0" started, PID 2222
UBIFS: recovery needed
UBIFS error (pid 2220): replay_log_leb: first log node at LEB 4:0 is not CS node
UBIFS error (pid 2220): replay_log_leb: log error detected while replaying the log at LEB 4:0
 magic          0x6101831
 crc            0x81e22cd5
 node_type      8 (reference node)
 group_type     0 (no node group)
 sqnum          2375337
 len            64
 lnum           5273
 offs           122880
 jhead          2
UBIFS: background thread "ubifs_bgt0_0" stops

This fix merges the abovementioned (a) and (b) operations by moving the master
node change code to the 'ubifs_log_end_commit()' function, so that it runs with
the log mutex locked, which will prevent the log from being changed benween
operations (a) and (b).

Reported-by: hujianyang <hujianyang@huawei.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: stable@vger.kernel.org
---
 fs/ubifs/commit.c | 37 ++-----------------------------------
 fs/ubifs/log.c    | 50 +++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 49 insertions(+), 38 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index ff82293..51a673c 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -166,45 +166,12 @@ static int do_commit(struct ubifs_info *c)
 	err = ubifs_orphan_end_commit(c);
 	if (err)
 		goto out;
-	old_ltail_lnum = c->ltail_lnum;
-	err = ubifs_log_end_commit(c, new_ltail_lnum);
-	if (err)
-		goto out;
 	err = dbg_check_old_index(c, &zroot);
 	if (err)
 		goto out;
 
-	mutex_lock(&c->mst_mutex);
-	c->mst_node->cmt_no      = cpu_to_le64(c->cmt_no);
-	c->mst_node->log_lnum    = cpu_to_le32(new_ltail_lnum);
-	c->mst_node->root_lnum   = cpu_to_le32(zroot.lnum);
-	c->mst_node->root_offs   = cpu_to_le32(zroot.offs);
-	c->mst_node->root_len    = cpu_to_le32(zroot.len);
-	c->mst_node->ihead_lnum  = cpu_to_le32(c->ihead_lnum);
-	c->mst_node->ihead_offs  = cpu_to_le32(c->ihead_offs);
-	c->mst_node->index_size  = cpu_to_le64(c->bi.old_idx_sz);
-	c->mst_node->lpt_lnum    = cpu_to_le32(c->lpt_lnum);
-	c->mst_node->lpt_offs    = cpu_to_le32(c->lpt_offs);
-	c->mst_node->nhead_lnum  = cpu_to_le32(c->nhead_lnum);
-	c->mst_node->nhead_offs  = cpu_to_le32(c->nhead_offs);
-	c->mst_node->ltab_lnum   = cpu_to_le32(c->ltab_lnum);
-	c->mst_node->ltab_offs   = cpu_to_le32(c->ltab_offs);
-	c->mst_node->lsave_lnum  = cpu_to_le32(c->lsave_lnum);
-	c->mst_node->lsave_offs  = cpu_to_le32(c->lsave_offs);
-	c->mst_node->lscan_lnum  = cpu_to_le32(c->lscan_lnum);
-	c->mst_node->empty_lebs  = cpu_to_le32(lst.empty_lebs);
-	c->mst_node->idx_lebs    = cpu_to_le32(lst.idx_lebs);
-	c->mst_node->total_free  = cpu_to_le64(lst.total_free);
-	c->mst_node->total_dirty = cpu_to_le64(lst.total_dirty);
-	c->mst_node->total_used  = cpu_to_le64(lst.total_used);
-	c->mst_node->total_dead  = cpu_to_le64(lst.total_dead);
-	c->mst_node->total_dark  = cpu_to_le64(lst.total_dark);
-	if (c->no_orphs)
-		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
-	else
-		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
-	err = ubifs_write_master(c);
-	mutex_unlock(&c->mst_mutex);
+	old_ltail_lnum = c->ltail_lnum;
+	err = ubifs_log_end_commit(c, new_ltail_lnum);
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index a902c59..29225bd 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -447,9 +447,9 @@ out:
  * @ltail_lnum: new log tail LEB number
  *
  * This function is called on when the commit operation was finished. It
- * moves log tail to new position and unmaps LEBs which contain obsolete data.
- * Returns zero in case of success and a negative error code in case of
- * failure.
+ * moves log tail to new position and updates the master node so that it stores
+ * the new log tail LEB number. Returns zero in case of success and a negative
+ * error code in case of failure.
  */
 int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
 {
@@ -477,7 +477,51 @@ int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
 	spin_unlock(&c->buds_lock);
 
 	err = dbg_check_bud_bytes(c);
+	if (err)
+		goto out_unlock;
 
+	/*
+	 * Update the master node. It is important to make sure that
+	 * the log does not grow between the 'c->ltail_lnum' and the master
+	 * node update. Otherwise the log head may move to the old journal
+	 * tail, and if an power cut happens before the master node is written,
+	 * we end up with old master node pointing to the log tail which was
+	 * erased.
+	 */
+	mutex_lock(&c->mst_mutex);
+	c->mst_node->cmt_no      = cpu_to_le64(c->cmt_no);
+	c->mst_node->log_lnum    = cpu_to_le32(new_ltail_lnum);
+	c->mst_node->root_lnum   = cpu_to_le32(zroot.lnum);
+	c->mst_node->root_offs   = cpu_to_le32(zroot.offs);
+	c->mst_node->root_len    = cpu_to_le32(zroot.len);
+	c->mst_node->ihead_lnum  = cpu_to_le32(c->ihead_lnum);
+	c->mst_node->ihead_offs  = cpu_to_le32(c->ihead_offs);
+	c->mst_node->index_size  = cpu_to_le64(c->bi.old_idx_sz);
+	c->mst_node->lpt_lnum    = cpu_to_le32(c->lpt_lnum);
+	c->mst_node->lpt_offs    = cpu_to_le32(c->lpt_offs);
+	c->mst_node->nhead_lnum  = cpu_to_le32(c->nhead_lnum);
+	c->mst_node->nhead_offs  = cpu_to_le32(c->nhead_offs);
+	c->mst_node->ltab_lnum   = cpu_to_le32(c->ltab_lnum);
+	c->mst_node->ltab_offs   = cpu_to_le32(c->ltab_offs);
+	c->mst_node->lsave_lnum  = cpu_to_le32(c->lsave_lnum);
+	c->mst_node->lsave_offs  = cpu_to_le32(c->lsave_offs);
+	c->mst_node->lscan_lnum  = cpu_to_le32(c->lscan_lnum);
+	c->mst_node->empty_lebs  = cpu_to_le32(lst.empty_lebs);
+	c->mst_node->idx_lebs    = cpu_to_le32(lst.idx_lebs);
+	c->mst_node->total_free  = cpu_to_le64(lst.total_free);
+	c->mst_node->total_dirty = cpu_to_le64(lst.total_dirty);
+	c->mst_node->total_used  = cpu_to_le64(lst.total_used);
+	c->mst_node->total_dead  = cpu_to_le64(lst.total_dead);
+	c->mst_node->total_dark  = cpu_to_le64(lst.total_dark);
+	if (c->no_orphs)
+		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
+	else
+		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
+
+	err = ubifs_write_master(c);
+
+	mutex_unlock(&c->mst_mutex);
+out_unlock:
 	mutex_unlock(&c->log_mutex);
 	return err;
 }
-- 
1.9.3


--=-69hyiOhH9lV6ea02BNCF--
