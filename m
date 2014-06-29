Received: from mga03.intel.com ([143.182.124.21])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1FuH-0000wO-1Z
 for linux-mtd@lists.infradead.org; Sun, 29 Jun 2014 14:16:38 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hujianyang <hujianyang@huawei.com>
Subject: [PATCH v2 2/2] UBIFS: fix fatal race condition
Date: Sun, 29 Jun 2014 17:16:11 +0300
Message-Id: <1404051371-29756-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1404051371-29756-1-git-send-email-dedekind1@gmail.com>
References: <1404051371-29756-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

[UNTESTED, needs testing before going to '@stable']

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
 fs/ubifs/commit.c |  8 +++-----
 fs/ubifs/log.c    | 11 ++++++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index aa13ad0..26b69b2 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -166,10 +166,6 @@ static int do_commit(struct ubifs_info *c)
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
@@ -202,7 +198,9 @@ static int do_commit(struct ubifs_info *c)
 		c->mst_node->flags |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
 	else
 		c->mst_node->flags &= ~cpu_to_le32(UBIFS_MST_NO_ORPHS);
-	err = ubifs_write_master(c);
+
+	old_ltail_lnum = c->ltail_lnum;
+	err = ubifs_log_end_commit(c, new_ltail_lnum);
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index a902c59..3edc4a3 100644
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
@@ -477,7 +477,12 @@ int ubifs_log_end_commit(struct ubifs_info *c, int ltail_lnum)
 	spin_unlock(&c->buds_lock);
 
 	err = dbg_check_bud_bytes(c);
+	if (err)
+		goto out;
 
+	err = ubifs_write_master(c);
+
+out:
 	mutex_unlock(&c->log_mutex);
 	return err;
 }
-- 
1.9.3
