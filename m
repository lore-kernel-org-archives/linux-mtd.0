Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf622-0007y2-VJ
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 07:31:38 +0000
Received: by fxm19 with SMTP id 19so6876551fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Jan 2011 23:30:22 -0800 (PST)
Subject: [PATCH v2 3/3] UBIFS: do not start the commit if there is nothing
	to commit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4D33FB78.5010208@nokia.com>
References: <20101013163005.GB1889@silverbox.local>
	<1295200104.2470.5.camel@koala>  <4D33FB78.5010208@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 09:30:17 +0200
Message-ID: <1295335817.2470.31.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Hans J. Koch" <hjk@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch fixes suboptimal UBIFS 'sync_fs()' implementation which causes
flash I/O even if the file-system is synchronized. E.g., a 'printk()'
in the MTD erasure function (e.g., 'nand_erase_nand()') can show that
for every 'sync' shell command UBIFS erases at least one eraseblock.

So '$ while true; do sync; done' will cause huge amount of flash I/O.

The reason for this is that UBIFS commits in 'sync_fs()', and starts the
commit even if there is nothing to commit, e.g., it anyway changes the
log. This patch adds a check in the 'do_commit()' UBIFS functions which
prevents the commit if there is nothing to commit.

Reported-by: Hans J. Koch <hjk@linutronix.de>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 53 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 02429d8..fdd5112 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -48,6 +48,52 @@
 #include <linux/slab.h>
 #include "ubifs.h"
 
+/*
+ * nothing_to_commit - check if there is nothing to commit.
+ * @c: UBIFS file-system description object
+ *
+ * This is a helper function which checks if there is anything to commit. It is
+ * used as an optimization to avoid starting the commit if it is not really
+ * necessary. Indeed, the commit operation always assumes flash I/O (e.g.,
+ * writing the commit start node to the log), and it is better to avoid doing
+ * this unnecessarily. E.g., 'ubifs_sync_fs()' runs the commit, but if there is
+ * nothing to commit, it is more optimal to avoid any flash I/O.
+ *
+ * This function returns %1 if there is something to commit and %0 otherwise.
+ */
+static int nothing_to_commit(struct ubifs_info *c)
+{
+	/*
+	 * During mounting or remounting from R/O mode to R/W mode we may
+	 * commit for various recovery-related reasons.
+	 */
+	if (c->mounting || c->remounting_rw)
+		return 0;
+
+	/*
+	 * If the root TNC node is dirty, we definitely have something to
+	 * commit.
+	 */
+	if (c->zroot.znode && test_bit(DIRTY_ZNODE, &c->zroot.znode->flags))
+		return 0;
+
+	/*
+	 * Even though the TNC is clean, the LPT tree may have dirty nodes. For
+	 * example, this may happen if the budgeting subsystem invoked GC to
+	 * make some free space, and the GC found an LEB with only dirty and
+	 * free space. In this case GC would just change the lprops of this
+	 * LEB (by turning all space into free space) and unmap it.
+	 */
+	if (c->nroot && test_bit(DIRTY_CNODE, &c->nroot->flags))
+		return 0;
+
+	ubifs_assert(atomic_long_read(&c->dirty_zn_cnt) == 0);
+	ubifs_assert(c->dirty_pn_cnt == 0);
+	ubifs_assert(c->dirty_nn_cnt == 0);
+
+	return 1;
+}
+
 /**
  * do_commit - commit the journal.
  * @c: UBIFS file-system description object
@@ -70,6 +116,12 @@ static int do_commit(struct ubifs_info *c)
 		goto out_up;
 	}
 
+	if (nothing_to_commit(c)) {
+		up_write(&c->commit_sem);
+		err = 0;
+		goto out_cancel;
+	}
+
 	/* Sync all write buffers (necessary for recovery) */
 	for (i = 0; i < c->jhead_cnt; i++) {
 		err = ubifs_wbuf_sync(&c->jheads[i].wbuf);
@@ -162,12 +214,12 @@ static int do_commit(struct ubifs_info *c)
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
