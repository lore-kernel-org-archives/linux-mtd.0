Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyG2M-0002Cq-Io
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2018 12:39:02 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: David Gstir <david@sigma-star.at>, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 23/25] ubifs: do not update inode size in-place in
 authenticated mode
Date: Fri,  7 Sep 2018 14:36:44 +0200
Message-Id: <20180907123646.12688-24-s.hauer@pengutronix.de>
In-Reply-To: <20180907123646.12688-1-s.hauer@pengutronix.de>
References: <20180907123646.12688-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In authenticated mode we cannot fixup the inode sizes in-place
during recovery as this would invalidate the hashes and HMACs
we stored for this inode.

Instead, we just write the updated inodes to the journal. We can
only do this after ubifs_rcvry_gc_commit() is done though, so for
authenticated mode call ubifs_recover_size() after
ubifs_rcvry_gc_commit() and not vice versa as normally done.

Calling ubifs_recover_size() after ubifs_rcvry_gc_commit() has the
drawback that after a commit the size fixup information is gone, so
when a powercut happens while recovering from another powercut
we may lose some data written right before the first powercut.
This is why we only do this in authenticated mode and leave the
behaviour for unauthenticated mode untouched.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/recovery.c | 111 +++++++++++++++++++++++++++++++++-----------
 fs/ubifs/super.c    |  38 +++++++++++----
 fs/ubifs/ubifs.h    |   2 +-
 3 files changed, 113 insertions(+), 38 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 5c1334e6bc81..8526b7ec4707 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1462,16 +1462,82 @@ static int fix_size_in_place(struct ubifs_info *c, struct size_entry *e)
 	return err;
 }
 
+/**
+ * inode_fix_size - fix inode size
+ * @c: UBIFS file-system description object
+ * @e: inode size information for recovery
+ */
+static int inode_fix_size(struct ubifs_info *c, struct size_entry *e)
+{
+	struct inode *inode;
+	struct ubifs_inode *ui;
+	int err;
+
+	if (c->ro_mount)
+		ubifs_assert(c, !e->inode);
+
+	if (e->inode) {
+		/* Remounting rw, pick up inode we stored earlier */
+		inode = e->inode;
+	} else {
+		inode = ubifs_iget(c->vfs_sb, e->inum);
+		if (IS_ERR(inode))
+			return PTR_ERR(inode);
+
+		if (inode->i_size >= e->d_size) {
+			/*
+			 * The original inode in the index already has a size
+			 * big enough, nothing to do
+			 */
+			iput(inode);
+			return 0;
+		}
+
+		dbg_rcvry("ino %lu size %lld -> %lld",
+			  (unsigned long)e->inum,
+			  inode->i_size, e->d_size);
+
+		ui = ubifs_inode(inode);
+
+		inode->i_size = e->d_size;
+		ui->ui_size = e->d_size;
+		ui->synced_i_size = e->d_size;
+
+		e->inode = inode;
+	}
+
+	/*
+	 * In readonly mode just keep the inode pinned in memory until we go
+	 * readwrite. In readwrite mode write the inode to the journal with the
+	 * fixed size.
+	 */
+	if (c->ro_mount)
+		return 0;
+
+	err = ubifs_jnl_write_inode(c, inode);
+
+	iput(inode);
+
+	if (err)
+		return err;
+
+	rb_erase(&e->rb, &c->size_tree);
+	kfree(e);
+
+	return 0;
+}
+
 /**
  * ubifs_recover_size - recover inode size.
  * @c: UBIFS file-system description object
+ * @in_place: If true, do a in-place size fixup
  *
  * This function attempts to fix inode size discrepancies identified by the
  * 'ubifs_recover_size_accum()' function.
  *
  * This functions returns %0 on success and a negative error code on failure.
  */
-int ubifs_recover_size(struct ubifs_info *c)
+int ubifs_recover_size(struct ubifs_info *c, bool in_place)
 {
 	struct rb_node *this = rb_first(&c->size_tree);
 
@@ -1480,6 +1546,9 @@ int ubifs_recover_size(struct ubifs_info *c)
 		int err;
 
 		e = rb_entry(this, struct size_entry, rb);
+
+		this = rb_next(this);
+
 		if (!e->exists) {
 			union ubifs_key key;
 
@@ -1503,40 +1572,26 @@ int ubifs_recover_size(struct ubifs_info *c)
 		}
 
 		if (e->exists && e->i_size < e->d_size) {
-			if (c->ro_mount) {
-				/* Fix the inode size and pin it in memory */
-				struct inode *inode;
-				struct ubifs_inode *ui;
-
-				ubifs_assert(c, !e->inode);
-
-				inode = ubifs_iget(c->vfs_sb, e->inum);
-				if (IS_ERR(inode))
-					return PTR_ERR(inode);
-
-				ui = ubifs_inode(inode);
-				if (inode->i_size < e->d_size) {
-					dbg_rcvry("ino %lu size %lld -> %lld",
-						  (unsigned long)e->inum,
-						  inode->i_size, e->d_size);
-					inode->i_size = e->d_size;
-					ui->ui_size = e->d_size;
-					ui->synced_i_size = e->d_size;
-					e->inode = inode;
-					this = rb_next(this);
-					continue;
-				}
-				iput(inode);
-			} else {
-				/* Fix the size in place */
+			ubifs_assert(c, !(c->ro_mount && in_place));
+
+			/*
+			 * We found data that is outside the found inode size,
+			 * fixup the inode size
+			 */
+
+			if (in_place) {
 				err = fix_size_in_place(c, e);
 				if (err)
 					return err;
 				iput(e->inode);
+			} else {
+				err = inode_fix_size(c, e);
+				if (err)
+					return err;
+				continue;
 			}
 		}
 
-		this = rb_next(this);
 		rb_erase(&e->rb, &c->size_tree);
 		kfree(e);
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 46d0d375cf8d..12683cb87315 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1378,12 +1378,21 @@ static int mount_ubifs(struct ubifs_info *c)
 		}
 
 		if (c->need_recovery) {
-			err = ubifs_recover_size(c);
-			if (err)
-				goto out_orphans;
+			if (!ubifs_authenticated(c)) {
+				err = ubifs_recover_size(c, true);
+				if (err)
+					goto out_orphans;
+			}
+
 			err = ubifs_rcvry_gc_commit(c);
 			if (err)
 				goto out_orphans;
+
+			if (ubifs_authenticated(c)) {
+				err = ubifs_recover_size(c, false);
+				if (err)
+					goto out_orphans;
+			}
 		} else {
 			err = take_gc_lnum(c);
 			if (err)
@@ -1402,7 +1411,7 @@ static int mount_ubifs(struct ubifs_info *c)
 		if (err)
 			goto out_orphans;
 	} else if (c->need_recovery) {
-		err = ubifs_recover_size(c);
+		err = ubifs_recover_size(c, false);
 		if (err)
 			goto out_orphans;
 	} else {
@@ -1629,9 +1638,11 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		err = ubifs_write_rcvrd_mst_node(c);
 		if (err)
 			goto out;
-		err = ubifs_recover_size(c);
-		if (err)
-			goto out;
+		if (!ubifs_authenticated(c)) {
+			err = ubifs_recover_size(c, true);
+			if (err)
+				goto out;
+		}
 		err = ubifs_clean_lebs(c, c->sbuf);
 		if (err)
 			goto out;
@@ -1697,10 +1708,19 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 			goto out;
 	}
 
-	if (c->need_recovery)
+	if (c->need_recovery) {
 		err = ubifs_rcvry_gc_commit(c);
-	else
+		if (err)
+			goto out;
+
+		if (ubifs_authenticated(c)) {
+			err = ubifs_recover_size(c, false);
+			if (err)
+				goto out;
+		}
+	} else {
 		err = ubifs_leb_unmap(c, c->gc_lnum);
+	}
 	if (err)
 		goto out;
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 504b651b78f1..38401adaa00d 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2050,7 +2050,7 @@ int ubifs_clean_lebs(struct ubifs_info *c, void *sbuf);
 int ubifs_rcvry_gc_commit(struct ubifs_info *c);
 int ubifs_recover_size_accum(struct ubifs_info *c, union ubifs_key *key,
 			     int deletion, loff_t new_size);
-int ubifs_recover_size(struct ubifs_info *c);
+int ubifs_recover_size(struct ubifs_info *c, bool in_place);
 void ubifs_destroy_size_tree(struct ubifs_info *c);
 
 /* ioctl.c */
-- 
2.18.0
