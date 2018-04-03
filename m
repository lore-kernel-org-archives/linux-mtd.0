Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3TTl-0002hD-E8
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2018 21:28:36 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Frank Erdrich <frank@erdrich.net>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
Date: Tue, 03 Apr 2018 23:28:15 +0200
Message-ID: <4391036.Fuyg1DPom3@blindfold>
In-Reply-To: <c3a2d38b-a789-81e6-bf3f-7a573778a054@erdrich.net>
References: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
 <s1l9q5oc97q87j6d75pkp49b.1522781343251@email.android.com>
 <c3a2d38b-a789-81e6-bf3f-7a573778a054@erdrich.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1522806096.clpQZ2rrax"
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

--nextPart1522806096.clpQZ2rrax
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Frank,

Am Dienstag, 3. April 2018, 22:26:32 CEST schrieb Frank Erdrich:
> Hello Richard,
> 
> thanks for your quick response. And sorry for writing from another 
> Mail-account, I hope that will not break the thread. Our setup at work 
> is a little bit weird and I need an admin to send messages to a mailing 
> list (disclaimer removal and stuff like that).

:-)
 
> > Frank,
> > 
> > On Tue, Apr 3, 2018 at 10:28 AM, Erdrich, Frank
> > <Frank.Erdrich@emtrion.de> wrote:
> >  > Hello,
> >  >
> >  > we are encountering an error on UBIFS that prevents mounting of a 
> > partition. Maybe one of you can tell me the directly the reason for that 
> > or can help me hunting this error down.
> > 
> > UBIFS got confused wrt. free space accounting.
> > Can you tell me more on your setup? Do you use Fastmap? fscrypt? xattr?
> 
> We use only extended attributes. fastmap and fscrypt are not used. That 
> are the kernel options we have set:
> 
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
> CONFIG_UBIFS_FS=y
> CONFIG_UBIFS_FS_ADVANCED_COMPR=y
> CONFIG_UBIFS_FS_LZO=y
> CONFIG_UBIFS_FS_ZLIB=y
> # CONFIG_UBIFS_ATIME_SUPPORT is not set

Good.

> The Flash itself is divided into three mtd partitions to get some sort 
> of separation of critical data against other data. The partition that 
> shows that error is a logging partition which is, of course, written on 
> a regular base. We are not using the sync mount option at the moment. 
> Writeback timers (for dirty data) are on default value.

Side note: Having multiple UBI instances on the same MTD is not a good idea.
Usually you want the wear leveling domain as large as possible.

> >  > I'm not deep enough in the ubifs system to completely understand what 
> > is happening here but for me it seems that there are more dirty data to 
> > write than the size of the LEB.
> >  > -> 3: free 507904 dirty 524128 flags 34 lnum 0
> >  > I've seen that the values are checked in validate_pnode() where the 
> > -EINVAL (-22) comes from. The question is, how can dirty data bigger 
> > that the LEB size?
> > 
> > Yes, this can happen. That's why UBIFS does in some cases a fixup of
> > the used/free numbers.
> > These numbers are not always updated immediately and when a power-cut
> > happens their state might be inconsistent.
> 
> I'm totally fine with that behaviour as a power-cut can happen anytime 
> in an embedded system but I would assume that the ubifs-recovery would 
> bring back the system to a operable state. Or is there an error in my 
> reasoning?

Of course UBIFS should be able to recover.
I suspect a very subtle but in UBIFS' xattr code.
Other bug reports point in that direction too.

Sadly so far I was not able to pinpoint the exact issue.
Therefore I started to review the code. So far I've found some odds but
I'm not 100% sure whether these cause the trouble you see.

> Please let me know if you need more information or if I should do 
> special testing.

Can you reproduce the issue?
If so, please retry with the attached patches.
They will not fix your already broken UBIFS but they (hopefully) will
make sure that the accounting problem will not happen again.

Can you also share me the broken UBIFS image?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
--nextPart1522806096.clpQZ2rrax
Content-Disposition: attachment; filename="0002-ubifs-Orphan-xattr-inodes-too.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0002-ubifs-Orphan-xattr-inodes-too.patch"

>From 5667651fcd44f12079f7b6bd6fbc52b1c898f8a1 Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Thu, 15 Feb 2018 20:18:46 +0100
Subject: [PATCH 2/2] ubifs: Orphan xattr inodes too.

WIP WIP WIP

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/orphan.c | 208 ++++++++++++++++++++++++++++++++++++------------------
 fs/ubifs/ubifs.h  |   3 +
 2 files changed, 144 insertions(+), 67 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index caf2d123e9ee..769e5cec04b3 100644
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
index 5ee7af879cc4..eb34bc0046c4 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -892,6 +892,8 @@ struct ubifs_budget_req {
  * @rb: rb-tree node of rb-tree of orphans sorted by inode number
  * @list: list head of list of orphans in order added
  * @new_list: list head of list of orphans added since the last commit
+ * @child_list: list of xattr childs if this orphan hosts xattrs, list head
+ * if this orphan is a xattr, not used otherwise.
  * @cnext: next orphan to commit
  * @dnext: next orphan to delete
  * @inum: inode number
@@ -903,6 +905,7 @@ struct ubifs_orphan {
 	struct rb_node rb;
 	struct list_head list;
 	struct list_head new_list;
+	struct list_head child_list;
 	struct ubifs_orphan *cnext;
 	struct ubifs_orphan *dnext;
 	ino_t inum;
-- 
2.13.6


--nextPart1522806096.clpQZ2rrax
Content-Disposition: attachment; filename="0001-ubifs-Fix-synced_i_size-calculation-for-xattr-inodes.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-ubifs-Fix-synced_i_size-calculation-for-xattr-inodes.patch"

>From acb4805ca8816b83873861090f97fae0bfeb313b Mon Sep 17 00:00:00 2001
From: Richard Weinberger <richard@nod.at>
Date: Wed, 14 Feb 2018 11:53:22 +0100
Subject: [PATCH 1/2] ubifs: Fix synced_i_size calculation for xattr inodes

In ubifs_jnl_update() we sync parent and child inodes to the flash,
in case of xattrs, the parent inode (AKA host inode) has a non-zero
data_len. Therefore we need to adjust synced_i_size too.

This issue was reported by ubifs self tests unter a xattr related work
load.
UBIFS error (ubi0:0 pid 1896): dbg_check_synced_i_size: ui_size is 4, synced_i_size is 0, but inode is clean
UBIFS error (ubi0:0 pid 1896): dbg_check_synced_i_size: i_ino 65, i_mode 0x81a4, i_size 4

Cc: <stable@vger.kernel.org>
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 04c4ec6483e5..1fb123279bb5 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -665,6 +665,11 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	spin_lock(&ui->ui_lock);
 	ui->synced_i_size = ui->ui_size;
 	spin_unlock(&ui->ui_lock);
+	if (xent) {
+		spin_lock(&host_ui->ui_lock);
+		host_ui->synced_i_size = host_ui->ui_size;
+		spin_unlock(&host_ui->ui_lock);
+	}
 	mark_inode_clean(c, ui);
 	mark_inode_clean(c, host_ui);
 	return 0;
-- 
2.13.6


--nextPart1522806096.clpQZ2rrax--
