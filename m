Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54A5D2E9D6
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIgdruG6bH93aeayHQPXdg8XwxZIBy9E8RvIow3noZM=; b=FX+BVFhrCGKZ/k
	wYYiffdzIDRUW1tBzqRsGZt2upSWfuZNc8JqhLq6MN0fF+Hzjq+Bhx7Q5oTlkFJPa0tl2BJo7NF5n
	oJSME77ExpWRQr+ixmJAzNHHu4XFuOreM62s10XMkLQRee0WtZMJDpKZu0GUO4gmye/pg2P+JW6ji
	kqi/Xn3X/hrbxTiOUmRZFfKZ4W99Hi7qfoloK8sQYW4lhPW+/nCR5Ci5oDou+18wzPkDi4bZxWyoa
	yoAmNYC9Txx/skDcmY7H3gCFQzKL3dCg1lUXdy510zlUj8jWk4e562enUhysfYR6hfzNH53a6yUDi
	XBtVPvY7CXemCK6F0Ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARSW-0000000HF8h-2VMN;
	Mon, 11 Nov 2024 10:15:48 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQJk-0000000GxiC-2xCC
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:02:43 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Xn3Tz5nCCz1ypSj;
	Mon, 11 Nov 2024 17:02:47 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A266F1401F4;
	Mon, 11 Nov 2024 17:02:36 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 17:02:35 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 042/102] ubifs-utils: Adapt orphan.c in libubifs
Date: Mon, 11 Nov 2024 17:00:56 +0800
Message-ID: <20241111090124.2070455-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_010241_082095_BD62C78C 
X-CRM114-Status: GOOD (  19.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adapt orphan.c in libubifs, compared with linux kernel implementations:
 1. Keep the commit related implementations, because do_commit depends
    on these functions which will be invoked in fsck.
 2. Keep the orphan replaying implementations, because fsck needs them.
 3. Other implementations are removed which won't be used in mkfs/fsck.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/orphan.c | 357 +-----------------------------------------
 1 file changed, 8 insertions(+), 349 deletions(-)

diff --git a/ubifs-utils/libubifs/orphan.c b/ubifs-utils/libubifs/orphan.c
index fb957d96..2f318748 100644
--- a/ubifs-utils/libubifs/orphan.c
+++ b/ubifs-utils/libubifs/orphan.c
@@ -7,7 +7,14 @@
  * Author: Adrian Hunter
  */
 
+#include "linux_err.h"
+#include "bitops.h"
+#include "kmem.h"
 #include "ubifs.h"
+#include "defs.h"
+#include "debug.h"
+#include "key.h"
+#include "misc.h"
 
 /*
  * An orphan is an inode number whose inode node has been committed to the index
@@ -43,137 +50,6 @@
 static int dbg_check_orphans(struct ubifs_info *c);
 
 /**
- * ubifs_add_orphan - add an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * Add an orphan. This function is called when an inodes link count drops to
- * zero.
- */
-int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
-{
-	struct ubifs_orphan *orphan, *o;
-	struct rb_node **p, *parent = NULL;
-
-	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_NOFS);
-	if (!orphan)
-		return -ENOMEM;
-	orphan->inum = inum;
-	orphan->new = 1;
-
-	spin_lock(&c->orphan_lock);
-	if (c->tot_orphans >= c->max_orphans) {
-		spin_unlock(&c->orphan_lock);
-		kfree(orphan);
-		return -ENFILE;
-	}
-	p = &c->orph_tree.rb_node;
-	while (*p) {
-		parent = *p;
-		o = rb_entry(parent, struct ubifs_orphan, rb);
-		if (inum < o->inum)
-			p = &(*p)->rb_left;
-		else if (inum > o->inum)
-			p = &(*p)->rb_right;
-		else {
-			ubifs_err(c, "orphaned twice");
-			spin_unlock(&c->orphan_lock);
-			kfree(orphan);
-			return -EINVAL;
-		}
-	}
-	c->tot_orphans += 1;
-	c->new_orphans += 1;
-	rb_link_node(&orphan->rb, parent, p);
-	rb_insert_color(&orphan->rb, &c->orph_tree);
-	list_add_tail(&orphan->list, &c->orph_list);
-	list_add_tail(&orphan->new_list, &c->orph_new);
-
-	spin_unlock(&c->orphan_lock);
-	dbg_gen("ino %lu", (unsigned long)inum);
-	return 0;
-}
-
-static struct ubifs_orphan *lookup_orphan(struct ubifs_info *c, ino_t inum)
-{
-	struct ubifs_orphan *o;
-	struct rb_node *p;
-
-	p = c->orph_tree.rb_node;
-	while (p) {
-		o = rb_entry(p, struct ubifs_orphan, rb);
-		if (inum < o->inum)
-			p = p->rb_left;
-		else if (inum > o->inum)
-			p = p->rb_right;
-		else {
-			return o;
-		}
-	}
-	return NULL;
-}
-
-static void __orphan_drop(struct ubifs_info *c, struct ubifs_orphan *o)
-{
-	rb_erase(&o->rb, &c->orph_tree);
-	list_del(&o->list);
-	c->tot_orphans -= 1;
-
-	if (o->new) {
-		list_del(&o->new_list);
-		c->new_orphans -= 1;
-	}
-
-	kfree(o);
-}
-
-static void orphan_delete(struct ubifs_info *c, struct ubifs_orphan *orph)
-{
-	if (orph->del) {
-		dbg_gen("deleted twice ino %lu", (unsigned long)orph->inum);
-		return;
-	}
-
-	if (orph->cmt) {
-		orph->del = 1;
-		rb_erase(&orph->rb, &c->orph_tree);
-		orph->dnext = c->orph_dnext;
-		c->orph_dnext = orph;
-		dbg_gen("delete later ino %lu", (unsigned long)orph->inum);
-		return;
-	}
-
-	__orphan_drop(c, orph);
-}
-
-/**
- * ubifs_delete_orphan - delete an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * Delete an orphan. This function is called when an inode is deleted.
- */
-void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
-{
-	struct ubifs_orphan *orph;
-
-	spin_lock(&c->orphan_lock);
-
-	orph = lookup_orphan(c, inum);
-	if (!orph) {
-		spin_unlock(&c->orphan_lock);
-		ubifs_err(c, "missing orphan ino %lu", (unsigned long)inum);
-		dump_stack();
-
-		return;
-	}
-
-	orphan_delete(c, orph);
-
-	spin_unlock(&c->orphan_lock);
-}
-
-/**
  * ubifs_orphan_start_commit - start commit of orphans.
  * @c: UBIFS file-system description object
  *
@@ -724,224 +600,7 @@ int ubifs_mount_orphans(struct ubifs_info *c, int unclean, int read_only)
 	return err;
 }
 
-/*
- * Everything below is related to debugging.
- */
-
-struct check_orphan {
-	struct rb_node rb;
-	ino_t inum;
-};
-
-struct check_info {
-	unsigned long last_ino;
-	unsigned long tot_inos;
-	unsigned long missing;
-	unsigned long long leaf_cnt;
-	struct ubifs_ino_node *node;
-	struct rb_root root;
-};
-
-static bool dbg_find_orphan(struct ubifs_info *c, ino_t inum)
-{
-	bool found = false;
-
-	spin_lock(&c->orphan_lock);
-	found = !!lookup_orphan(c, inum);
-	spin_unlock(&c->orphan_lock);
-
-	return found;
-}
-
-static int dbg_ins_check_orphan(struct rb_root *root, ino_t inum)
-{
-	struct check_orphan *orphan, *o;
-	struct rb_node **p, *parent = NULL;
-
-	orphan = kzalloc(sizeof(struct check_orphan), GFP_NOFS);
-	if (!orphan)
-		return -ENOMEM;
-	orphan->inum = inum;
-
-	p = &root->rb_node;
-	while (*p) {
-		parent = *p;
-		o = rb_entry(parent, struct check_orphan, rb);
-		if (inum < o->inum)
-			p = &(*p)->rb_left;
-		else if (inum > o->inum)
-			p = &(*p)->rb_right;
-		else {
-			kfree(orphan);
-			return 0;
-		}
-	}
-	rb_link_node(&orphan->rb, parent, p);
-	rb_insert_color(&orphan->rb, root);
-	return 0;
-}
-
-static int dbg_find_check_orphan(struct rb_root *root, ino_t inum)
-{
-	struct check_orphan *o;
-	struct rb_node *p;
-
-	p = root->rb_node;
-	while (p) {
-		o = rb_entry(p, struct check_orphan, rb);
-		if (inum < o->inum)
-			p = p->rb_left;
-		else if (inum > o->inum)
-			p = p->rb_right;
-		else
-			return 1;
-	}
-	return 0;
-}
-
-static void dbg_free_check_tree(struct rb_root *root)
-{
-	struct check_orphan *o, *n;
-
-	rbtree_postorder_for_each_entry_safe(o, n, root, rb)
-		kfree(o);
-}
-
-static int dbg_orphan_check(struct ubifs_info *c, struct ubifs_zbranch *zbr,
-			    void *priv)
+static int dbg_check_orphans(__unused struct ubifs_info *c)
 {
-	struct check_info *ci = priv;
-	ino_t inum;
-	int err;
-
-	inum = key_inum(c, &zbr->key);
-	if (inum != ci->last_ino) {
-		/*
-		 * Lowest node type is the inode node or xattr entry(when
-		 * selinux/encryption is enabled), so it comes first
-		 */
-		if (key_type(c, &zbr->key) != UBIFS_INO_KEY &&
-		    key_type(c, &zbr->key) != UBIFS_XENT_KEY)
-			ubifs_err(c, "found orphan node ino %lu, type %d",
-				  (unsigned long)inum, key_type(c, &zbr->key));
-		ci->last_ino = inum;
-		ci->tot_inos += 1;
-		err = ubifs_tnc_read_node(c, zbr, ci->node);
-		if (err) {
-			ubifs_err(c, "node read failed, error %d", err);
-			return err;
-		}
-		if (ci->node->nlink == 0)
-			/* Must be recorded as an orphan */
-			if (!dbg_find_check_orphan(&ci->root, inum) &&
-			    !dbg_find_orphan(c, inum)) {
-				ubifs_err(c, "missing orphan, ino %lu",
-					  (unsigned long)inum);
-				ci->missing += 1;
-			}
-	}
-	ci->leaf_cnt += 1;
 	return 0;
 }
-
-static int dbg_read_orphans(struct check_info *ci, struct ubifs_scan_leb *sleb)
-{
-	struct ubifs_scan_node *snod;
-	struct ubifs_orph_node *orph;
-	ino_t inum;
-	int i, n, err;
-
-	list_for_each_entry(snod, &sleb->nodes, list) {
-		cond_resched();
-		if (snod->type != UBIFS_ORPH_NODE)
-			continue;
-		orph = snod->node;
-		n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
-		for (i = 0; i < n; i++) {
-			inum = le64_to_cpu(orph->inos[i]);
-			err = dbg_ins_check_orphan(&ci->root, inum);
-			if (err)
-				return err;
-		}
-	}
-	return 0;
-}
-
-static int dbg_scan_orphans(struct ubifs_info *c, struct check_info *ci)
-{
-	int lnum, err = 0;
-	void *buf;
-
-	/* Check no-orphans flag and skip this if no orphans */
-	if (c->no_orphs)
-		return 0;
-
-	buf = __vmalloc(c->leb_size, GFP_NOFS);
-	if (!buf) {
-		ubifs_err(c, "cannot allocate memory to check orphans");
-		return 0;
-	}
-
-	for (lnum = c->orph_first; lnum <= c->orph_last; lnum++) {
-		struct ubifs_scan_leb *sleb;
-
-		sleb = ubifs_scan(c, lnum, 0, buf, 0);
-		if (IS_ERR(sleb)) {
-			err = PTR_ERR(sleb);
-			break;
-		}
-
-		err = dbg_read_orphans(ci, sleb);
-		ubifs_scan_destroy(sleb);
-		if (err)
-			break;
-	}
-
-	vfree(buf);
-	return err;
-}
-
-static int dbg_check_orphans(struct ubifs_info *c)
-{
-	struct check_info ci;
-	int err;
-
-	if (!dbg_is_chk_orph(c))
-		return 0;
-
-	ci.last_ino = 0;
-	ci.tot_inos = 0;
-	ci.missing  = 0;
-	ci.leaf_cnt = 0;
-	ci.root = RB_ROOT;
-	ci.node = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
-	if (!ci.node) {
-		ubifs_err(c, "out of memory");
-		return -ENOMEM;
-	}
-
-	err = dbg_scan_orphans(c, &ci);
-	if (err)
-		goto out;
-
-	err = dbg_walk_index(c, &dbg_orphan_check, NULL, &ci);
-	if (err) {
-		ubifs_err(c, "cannot scan TNC, error %d", err);
-		goto out;
-	}
-
-	if (ci.missing) {
-		ubifs_err(c, "%lu missing orphan(s)", ci.missing);
-		err = -EINVAL;
-		goto out;
-	}
-
-	dbg_cmt("last inode number is %lu", ci.last_ino);
-	dbg_cmt("total number of inodes is %lu", ci.tot_inos);
-	dbg_cmt("total number of leaf nodes is %llu", ci.leaf_cnt);
-
-out:
-	dbg_free_check_tree(&ci.root);
-	kfree(ci.node);
-	return err;
-}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
