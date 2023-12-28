Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C26FC46CD4
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MHAbzwQ8BQULnqlXxgPvvD0kwOEVWluvq5nw275/rqE=; b=GOFCgsNMkr/A1K
	IanMOx7Et+658KueAl9SHvjDXtr11uFwsveuirzzT7I/rILjent5Ig9X8c5f3e/fznWOUMifgZzfJ
	32xapCx3jgjcdAMe74UZnOrias0LSgIQg7ObNv3oCTY+O8xhZdzXqOMt4WKS7Qutzr8s4+o6PXnh+
	DGmj0VDV82nuemjZcmK/pC1iTxc1zP9poUETBwfCn7vd5ZYemvqIiHuCH5xzQndUjsTOdyx+wSsRB
	v3rYxP5kL3yZscCb3W51BnWasrHRBPedI/ayXGw/dFj7gFeGS4NH00S2R6fnzf2j8c1h04DDNgYUD
	CYKxGBPmhSmy0ez5omyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfN6-00Fqhl-2j;
	Thu, 28 Dec 2023 01:39:40 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfMw-00FqaA-10
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:39:38 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4T0rgD571Xz1FGNZ;
	Thu, 28 Dec 2023 09:35:36 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id A40321A019B;
	Thu, 28 Dec 2023 09:39:13 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:38:15 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 15/17] ubifs: repair: Write master node
Date: Thu, 28 Dec 2023 09:41:10 +0800
Message-ID: <20231228014112.2836317-16-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228014112.2836317-1-chengzhihao1@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173930_717958_9A5401DF 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

This is the 13/13 step of repairing. Since all meta areas are ready,
master node can be updated. After this step, a consistent UBIFS image
can be mounted, and it should pass all tests from chk_fs, chk_general,
chk_index, chk_lprops and chk_orphans.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/repair.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/fs/ubifs/repair.c b/fs/ubifs/repair.c
index 42124cda5d7d..f2600bbb1431 100644
--- a/fs/ubifs/repair.c
+++ b/fs/ubifs/repair.c
@@ -2225,6 +2225,8 @@ static int traverse_files_and_nodes(struct ubifs_info *c)
 		     ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		     c->vi.ubi_num, c->vi.vol_id);
 
+		c->highest_inum = max(c->highest_inum, file->inum);
+
 		err = parse_node_info(c, &file->ino.header, &file->ino.key,
 				      NULL, 0, &idx_list, &idx_cnt);
 		if (err)
@@ -2404,6 +2406,75 @@ static int clean_log(struct ubifs_info *c)
 	return 0;
 }
 
+/**
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
 static int do_repair(struct ubifs_info *c)
 {
 	int err = 0;
@@ -2463,6 +2534,12 @@ static int do_repair(struct ubifs_info *c)
 		goto out;
 
 	err = ubifs_clear_orphans(c);
+	if (err)
+		goto out;
+
+	/* Step 13. Write master node. */
+	ubifs_msg(c, "Step 13: Write master");
+	err = write_master(c);
 
 out:
 	destroy_scanned_info(c, &si);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
