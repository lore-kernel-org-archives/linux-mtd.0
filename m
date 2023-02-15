Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E29C6379F
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MdUlT6ocok8J77L02A9HOoS1pj8RJHNy9bBfHFVqHQM=; b=WcyerGo3WTutOV
	ZJAsTezr8/tzeGgr9oLaZ9wgIWkVg8JbKmduAgCjNL+ED1Y19wMErvDv8M3nSiHWtGBqfxY47LvVq
	hGyaDT+R40hLtEvvflMdpkNYn5LKZEVvnF8ySREeCp848+BS2HveGKKsfMUTugsqgwrEW197fPu+X
	jr0KxDdOdpGsoVcGJXmSboFK1EdNLVeAEW9VQCWURwML7WO3aAJE/O400FFoK1GXRHbKlUSXgpbL/
	QZzfxsO8I1RqQT+RNj7BTYF/dwN5QlKpk6sZ/CvYUVy3lX+IxhSWhp1SsA+dLnftajTmG4dKs9LLX
	dgtlfuL1+Z8uj6YyXKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS779-004LLi-W6; Wed, 15 Feb 2023 02:01:44 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS776-004LKe-Is
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 02:01:43 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PGh8H3NMrz16Nd4;
	Wed, 15 Feb 2023 09:59:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 15 Feb
 2023 10:01:30 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>
Subject: [PATCH v2] ubifs: dirty_cow_znode: Fix memleak in error handling path
Date: Wed, 15 Feb 2023 10:25:07 +0800
Message-ID: <20230215022507.2363193-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_180140_984196_4AD81C18 
X-CRM114-Status: GOOD (  18.29  )
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

Following process will cause a memleak for copied up znode:

dirty_cow_znode
  zn = copy_znode(c, znode);
  err = insert_old_idx(c, zbr->lnum, zbr->offs);
  if (unlikely(err))
     return ERR_PTR(err);   // No one refers to zn.

Fetch a reproducer in [Link].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216705
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 v1: https://patchwork.ozlabs.org/project/linux-mtd/patch/20221118090236.664244-3-chengzhihao1@huawei.com/
 v1->v2: In v1, if insert_old_idx() failed, old index neither exists in
	 TNC nor in old-index tree. Which means that old index node could
	 be overwritten in layout_leb_in_gaps(), then ubifs image will be
	 corrupted in power-cut.
	 In v2, copy_znode() is splitted into 2 parts: resouce allocation
	 and znode replacement, insert_old_idx() is splitted in similar
	 way, so resouce cleanup could be done in error handling path
	 without corrupting metadata(mem & disk).
	 It's okay that old index inserting is put behind of add_idx_dirt(),
	 old index is used in layout_leb_in_gaps(), so the two processes
	 do not depend on each other.
 fs/ubifs/tnc.c | 137 +++++++++++++++++++++++++++++++------------------
 1 file changed, 87 insertions(+), 50 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 2df56bbc6865..6b7d95b65f4b 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -44,6 +44,33 @@ enum {
 	NOT_ON_MEDIA = 3,
 };
 
+static void do_insert_old_idx(struct ubifs_info *c,
+			      struct ubifs_old_idx *old_idx)
+{
+	struct ubifs_old_idx *o;
+	struct rb_node **p, *parent = NULL;
+
+	p = &c->old_idx.rb_node;
+	while (*p) {
+		parent = *p;
+		o = rb_entry(parent, struct ubifs_old_idx, rb);
+		if (old_idx->lnum < o->lnum)
+			p = &(*p)->rb_left;
+		else if (old_idx->lnum > o->lnum)
+			p = &(*p)->rb_right;
+		else if (old_idx->offs < o->offs)
+			p = &(*p)->rb_left;
+		else if (old_idx->offs > o->offs)
+			p = &(*p)->rb_right;
+		else {
+			ubifs_err(c, "old idx added twice!");
+			kfree(old_idx);
+		}
+	}
+	rb_link_node(&old_idx->rb, parent, p);
+	rb_insert_color(&old_idx->rb, &c->old_idx);
+}
+
 /**
  * insert_old_idx - record an index node obsoleted since the last commit start.
  * @c: UBIFS file-system description object
@@ -69,35 +96,15 @@ enum {
  */
 static int insert_old_idx(struct ubifs_info *c, int lnum, int offs)
 {
-	struct ubifs_old_idx *old_idx, *o;
-	struct rb_node **p, *parent = NULL;
+	struct ubifs_old_idx *old_idx;
 
 	old_idx = kmalloc(sizeof(struct ubifs_old_idx), GFP_NOFS);
 	if (unlikely(!old_idx))
 		return -ENOMEM;
 	old_idx->lnum = lnum;
 	old_idx->offs = offs;
+	do_insert_old_idx(c, old_idx);
 
-	p = &c->old_idx.rb_node;
-	while (*p) {
-		parent = *p;
-		o = rb_entry(parent, struct ubifs_old_idx, rb);
-		if (lnum < o->lnum)
-			p = &(*p)->rb_left;
-		else if (lnum > o->lnum)
-			p = &(*p)->rb_right;
-		else if (offs < o->offs)
-			p = &(*p)->rb_left;
-		else if (offs > o->offs)
-			p = &(*p)->rb_right;
-		else {
-			ubifs_err(c, "old idx added twice!");
-			kfree(old_idx);
-			return 0;
-		}
-	}
-	rb_link_node(&old_idx->rb, parent, p);
-	rb_insert_color(&old_idx->rb, &c->old_idx);
 	return 0;
 }
 
@@ -199,23 +206,6 @@ static struct ubifs_znode *copy_znode(struct ubifs_info *c,
 	__set_bit(DIRTY_ZNODE, &zn->flags);
 	__clear_bit(COW_ZNODE, &zn->flags);
 
-	ubifs_assert(c, !ubifs_zn_obsolete(znode));
-	__set_bit(OBSOLETE_ZNODE, &znode->flags);
-
-	if (znode->level != 0) {
-		int i;
-		const int n = zn->child_cnt;
-
-		/* The children now have new parent */
-		for (i = 0; i < n; i++) {
-			struct ubifs_zbranch *zbr = &zn->zbranch[i];
-
-			if (zbr->znode)
-				zbr->znode->parent = zn;
-		}
-	}
-
-	atomic_long_inc(&c->dirty_zn_cnt);
 	return zn;
 }
 
@@ -233,6 +223,42 @@ static int add_idx_dirt(struct ubifs_info *c, int lnum, int dirt)
 	return ubifs_add_dirt(c, lnum, dirt);
 }
 
+/**
+ * replace_znode - replace old znode with new znode.
+ * @c: UBIFS file-system description object
+ * @new_zn: new znode
+ * @old_zn: old znode
+ * @zbr: the branch of parent znode
+ *
+ * Replace old znode with new znode in TNC.
+ */
+static void replace_znode(struct ubifs_info *c, struct ubifs_znode *new_zn,
+			  struct ubifs_znode *old_zn, struct ubifs_zbranch *zbr)
+{
+	ubifs_assert(c, !ubifs_zn_obsolete(old_zn));
+	__set_bit(OBSOLETE_ZNODE, &old_zn->flags);
+
+	if (old_zn->level != 0) {
+		int i;
+		const int n = new_zn->child_cnt;
+
+		/* The children now have new parent */
+		for (i = 0; i < n; i++) {
+			struct ubifs_zbranch *child = &new_zn->zbranch[i];
+
+			if (child->znode)
+				child->znode->parent = new_zn;
+		}
+	}
+
+	zbr->znode = new_zn;
+	zbr->lnum = 0;
+	zbr->offs = 0;
+	zbr->len = 0;
+
+	atomic_long_inc(&c->dirty_zn_cnt);
+}
+
 /**
  * dirty_cow_znode - ensure a znode is not being committed.
  * @c: UBIFS file-system description object
@@ -265,21 +291,32 @@ static struct ubifs_znode *dirty_cow_znode(struct ubifs_info *c,
 		return zn;
 
 	if (zbr->len) {
-		err = insert_old_idx(c, zbr->lnum, zbr->offs);
-		if (unlikely(err))
-			return ERR_PTR(err);
+		struct ubifs_old_idx *old_idx;
+
+		old_idx = kmalloc(sizeof(struct ubifs_old_idx), GFP_NOFS);
+		if (unlikely(!old_idx)) {
+			err = -ENOMEM;
+			goto out;
+		}
+		old_idx->lnum = zbr->lnum;
+		old_idx->offs = zbr->offs;
+
 		err = add_idx_dirt(c, zbr->lnum, zbr->len);
-	} else
-		err = 0;
+		if (err) {
+			kfree(old_idx);
+			goto out;
+		}
 
-	zbr->znode = zn;
-	zbr->lnum = 0;
-	zbr->offs = 0;
-	zbr->len = 0;
+		do_insert_old_idx(c, old_idx);
+	}
+
+	replace_znode(c, zn, znode, zbr);
 
-	if (unlikely(err))
-		return ERR_PTR(err);
 	return zn;
+
+out:
+	kfree(zn);
+	return ERR_PTR(err);
 }
 
 /**
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
