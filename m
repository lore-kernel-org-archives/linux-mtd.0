Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dPS4K-0004LS-4G
 for linux-mtd@lists.infradead.org; Mon, 26 Jun 2017 11:20:39 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, Richard Weinberger <richard@nod.at>,
 Subodh Nijsure <snijsure@grid-net.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Ben Shelton <ben.shelton@ni.com>,
 Brad Mouring <brad.mouring@ni.com>, Terry Wilcox <terry.wilcox@ni.com>,
 Gratian Crisan <gratian.crisan@ni.com>, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
Date: Mon, 26 Jun 2017 13:19:46 +0200
Message-Id: <20170626111947.17092-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Creating an xattr is an independent journal transaction and the xattr
code assumes that there is always a valid host inode present when a new
xattr is created. This assumption is not correct for LSM and now
fscrypt, for these users UBIFS creates the xattr before the host inode
is created and visible to the user. Since these are two journal
transactions it can happen that due to a power-cut only the xattr is
present but not the host inode nor the directory entry for it. As result
of this UBIFS will lose free space and can run out of space at some
time.
It is also not possible to create the xattr after the host inode because
this would violate LSM and fscrypt model. After a power-cut we could end
up with a inode without security context.

This is an intermediate fix that can go into -stable, as long term
solution we have to make sure that creating the xattr and the host inode
is a single journal transaction. But to achieve this the journal code
need some rework first.

Cc: Subodh Nijsure <snijsure@grid-net.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Ben Shelton <ben.shelton@ni.com>
Cc: Brad Mouring <brad.mouring@ni.com>
Cc: Terry Wilcox <terry.wilcox@ni.com>
Cc: Gratian Crisan <gratian.crisan@ni.com>
Cc: stable@vger.kernel.org
Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/replay.c | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index ae5c02f22f3e..58a3d10f3191 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -290,6 +290,85 @@ static int replay_entries_cmp(void *priv, struct list_head *a,
 	return -1;
 }
 
+static void inspect_xattr_nodes(struct ubifs_info *c, struct replay_entry *pos)
+{
+	int n, found;
+	struct ubifs_znode *znode;
+	struct replay_entry *r, *r1, *r2, *r3;
+
+	r1 = pos;
+
+	/* Don't wrap around. */
+	if (list_is_last(&r1->list, &c->replay_list))
+		return;
+
+	r2 = list_next_entry(r1, list);
+
+	if (list_is_last(&r2->list, &c->replay_list))
+		return;
+
+	r3 = list_next_entry(r2, list);
+
+	if (key_type(c, &r2->key) != UBIFS_INO_KEY) {
+		/* We always write a xent node, followed by two ino nodes. */
+		ubifs_err(c, "Expected ino node, got: %i", key_type(c, &r2->key));
+		return;
+	}
+
+	if (key_type(c, &r3->key) != UBIFS_INO_KEY) {
+		/* We always write a xent node, followed by two ino nodes. */
+		ubifs_err(c, "Expected ino node, got: %i", key_type(c, &r3->key));
+		return;
+	}
+
+	/*
+	 * If the replay list container another reference to the host inode, @r3,
+	 * we can assume that the xattr is not orphaned.
+	 */
+	list_for_each_entry(r, &c->replay_list, list) {
+		if (key_type(c, &r->key) == UBIFS_INO_KEY &&
+		    key_inum(c, &r->key) == key_inum(c, &r3->key) &&
+		    r->sqnum != r3->sqnum)
+			return;
+	}
+
+	/*
+	 * Also make sure that the TNC does not know the host inode.
+	 */
+	found = ubifs_lookup_level0(c, &r3->key, &znode, &n);
+	if (found)
+		return;
+
+	/* The xattr is really an orphan, mark all three nodes for deletion. */
+	r1->deletion = 1;
+	r2->deletion = 1;
+	r3->deletion = 1;
+}
+
+/**
+ * kill_orphan_xattrs - search and kill orphaned xattr nodes.
+ * @c: UBIFS file-system description object
+ *
+ * Creating a xattr is an independent journal transaction and the xattr
+ * code assumes that there is always a valid host inode present when a
+ * new xattr is created.
+ * This assumption is not correct for LSM and fscrypt, for these users
+ * UBIFS creates the xattr before the host inode is created and visible to
+ * the user. Since these are two journal transactions it can happen that
+ * due to a power-cut only the xattr is present but not the host inode
+ * nor a directory entry for it. To deal with that problem we have to
+ * scan the replay list for such orphans and kill them.
+ */
+static void kill_orphan_xattrs(struct ubifs_info *c)
+{
+	struct replay_entry *r;
+
+	list_for_each_entry(r, &c->replay_list, list) {
+		if (!r->deletion && key_type(c, &r->key) == UBIFS_XENT_KEY)
+			inspect_xattr_nodes(c, r);
+	}
+}
+
 /**
  * apply_replay_list - apply the replay list to the TNC.
  * @c: UBIFS file-system description object
@@ -304,6 +383,8 @@ static int apply_replay_list(struct ubifs_info *c)
 
 	list_sort(c, &c->replay_list, &replay_entries_cmp);
 
+	kill_orphan_xattrs(c);
+
 	list_for_each_entry(r, &c->replay_list, list) {
 		cond_resched();
 
-- 
2.12.3
