Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7278EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38ECF61029
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 03:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38ECF61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbu3rSkEZ4op9aPm0oPIqHHSBB27vYwXC9cJyQXhQ44=; b=O4YIC6q3rvjn9m
	uN6hbgzWYTL18gUJCYMcKXTW2VXpAfbvKDMJ7jVtZevKQNFL2nFIXofbZ5gZFznwT0jiK3pmVgA03
	sVSTs0bV/uutlGnsET9dlLF4ojg6uFETYnbIHCWwHQOn7ZW9SQhN8SG65RQ50Ycr/ReGbVy13dktG
	Qcge9cINkxwWJpOfJMSTNy8dVsrIWEcmC5K0R5eeRcdgpAgHZOWAQsjOX+8UQ8gWmsyMINXFUuDCo
	J7eooK3cBttioCsFpdbNPKDtJ3hWAJMCTBqPkvESgJuHaXwNGnAcoPUqwZYuvf2QFyKX1kGpKQ6kC
	Wz7WeXdcPHuEtTbV29HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meqgw-00F8Um-A8; Mon, 25 Oct 2021 03:30:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meqf2-00F7sd-Fn
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 03:28:34 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hd0lr69Ynz90PG;
 Mon, 25 Oct 2021 11:28:24 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Mon, 25 Oct 2021 11:28:26 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 25
 Oct 2021 11:28:25 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <Artem.Bityutskiy@nokia.com>, <ext-adrian.hunter@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH 06/11] ubifs: Fix 'ui->dirty' race between do_tmpfile() and
 writeback work
Date: Mon, 25 Oct 2021 11:41:11 +0800
Message-ID: <20211025034116.3544321-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025034116.3544321-1-chengzhihao1@huawei.com>
References: <20211025034116.3544321-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_202833_056086_A4AA376A 
X-CRM114-Status: GOOD (  12.00  )
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

'ui->dirty' is not protected by 'ui_mutex' in function do_tmpfile() which
may race with ubifs_write_inode[wb_workfn] to access/update 'ui->dirty',
finally dirty space is released twice.

	open(O_TMPFILE)                wb_workfn
do_tmpfile
  ubifs_budget_space(ino_req = { .dirtied_ino = 1})
  d_tmpfile // mark inode(tmpfile) dirty
  ubifs_jnl_update // without holding tmpfile's ui_mutex
    mark_inode_clean(ui)
      if (ui->dirty)
        ubifs_release_dirty_inode_budget(ui)  // release first time
                                   ubifs_write_inode
				     mutex_lock(&ui->ui_mutex)
                                     ubifs_release_dirty_inode_budget(ui)
				     // release second time
				     mutex_unlock(&ui->ui_mutex)
      ui->dirty = 0

Run generic/476 can reproduce following message easily
(See reproducer in [Link]):

  UBIFS error (ubi0:0 pid 2578): ubifs_assert_failed [ubifs]: UBIFS assert
  failed: c->bi.dd_growth >= 0, in fs/ubifs/budget.c:554
  UBIFS warning (ubi0:0 pid 2578): ubifs_ro_mode [ubifs]: switched to
  read-only mode, error -22
  Workqueue: writeback wb_workfn (flush-ubifs_0_0)
  Call Trace:
    ubifs_ro_mode+0x54/0x60 [ubifs]
    ubifs_assert_failed+0x4b/0x80 [ubifs]
    ubifs_release_budget+0x468/0x5a0 [ubifs]
    ubifs_release_dirty_inode_budget+0x53/0x80 [ubifs]
    ubifs_write_inode+0x121/0x1f0 [ubifs]
    ...
    wb_workfn+0x283/0x7b0

Fix it by holding tmpfile ubifs inode lock during ubifs_jnl_update().
Similar problem exists in whiteout renaming, but previous fix("ubifs:
Rename whiteout atomically") has solved the problem.

Fixes: 474b93704f32163 ("ubifs: Implement O_TMPFILE")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=214765
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 60 +++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 6344e2bc9338..8a2c42e6b22b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -399,6 +399,32 @@ static struct inode *create_whiteout(struct inode *dir, struct dentry *dentry,
 	return ERR_PTR(err);
 }
 
+/**
+ * lock_2_inodes - a wrapper for locking two UBIFS inodes.
+ * @inode1: first inode
+ * @inode2: second inode
+ *
+ * We do not implement any tricks to guarantee strict lock ordering, because
+ * VFS has already done it for us on the @i_mutex. So this is just a simple
+ * wrapper function.
+ */
+static void lock_2_inodes(struct inode *inode1, struct inode *inode2)
+{
+	mutex_lock_nested(&ubifs_inode(inode1)->ui_mutex, WB_MUTEX_1);
+	mutex_lock_nested(&ubifs_inode(inode2)->ui_mutex, WB_MUTEX_2);
+}
+
+/**
+ * unlock_2_inodes - a wrapper for unlocking two UBIFS inodes.
+ * @inode1: first inode
+ * @inode2: second inode
+ */
+static void unlock_2_inodes(struct inode *inode1, struct inode *inode2)
+{
+	mutex_unlock(&ubifs_inode(inode2)->ui_mutex);
+	mutex_unlock(&ubifs_inode(inode1)->ui_mutex);
+}
+
 static int ubifs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 			 struct dentry *dentry, umode_t mode)
 {
@@ -406,7 +432,7 @@ static int ubifs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1};
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1 };
-	struct ubifs_inode *ui, *dir_ui = ubifs_inode(dir);
+	struct ubifs_inode *ui;
 	int err, instantiated = 0;
 	struct fscrypt_name nm;
 
@@ -454,18 +480,18 @@ static int ubifs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	instantiated = 1;
 	mutex_unlock(&ui->ui_mutex);
 
-	mutex_lock(&dir_ui->ui_mutex);
+	lock_2_inodes(dir, inode);
 	err = ubifs_jnl_update(c, dir, &nm, inode, 1, 0);
 	if (err)
 		goto out_cancel;
-	mutex_unlock(&dir_ui->ui_mutex);
+	unlock_2_inodes(dir, inode);
 
 	ubifs_release_budget(c, &req);
 
 	return 0;
 
 out_cancel:
-	mutex_unlock(&dir_ui->ui_mutex);
+	unlock_2_inodes(dir, inode);
 out_inode:
 	make_bad_inode(inode);
 	if (!instantiated)
@@ -692,32 +718,6 @@ static int ubifs_dir_release(struct inode *dir, struct file *file)
 	return 0;
 }
 
-/**
- * lock_2_inodes - a wrapper for locking two UBIFS inodes.
- * @inode1: first inode
- * @inode2: second inode
- *
- * We do not implement any tricks to guarantee strict lock ordering, because
- * VFS has already done it for us on the @i_mutex. So this is just a simple
- * wrapper function.
- */
-static void lock_2_inodes(struct inode *inode1, struct inode *inode2)
-{
-	mutex_lock_nested(&ubifs_inode(inode1)->ui_mutex, WB_MUTEX_1);
-	mutex_lock_nested(&ubifs_inode(inode2)->ui_mutex, WB_MUTEX_2);
-}
-
-/**
- * unlock_2_inodes - a wrapper for unlocking two UBIFS inodes.
- * @inode1: first inode
- * @inode2: second inode
- */
-static void unlock_2_inodes(struct inode *inode1, struct inode *inode2)
-{
-	mutex_unlock(&ubifs_inode(inode2)->ui_mutex);
-	mutex_unlock(&ubifs_inode(inode1)->ui_mutex);
-}
-
 static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 		      struct dentry *dentry)
 {
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
