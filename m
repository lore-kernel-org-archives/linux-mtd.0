Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5C4CD129D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FG2I+Ph/foNjRP3R88L9uE+Er7w5FsMili1zhU1nRY=; b=cmmiOzPFZ6zf6N
	Th1ngxOxs+7L8SUYc2KND1lNPuGsoNv9aA3Rhg7yAPfatA5hQRYnWrHwMspW4tV5QSE37eh0MoRvH
	w1nCilIlszKZ6qSUQ1Ja+/YemrJlnIe7LV1tEfPs+yxrjrviQBzbv0MFGcLEM1JYeJOkkknzc8AsX
	V9tEBd98apJP3iSDKJ0oyWZkeHJmFslTOrXmd/ZY8Omj98BweqgqxFdHp6oKg5DBAuYUqu7bWAvYA
	cW2moIiryqyut7dp5qEtjeTMA4Rz+BxNr1u0xErLscmZqfQIbGduPH9Jor0Xk9SKds9H1krb9PDvW
	cx3CaSIpB8zrD6eJdJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfF-00000005gIG-2Eyc;
	Wed, 10 Apr 2024 07:46:37 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBu-0516
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VDvy74PJPz1GGhr;
	Wed, 10 Apr 2024 15:45:35 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 81DAA180064;
	Wed, 10 Apr 2024 15:46:21 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 2/9] ubifs: Don't add xattr inode into orphan area
Date: Wed, 10 Apr 2024 15:37:44 +0800
Message-ID: <20240410073751.2522830-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_496478_1F940898 
X-CRM114-Status: GOOD (  16.66  )
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

Now, the entire inode with its' xattrs are removed while replaying
orphan nodes. There is no need to add xattr inodes into orphan area,
which is based on the fact that xattr entries won't be cleared from
disk before deleting xattr inodes, in another words, current logic
can make sure that xattr inode be deleted in any cases even UBIFS not
record xattr inode into orphan area.
Let's looking for possible paths that could clear xattr entries from
disk but leave the xattr inode on TNC:
 1. unlink/tmpfile -> ubifs_jnl_update: inode(nlink=0) is written
    into bud LEB and added into orphan list, then:
    a. powercut: ubifs_tnc_remove_ino(xattr entry/inode can be found
       from TNC and being deleted) is invoked in replaying journal.
    b. commit + powercut: inode is written into orphan area, and
       ubifs_tnc_remove_ino is invoked in replaying orphan nodes.
    c. evicting + powercut: xattr inode(nlink=0) is written on disk,
       xattr is removed from TNC, gc could clear xattr entries from
       disk. ubifs_tnc_remove_ino will apply on inode and xattr inode
       in replaying journal, so lost xattr entries will make no
       influence.
    d. evicting + commit + powercut: xattr inode/entry are removed from
       index tree(on disk) by ubifs_jnl_write_inode, xattr inode is
       cleared from orphan area by ubifs_jnl_write_inode + commit.
    e. commit + evicting + powercut: inode is written into orphan area,
       then equivalent to c.
 2. remove xattr -> ubifs_jnl_delete_xattr: xattr entry(inum=0) and
    xattr inode(nlink=0) is written into bud LEB, xattr entry/inode are
    removed from TNC, then:
    a. powercut: gc could clear xattr entries from disk, which won't
       affect deleting xattr entry from TNC. ubifs_tnc_remove_ino will
       apply on xattr inode in replaying journal, ubifs_tnc_remove_nm
       will apply on xattr entry in replaying journal.
    b. commit + powercut: xattr entry/inode are removed from index tree
       (on disk).
Tracking xattr inode in orphan list is imported by commit 988bec41318f3f
("ubifs: orphan: Handle xattrs like files"), it aims to fix the similar
problem described in commit 7959cf3a7506d4a ("ubifs: journal: Handle
xattrs like files"). Actually, the problem only exist in journal case
but not the orphan case. So, we can remove the orphan tracking for xattr
inodes.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/orphan.c | 85 ++++++++---------------------------------------
 fs/ubifs/ubifs.h  |  3 --
 2 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index ddeb125e6930..88fbf331ad8c 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -42,24 +42,30 @@
 
 static int dbg_check_orphans(struct ubifs_info *c);
 
-static struct ubifs_orphan *orphan_add(struct ubifs_info *c, ino_t inum,
-				       struct ubifs_orphan *parent_orphan)
+/**
+ * ubifs_add_orphan - add an orphan.
+ * @c: UBIFS file-system description object
+ * @inum: orphan inode number
+ *
+ * Add an orphan. This function is called when an inodes link count drops to
+ * zero.
+ */
+int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
 {
 	struct ubifs_orphan *orphan, *o;
 	struct rb_node **p, *parent = NULL;
 
 	orphan = kzalloc(sizeof(struct ubifs_orphan), GFP_NOFS);
 	if (!orphan)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 	orphan->inum = inum;
 	orphan->new = 1;
-	INIT_LIST_HEAD(&orphan->child_list);
 
 	spin_lock(&c->orphan_lock);
 	if (c->tot_orphans >= c->max_orphans) {
 		spin_unlock(&c->orphan_lock);
 		kfree(orphan);
-		return ERR_PTR(-ENFILE);
+		return -ENFILE;
 	}
 	p = &c->orph_tree.rb_node;
 	while (*p) {
@@ -73,7 +79,7 @@ static struct ubifs_orphan *orphan_add(struct ubifs_info *c, ino_t inum,
 			ubifs_err(c, "orphaned twice");
 			spin_unlock(&c->orphan_lock);
 			kfree(orphan);
-			return ERR_PTR(-EINVAL);
+			return -EINVAL;
 		}
 	}
 	c->tot_orphans += 1;
@@ -83,14 +89,9 @@ static struct ubifs_orphan *orphan_add(struct ubifs_info *c, ino_t inum,
 	list_add_tail(&orphan->list, &c->orph_list);
 	list_add_tail(&orphan->new_list, &c->orph_new);
 
-	if (parent_orphan) {
-		list_add_tail(&orphan->child_list,
-			      &parent_orphan->child_list);
-	}
-
 	spin_unlock(&c->orphan_lock);
 	dbg_gen("ino %lu", (unsigned long)inum);
-	return orphan;
+	return 0;
 }
 
 static struct ubifs_orphan *lookup_orphan(struct ubifs_info *c, ino_t inum)
@@ -144,59 +145,6 @@ static void orphan_delete(struct ubifs_info *c, struct ubifs_orphan *orph)
 	__orphan_drop(c, orph);
 }
 
-/**
- * ubifs_add_orphan - add an orphan.
- * @c: UBIFS file-system description object
- * @inum: orphan inode number
- *
- * Add an orphan. This function is called when an inodes link count drops to
- * zero.
- */
-int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
-{
-	int err = 0;
-	ino_t xattr_inum;
-	union ubifs_key key;
-	struct ubifs_dent_node *xent, *pxent = NULL;
-	struct fscrypt_name nm = {0};
-	struct ubifs_orphan *xattr_orphan;
-	struct ubifs_orphan *orphan;
-
-	orphan = orphan_add(c, inum, NULL);
-	if (IS_ERR(orphan))
-		return PTR_ERR(orphan);
-
-	lowest_xent_key(c, &key, inum);
-	while (1) {
-		xent = ubifs_tnc_next_ent(c, &key, &nm);
-		if (IS_ERR(xent)) {
-			err = PTR_ERR(xent);
-			if (err == -ENOENT)
-				break;
-			kfree(pxent);
-			return err;
-		}
-
-		fname_name(&nm) = xent->name;
-		fname_len(&nm) = le16_to_cpu(xent->nlen);
-		xattr_inum = le64_to_cpu(xent->inum);
-
-		xattr_orphan = orphan_add(c, xattr_inum, orphan);
-		if (IS_ERR(xattr_orphan)) {
-			kfree(pxent);
-			kfree(xent);
-			return PTR_ERR(xattr_orphan);
-		}
-
-		kfree(pxent);
-		pxent = xent;
-		key_read(c, &xent->key, &key);
-	}
-	kfree(pxent);
-
-	return 0;
-}
-
 /**
  * ubifs_delete_orphan - delete an orphan.
  * @c: UBIFS file-system description object
@@ -206,7 +154,7 @@ int ubifs_add_orphan(struct ubifs_info *c, ino_t inum)
  */
 void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 {
-	struct ubifs_orphan *orph, *child_orph, *tmp_o;
+	struct ubifs_orphan *orph;
 
 	spin_lock(&c->orphan_lock);
 
@@ -219,11 +167,6 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
 		return;
 	}
 
-	list_for_each_entry_safe(child_orph, tmp_o, &orph->child_list, child_list) {
-		list_del(&child_orph->child_list);
-		orphan_delete(c, child_orph);
-	}
-	
 	orphan_delete(c, orph);
 
 	spin_unlock(&c->orphan_lock);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 7a7c62104f2b..3651a87e64b2 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -923,8 +923,6 @@ struct ubifs_budget_req {
  * @rb: rb-tree node of rb-tree of orphans sorted by inode number
  * @list: list head of list of orphans in order added
  * @new_list: list head of list of orphans added since the last commit
- * @child_list: list of xattr children if this orphan hosts xattrs, list head
- * if this orphan is a xattr, not used otherwise.
  * @cnext: next orphan to commit
  * @dnext: next orphan to delete
  * @inum: inode number
@@ -936,7 +934,6 @@ struct ubifs_orphan {
 	struct rb_node rb;
 	struct list_head list;
 	struct list_head new_list;
-	struct list_head child_list;
 	struct ubifs_orphan *cnext;
 	struct ubifs_orphan *dnext;
 	ino_t inum;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
