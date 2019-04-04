Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22525C4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74EC206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 22:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IBLj1ezR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D74EC206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SSG8xGlFoujMa3CwPunGnek29o3sheQzL0D+AK+YsE=; b=IBLj1ezRK74OTG
	FAmD0/ef4xm9aPtFoW1E9BFgdu9+mT/RSl/FVRE2pZzdaLIa/ArRcyJXBzC4oR43tifKIyVM+qmCN
	XExlAt8MJy6V8JCVl8+KkokshCRX5lQkoZyFxCM2hCYoibVB+Dmm8aJu7FYi9+Hp+rRzE09Nx7NeB
	8FAMiW/xwhtGdfGf6CbTVuhjGB3WMH7h5cgyZQ2vMZjOuWGPpiCcuo1p2rnN8Btlv2Ui8Df9cqb5i
	lmISOaJrWha0Y/x0a9TmQuGq3WiS4/sxeeJpyV0fUhxSB9ZxelMbLrEjMuNxOKeTsZ+WA+B9SdFsB
	c6c+hBLvfok7yKePX+hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCAx8-0000vE-F0; Thu, 04 Apr 2019 22:35:22 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCAwp-0007uc-Af
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 22:35:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 23BCC1801445D;
 Fri,  5 Apr 2019 00:35:02 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] ubifs: orphan: Handle xattrs like files
Date: Fri,  5 Apr 2019 00:34:37 +0200
Message-Id: <20190404223438.29408-3-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404223438.29408-1-richard@nod.at>
References: <20190404223438.29408-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_153503_662575_83E3E822 
X-CRM114-Status: GOOD (  17.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, stefan@agner.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Like for the journal case, make sure that we track all xattr
inodes.
Otherwise UBIFS might not be able to locate stale xattr inodes
upon recovery.

Reported-by: Stefan Agner <stefan@agner.ch>
Fixes: 1e51764a3c2ac ("UBIFS: add new flash file system")
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
index 1ae12900e01d..d28102829f6c 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -924,6 +924,8 @@ struct ubifs_budget_req {
  * @rb: rb-tree node of rb-tree of orphans sorted by inode number
  * @list: list head of list of orphans in order added
  * @new_list: list head of list of orphans added since the last commit
+ * @child_list: list of xattr childs if this orphan hosts xattrs, list head
+ * if this orphan is a xattr, not used otherwise.
  * @cnext: next orphan to commit
  * @dnext: next orphan to delete
  * @inum: inode number
@@ -935,6 +937,7 @@ struct ubifs_orphan {
 	struct rb_node rb;
 	struct list_head list;
 	struct list_head new_list;
+	struct list_head child_list;
 	struct ubifs_orphan *cnext;
 	struct ubifs_orphan *dnext;
 	ino_t inum;
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
