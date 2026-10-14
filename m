Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EAFCC6B19
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6EHXk5kvdQ7PhB9n2WEI3ed7tY7ZZcBLooJUnUtqDc=; b=zeHiAn08rpFFjL
	kuhckbqj+aHgbj2OILprWu9eBMtK3FxG54oh5vDGSvOu+ACPxKG/aabehD1rJZZi7gMHYgIBQL6kZ
	tLFHYqf9sLOU8KStVbA+f1gzQEpabSVMOC+cmZJzfHGBFDQqwnt3INcIYdVOweJDYtNEQSNhDmV4b
	t8ur9ZlQplQeE4VGabUQ9N7ezpmV418O/jRBw+1TP1IppGQOBJfBypnhC8lBLnkQKfKTSGhrQmm3Q
	ZoJP1jABOlimkVBeqs3gosByLiOCo5jDj1hc4YpOhStuYaq+q4cavOUAyafpICl7irbqJg4w7sBL9
	AXF/3TT9asOzdc1tozaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsBo-0000000EaQP-301z;
	Wed, 14 Oct 2026 06:10:12 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsBj-0000000EaP0-2DRG
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 06:10:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2WFJG9cJcmAhOhk8siaFmZKVTzgJRkbhQt/87zzm9xQ=;
	b=Ia+QpVAZ8ls+iWJKbgMxrR4kuv0fjjxd4gXOdoNoVYpsqUIfwBT464tflHRY+dRtmX6Y51wYy
	5MfhemvS3AiRrrRCk2aa38NirM2Tafbv2KQTLj45TJec5B6LlEnEQG5P/UtzijhWaGexPWs7qkG
	cjmdHGCzup43SwgIq/sfo14=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4j4L8B4xrjz1T4LX;
	Wed, 14 Oct 2026 13:57:30 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id DB9AC4057D;
	Wed, 14 Oct 2026 14:09:51 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 14:09:50 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH 1/2] ubifs: tnc_delete: Don't free zero-branch znodes if memory allocation fails
Date: Wed, 14 Oct 2026 14:02:51 +0800
Message-ID: <20261014060252.3531356-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014060252.3531356-1-chengzhihao1@huawei.com>
References: <20261014060252.3531356-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_231007_878183_9B9D5021 
X-CRM114-Status: GOOD (  16.83  )
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

The freed zero-branch znodes won't be removed from TNC if a failure
(eg. mem alloc in insert_old_idx_znode) happens in tnc_delete, then
TNC traversing could access the freed znodes, the details shown as:

 file: consists of many data nodes, TNC is:
                       znode_A (lv 2)
		 /                       \
         znode (lv 1)                 znode_B (lv 1)
	  /        \                      |
    znode(lv 0)...znode(lv 0)         znode_C (lv 0, child_cnt = 1)
    |    |    |    |	  |               |
 ino_1 ino_f dent dn0...dn_i-1		dn_i

    P1
 truncate(file, dn_i-1)
  ubifs_setattr
   ubifs_jnl_truncate
    ubifs_tnc_remove_range
     tnc_delete // dn_i is removed, znode_C->child_cnt becomes 0
      do-while
       kfree(znode_C)
       ENOMEM = insert_old_idx_znode(c, znode_B)
       return
      znode->zbranch[i] = znode->zbranch[i + 1] // skip,
      // znode_C is still in TNC

 the TNC looks like:
                       znode_A (lv 2)
		 /                       \
         znode (lv 1)                 znode_B (lv 1)
	  /        \                      |
    znode(lv 0)...znode(lv 0)         znode_C (lv 0, child_cnt = 0, freed)
    |    |    |    |	  |
 ino_1 ino_f dent dn0...dn_i-1

     P2
 drop_caches_sysctl_handler
  shrink_slab
   ubifs_shrink_scan
    shrink_tnc_trees
     shrink_tnc
      ubifs_tnc_levelorder_next
       access znode_C // UAF

The root cause is that zero-branch znodes freeing & znode->zbranch is not
atomic, which could be interrupted by the insert_old_idx_znode() failure,
fix it by freeing znodes after all insert_old_idx_znode() callers success.
The znodes collapsing won't meet the problem if insert_old_idx() fails,
because znode is freed after updating c->zroot, the TNC traversing won't
access a freed znode.
Notice: we add new field 'fnext' in struct ubifs_znode to trace to be
freed znodes. Because tnc_delete and do_commit could race, the members
parent/cnext/cparent can not be reused. Importing a stack array to record
znodes is also not recommended, becase the UBIFS_MAX_LEVELS*sizeof(ptr)
becomes 4096, which may cause the compiler to complain.

Reproducer is https://bugzilla.kernel.org/show_bug.cgi?id=222129.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c   | 40 +++++++++++++++++++++++++++++++---------
 fs/ubifs/ubifs.h |  2 ++
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 776e6bc6a00d..679afddadf82 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2514,8 +2514,9 @@ int ubifs_tnc_add_nm(struct ubifs_info *c, const union ubifs_key *key,
 static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 {
 	struct ubifs_zbranch *zbr;
-	struct ubifs_znode *zp;
+	struct ubifs_znode *zp, *zn;
 	int i, err;
+	struct ubifs_znode free_head = { .fnext = NULL };
 
 	/* Delete without merge for now */
 	ubifs_assert(c, znode->level == 0);
@@ -2543,7 +2544,7 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 	 * This was the last zbranch, we have to delete this znode from the
 	 * parent.
 	 */
-
+	zn = &free_head;
 	do {
 		ubifs_assert(c, !ubifs_zn_obsolete(znode));
 		ubifs_assert(c, ubifs_zn_dirty(znode));
@@ -2554,15 +2555,20 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 		atomic_long_dec(&c->dirty_zn_cnt);
 
 		err = insert_old_idx_znode(c, znode);
-		if (err)
+		if (err) {
+			zn = free_head.fnext;
+			while (zn) {
+				struct ubifs_znode *next = zn->fnext;
+
+				zn->fnext = NULL;
+				zn = next;
+			}
 			return err;
+		}
+
+		zn->fnext = znode;
+		zn = znode;
 
-		if (znode->cnext) {
-			__set_bit(OBSOLETE_ZNODE, &znode->flags);
-			atomic_long_inc(&c->clean_zn_cnt);
-			atomic_long_inc(&ubifs_clean_zn_cnt);
-		} else
-			kfree(znode);
 		znode = zp;
 	} while (znode->child_cnt == 1); /* while removing last child */
 
@@ -2575,6 +2581,22 @@ static int tnc_delete(struct ubifs_info *c, struct ubifs_znode *znode, int n)
 			znode->zbranch[i].znode->iip = i;
 	}
 
+	/* Free zero-branchs znodes. */
+	zn = free_head.fnext;
+	while (zn) {
+		struct ubifs_znode *next = zn->fnext;
+
+		zn->fnext = NULL;
+		if (zn->cnext) {
+			__set_bit(OBSOLETE_ZNODE, &zn->flags);
+			atomic_long_inc(&c->clean_zn_cnt);
+			atomic_long_inc(&ubifs_clean_zn_cnt);
+		} else {
+			kfree(zn);
+		}
+		zn = next;
+	}
+
 	/*
 	 * If this is the root and it has only 1 child then
 	 * collapse the tree.
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 00db0d19a85e..c3ae7c2625a4 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -761,6 +761,7 @@ struct ubifs_zbranch {
  * @parent: parent znode or NULL if it is the root
  * @cnext: next znode to commit
  * @cparent: parent node for this commit
+ * @fnext: next znode to free
  * @ciip: index in cparent's zbranch array
  * @flags: znode flags (%DIRTY_ZNODE, %COW_ZNODE or %OBSOLETE_ZNODE)
  * @time: last access time (seconds)
@@ -780,6 +781,7 @@ struct ubifs_znode {
 	struct ubifs_znode *parent;
 	struct ubifs_znode *cnext;
 	struct ubifs_znode *cparent;
+	struct ubifs_znode *fnext;
 	int ciip;
 	unsigned long flags;
 	time64_t time;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
