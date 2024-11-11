Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04674D2E9C7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+hDe27m8E6wnn7ITOQaIqxl26A2DYVVOYG8xmbTGqM=; b=38CSIU2heWCOqp
	nvfREL95i9M/Kci5wOk6E3w0/VfYOL70NoOEshGsaOxpUYfk9dd+9tOq2lxKCXdoPn2R6GozDiPiK
	cesJYgZPbaWkrhnY/pnqv0Q7+RlRLp/X1VcjQ4DxelTTULTY4YG2dOoziEFVS5VYhHUH3Bd46hFYq
	/E/XmkziWk+c0pI/krrj61KUVtJkZWM7cwHRNQookjpnTsJTex4LiwzR/SB29arwkvRrTyRMXL8Ug
	OYmLjkQkwqwYUthM3QD6Rzw2xvMqM1Kx+mYEaCSkSKaUaP+YXDRHAY0a4dxSxx/wU1jUGIY6rcJgy
	pakfQmn2JJ/Mr+ywWYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQI0-0000000Gwzp-28kV;
	Mon, 11 Nov 2024 09:00:52 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQGH-0000000Gvbh-2hAa
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 08:59:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xn3JG3HPhz28fSM;
	Mon, 11 Nov 2024 16:54:22 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id E07AE180043;
	Mon, 11 Nov 2024 16:59:03 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 16:59:03 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 RESEND 064/102] fsck.ubifs: rebuild_fs: Build LPT
Date: Mon, 11 Nov 2024 16:57:35 +0800
Message-ID: <20241111085741.2066378-25-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111085741.2066378-1-chengzhihao1@huawei.com>
References: <20241111085741.2066378-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_005906_291297_39188A65 
X-CRM114-Status: GOOD (  21.94  )
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

This is the 10/12 step of rebuilding. All LEBs' properties can be
calculated in previous steps according to all nodes' position, then
construct LPT just like mkfs does, and write LPT on flash.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/fsck.ubifs.h |   2 +
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 149 ++++++++++++++++++++++++++++--------
 ubifs-utils/libubifs/ubifs.h        |   2 +
 3 files changed, 119 insertions(+), 34 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/fsck.ubifs.h b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
index fb72d8af..d25ecc2d 100644
--- a/ubifs-utils/fsck.ubifs/fsck.ubifs.h
+++ b/ubifs-utils/fsck.ubifs/fsck.ubifs.h
@@ -186,6 +186,7 @@ struct scanned_file {
  * @write_buf: write buffer for LEB @head_lnum
  * @head_lnum: current writing LEB number
  * @head_offs: current writing position in LEB @head_lnum
+ * @need_update_lpt: whether to update lpt while writing index nodes
  */
 struct ubifs_rebuild_info {
 	unsigned long *used_lebs;
@@ -194,6 +195,7 @@ struct ubifs_rebuild_info {
 	void *write_buf;
 	int head_lnum;
 	int head_offs;
+	bool need_update_lpt;
 };
 
 /**
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index e1d1957f..085df2b9 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -489,6 +489,22 @@ lookup_valid_dent_node(struct ubifs_info *c, struct scanned_info *si,
 	return NULL;
 }
 
+static void update_lpt(struct ubifs_info *c, struct scanned_node *sn,
+		       bool deleted)
+{
+	int index = sn->lnum - c->main_first;
+	int pos = sn->offs + ALIGN(sn->len, 8);
+
+	set_bit(index, FSCK(c)->rebuild->used_lebs);
+	FSCK(c)->rebuild->lpts[index].end = max_t(int,
+					FSCK(c)->rebuild->lpts[index].end, pos);
+
+	if (deleted)
+		return;
+
+	FSCK(c)->rebuild->lpts[index].used += ALIGN(sn->len, 8);
+}
+
 /**
  * remove_del_nodes - remove deleted nodes from valid node tree.
  * @c: UBIFS file-system description object
@@ -512,13 +528,7 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_ino_node = lookup_valid_ino_node(c, si, del_ino_node);
 		if (valid_ino_node) {
-			int lnum = del_ino_node->header.lnum - c->main_first;
-			int pos = del_ino_node->header.offs +
-				  ALIGN(del_ino_node->header.len, 8);
-
-			set_bit(lnum, FSCK(c)->rebuild->used_lebs);
-			FSCK(c)->rebuild->lpts[lnum].end =
-				max_t(int, FSCK(c)->rebuild->lpts[lnum].end, pos);
+			update_lpt(c, &del_ino_node->header, true);
 			rb_erase(&valid_ino_node->rb, &si->valid_inos);
 			kfree(valid_ino_node);
 		}
@@ -534,13 +544,7 @@ static void remove_del_nodes(struct ubifs_info *c, struct scanned_info *si)
 
 		valid_dent_node = lookup_valid_dent_node(c, si, del_dent_node);
 		if (valid_dent_node) {
-			int lnum = del_dent_node->header.lnum - c->main_first;
-			int pos = del_dent_node->header.offs +
-				  ALIGN(del_dent_node->header.len, 8);
-
-			set_bit(lnum, FSCK(c)->rebuild->used_lebs);
-			FSCK(c)->rebuild->lpts[lnum].end =
-				max_t(int, FSCK(c)->rebuild->lpts[lnum].end, pos);
+			update_lpt(c, &del_dent_node->header, true);
 			rb_erase(&valid_dent_node->rb, &si->valid_dents);
 			kfree(valid_dent_node);
 		}
@@ -730,12 +734,12 @@ static void init_root_ino(struct ubifs_info *c, struct ubifs_ino_node *ino)
  * get_free_leb - get a free LEB according to @FSCK(c)->rebuild->used_lebs.
  * @c: UBIFS file-system description object
  *
- * This function tries to find a free LEB, %0 is returned if found, otherwise
- * %ENOSPC is returned.
+ * This function tries to find a free LEB, lnum is returned if found, otherwise
+ * %-ENOSPC is returned.
  */
 static int get_free_leb(struct ubifs_info *c)
 {
-	int lnum, err;
+	int lnum;
 
 	lnum = find_next_zero_bit(FSCK(c)->rebuild->used_lebs, c->main_lebs, 0);
 	if (lnum >= c->main_lebs) {
@@ -745,14 +749,7 @@ static int get_free_leb(struct ubifs_info *c)
 	set_bit(lnum, FSCK(c)->rebuild->used_lebs);
 	lnum += c->main_first;
 
-	err = ubifs_leb_unmap(c, lnum);
-	if (err)
-		return err;
-
-	FSCK(c)->rebuild->head_lnum = lnum;
-	FSCK(c)->rebuild->head_offs = 0;
-
-	return 0;
+	return lnum;
 }
 
 /**
@@ -780,6 +777,14 @@ static int flush_write_buf(struct ubifs_info *c)
 	if (err)
 		return err;
 
+	if (FSCK(c)->rebuild->need_update_lpt) {
+		int index = FSCK(c)->rebuild->head_lnum - c->main_first;
+
+		FSCK(c)->rebuild->lpts[index].free = c->leb_size - len;
+		FSCK(c)->rebuild->lpts[index].dirty = pad;
+		FSCK(c)->rebuild->lpts[index].flags = LPROPS_INDEX;
+	}
+
 	FSCK(c)->rebuild->head_lnum = -1;
 
 	return 0;
@@ -797,13 +802,20 @@ static int flush_write_buf(struct ubifs_info *c)
  */
 static int reserve_space(struct ubifs_info *c, int len, int *lnum, int *offs)
 {
-	int err;
+	int err, new_lnum;
 
 	if (FSCK(c)->rebuild->head_lnum == -1) {
 get_new:
-		err = get_free_leb(c);
+		new_lnum = get_free_leb(c);
+		if (new_lnum < 0)
+			return new_lnum;
+
+		err = ubifs_leb_unmap(c, new_lnum);
 		if (err)
 			return err;
+
+		FSCK(c)->rebuild->head_lnum = new_lnum;
+		FSCK(c)->rebuild->head_offs = 0;
 	}
 
 	if (len > c->leb_size - FSCK(c)->rebuild->head_offs) {
@@ -921,15 +933,9 @@ static int parse_node_info(struct ubifs_info *c, struct scanned_node *sn,
 			   union ubifs_key *key, char *name, int name_len,
 			   struct list_head *idx_list, int *idx_cnt)
 {
-	int lnum, pos;
 	struct idx_entry *e;
 
-	lnum = sn->lnum - c->main_first;
-	pos = sn->offs + ALIGN(sn->len, 8);
-
-	set_bit(lnum, FSCK(c)->rebuild->used_lebs);
-	FSCK(c)->rebuild->lpts[lnum].end = max_t(int,
-					FSCK(c)->rebuild->lpts[lnum].end, pos);
+	update_lpt(c, sn, idx_cnt == NULL);
 
 	if (idx_cnt == NULL)
 		/* Skip truncation node. */
@@ -1026,6 +1032,7 @@ static int build_tnc(struct ubifs_info *c, struct list_head *lower_idxs,
 		return -ENOMEM;
 
 	list_sort(c, lower_idxs, cmp_idx);
+	FSCK(c)->rebuild->need_update_lpt = true;
 
 	ubifs_assert(c, lower_cnt != 0);
 
@@ -1089,6 +1096,7 @@ static int build_tnc(struct ubifs_info *c, struct list_head *lower_idxs,
 
 	/* Flush the last index LEB */
 	err = flush_write_buf(c);
+	FSCK(c)->rebuild->need_update_lpt = false;
 
 out:
 	list_for_each_entry_safe(e, tmp_e, lower_idxs, list) {
@@ -1239,6 +1247,71 @@ out_idx_list:
 }
 
 /**
+ * build_lpt - construct LPT and write it into flash.
+ * @c: UBIFS file-system description object
+ *
+ * This function builds LPT according to @FSCK(c)->rebuild->lpts and writes
+ * LPT into flash.
+ */
+static int build_lpt(struct ubifs_info *c)
+{
+	int i, len, free, dirty, lnum;
+	u8 hash_lpt[UBIFS_HASH_ARR_SZ];
+
+	memset(&c->lst, 0, sizeof(struct ubifs_lp_stats));
+	/* Set gc lnum. */
+	lnum = get_free_leb(c);
+	if (lnum < 0)
+		return lnum;
+	c->gc_lnum = lnum;
+
+	/* Update LPT. */
+	for (i = 0; i < c->main_lebs; i++) {
+		if (!test_bit(i, FSCK(c)->rebuild->used_lebs) ||
+		    c->gc_lnum == i + c->main_first) {
+			free = c->leb_size;
+			dirty = 0;
+		} else if (FSCK(c)->rebuild->lpts[i].flags & LPROPS_INDEX) {
+			free = FSCK(c)->rebuild->lpts[i].free;
+			dirty = FSCK(c)->rebuild->lpts[i].dirty;
+		} else {
+			len = ALIGN(FSCK(c)->rebuild->lpts[i].end, c->min_io_size);
+			free = c->leb_size - len;
+			dirty = len - FSCK(c)->rebuild->lpts[i].used;
+
+			if (dirty == c->leb_size) {
+				free = c->leb_size;
+				dirty = 0;
+			}
+		}
+
+		FSCK(c)->rebuild->lpts[i].free = free;
+		FSCK(c)->rebuild->lpts[i].dirty = dirty;
+		c->lst.total_free += free;
+		c->lst.total_dirty += dirty;
+
+		if (free == c->leb_size)
+			c->lst.empty_lebs++;
+
+		if (!(FSCK(c)->rebuild->lpts[i].flags & LPROPS_INDEX)) {
+			int spc;
+
+			spc = free + dirty;
+			if (spc < c->dead_wm)
+				c->lst.total_dead += spc;
+			else
+				c->lst.total_dark += ubifs_calc_dark(c, spc);
+			c->lst.total_used += c->leb_size - spc;
+		} else {
+			c->lst.idx_lebs += 1;
+		}
+	}
+
+	/* Write LPT. */
+	return ubifs_create_lpt(c, FSCK(c)->rebuild->lpts, c->main_lebs, hash_lpt);
+}
+
+/**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
  *
@@ -1302,6 +1375,14 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 	 * Step 9: Build TNC.
 	 */
 	err = traverse_files_and_nodes(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 10. Build LPT. */
+	log_out(c, "Build LPT");
+	err = build_lpt(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index c9d582da..6f965555 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -338,6 +338,7 @@ enum {
  * @flags: LEB properties flags (see above)
  * @lnum: LEB number
  * @end: the end postition of LEB calculated by the last node
+ * @used: amount of used space in bytes
  * @list: list of same-category lprops (for LPROPS_EMPTY and LPROPS_FREEABLE)
  * @hpos: heap position in heap of same-category lprops (other categories)
  */
@@ -347,6 +348,7 @@ struct ubifs_lprops {
 	int flags;
 	int lnum;
 	int end;
+	int used;
 	union {
 		struct list_head list;
 		int hpos;
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
