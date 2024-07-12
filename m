Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A74C3DA45
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFHtb1YvQFutC8levCACf9KdumLrNvS0Fzbop4fUcvw=; b=NSQDd1JSdjj6W1
	pwLAkbueklvood2PVNQPLtDGBTlplV+TCwQ8mBx0RxNhWIgZ16ra/Kgd4gIydK0r1zx/RydU54CFK
	khSJSnBxTzs5CSEJv5jA3RgxakKNOfKKNQZ6FMpi6MCmJUKouAsH3Qynez3gFaPoc67CsLvxrA0Bf
	saRH0WU1Za0iXqpCa+jiTgoRUizPtjuoz1PMi0DE6UFHLaKQ68RYcN1zY3H8UkvwPu1KNxYGl4BCb
	157fwQf/+27O3Bl86/HLTNQ/bMI2SnzmZoAdBw3lRajCMIFqZmX8ejFA+hM5jbLbyNQj2A7qQ5T1B
	kOGJeAsc3LJ7UTo/tbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vo-0000000GeG4-2GYq;
	Fri, 12 Jul 2024 06:39:00 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sS9vk-0000000GeES-0z5f
	for linux-mtd@lists.infradead.org;
	Fri, 12 Jul 2024 06:38:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WL1yj5nVdzxW5N;
	Fri, 12 Jul 2024 14:34:05 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 0149818009B;
	Fri, 12 Jul 2024 14:38:43 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Jul
 2024 14:38:42 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] ubifs: Remove ineffective function ubifs_evict_xattr_inode()
Date: Fri, 12 Jul 2024 14:36:25 +0800
Message-ID: <20240712063625.3363974-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240712063625.3363974-1-chengzhihao1@huawei.com>
References: <20240712063625.3363974-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_233856_639997_3001F103 
X-CRM114-Status: GOOD (  11.57  )
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

Function ubifs_evict_xattr_inode() is imported by commit 272eda8298dc
("ubifs: Correctly evict xattr inodes") to reclaim xattr inode when
the host inode is deleted.
The xattr inode is evicted in the host inode deleting process since
commit 7959cf3a7506 ("ubifs: journal: Handle xattrs like files").
So the ineffective function ubifs_evict_xattr_inode() can be deleted
safely.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/tnc.c   |  2 --
 fs/ubifs/ubifs.h |  3 ---
 fs/ubifs/xattr.c | 22 ----------------------
 3 files changed, 27 deletions(-)

diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 0fabecd9d379..8f38e33eb928 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -2905,8 +2905,6 @@ int ubifs_tnc_remove_ino(struct ubifs_info *c, ino_t inum)
 		dbg_tnc("xent '%s', ino %lu", xent->name,
 			(unsigned long)xattr_inum);
 
-		ubifs_evict_xattr_inode(c, xattr_inum);
-
 		fname_name(&nm) = xent->name;
 		fname_len(&nm) = le16_to_cpu(xent->nlen);
 		err = ubifs_tnc_remove_nm(c, &key1, &nm);
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 12216a159227..84dd7900d3f0 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -2049,13 +2049,10 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 #ifdef CONFIG_UBIFS_FS_XATTR
 extern const struct xattr_handler * const ubifs_xattr_handlers[];
 ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size);
-void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum);
 int ubifs_purge_xattrs(struct inode *host);
 #else
 #define ubifs_listxattr NULL
 #define ubifs_xattr_handlers NULL
-static inline void ubifs_evict_xattr_inode(struct ubifs_info *c,
-					   ino_t xattr_inum) { }
 static inline int ubifs_purge_xattrs(struct inode *host)
 {
 	return 0;
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f734588b224a..c673fd03d9b4 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -570,28 +570,6 @@ int ubifs_purge_xattrs(struct inode *host)
 	return err;
 }
 
-/**
- * ubifs_evict_xattr_inode - Evict an xattr inode.
- * @c: UBIFS file-system description object
- * @xattr_inum: xattr inode number
- *
- * When an inode that hosts xattrs is being removed we have to make sure
- * that cached inodes of the xattrs also get removed from the inode cache
- * otherwise we'd waste memory. This function looks up an inode from the
- * inode cache and clears the link counter such that iput() will evict
- * the inode.
- */
-void ubifs_evict_xattr_inode(struct ubifs_info *c, ino_t xattr_inum)
-{
-	struct inode *inode;
-
-	inode = ilookup(c->vfs_sb, xattr_inum);
-	if (inode) {
-		clear_nlink(inode);
-		iput(inode);
-	}
-}
-
 static int ubifs_xattr_remove(struct inode *host, const char *name)
 {
 	struct inode *inode;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
