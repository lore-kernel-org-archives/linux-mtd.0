Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C813D12D7E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 07:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEXvauS+QvCHJUd8z5hCaJ2fNvgLC0G22xFGtWByzVg=; b=lGV3D9V7N21ekO
	HJtuEnBI3HVOKRdL5LXvJ/k9U2bUWcHUWAxFiQFXznXN09+DtVTkuqZfIGzC0k/cQJnqikdiICceK
	oz3A7yoh7cvkoeM6d4RnXxUfdn59+T9ZhMwgHnzH757SVpDLa+bBhlwEtx+zCvlpzEM5VqvVGBwVr
	z9QhdVgKb73+6fPX1JL1kEwe6W8G+c9DOKqpjXYObSls2Zjin1fG6h7kh+WdbT6IxjC5SpRstYmDv
	iLz00XtqPHdrE4WLggtNOGZA5X1px2YCVo3kMtLWHXFUByv7rfntdmwD1dP0z7+bK51sMC+Ye3tm8
	2NfIfvMzNWTImdB6gSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOWB-0000000Gakz-0szf;
	Mon, 11 Nov 2024 07:07:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOV3-0000000GZrz-3NH5
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Nov 2024 07:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ke5PlkidvWVBZ08CRj24Xa0sIXx0V2Ulg9Fg7tOhQQg=; b=VIUleBSVt3iNCoigA9MZycGYmA
	lHWh014IOTI0JdGEyAHLqVtPEz3xzFBL6XtnB0EdxpbvLipKXWDKExMm4geMGL/U012Lvn3hZOZYy
	r5ieZZAykxErPB0Qf6PRGNMBjUvy2YNpx8sDQy2kq7q93nnkcbA2wsQkgoRVGE2R3B2v8Fo9hDuhi
	lnh0yCLgYGg0fnKe/mU9nK++FBypXVYe+Z0AFEpuYy2IS9HFto6GKhf1Tg5cBP/yz4RXBKgy0bBkf
	cHE2QB7KxHGp0/QWhUTCLTqJouxVnmNqvkkkhv7YxkQ9oeQMZZ3NgHniFAZAXoLqOI7LOanShSWe5
	RCqY92MQ==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAOUd-0000000CmJd-1nmm
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 07:05:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Xn0rf4mrLz1hwTV;
	Mon, 11 Nov 2024 15:03:46 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D8EA1A0188;
	Mon, 11 Nov 2024 15:05:34 +0800 (CST)
Received: from huawei.com (10.175.112.188) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 Nov
 2024 15:05:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<yi.zhang@huawei.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH mtd-utils v2 066/102] fsck.ubifs: rebuild_fs: Write master node
Date: Mon, 11 Nov 2024 15:03:09 +0800
Message-ID: <20241111070346.1314122-67-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241111070346.1314122-1-chengzhihao1@huawei.com>
References: <20241111070346.1314122-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.188]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_070550_959441_52650822 
X-CRM114-Status: GOOD (  10.36  )
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

This is the 12/12 step of rebuilding. Since all meta areas are ready,
master node can be updated. After this step, a consistent UBIFS image
can be mounted, and it should pass all tests from chk_fs, chk_general,
chk_index, chk_lprops and chk_orphans.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/fsck.ubifs/rebuild_fs.c | 78 +++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index 9ea4c224..382687b3 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -1126,6 +1126,7 @@ static int record_file_used_lebs(struct ubifs_info *c,
 		 file->ino.is_xattr ? "xattr" :
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 c->dev_name);
+	c->highest_inum = max_t(ino_t, c->highest_inum, file->inum);
 
 	err = parse_node_info(c, &file->ino.header, &file->ino.key,
 			      NULL, 0, idx_list, idx_cnt);
@@ -1345,6 +1346,75 @@ static int clean_log(struct ubifs_info *c)
 }
 
 /**
+ * write_master - write master nodes.
+ * @c: UBIFS file-system description object
+ *
+ * This function updates meta information into master node and writes master
+ * node into master area.
+ */
+static int write_master(struct ubifs_info *c)
+{
+	int err, lnum;
+	struct ubifs_mst_node *mst;
+
+	mst = kzalloc(c->mst_node_alsz, GFP_KERNEL);
+	if (!mst)
+		return -ENOMEM;
+
+	mst->ch.node_type = UBIFS_MST_NODE;
+	mst->log_lnum     = cpu_to_le32(UBIFS_LOG_LNUM);
+	mst->highest_inum = cpu_to_le64(c->highest_inum);
+	mst->cmt_no       = 0;
+	mst->root_lnum    = cpu_to_le32(c->zroot.lnum);
+	mst->root_offs    = cpu_to_le32(c->zroot.offs);
+	mst->root_len     = cpu_to_le32(c->zroot.len);
+	mst->gc_lnum      = cpu_to_le32(c->gc_lnum);
+	mst->ihead_lnum   = cpu_to_le32(c->ihead_lnum);
+	mst->ihead_offs   = cpu_to_le32(c->ihead_offs);
+	mst->index_size   = cpu_to_le64(c->calc_idx_sz);
+	mst->lpt_lnum     = cpu_to_le32(c->lpt_lnum);
+	mst->lpt_offs     = cpu_to_le32(c->lpt_offs);
+	mst->nhead_lnum   = cpu_to_le32(c->nhead_lnum);
+	mst->nhead_offs   = cpu_to_le32(c->nhead_offs);
+	mst->ltab_lnum    = cpu_to_le32(c->ltab_lnum);
+	mst->ltab_offs    = cpu_to_le32(c->ltab_offs);
+	mst->lsave_lnum   = cpu_to_le32(c->lsave_lnum);
+	mst->lsave_offs   = cpu_to_le32(c->lsave_offs);
+	mst->lscan_lnum   = cpu_to_le32(c->main_first);
+	mst->empty_lebs   = cpu_to_le32(c->lst.empty_lebs);
+	mst->idx_lebs     = cpu_to_le32(c->lst.idx_lebs);
+	mst->leb_cnt      = cpu_to_le32(c->leb_cnt);
+	mst->total_free   = cpu_to_le64(c->lst.total_free);
+	mst->total_dirty  = cpu_to_le64(c->lst.total_dirty);
+	mst->total_used   = cpu_to_le64(c->lst.total_used);
+	mst->total_dead   = cpu_to_le64(c->lst.total_dead);
+	mst->total_dark   = cpu_to_le64(c->lst.total_dark);
+	mst->flags	  |= cpu_to_le32(UBIFS_MST_NO_ORPHS);
+
+	lnum = UBIFS_MST_LNUM;
+	err = ubifs_leb_unmap(c, lnum);
+	if (err)
+		goto out;
+	err = ubifs_write_node_hmac(c, mst, UBIFS_MST_NODE_SZ, lnum, 0,
+				    offsetof(struct ubifs_mst_node, hmac));
+	if (err)
+		goto out;
+	lnum++;
+	err = ubifs_leb_unmap(c, lnum);
+	if (err)
+		goto out;
+	err = ubifs_write_node_hmac(c, mst, UBIFS_MST_NODE_SZ, lnum, 0,
+				    offsetof(struct ubifs_mst_node, hmac));
+	if (err)
+		goto out;
+
+out:
+	kfree(mst);
+
+	return err;
+}
+
+/**
  * ubifs_rebuild_filesystem - Rebuild filesystem.
  * @c: UBIFS file-system description object
  *
@@ -1429,6 +1499,14 @@ int ubifs_rebuild_filesystem(struct ubifs_info *c)
 		goto out;
 	}
 	err = ubifs_clear_orphans(c);
+	if (err) {
+		exit_code |= FSCK_ERROR;
+		goto out;
+	}
+
+	/* Step 12. Write master node. */
+	log_out(c, "Write master");
+	err = write_master(c);
 	if (err)
 		exit_code |= FSCK_ERROR;
 
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
