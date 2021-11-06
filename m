Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA58C4332F
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:49:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1CD611EF
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B1CD611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HexlUV5R++wR+YSk5TdPEBkQEBzC32/WGj+ghySHris=; b=BLii6qAzJA2VRg
	8ERLH0Wac7b2N9n0wi5K9KGeEJHzKTvgcJNVMKnwiiRunSaPpNHEOZBsjsm57e88dHfY93WBKAnIO
	MeZnpKIWyXt3Rs/Ynr6Z1zCH3xJ18dsB4fcNKtCX5MmNu3eQa30ozMSHwvFxYje00JMt9EkpGXRZs
	YR2ZjR2A7v8PTgwXVR+NJZmHtvtZ6c+PXuCmJziMjsWMcXPahlO7kWscAkJ8Rt8GgOjmcmdolPegO
	n9fa9mmHArKePao2LI+otGEMHJXU0RP5yAnktA5eupzPyOaF4aQEC2qMnt44warV34B6rE1aszM4A
	f6Yv0dZwhD/VI+t9iUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOsC-00D8vi-Ej; Sat, 06 Nov 2021 16:48:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKzX-00CzUC-EQ
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ShClMNyO4NBNUTum7moO8yMJ/bNR0pdDK4PO+qZjEQU=; b=oWm6xVJVoTC+9hio80BHp1i459
 u1cxSBArQpdFG9W8FFrQA92zKrkblAf9IFKRO3r0pYumem/GESAGpNsHQkkO4Wnr3nmtJJFDn8ZoA
 tjJEtuwuj3F/+d7N5ogv7cZk7+Wz0jFD3MjAE/VYE5hRBku0bz0zWK96AAanNjLTE7bbiha2udMFn
 WTBMqlc0g9jkZ0J9T77yoItjqxDkkbjaIeWK/wRWUHF+9KnTVISLR0UAkdWxlK0ChQ0Wldm9jLZTl
 y7PN+Jl4ZhQovVReZtzha9xhU+Z3M4GV3Rdgy+VWTtuhnKRDYywwjVGjmeZH6HyWbriSFY5MD0tC1
 sB9wbDgA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKZR-00EVVf-07
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:13:22 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hmbmr1GNmzZclh;
 Sat,  6 Nov 2021 20:10:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:45 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:44 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 06/12] ubifs: Fix 'ui->dirty' race between do_tmpfile() and
 writeback work
Date: Sat, 6 Nov 2021 20:25:11 +0800
Message-ID: <20211106122517.3304628-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121318_480018_D3746225 
X-CRM114-Status: GOOD (  12.33  )
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
index 30fcfdbe0ab5..ef39ba851bbc 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -397,6 +397,32 @@ static struct inode *create_whiteout(struct inode *dir, struct dentry *dentry)
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
@@ -404,7 +430,7 @@ static int ubifs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1};
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1 };
-	struct ubifs_inode *ui, *dir_ui = ubifs_inode(dir);
+	struct ubifs_inode *ui;
 	int err, instantiated = 0;
 	struct fscrypt_name nm;
 
@@ -452,18 +478,18 @@ static int ubifs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
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
@@ -690,32 +716,6 @@ static int ubifs_dir_release(struct inode *dir, struct file *file)
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
