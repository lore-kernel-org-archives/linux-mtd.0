From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Sun, 16 Jan 2011 19:22:02 +0200
Subject: [PATCH] UBIFS: do not start the commit if there is nothing to commit
Message-ID: <mailman.120.1295200113.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch fixes suboptimal UBIFS 'sync_fs()' implementation which causes
flash I/O even if the file-system is synchronized. E.g., a 'printk()'
in the MTD erasure function (e.g., 'nand_erase_nand()') can show that
for every 'sync' shell command UBIFS erases at least one eraseblock.

So '$ while true; do sync; done' will cause huge amount of flash I/O.

The reason for this is that UBIFS commits in 'sync_fs()', and starts the
commit even if there is nothing to commit, e.g., it anyway changes the
log. This patch adds a check in the 'do_commit()' UBIFS functions which
prevents the commit if there are not dirty znodes (hence, nothing to
commit).

Reported-by: Hans J. Koch <hjk@linutronix.de>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 02429d8..a963d96 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -70,6 +70,21 @@ static int do_commit(struct ubifs_info *c)
 		goto out_up;
 	}
 
+	/*
+	 * Every file-system change changes the TNC, and makes the root znode
+	 * dirty. So if the root znode is clean we can just return immediately
+	 * because there must be nothing to commit. Note, se do not have to
+	 * lock @c->tnc_mutex because we have @c->commit_sem in write mode,
+	 * which guarantees that no one else can access TNC functions
+	 * concurrently.
+	 */
+	if (!c->zroot.znode || !test_bit(DIRTY_ZNODE, &c->zroot.znode->flags)) {
+		ubifs_assert(atomic_long_read(&c->dirty_zn_cnt) == 0);
+		err = 0;
+		up_write(&c->commit_sem);
+		goto out_cancel;
+	}
+
 	/* Sync all write buffers (necessary for recovery) */
 	for (i = 0; i < c->jhead_cnt; i++) {
 		err = ubifs_wbuf_sync(&c->jheads[i].wbuf);
@@ -162,12 +177,12 @@ static int do_commit(struct ubifs_info *c)
 	if (err)
 		goto out;
 
+out_cancel:
 	spin_lock(&c->cs_lock);
 	c->cmt_state = COMMIT_RESTING;
 	wake_up(&c->cmt_wq);
 	dbg_cmt("commit end");
 	spin_unlock(&c->cs_lock);
-
 	return 0;
 
 out_up:
-- 
1.7.3.4

-- 
Best Regards,
Artem Bityutskiy (???????????????? ??????????)
