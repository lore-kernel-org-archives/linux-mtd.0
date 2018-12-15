Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYB8A-0007Yw-WD
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 14:41:29 +0000
From: Richard Weinberger <richard@nod.at>
To: Hou Tao <houtao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [bug report] Got "read_pnode: error -22 reading pnode" during
 ubifs mount
Date: Sat, 15 Dec 2018 15:41:12 +0100
Message-ID: <1744858.UbCnKIVnxf@blindfold>
In-Reply-To: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
References: <402695c6-7ba9-abe9-4ccd-ea598ea2511e@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2915621.OuIZ6mvAqq"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--nextPart2915621.OuIZ6mvAqq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Tao,

Am Samstag, 15. Dezember 2018, 13:28:12 CET schrieb Hou Tao:
> We had encountered an ubi-fs mount failure during our repeated power-cut tests,
> and the failure was caused by an invalid pnode during commit:
> 
> <5>[   25.557349]UBI: attaching mtd9 to ubi2
> <5>[   28.835135]UBI: scanning is finished
> <5>[   28.894720]UBI: attached mtd9 (name "system", size 415 MiB) to ubi2
> <5>[   28.894754]UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
> <5>[   28.894771]UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
> <5>[   28.894784]UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
> <5>[   28.894798]UBI: good PEBs: 3320, bad PEBs: 0, corrupted PEBs: 0
> <5>[   28.894811]UBI: user volume: 1, internal volumes: 1, max. volumes count: 128
> <5>[   28.894827]UBI: max/mean erase counter: 1528/269, WL threshold: 4096, image sequence number: 1247603810
> <5>[   28.894843]UBI: available PEBs: 0, total reserved PEBs: 3320, PEBs reserved for bad PEB handling: 65
> <5>[   28.895130]UBI: background thread "ubi_bgt2d" started, PID 2056
> <5>[   29.033842]UBIFS: background thread "ubifs_bgt2_0" started, PID 2066
> <5>[   29.056907]UBIFS: recovery needed
> <3>[   29.477167]UBIFS error (pid 2064): read_pnode: error -22 reading pnode at 12:34909
> <3>[   29.477201](pid 2064) dumping pnode:
> <3>[   29.477220]	address ddd75840 parent ddc43a80 cnext 0
> <3>[   29.477234]	flags 0 iip 0 level 0 num 0
> <3>[   29.477248]	0: free 0 dirty 2656 flags 1 lnum 0
> <3>[   29.477263]	1: free 0 dirty 127304 flags 1 lnum 0

The dirty counter is larger than LEB size. :-(
So, your LPT is inconsistent.

> The problem is hard to reproduce and we are still trying.  As showed in the
> above dmesg, the version of our kernel is v3.10.53, but the problem also
> had been occurred on board using v4.1.

This sounds a lot like the xattr issue I've hunting down for some time now.
The issue is very hard to reproduce and it took a long time for me to understand
what is going on.

Can you please check whether the filesystem has xattr nodes?
Please note that xattrs can be used for many reasons, including SELinux, SMACK,
fscrypt, file capabilities, journald, ...

In doubt, try to reproduce with 7e5471ce6dba5f28a3c7afdfe168655d236f677b applied
and disable UBIFS xattr support completely.

> It seems there is no easy way to fix or circumvent the problem (e.g. fsck.ubifs),
> so does anyone or any-organization have a plan to implement fsck.ubifs ?

The thing is, a fsck.ubifs cannot recover a failed filesystem (failed due to a bug).
It may be able to bring it back in a mountable shape but user data will be lost
in any case.
In your case, the corrupt LPT is not the root cause, recreating it from scratch
will not solve anything.

> We have checked ubifs_change_lp() and found it doesn't check whether or not
> the new free space or dirty space is less the leb_size, and we will add these
> checks during reproduction first.
> 
> So any direction or suggestion for the reproduction & the solution ?

If you are using xattrs, please give the attached patch series a try.
This is my current work.

Patchs 1/4 and 2/4 fix the xattr problem. 3/4 and 4/4 enforce new rules
for xattrs. Before that, UBIFS supported up to 2^16 xattrs per inode and tried
to be smart. It assumed that upon journal replay it can lookup the position of
all xattr inodes from the TNC. Since these TNC entries can get garbage collected
in the mean while, it fails to find them and the free-space accounting (LPT)
goes nuts.

One solution is to insert xattr inodes also to the journal.
Hence the number of xattrs is now stricter limited.
On a typical NAND still more than 100...
I plan also to add a new xattr-deltion-inode to support deleting xattr inodes
in bulk, but this needs changes to the on-disk format.

One open question is, what to do with UBIFS filesystem which have already more xattrs
per inode than the new limit allows?
I tend to claim that nobody runs such an UBIFS for a single reason, such an user
would face the xattrs bug much more likely and lose all his data.  
Filesystems like ext4 also support not that many xattrs.

Thanks,
//richard
--nextPart2915621.OuIZ6mvAqq
Content-Disposition: attachment; filename="0002-ubifs-Orphan-xattr-inodes-too.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0002-ubifs-Orphan-xattr-inodes-too.patch"

>From 800504ab32825983b7e87d58a89039beab4b7b2d Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Sat, 15 Dec 2018 14:44:21 +0100
Subject: [PATCH 2/4] ubifs: Orphan xattr inodes too

WIP

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/orphan.c | 208 ++++++++++++++++++++++++++++++++++++------------------
 fs/ubifs/ubifs.h  |   3 +
 2 files changed, 144 insertions(+), 67 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 8f70494efb0c..2f1618f300fb 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -54,30 +54,24 @@
 
 static int dbg_check_orphans(struct ubifs_info *c);
 
-/**
- * ubifs_add_orphan - add an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * Add an orphan. This function is called when an inodes link count drops to
- * zero.
- */
-int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
+static struct ubifs_orphan *orphan_add(struct ubifs_info *c, ino_t inum,
+				       struct ubifs_orphan *parent_orphan)
 {
 	struct ubifs_orphan *orphan, *o;
 	struct rb_node **p, *parent = NULL;
 
 	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_NOFS);
 	if (!orphan)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 	orphan->inum = inum;
 	orphan->new = 1;
+	INIT_LIST_HEAD(&orphan->child_list);
 
 	spin_lock(&c->orphan_lock);
 	if (c->tot_orphans >= c->max_orphans) {
 		spin_unlock(&c->orphan_lock);
 		kfree(orphan);
-		return -ENFILE;
+		return ERR_PTR(-ENFILE);
 	}
 	p = &c->orph_tree.rb_node;
 	while (*p) {
@@ -91,7 +85,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 			ubifs_err(c, "orphaned twice");
 			spin_unlock(&c->orphan_lock);
 			kfree(orphan);
-			return 0;
+			return ERR_PTR(-EINVAL);
 		}
 	}
 	c->tot_orphans += 1;
@@ -100,24 +94,22 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 	rb_insert_color(&orphan->rb, &c->orph_tree);
 	list_add_tail(&orphan->list, &c->orph_list);
 	list_add_tail(&orphan->new_list, &c->orph_new);
+
+	if (parent_orphan) {
+		list_add_tail(&orphan->child_list,
+			      &parent_orphan->child_list);
+	}
+
 	spin_unlock(&c->orphan_lock);
 	dbg_gen("ino %lu", (unsigned long)inum);
-	return 0;
+	return orphan;
 }
 
-/**
- * ubifs_delete_orphan - delete an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * Delete an orphan. This function is called when an inode is deleted.
- */
-void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
+static struct ubifs_orphan *lookup_orphan(struct ubifs_info *c, ino_t inum)
 {
 	struct ubifs_orphan *o;
 	struct rb_node *p;
 
-	spin_lock(&c->orphan_lock);
 	p = c->orph_tree.rb_node;
 	while (p) {
 		o = rb_entry(p, struct ubifs_orphan, rb);
@@ -126,37 +118,124 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 		else if (inum > o->inum)
 			p = p->rb_right;
 		else {
-			if (o->del) {
-				spin_unlock(&c->orphan_lock);
-				dbg_gen("deleted twice ino %lu",
-					(unsigned long)inum);
-				return;
-			}
-			if (o->cmt) {
-				o->del = 1;
-				o->dnext = c->orph_dnext;
-				c->orph_dnext = o;
-				spin_unlock(&c->orphan_lock);
-				dbg_gen("delete later ino %lu",
-					(unsigned long)inum);
-				return;
-			}
-			rb_erase(p, &c->orph_tree);
-			list_del(&o->list);
-			c->tot_orphans -= 1;
-			if (o->new) {
-				list_del(&o->new_list);
-				c->new_orphans -= 1;
-			}
-			spin_unlock(&c->orphan_lock);
-			kfree(o);
-			dbg_gen("inum %lu", (unsigned long)inum);
-			return;
+			return o;
 		}
 	}
+	return NULL;
+}
+
+static void __orphan_drop(struct ubifs_info *c, struct ubifs_orphan *o)
+{
+	rb_erase(&o->rb, &c->orph_tree);
+	list_del(&o->list);
+	c->tot_orphans -= 1;
+
+	if (o->new) {
+		list_del(&o->new_list);
+		c->new_orphans -= 1;
+	}
+
+	kfree(o);
+}
+
+static void orphan_delete(struct ubifs_info *c, ino_t inum)
+{
+	struct ubifs_orphan *orph, *child_orph, *tmp_o;
+
+	spin_lock(&c->orphan_lock);
+
+	orph = lookup_orphan(c, inum);
+	if (!orph) {
+		spin_unlock(&c->orphan_lock);
+		ubifs_err(c, "missing orphan ino %lu", (unsigned long)inum);
+		dump_stack();
+
+		return;
+	}
+
+	if (orph->del) {
+		spin_unlock(&c->orphan_lock);
+		dbg_gen("deleted twice ino %lu",
+			(unsigned long)inum);
+		return;
+	}
+
+	if (orph->cmt) {
+		orph->del = 1;
+		orph->dnext = c->orph_dnext;
+		c->orph_dnext = orph;
+		spin_unlock(&c->orphan_lock);
+		dbg_gen("delete later ino %lu",
+			(unsigned long)inum);
+		return;
+	}
+
+	list_for_each_entry_safe(child_orph, tmp_o, &orph->child_list, child_list) {
+		list_del(&child_orph->child_list);
+		__orphan_drop(c, child_orph);
+	}
+
+	__orphan_drop(c, orph);
+
 	spin_unlock(&c->orphan_lock);
-	ubifs_err(c, "missing orphan ino %lu", (unsigned long)inum);
-	dump_stack();
+}
+
+/**
+ * ubifs_add_orphan - add an orphan.
+ * @c: UBIFS file-system description object
+ * @inum: orphan inode number
+ *
+ * Add an orphan. This function is called when an inodes link count drops to
+ * zero.
+ */
+int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
+{
+	int err = 0;
+	ino_t xattr_inum;
+	union ubifs_key key;
+	struct ubifs_dent_node *xent;
+	struct fscrypt_name nm = {0};
+	struct ubifs_orphan *xattr_orphan;
+	struct ubifs_orphan *orphan;
+
+	orphan = orphan_add(c, inum, NULL);
+	if (IS_ERR(orphan))
+		return PTR_ERR(orphan);
+
+	lowest_xent_key(c, &key, inum);
+	while (1) {
+		xent = ubifs_tnc_next_ent(c, &key, &nm);
+		if (IS_ERR(xent)) {
+			err = PTR_ERR(xent);
+			if (err == -ENOENT)
+				break;
+			return err;
+		}
+
+		fname_name(&nm) = xent->name;
+		fname_len(&nm) = le16_to_cpu(xent->nlen);
+		xattr_inum = le64_to_cpu(xent->inum);
+
+		xattr_orphan = orphan_add(c, xattr_inum, orphan);
+		if (IS_ERR(xattr_orphan))
+			return PTR_ERR(xattr_orphan);
+
+		key_read(c, &xent->key, &key);
+	}
+
+	return 0;
+}
+
+/**
+ * ubifs_delete_orphan - delete an orphan.
+ * @c: UBIFS file-system description object
+ * @inum: orphan inode number
+ *
+ * Delete an orphan. This function is called when an inode is deleted.
+ */
+void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
+{
+	orphan_delete(c, inum);
 }
 
 /**
@@ -611,10 +690,16 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
 
 		n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
 		for (i = 0; i < n; i++) {
+			union ubifs_key key1, key2;
+
 			inum = le64_to_cpu(orph->inos[i]);
 			dbg_rcvry("deleting orphaned inode %lu",
 				  (unsigned long)inum);
-			err = ubifs_tnc_remove_ino(c, inum);
+
+			lowest_ino_key(c, &key1, inum);
+			highest_ino_key(c, &key2, inum);
+
+			err = ubifs_tnc_remove_range(c, &key1, &key2);
 			if (err)
 				return err;
 			err = insert_dead_orphan(c, inum);
@@ -744,26 +829,15 @@ struct check_info {
 	struct rb_root root;
 };
 
-static int dbg_find_orphan(struct ubifs_info *c, ino_t inum)
+static bool dbg_find_orphan(struct ubifs_info *c, ino_t inum)
 {
-	struct ubifs_orphan *o;
-	struct rb_node *p;
+	bool found = false;
 
 	spin_lock(&c->orphan_lock);
-	p = c->orph_tree.rb_node;
-	while (p) {
-		o = rb_entry(p, struct ubifs_orphan, rb);
-		if (inum < o->inum)
-			p = p->rb_left;
-		else if (inum > o->inum)
-			p = p->rb_right;
-		else {
-			spin_unlock(&c->orphan_lock);
-			return 1;
-		}
-	}
+	found = !!lookup_orphan(c, inum);
 	spin_unlock(&c->orphan_lock);
-	return 0;
+
+	return found;
 }
 
 static int dbg_ins_check_orphan(struct rb_root *root, ino_t inum)
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 4368cde476b0..26484218d953 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -904,6 +904,8 @@ struct ubifs_budget_req {
  * @rb: rb-tree node of rb-tree of orphans sorted by inode number
  * @list: list head of list of orphans in order added
  * @new_list: list head of list of orphans added since the last commit
+ * @child_list: list of xattr childs if this orphan hosts xattrs, list head
+ * if this orphan is a xattr, not used otherwise.
  * @cnext: next orphan to commit
  * @dnext: next orphan to delete
  * @inum: inode number
@@ -915,6 +917,7 @@ struct ubifs_orphan {
 	struct rb_node rb;
 	struct list_head list;
 	struct list_head new_list;
+	struct list_head child_list;
 	struct ubifs_orphan *cnext;
 	struct ubifs_orphan *dnext;
 	ino_t inum;
-- 
2.16.4


--nextPart2915621.OuIZ6mvAqq
Content-Disposition: attachment; filename="0001-ubifs-Add-xattr-inodes-to-journal-upon-unlink.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-ubifs-Add-xattr-inodes-to-journal-upon-unlink.patch"

>From 89032141591a142da5b9daa6e345cf73e93812ed Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Sat, 15 Dec 2018 14:43:30 +0100
Subject: [PATCH 1/4] ubifs: Add xattr inodes to journal upon unlink

WIP

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 66 +++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 802565a17733..b5dd3c1e6eb2 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -806,9 +806,12 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 {
 	int err, lnum, offs;
-	struct ubifs_ino_node *ino;
+	struct ubifs_ino_node *ino, *ino_start;
 	struct ubifs_inode *ui = ubifs_inode(inode);
-	int sync = 0, len = UBIFS_INO_NODE_SZ, last_reference = !inode->i_nlink;
+	int sync = 0, last_reference = !inode->i_nlink;
+	int kill_xattrs = ui->xattr_cnt && last_reference;
+	int host_ino_len = UBIFS_INO_NODE_SZ;
+	int alloc_len = UBIFS_INO_NODE_SZ;
 
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
@@ -817,22 +820,62 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	 * need to synchronize the write-buffer either.
 	 */
 	if (!last_reference) {
-		len += ui->data_len;
+		host_ino_len += ui->data_len;
+		alloc_len = host_ino_len;
 		sync = IS_SYNC(inode);
+	} else if (kill_xattrs) {
+		alloc_len += UBIFS_INO_NODE_SZ * ui->xattr_cnt;
 	}
-	ino = kmalloc(len, GFP_NOFS);
+
+	ino_start = ino = kmalloc(alloc_len, GFP_NOFS);
 	if (!ino)
 		return -ENOMEM;
 
 	/* Make reservation before allocating sequence numbers */
-	err = make_reservation(c, BASEHD, len);
+	err = make_reservation(c, BASEHD, alloc_len);
 	if (err)
 		goto out_free;
 
+	if (kill_xattrs) {
+		union ubifs_key key;
+		struct fscrypt_name nm = {0};
+		struct inode *xino;
+		struct ubifs_dent_node *xent, *pxent = NULL;
+
+		lowest_xent_key(c, &key, inode->i_ino);
+		while (1) {
+			xent = ubifs_tnc_next_ent(c, &key, &nm);
+			if (IS_ERR(xent)) {
+				err = PTR_ERR(xent);
+				if (err == -ENOENT)
+					break;
+
+				goto out_release;
+			}
+
+			fname_name(&nm) = xent->name;
+			fname_len(&nm) = le16_to_cpu(xent->nlen);
+
+			xino = ubifs_iget(c->vfs_sb, xent->inum);
+			ubifs_assert(c, ubifs_inode(xino)->xattr);
+
+			clear_nlink(xino);
+			pack_inode(c, ino, xino, 0);
+			ino = (void *)ino + UBIFS_INO_NODE_SZ;
+			iput(xino);
+
+			kfree(pxent);
+			pxent = xent;
+			key_read(c, &xent->key, &key);
+		}
+		kfree(pxent);
+	}
+
 	pack_inode(c, ino, inode, 1);
-	err = write_head(c, BASEHD, ino, len, &lnum, &offs, sync);
+	err = write_head(c, BASEHD, ino_start, alloc_len, &lnum, &offs, sync);
 	if (err)
 		goto out_release;
+
 	if (!sync)
 		ubifs_wbuf_add_ino_nolock(&c->jheads[BASEHD].wbuf,
 					  inode->i_ino);
@@ -843,12 +886,12 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		if (err)
 			goto out_ro;
 		ubifs_delete_orphan(c, inode->i_ino);
-		err = ubifs_add_dirt(c, lnum, len);
+		err = ubifs_add_dirt(c, lnum, alloc_len);
 	} else {
 		union ubifs_key key;
 
 		ino_key_init(c, &key, inode->i_ino);
-		err = ubifs_tnc_add(c, &key, lnum, offs, len);
+		err = ubifs_tnc_add(c, &key, lnum, offs, host_ino_len);
 	}
 	if (err)
 		goto out_ro;
@@ -857,7 +900,8 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	spin_lock(&ui->ui_lock);
 	ui->synced_i_size = ui->ui_size;
 	spin_unlock(&ui->ui_lock);
-	kfree(ino);
+	kfree(ino_start);
+
 	return 0;
 
 out_release:
@@ -866,7 +910,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	ubifs_ro_mode(c, err);
 	finish_reservation(c);
 out_free:
-	kfree(ino);
+	kfree(ino_start);
 	return err;
 }
 
@@ -906,7 +950,7 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c, const struct inode *inode)
 
 	ubifs_assert(c, inode->i_nlink == 0);
 
-	if (ui->del_cmtno != c->cmt_no)
+	if (ui->xattr_cnt || ui->del_cmtno != c->cmt_no)
 		/* A commit happened for sure */
 		return ubifs_jnl_write_inode(c, inode);
 
-- 
2.16.4


--nextPart2915621.OuIZ6mvAqq
Content-Disposition: attachment; filename="0003-RFC-ubifs-Limit-number-of-xattrs-per-inode.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0003-RFC-ubifs-Limit-number-of-xattrs-per-inode.patch"

>From fd8df4ad187c447dfef8e1f836a37bb90c1c0062 Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Sat, 15 Dec 2018 14:47:03 +0100
Subject: [PATCH 3/4] [RFC] ubifs: Limit number of xattrs per inode

Since we have to write one deletion inode per xattr
into the journal, limit the max number of xattrs.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/misc.h  | 8 ++++++++
 fs/ubifs/super.c | 2 ++
 fs/ubifs/xattr.c | 8 +-------
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/misc.h b/fs/ubifs/misc.h
index 21d35d7dd975..dbdb66d1eddd 100644
--- a/fs/ubifs/misc.h
+++ b/fs/ubifs/misc.h
@@ -287,6 +287,14 @@ static inline int ubifs_next_log_lnum(const struct ubifs_info *c, int lnum)
 	return lnum;
 }
 
+static inline int ubifs_xattr_max_cnt(struct ubifs_info *c)
+{
+	int max_xattrs = (c->leb_size / 2) / UBIFS_INO_NODE_SZ;
+
+	ubifs_assert(c, max_xattrs < c->max_orphans);
+	return max_xattrs;
+}
+
 const char *ubifs_assert_action_name(struct ubifs_info *c);
 
 #endif /* __UBIFS_MISC_H__ */
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 23e7042666a7..0ab126f8aeef 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1499,6 +1499,8 @@ static int mount_ubifs(struct ubifs_info *c)
 		c->bud_bytes, c->bud_bytes >> 10, c->bud_bytes >> 20);
 	dbg_gen("max. seq. number:    %llu", c->max_sqnum);
 	dbg_gen("commit number:       %llu", c->cmt_no);
+	dbg_gen("max. xattrs per inode: %d", ubifs_xattr_max_cnt(c));
+	dbg_gen("max orphans:           %d", c->max_orphans);
 
 	return 0;
 
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 61afdfee4b28..d961f648c5bf 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -60,12 +60,6 @@
 #include <linux/slab.h>
 #include <linux/xattr.h>
 
-/*
- * Limit the number of extended attributes per inode so that the total size
- * (@xattr_size) is guaranteeded to fit in an 'unsigned int'.
- */
-#define MAX_XATTRS_PER_INODE 65535
-
 /*
  * Extended attribute type constants.
  *
@@ -106,7 +100,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 				.new_ino_d = ALIGN(size, 8), .dirtied_ino = 1,
 				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
 
-	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
+	if (host_ui->xattr_cnt >= ubifs_xattr_max_cnt(c)) {
 		ubifs_err(c, "inode %lu already has too many xattrs (%d), cannot create more",
 			  host->i_ino, host_ui->xattr_cnt);
 		return -ENOSPC;
-- 
2.16.4


--nextPart2915621.OuIZ6mvAqq
Content-Disposition: attachment; filename="0004-RFC-ubifs-Refuse-to-unlink-inode-with-too-many-xattr.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0004-RFC-ubifs-Refuse-to-unlink-inode-with-too-many-xattr.patch"

>From 9465bbaf9b97643b1fb1a8216a0595f613ee9c0f Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Sat, 15 Dec 2018 14:39:37 +0100
Subject: [PATCH 4/4] [RFC] ubifs: Refuse to unlink inode with too many xattrs

WIP

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index b5dd3c1e6eb2..3ac2367eec40 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -842,6 +842,11 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct inode *xino;
 		struct ubifs_dent_node *xent, *pxent = NULL;
 
+		if (ui->xattr_cnt >= ubifs_xattr_max_cnt(c)) {
+			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+			goto out_release;
+		}
+
 		lowest_xent_key(c, &key, inode->i_ino);
 		while (1) {
 			xent = ubifs_tnc_next_ent(c, &key, &nm);
-- 
2.16.4


--nextPart2915621.OuIZ6mvAqq--
