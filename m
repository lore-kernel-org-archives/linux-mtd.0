Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE01AC27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEXvauS+QvCHJUd8z5hCaJ2fNvgLC0G22xFGtWByzVg=; b=0YygJPv9xRh4O4
	r4gamjF/2Spt4avF8y4lruFtKv1OpytyUKJLvT1CV1qMQsuP9cYV2sm/p93DQG7KjpUR+dLqGls+E
	IlJ/RKM7Yt9JyvZ7hsLdmQgoBMig2+MvCw9q8NqYAe5Fgl86s2jpJmcxM5L1H7CggKF6JjHdp7wYy
	ZHoynl6ioHBf+31S75bFTRk4Ih8JAMUQv2FeiCfvTIHg3Ob+p1MBJ+IwsLuJHqHo/K8Q8NbSEQVhw
	bicK/qyjHOqbXer0X1IeF1T3ePj/KBxp96YFM9w/Rpk6CoxUYwEDY8HZNxEATU03SLduG9s2X0H0Z
	DWY5XkaY/rGpAAgPk4OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRGP-0000000CJvk-21Fk;
	Fri, 07 Jun 2024 04:31:41 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRCY-0000000CGtn-1dwN
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:28:10 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwSnM3vqzzdZh7;
	Fri,  7 Jun 2024 12:26:15 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 716FE180085;
	Fri,  7 Jun 2024 12:27:40 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:27:22 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 075/110] fsck.ubifs: rebuild_fs: Write master node
Date: Fri, 7 Jun 2024 12:25:40 +0800
Message-ID: <20240607042615.2069840-76-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212743_279331_532BB5DC 
X-CRM114-Status: GOOD (  10.20  )
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
