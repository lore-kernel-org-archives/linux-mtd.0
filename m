Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DBACD11DB
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn6aISJXyGIBc3NQhmOx9ux0CidPclZV137+cU1/hF0=; b=dPqyyqLmv1YR9l
	1s07DK3UjPjkxfg3/NmXRL1SFxxijS5OntCI3SGNPkuAr8228FY/05xdbJ+Kr0bmk0ryUkmRqGRm/
	ExBIKmfOX6aBiWG2dfBwiVcXRjaMi5vnYEfe18XLnnlNaKzzZVOH+KtBKN+GElQU/d/isF0dlEUcG
	oEgfosk6XahVnWKeYiWkKAGAbjPWc6vYnen0aF/AAdpz2Gxa1jRJ3Q5rSuP1JAvn22fSSx8a7J3TS
	yyb27hc/ppBPZG+WSzOTnKyQv/SZ2H1WhNUViJOr38wxpIzLV0bsXTiPaDLO27afwwlT019RpURWI
	tx2TuyURuyIwZ1skarHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9H-0000000DKHr-1u5R;
	Tue, 19 Mar 2024 16:17:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmc9C-0000000DKE1-2jbD
	for linux-mtd@lists.infradead.org;
	Tue, 19 Mar 2024 16:17:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TzcHM2TsWz1h30K;
	Wed, 20 Mar 2024 00:14:23 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id DD1011A0172;
	Wed, 20 Mar 2024 00:16:55 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 20 Mar
 2024 00:16:55 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <lizetao1@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 2/5] ubifs: Initialize or update ACLs for inode
Date: Wed, 20 Mar 2024 00:16:43 +0800
Message-ID: <20240319161646.2153867-3-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240319161646.2153867-1-lizetao1@huawei.com>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_091707_037754_C1C4C743 
X-CRM114-Status: GOOD (  11.04  )
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

There are two scenarios where ACL needs to be updated, the first one
is when creating the inode, and the second one is in the chmod process.
When creating directories/files/device node/tmpfile, ACLs needs to be
initialized, but symlink do not.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/ubifs/dir.c  | 16 ++++++++++++++++
 fs/ubifs/file.c |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 551148de66cd..dfb6823cc953 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -316,6 +316,10 @@ static int ubifs_create(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_fname;
 	}
 
+	err = ubifs_init_acl(inode, dir);
+	if (err)
+		goto out_inode;
+
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
 		goto out_inode;
@@ -466,6 +470,10 @@ static int ubifs_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 	}
 	ui = ubifs_inode(inode);
 
+	err = ubifs_init_acl(inode, dir);
+	if (err)
+		goto out_inode;
+
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
 		goto out_inode;
@@ -1013,6 +1021,10 @@ static int ubifs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_fname;
 	}
 
+	err = ubifs_init_acl(inode, dir);
+	if (err)
+		goto out_inode;
+
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
 		goto out_inode;
@@ -1108,6 +1120,10 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	ui->data = dev;
 	ui->data_len = devlen;
 
+	err = ubifs_init_acl(inode, dir);
+	if (err)
+		goto out_inode;
+
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
 		goto out_inode;
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 5029eb3390a5..8f964f8b0f96 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -41,6 +41,7 @@
 #include <linux/mount.h>
 #include <linux/slab.h>
 #include <linux/migrate.h>
+#include <linux/posix_acl.h>
 
 static int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
@@ -1298,6 +1299,9 @@ int ubifs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	else
 		err = do_setattr(c, inode, attr);
 
+	if (!err && (attr->ia_valid & ATTR_MODE))
+		err = posix_acl_chmod(idmap, dentry, inode->i_mode);
+
 	return err;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
