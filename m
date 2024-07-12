Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C0C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smETuOOgtELP6E3mYmh1dgzNCPgPULRYGSlnpMdXUFA=; b=FkTjyxLO63XU5p
	CNNbeko/1foI3hiDiWjLKSTu4cRBGCuKNbkdU+Rjly9ZQCLqtASiZEdCJSePMwzk7r8n7XeJSPrK2
	ZahVvJjz2uSTasth10G3S+SII82UZ6vfSI4qXsnQ5FeNf4wGM6TsIJ5eP9Cy6+TNa0z96dxnOvGHC
	wuMDvyBTT/myeuYx6MUfxC3lnPz3leddxvuBM2PBQtg3sqcurFgeOZ++r09ACVjJjuWQtacMb7FKU
	5ab5Ka5mz+bucptCcu9yiA7VzXEiwdgzQ3AZ+2FeAhQSnR3hgHhI3zJco9EmjUCmf8QICUcP0xMhy
	pWw/pwLFuEP9GPl4p7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vl-0000000GeFY-3the;
	Fri, 12 Jul 2024 06:38:57 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vi-0000000GeEU-12xv
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 06:38:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WL1zS5XJ6zQjM1;
	Fri, 12 Jul 2024 14:34:44 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 944CE140336;
	Fri, 12 Jul 2024 14:38:42 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Jul
 2024 14:38:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] ubifs: ubifs_jnl_write_inode: Only check once for the limitation of xattr count
Date: Fri, 12 Jul 2024 14:36:24 +0800
Message-ID: <20240712063625.3363974-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240712063625.3363974-1-chengzhihao1@huawei.com>
References: <20240712063625.3363974-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_233854_509943_6EEC4EAD 
X-CRM114-Status: GOOD (  11.45  )
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
 fs/ubifs/journal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4a35f9e8f668..8e98be642371 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -981,6 +981,12 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
+	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
+		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+		ubifs_ro_mode(c, err);
+		return -EPERM;
+	}
+
 	/*
 	 * If the inode is being deleted, do not write the attached data. No
 	 * need to synchronize the write-buffer either.
@@ -1012,12 +1018,6 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
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
