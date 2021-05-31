Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6DEC47082
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DE26052B
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 12:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86DE26052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlk+PJ4o4dmtWIj/+o5Zw8S2x8SQGvE7r36XVAC0+GY=; b=Biy0TGGQoQ8Va7
	s2uvUNt9K4uR+grIDbTboAPDpl/deV5FZvovTd0tO64/YA7iVcOvPdGja2U3lyF10FablAzQ4SV5l
	neEQly0fWOAzQAK6rErJRT61YR1npmKfX05v3ihhJzuFBnsZPky7ChPvVD+cij9IV6RiIyRFoAnMB
	WGznRwpg0PcfGRc0TdfQ81cD9el5YRSOm/OsMtTLa7D2bh2TzRDG3j0De25a9bIuIyO70gj0lDn6J
	li6Yqi/YXuExl91sfoH1O90psdaLNY0Lv9QOJ1ILCqo366QF0reRhGsCq1uyTZZxyXT0O3BSsJrQ+
	+CSoduRvBTVoUJpn+DHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnhGF-00CCnk-Qs; Mon, 31 May 2021 12:43:15 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnhG0-00CCkV-St
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 12:43:03 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ftvw96Fv3zWqNZ;
 Mon, 31 May 2021 20:38:17 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 20:42:52 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 20:42:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <yangds.fnst@cn.fujitsu.com>, <s.hauer@pengutronix.de>
CC: <yi.zhang@huawei.com>, <houtao1@huawei.com>, <yukuai3@huawei.com>,
 <chengzhihao1@huawei.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ubifs: Fix races between xattr_{set|get} and listxattr
 operations
Date: Mon, 31 May 2021 20:52:09 +0800
Message-ID: <20210531125210.1173922-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210531125210.1173922-1-chengzhihao1@huawei.com>
References: <20210531125210.1173922-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_054301_312574_AF82F68E 
X-CRM114-Status: GOOD (  18.17  )
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

UBIFS may occur some problems with concurrent xattr_{set|get} and
listxattr operations, such as assertion failure, memory corruption,
stale xattr value[1].

Fix it by importing a new rw-lock in @ubifs_inode to serilize write
operations on xattr, concurrent read operations are still effective,
just like ext4.

[1] https://lore.kernel.org/linux-mtd/20200630130438.141649-1-houtao1@huawei.com

Fixes: 1e51764a3c2ac05a23 ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org  # v2.6+
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/super.c |  1 +
 fs/ubifs/ubifs.h |  2 ++
 fs/ubifs/xattr.c | 44 +++++++++++++++++++++++++++++++++-----------
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f65f665c5e12..94cf4f4675fe 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -275,6 +275,7 @@ static struct inode *ubifs_alloc_inode(struct super_block *sb)
 	memset((void *)ui + sizeof(struct inode), 0,
 	       sizeof(struct ubifs_inode) - sizeof(struct inode));
 	mutex_init(&ui->ui_mutex);
+	init_rwsem(&ui->xattr_sem);
 	spin_lock_init(&ui->ui_lock);
 	return &ui->vfs_inode;
 };
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index b65c599a386a..7e978f421430 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -356,6 +356,7 @@ struct ubifs_gced_idx_leb {
  * @ui_mutex: serializes inode write-back with the rest of VFS operations,
  *            serializes "clean <-> dirty" state changes, serializes bulk-read,
  *            protects @dirty, @bulk_read, @ui_size, and @xattr_size
+ * @xattr_sem: serilizes write operations (remove|set|create) on xattr
  * @ui_lock: protects @synced_i_size
  * @synced_i_size: synchronized size of inode, i.e. the value of inode size
  *                 currently stored on the flash; used only for regular file
@@ -409,6 +410,7 @@ struct ubifs_inode {
 	unsigned int bulk_read:1;
 	unsigned int compr_type:2;
 	struct mutex ui_mutex;
+	struct rw_semaphore xattr_sem;
 	spinlock_t ui_lock;
 	loff_t synced_i_size;
 	loff_t ui_size;
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 6b1e9830b274..1fce27e9b769 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -285,6 +285,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	if (!xent)
 		return -ENOMEM;
 
+	down_write(&ubifs_inode(host)->xattr_sem);
 	/*
 	 * The extended attribute entries are stored in LNC, so multiple
 	 * look-ups do not involve reading the flash.
@@ -319,6 +320,7 @@ int ubifs_xattr_set(struct inode *host, const char *name, const void *value,
 	iput(inode);
 
 out_free:
+	up_write(&ubifs_inode(host)->xattr_sem);
 	kfree(xent);
 	return err;
 }
@@ -341,18 +343,19 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 	if (!xent)
 		return -ENOMEM;
 
+	down_read(&ubifs_inode(host)->xattr_sem);
 	xent_key_init(c, &key, host->i_ino, &nm);
 	err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
 	if (err) {
 		if (err == -ENOENT)
 			err = -ENODATA;
-		goto out_unlock;
+		goto out_cleanup;
 	}
 
 	inode = iget_xattr(c, le64_to_cpu(xent->inum));
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-		goto out_unlock;
+		goto out_cleanup;
 	}
 
 	ui = ubifs_inode(inode);
@@ -374,7 +377,8 @@ ssize_t ubifs_xattr_get(struct inode *host, const char *name, void *buf,
 out_iput:
 	mutex_unlock(&ui->ui_mutex);
 	iput(inode);
-out_unlock:
+out_cleanup:
+	up_read(&ubifs_inode(host)->xattr_sem);
 	kfree(xent);
 	return err;
 }
@@ -406,16 +410,21 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	dbg_gen("ino %lu ('%pd'), buffer size %zd", host->i_ino,
 		dentry, size);
 
+	down_read(&host_ui->xattr_sem);
 	len = host_ui->xattr_names + host_ui->xattr_cnt;
-	if (!buffer)
+	if (!buffer) {
 		/*
 		 * We should return the minimum buffer size which will fit a
 		 * null-terminated list of all the extended attribute names.
 		 */
-		return len;
+		err = len;
+		goto out_err;
+	}
 
-	if (len > size)
-		return -ERANGE;
+	if (len > size) {
+		err = -ERANGE;
+		goto out_err;
+	}
 
 	lowest_xent_key(c, &key, host->i_ino);
 	while (1) {
@@ -437,8 +446,9 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		pxent = xent;
 		key_read(c, &xent->key, &key);
 	}
-
 	kfree(pxent);
+	up_read(&host_ui->xattr_sem);
+
 	if (err != -ENOENT) {
 		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;
@@ -446,6 +456,10 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 
 	ubifs_assert(c, written <= size);
 	return written;
+
+out_err:
+	up_read(&host_ui->xattr_sem);
+	return err;
 }
 
 static int remove_xattr(struct ubifs_info *c, struct inode *host,
@@ -504,6 +518,7 @@ int ubifs_purge_xattrs(struct inode *host)
 	ubifs_warn(c, "inode %lu has too many xattrs, doing a non-atomic deletion",
 		   host->i_ino);
 
+	down_write(&ubifs_inode(host)->xattr_sem);
 	lowest_xent_key(c, &key, host->i_ino);
 	while (1) {
 		xent = ubifs_tnc_next_ent(c, &key, &nm);
@@ -523,7 +538,7 @@ int ubifs_purge_xattrs(struct inode *host)
 			ubifs_ro_mode(c, err);
 			kfree(pxent);
 			kfree(xent);
-			return err;
+			goto out_err;
 		}
 
 		ubifs_assert(c, ubifs_inode(xino)->xattr);
@@ -535,7 +550,7 @@ int ubifs_purge_xattrs(struct inode *host)
 			kfree(xent);
 			iput(xino);
 			ubifs_err(c, "cannot remove xattr, error %d", err);
-			return err;
+			goto out_err;
 		}
 
 		iput(xino);
@@ -544,14 +559,19 @@ int ubifs_purge_xattrs(struct inode *host)
 		pxent = xent;
 		key_read(c, &xent->key, &key);
 	}
-
 	kfree(pxent);
+	up_write(&ubifs_inode(host)->xattr_sem);
+
 	if (err != -ENOENT) {
 		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;
 	}
 
 	return 0;
+
+out_err:
+	up_write(&ubifs_inode(host)->xattr_sem);
+	return err;
 }
 
 /**
@@ -594,6 +614,7 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 	if (!xent)
 		return -ENOMEM;
 
+	down_write(&ubifs_inode(host)->xattr_sem);
 	xent_key_init(c, &key, host->i_ino, &nm);
 	err = ubifs_tnc_lookup_nm(c, &key, xent, &nm);
 	if (err) {
@@ -618,6 +639,7 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 	iput(inode);
 
 out_free:
+	up_write(&ubifs_inode(host)->xattr_sem);
 	kfree(xent);
 	return err;
 }
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
