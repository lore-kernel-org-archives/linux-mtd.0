Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A7C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qfUL4A7F9Wfbu93zXRAeNVWDRZb0mGj7tYpECo53gk=; b=FFffjfgTS6Sffa
	atFyV/6h/pq8pJ9nFX8GxDwAQhrCViZXfSoKhGa+lR3dKvmuhXG5op84E/0VikYuXjEbr5Tjvxlsz
	07fqiX/WojWQz7RT5HuhmHcB83X77w8FFMEOZd3poEUs4UlH03GKDZkYm3m9qnAh/9Dp6Jlz+hcmw
	1Am0c2Apsf45yLx7M4L8HqtPpDHnKupT56rHMRzWwi1/iW5RsF7g8/82p994JlWwZdDqgbokQnWX9
	AnNxLwkbAnOuaLr3ik3A9WjXhJb03gGgUtG+v6TLquJRF5VaihkJMV4aBG2nzALZJKXQFHiX6/PM9
	+pcnsEg+eQIcZU3dkvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfMH-00Fq1l-2t;
	Thu, 28 Dec 2023 01:38:49 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfMC-00Fpux-35
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:38:48 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4T0rjG6llHz1R701;
	Thu, 28 Dec 2023 09:37:22 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 812111A019E;
	Thu, 28 Dec 2023 09:38:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:38:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 12/17] ubifs: Extract a helper function to create lpt
Date: Thu, 28 Dec 2023 09:41:07 +0800
Message-ID: <20231228014112.2836317-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228014112.2836317-1-chengzhihao1@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173845_326411_E7EC5413 
X-CRM114-Status: GOOD (  25.15  )
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

Abstract a helper function to create lpt, this is a preparation to
add lpt creation support in ubifs_repair.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/lpt.c    | 140 ++++++++++++++++++++++++++--------------------
 fs/ubifs/repair.h |  11 +---
 fs/ubifs/ubifs.h  |  18 ++++++
 3 files changed, 98 insertions(+), 71 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 778a22bf9a92..fa50ad5106d4 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -586,20 +586,21 @@ static int calc_pnode_num_from_parent(const struct ubifs_info *c,
 }
 
 /**
- * ubifs_create_dflt_lpt - create default LPT.
+ * ubifs_create_lpt - create lpt acccording to lprops array.
  * @c: UBIFS file-system description object
- * @main_lebs: number of main area LEBs is passed and returned here
- * @lpt_first: LEB number of first LPT LEB
- * @lpt_lebs: number of LEBs for LPT is passed and returned here
- * @big_lpt: use big LPT model is passed and returned here
+ * @lps: lprops array to record logical eraseblock properties
+ * @lp_cnt: the length of @lps
  * @hash: hash of the LPT is returned here
  *
- * This function returns %0 on success and a negative error code on failure.
+ * This function creates lpt, the pnode will be initialized based on
+ * corresponding elements in @lps. If there are no corresponding lprops
+ * (eg. @lp_cnt is smaller than @c->main_lebs), the LEB property is set
+ * as free state.
  */
-int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
-			  int *lpt_lebs, int *big_lpt, u8 *hash)
+int ubifs_create_lpt(struct ubifs_info *c, struct lprops *lps, int lp_cnt,
+		     u8 *hash)
 {
-	int lnum, err = 0, node_sz, iopos, i, j, cnt, len, alen, row;
+	int lnum, err = 0, i, j, cnt, len, alen, row;
 	int blnum, boffs, bsz, bcnt;
 	struct ubifs_pnode *pnode = NULL;
 	struct ubifs_nnode *nnode = NULL;
@@ -608,18 +609,6 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	int *lsave = NULL;
 	struct shash_desc *desc;
 
-	err = calc_dflt_lpt_geom(c, main_lebs, big_lpt);
-	if (err)
-		return err;
-	*lpt_lebs = c->lpt_lebs;
-
-	/* Needed by 'ubifs_pack_nnode()' and 'set_ltab()' */
-	c->lpt_first = lpt_first;
-	/* Needed by 'set_ltab()' */
-	c->lpt_last = lpt_first + c->lpt_lebs - 1;
-	/* Needed by 'ubifs_pack_lsave()' */
-	c->main_first = c->leb_cnt - *main_lebs;
-
 	desc = ubifs_hash_get_desc(c);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
@@ -646,47 +635,12 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 		ltab[i].cmt = 0;
 	}
 
-	lnum = lpt_first;
+	lnum = c->lpt_first;
 	p = buf;
+	len = 0;
 	/* Number of leaf nodes (pnodes) */
 	cnt = c->pnode_cnt;
 
-	/*
-	 * The first pnode contains the LEB properties for the LEBs that contain
-	 * the root inode node and the root index node of the index tree.
-	 */
-	node_sz = ALIGN(ubifs_idx_node_sz(c, 1), 8);
-	iopos = ALIGN(node_sz, c->min_io_size);
-	pnode->lprops[0].free = c->leb_size - iopos;
-	pnode->lprops[0].dirty = iopos - node_sz;
-	pnode->lprops[0].flags = LPROPS_INDEX;
-
-	node_sz = UBIFS_INO_NODE_SZ;
-	iopos = ALIGN(node_sz, c->min_io_size);
-	pnode->lprops[1].free = c->leb_size - iopos;
-	pnode->lprops[1].dirty = iopos - node_sz;
-
-	for (i = 2; i < UBIFS_LPT_FANOUT; i++)
-		pnode->lprops[i].free = c->leb_size;
-
-	/* Add first pnode */
-	ubifs_pack_pnode(c, p, pnode);
-	err = ubifs_shash_update(c, desc, p, c->pnode_sz);
-	if (err)
-		goto out;
-
-	p += c->pnode_sz;
-	len = c->pnode_sz;
-	pnode->num += 1;
-
-	/* Reset pnode values for remaining pnodes */
-	pnode->lprops[0].free = c->leb_size;
-	pnode->lprops[0].dirty = 0;
-	pnode->lprops[0].flags = 0;
-
-	pnode->lprops[1].free = c->leb_size;
-	pnode->lprops[1].dirty = 0;
-
 	/*
 	 * To calculate the internal node branches, we keep information about
 	 * the level below.
@@ -696,8 +650,8 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	bcnt = cnt; /* Number of nodes in level below */
 	bsz = c->pnode_sz; /* Size of nodes in level below */
 
-	/* Add all remaining pnodes */
-	for (i = 1; i < cnt; i++) {
+	/* Add all pnodes */
+	for (i = 0; i < cnt; i++) {
 		if (len + c->pnode_sz > c->leb_size) {
 			alen = ALIGN(len, c->min_io_size);
 			set_ltab(c, lnum, c->leb_size - alen, alen - len);
@@ -708,6 +662,20 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 			p = buf;
 			len = 0;
 		}
+		/* Fill in the pnode */
+		for (j = 0; j < UBIFS_LPT_FANOUT; j++) {
+			int k = (i << UBIFS_LPT_FANOUT_SHIFT) + j;
+
+			if (k < lp_cnt) {
+				pnode->lprops[j].free = lps[k].free;
+				pnode->lprops[j].dirty = lps[k].dirty;
+				pnode->lprops[j].flags = lps[k].flags;
+			} else {
+				pnode->lprops[j].free = c->leb_size;
+				pnode->lprops[j].dirty = 0;
+				pnode->lprops[j].flags = 0;
+			}
+		}
 		ubifs_pack_pnode(c, p, pnode);
 		err = ubifs_shash_update(c, desc, p, c->pnode_sz);
 		if (err)
@@ -777,7 +745,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 		row -= 1;
 	}
 
-	if (*big_lpt) {
+	if (c->big_lpt) {
 		/* Need to add LPT's save table */
 		if (len + c->lsave_sz > c->leb_size) {
 			alen = ALIGN(len, c->min_io_size);
@@ -793,7 +761,7 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 		c->lsave_lnum = lnum;
 		c->lsave_offs = len;
 
-		for (i = 0; i < c->lsave_cnt && i < *main_lebs; i++)
+		for (i = 0; i < c->lsave_cnt && i < c->main_lebs; i++)
 			lsave[i] = c->main_first + i;
 		for (; i < c->lsave_cnt; i++)
 			lsave[i] = c->main_first;
@@ -868,6 +836,54 @@ int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 	return err;
 }
 
+/**
+ * ubifs_create_dflt_lpt - create default LPT.
+ * @c: UBIFS file-system description object
+ * @main_lebs: number of main area LEBs is passed and returned here
+ * @lpt_first: LEB number of first LPT LEB
+ * @lpt_lebs: number of LEBs for LPT is passed and returned here
+ * @big_lpt: use big LPT model is passed and returned here
+ * @hash: hash of the LPT is returned here
+ *
+ * This function returns %0 on success and a negative error code on failure.
+ */
+int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
+			  int *lpt_lebs, int *big_lpt, u8 *hash)
+{
+	int node_sz, iopos, err = 0;
+	struct lprops lps[2];
+
+	err = calc_dflt_lpt_geom(c, main_lebs, big_lpt);
+	if (err)
+		return err;
+	*lpt_lebs = c->lpt_lebs;
+
+	/* Needed by 'ubifs_pack_nnode()' and 'set_ltab()' */
+	c->lpt_first = lpt_first;
+	/* Needed by 'set_ltab()' */
+	c->lpt_last = lpt_first + c->lpt_lebs - 1;
+	/* Needed by 'ubifs_pack_lsave()' */
+	c->main_first = c->leb_cnt - *main_lebs;
+
+	/*
+	 * The first pnode contains the LEB properties for the LEBs that contain
+	 * the root inode node and the root index node of the index tree.
+	 */
+	node_sz = ALIGN(ubifs_idx_node_sz(c, 1), 8);
+	iopos = ALIGN(node_sz, c->min_io_size);
+	lps[0].free = c->leb_size - iopos;
+	lps[0].dirty = iopos - node_sz;
+	lps[0].flags = LPROPS_INDEX;
+
+	node_sz = UBIFS_INO_NODE_SZ;
+	iopos = ALIGN(node_sz, c->min_io_size);
+	lps[1].free = c->leb_size - iopos;
+	lps[1].dirty = iopos - node_sz;
+	lps[1].flags = 0;
+
+	return ubifs_create_lpt(c, lps, 2, hash);
+}
+
 /**
  * update_cats - add LEB properties of a pnode to LEB category lists and heaps.
  * @c: UBIFS file-system description object
diff --git a/fs/ubifs/repair.h b/fs/ubifs/repair.h
index e3b879b3f999..f8d18f07e324 100644
--- a/fs/ubifs/repair.h
+++ b/fs/ubifs/repair.h
@@ -151,15 +151,6 @@ struct scanned_file {
 	struct rb_root data_nodes;
 };
 
-
-/**
- * lprops - logical eraseblock properties.
- * @end: the end postition of LEB calculated by the last node
- */
-struct lprops {
-	int end;
-};
-
 /**
  * ubifs_repair_info - per-FS repairing information.
  * @usen_lebs: a bitmap used for recording used lebs
@@ -168,6 +159,7 @@ struct lprops {
  * @write_buf: write buffer for LEB @head_lnum
  * @head_lnum: current writing LEB number
  * @head_offs: current writing position in LEB @head_lnum
+ * @need_update_lpt: whether to update lpt while writing index nodes
  */
 struct ubifs_repair_info {
 	unsigned long *used_lebs;
@@ -176,6 +168,7 @@ struct ubifs_repair_info {
 	void *write_buf;
 	int head_lnum;
 	int head_offs;
+	bool need_update_lpt;
 };
 
 #endif /* !__UBIFS_REPAIR_H__ */
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 7d66440623cb..5fe28980d151 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -495,6 +495,22 @@ struct ubifs_lprops {
 	};
 };
 
+/**
+ * struct lprops - logical eraseblock properties.
+ * @free: amount of free space in bytes
+ * @dirty: amount of dirty space in bytes
+ * @used: amount of used space in bytes
+ * @flags: LEB properties flags
+ * @end: the end postition of LEB calculated by the last node
+ */
+struct lprops {
+	int free;
+	int dirty;
+	int used;
+	int flags;
+	int end;
+};
+
 /**
  * struct ubifs_lpt_lprops - LPT logical eraseblock properties.
  * @free: amount of free space in bytes
@@ -2020,6 +2036,8 @@ int ubifs_clear_orphans(struct ubifs_info *c);
 
 /* lpt.c */
 int ubifs_calc_lpt_geom(struct ubifs_info *c);
+int ubifs_create_lpt(struct ubifs_info *c, struct lprops *lps, int lp_cnt,
+		     u8 *hash);
 int ubifs_create_dflt_lpt(struct ubifs_info *c, int *main_lebs, int lpt_first,
 			  int *lpt_lebs, int *big_lpt, u8 *hash);
 int ubifs_lpt_init(struct ubifs_info *c, int rd, int wr);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
