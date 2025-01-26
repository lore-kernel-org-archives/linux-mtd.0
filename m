Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196F3C0218E
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 06:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xOZBvaApjRp3vS3pG0sMQD8Zad9t0Z8SIIDs7aJgg0=; b=aKCselRluGEWxr
	HLnETx8WZjvauiOCP7PzSUYEDs8R/gSktDRG4cxnVhLYYsgD4VpfX08/MxmIe7nG/JSBv4wwn1iYd
	n1jKNntYwAvspq/dhQK6+0lf3DW7Uv500VIlviDP4/hG0ghCztnIN5xErifjQqZ5e6LPXZTfIOcuJ
	BS0ppbnUDMTHu18sujHosbt1Xj40KsEedtoQC5i9lnoW8EWNY3GbVUi78s9PwxSgRST6PbfWVEume
	DNYKdbXv2AYfBcnXbx//JciSQiJpLA+DJ2fPlVTVRfBAQiDKijWkoDwOCkXyJ6y0dFTLE/eyzJNns
	DDGzKumV/mNP7mPun7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQr-0000000HALg-0G90;
	Sun, 26 Jan 2025 06:47:45 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbwQm-0000000HAIs-3vlV
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 06:47:43 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YghvL6zjSz20pX2;
	Sun, 26 Jan 2025 14:47:58 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id D2F5F1A0188;
	Sun, 26 Jan 2025 14:47:32 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sun, 26 Jan
 2025 14:47:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>
CC: <yangerkun@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils 7/7] ubifs-utils: libubifs: Update source files from linux kernel 6.13-rc7
Date: Sun, 26 Jan 2025 14:42:03 +0800
Message-ID: <20250126064203.3348494-8-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250126064203.3348494-1-chengzhihao1@huawei.com>
References: <20250126064203.3348494-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250125_224741_274424_DB108B72 
X-CRM114-Status: GOOD (  21.22  )
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

Update source files from linux kernel 6.13-rc7 aa22f4da2a46.
Following changes since 6.8-rc2 41bccc98fb7931d63:
 1) 60f16e912a53a ("ubifs: fix sort function prototype")
 2) ec724e534dfdd ("ubifs: fix function pointer cast warnings")
 3) 39986148bc2ab ("ubifs: fix kernel-doc warnings")
 4) 94f5b1571ec8d ("ubifs: Convert to use ERR_CAST()")
 5) 4617fb8fc15ef ("ubifs: authentication: Fix use-after-free in
		   ubifs_tnc_end_commit")

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/libubifs/README       |  2 +-
 ubifs-utils/libubifs/find.c       | 40 +++++++++++++++++++--------------------
 ubifs-utils/libubifs/lpt.c        |  1 +
 ubifs-utils/libubifs/lpt_commit.c |  4 ++--
 ubifs-utils/libubifs/replay.c     |  1 +
 ubifs-utils/libubifs/tnc_commit.c |  2 ++
 6 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/ubifs-utils/libubifs/README b/ubifs-utils/libubifs/README
index 551ed8e..dd9322a 100644
--- a/ubifs-utils/libubifs/README
+++ b/ubifs-utils/libubifs/README
@@ -1,4 +1,4 @@
-UBIFS Library (Imported from linux kernel 6.8-rc2 41bccc98fb7931d63)
+UBIFS Library (Imported from linux kernel 6.13-rc7 aa22f4da2a46)
 
 * ubifs.h is a selection of definitions from fs/ubifs/ubifs.h from the linux kernel.
 * key.h is copied from fs/ubifs/key.h from the linux kernel.
diff --git a/ubifs-utils/libubifs/find.c b/ubifs-utils/libubifs/find.c
index ecf689c..364252e 100644
--- a/ubifs-utils/libubifs/find.c
+++ b/ubifs-utils/libubifs/find.c
@@ -80,7 +80,7 @@ static int valuable(struct ubifs_info *c, const struct ubifs_lprops *lprops)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -89,8 +89,9 @@ static int valuable(struct ubifs_info *c, const struct ubifs_lprops *lprops)
  */
 static int scan_for_dirty_cb(struct ubifs_info *c,
 			     const struct ubifs_lprops *lprops, int in_tree,
-			     struct scan_data *data)
+			     void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -173,8 +174,7 @@ static const struct ubifs_lprops *scan_for_dirty(struct ubifs_info *c,
 	data.pick_free = pick_free;
 	data.lnum = -1;
 	data.exclude_index = exclude_index;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_dirty_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_for_dirty_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -347,7 +347,7 @@ out:
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -356,8 +356,9 @@ out:
  */
 static int scan_for_free_cb(struct ubifs_info *c,
 			    const struct ubifs_lprops *lprops, int in_tree,
-			    struct scan_data *data)
+			    void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -453,7 +454,7 @@ const struct ubifs_lprops *do_find_free_space(struct ubifs_info *c,
 	data.pick_free = pick_free;
 	data.lnum = -1;
 	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_free_cb,
+				    scan_for_free_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -587,7 +588,7 @@ out:
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -596,8 +597,9 @@ out:
  */
 static int scan_for_idx_cb(struct ubifs_info *c,
 			   const struct ubifs_lprops *lprops, int in_tree,
-			   struct scan_data *data)
+			   void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -632,8 +634,7 @@ static const struct ubifs_lprops *scan_for_leb_for_idx(struct ubifs_info *c)
 	int err;
 
 	data.lnum = -1;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_for_idx_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_for_idx_cb,
 				    &data);
 	if (err)
 		return ERR_PTR(err);
@@ -733,11 +734,10 @@ out:
 	return err;
 }
 
-static int cmp_dirty_idx(const struct ubifs_lprops **a,
-			 const struct ubifs_lprops **b)
+static int cmp_dirty_idx(const void *a, const void *b)
 {
-	const struct ubifs_lprops *lpa = *a;
-	const struct ubifs_lprops *lpb = *b;
+	const struct ubifs_lprops *lpa = *(const struct ubifs_lprops **)a;
+	const struct ubifs_lprops *lpb = *(const struct ubifs_lprops **)b;
 
 	return lpa->dirty + lpa->free - lpb->dirty - lpb->free;
 }
@@ -761,7 +761,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
 	       sizeof(void *) * c->dirty_idx.cnt);
 	/* Sort it so that the dirtiest is now at the end */
 	sort(c->dirty_idx.arr, c->dirty_idx.cnt, sizeof(void *),
-	     (int (*)(const void *, const void *))cmp_dirty_idx, NULL);
+	     cmp_dirty_idx, NULL);
 	dbg_find("found %d dirty index LEBs", c->dirty_idx.cnt);
 	if (c->dirty_idx.cnt)
 		dbg_find("dirtiest index LEB is %d with dirty %d and free %d",
@@ -780,7 +780,7 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
  * @c: the UBIFS file-system description object
  * @lprops: LEB properties to scan
  * @in_tree: whether the LEB properties are in main memory
- * @data: information passed to and from the caller of the scan
+ * @arg: information passed to and from the caller of the scan
  *
  * This function returns a code that indicates whether the scan should continue
  * (%LPT_SCAN_CONTINUE), whether the LEB properties should be added to the tree
@@ -789,8 +789,9 @@ int ubifs_save_dirty_idx_lnums(struct ubifs_info *c)
  */
 static int scan_dirty_idx_cb(struct ubifs_info *c,
 			   const struct ubifs_lprops *lprops, int in_tree,
-			   struct scan_data *data)
+			   void *arg)
 {
+	struct scan_data *data = arg;
 	int ret = LPT_SCAN_CONTINUE;
 
 	/* Exclude LEBs that are currently in use */
@@ -849,8 +850,7 @@ static int find_dirty_idx_leb(struct ubifs_info *c)
 	if (c->pnodes_have >= c->pnode_cnt)
 		/* All pnodes are in memory, so skip scan */
 		return -ENOSPC;
-	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum,
-				    (ubifs_lpt_scan_callback)scan_dirty_idx_cb,
+	err = ubifs_lpt_scan_nolock(c, -1, c->lscan_lnum, scan_dirty_idx_cb,
 				    &data);
 	if (err)
 		return err;
diff --git a/ubifs-utils/libubifs/lpt.c b/ubifs-utils/libubifs/lpt.c
index 8e20a17..f2f2727 100644
--- a/ubifs-utils/libubifs/lpt.c
+++ b/ubifs-utils/libubifs/lpt.c
@@ -2009,6 +2009,7 @@ out_err:
  * @pnode: where to keep a pnode
  * @cnode: where to keep a cnode
  * @in_tree: is the node in the tree in memory
+ * @ptr: union of node pointers
  * @ptr.nnode: pointer to the nnode (if it is an nnode) which may be here or in
  * the tree
  * @ptr.pnode: ditto for pnode
diff --git a/ubifs-utils/libubifs/lpt_commit.c b/ubifs-utils/libubifs/lpt_commit.c
index ee84f80..79f7b14 100644
--- a/ubifs-utils/libubifs/lpt_commit.c
+++ b/ubifs-utils/libubifs/lpt_commit.c
@@ -580,7 +580,7 @@ struct ubifs_pnode *ubifs_find_next_pnode(struct ubifs_info *c,
 	/* Go right */
 	nnode = ubifs_get_nnode(c, nnode, iip);
 	if (IS_ERR(nnode))
-		return (void *)nnode;
+		return ERR_CAST(nnode);
 
 	/* Go down to level 1 */
 	while (nnode->level > 1) {
@@ -597,7 +597,7 @@ struct ubifs_pnode *ubifs_find_next_pnode(struct ubifs_info *c,
 		}
 		nnode = ubifs_get_nnode(c, nnode, iip);
 		if (IS_ERR(nnode))
-			return (void *)nnode;
+			return ERR_CAST(nnode);
 	}
 
 	for (iip = 0; iip < UBIFS_LPT_FANOUT; iip++)
diff --git a/ubifs-utils/libubifs/replay.c b/ubifs-utils/libubifs/replay.c
index 3943b32..9d61133 100644
--- a/ubifs-utils/libubifs/replay.c
+++ b/ubifs-utils/libubifs/replay.c
@@ -34,6 +34,7 @@
  * @lnum: logical eraseblock number of the node
  * @offs: node offset
  * @len: node length
+ * @hash: node hash
  * @deletion: non-zero if this entry corresponds to a node deletion
  * @sqnum: node sequence number
  * @list: links the replay list
diff --git a/ubifs-utils/libubifs/tnc_commit.c b/ubifs-utils/libubifs/tnc_commit.c
index d797006..66922d4 100644
--- a/ubifs-utils/libubifs/tnc_commit.c
+++ b/ubifs-utils/libubifs/tnc_commit.c
@@ -663,6 +663,8 @@ static int get_znodes_to_commit(struct ubifs_info *c)
 		znode->alt = 0;
 		cnext = find_next_dirty(znode);
 		if (!cnext) {
+			ubifs_assert(c, !znode->parent);
+			znode->cparent = NULL;
 			znode->cnext = c->cnext;
 			break;
 		}
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
