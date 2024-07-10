Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B23C3DA41
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfBq4prx5TGRvetvcQIbN9MLdbTNvhPt7GN+u6TM5QU=; b=PrEJVDl9mTKIyE
	j4e/WU9D2WcrS4LbwgkV5fiad0wRHJjR5BwSU6i4jGNishhQjKkZMg4Syg2cyOf8nWGx2HeExueIS
	+FMKZE+hDqDs21faO7WQBFMPOsr7Fd3VVVXyDaY2r0FNuzuuQDCIno/g9x5lhrY3GNLumYI+w15Z9
	38nBaW1JgxRDS7l82z30LMlXBz5Jto+QVLStnKO3eCX9EQ3E2fWV1tLgj3/X0xWf6Qqyst42Jmpzq
	SSTmE1xK9DD7Hm12EJMkgFZxHktCS++VXw6SItF6ckFmWNqArOv/y6ODFcCcSqOWkpVX3K/4kmhd8
	CqsnPeNuH7dyRzaaN8kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRN4w-00000009BmX-35qV;
	Wed, 10 Jul 2024 02:29:10 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRN4t-00000009Bks-0Mcj
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 02:29:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WJhWJ03bpz1T4k8;
	Wed, 10 Jul 2024 10:24:12 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 15D9E140428;
	Wed, 10 Jul 2024 10:28:54 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 10 Jul
 2024 10:28:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] ubifs: ubifs_jnl_write_inode: Only check once for the limitation of xattr count
Date: Wed, 10 Jul 2024 10:26:27 +0800
Message-ID: <20240710022628.1227996-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710022628.1227996-1-chengzhihao1@huawei.com>
References: <20240710022628.1227996-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_192907_316598_A3BAD28B 
X-CRM114-Status: GOOD (  12.28  )
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

No need to check the limitation of xattr count every time in function
ubifs_jnl_write_inode(), because the 'ui->xattr_cnt' won't be modified
by others in the inode evicting process.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/journal.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4a35f9e8f668..a5c7c499cc29 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -981,6 +981,14 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
+	if (kill_xattrs) {
+		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
+			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+			ubifs_ro_mode(c, err);
+			return -EPERM;
+		}
+	}
+
 	/*
 	 * If the inode is being deleted, do not write the attached data. No
 	 * need to synchronize the write-buffer either.
@@ -1012,12 +1020,6 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct inode *xino;
 		struct ubifs_dent_node *xent, *pxent = NULL;
 
-		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
-			err = -EPERM;
-			ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
-			goto out_release;
-		}
-
 		lowest_xent_key(c, &key, inode->i_ino);
 		while (1) {
 			xent = ubifs_tnc_next_ent(c, &key, &nm);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
