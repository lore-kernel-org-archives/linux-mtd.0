Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A20CD129E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAVcVRZK5KHwQL9Guiy7IOemMCoRAYm9gf2vXT9qoiI=; b=CW4dncXdvGh7GZ
	FrgIEgS5ZMtwOPY+uhIa3h+aOM6Socj/DQtSIyWTjZ8AT10q5s1Wz+SshwfZ92IRR7d3lkVLEbPos
	LelDHa0IUlBohreGG06jGyu3it/mzcZAEDyXM7c5w+PKkU8aRkj3dq5gHrAO00fm2cTmHhxQ80A9b
	70ToqfJaTvakHhr3r9HCl7F5+Dlo+YQUq2P5Egrb21xTZLZF9XeJxLmV5RqTL2813ZtA5LCxpme/Y
	6BY83NezMOChAvGtW76lJYW7YQffRsLFUhRH6S9jr4+r8b8knnPiff83CZpWXIlKJ+Uu6iPx5nchU
	OgN63/Zd4JjNXQWR4eYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSfG-00000005gIw-1FsR;
	Wed, 10 Apr 2024 07:46:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSf9-00000005gBv-1W6h
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:46:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4VDvvm6Jn4z29lMv;
	Wed, 10 Apr 2024 15:43:32 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A876218001A;
	Wed, 10 Apr 2024 15:46:24 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:46:21 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yi.zhang@huawei.com>
Subject: [PATCH 6/9] ubifs: Move ui->data initialization after initializing security
Date: Wed, 10 Apr 2024 15:37:48 +0800
Message-ID: <20240410073751.2522830-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410073751.2522830-1-chengzhihao1@huawei.com>
References: <20240410073751.2522830-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004631_728968_BBAE0FD5 
X-CRM114-Status: UNSURE (   9.91  )
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

Host inode and its' xattr will be written on disk after initializing
security when creating symlink or dev, then the host inode and its
dentry will be written again in ubifs_jnl_update.
There is no need to write inode data in the security initialization
pass, just move the ui->data initialization after initializing
security.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 551148de66cd..848988f2b7dc 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1102,16 +1102,18 @@ static int ubifs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_fname;
 	}
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err) {
+		kfree(dev);
+		goto out_inode;
+	}
+
 	init_special_inode(inode, inode->i_mode, rdev);
 	inode->i_size = ubifs_inode(inode)->ui_size = devlen;
 	ui = ubifs_inode(inode);
 	ui->data = dev;
 	ui->data_len = devlen;
 
-	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
-		goto out_inode;
-
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
@@ -1184,6 +1186,10 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_fname;
 	}
 
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_inode;
+
 	ui = ubifs_inode(inode);
 	ui->data = kmalloc(disk_link.len, GFP_NOFS);
 	if (!ui->data) {
@@ -1209,10 +1215,6 @@ static int ubifs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	ui->data_len = disk_link.len - 1;
 	inode->i_size = ubifs_inode(inode)->ui_size = disk_link.len - 1;
 
-	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
-		goto out_inode;
-
 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
