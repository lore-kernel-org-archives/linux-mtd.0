Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFB8C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZcumgvH4cUUC+TxWhxBRRy/LBLWhjKwzyWEHJJapRas=; b=jBL1uYQAMQbQNS
	f6r5gb6eOY9Qz0vC/LsC2i9qTU/pNfhFPe+3QriPeeIEMm4LFuGHriql0Eh2Qo9i/BQlaZ1dWFKRW
	ygC2CisH/pagkC8sdJM1c5I7WXiyUhE5X8PlayrYslMvLLcQN4JjkjUIXo+xQaOutQPxeyIJQMJ8V
	RqD4BBu5uGPrDuSPvsv02xVYWFhkbMhO9HUCcbno/I8kquofdDx829FJ+F4ji30SeufSrOjjuDrLp
	gCw3MDNV9cs1mGPRdCZaUzkiMLD2rcGCuJOH+7r0x8GASupVR3PpdjymBX2/FMcVrBZW5D1VDrI7W
	Exb8aGcGljEn16R8zQHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1ZM-0000000FPBy-23oQ;
	Wed, 17 Apr 2024 09:27:08 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1ZI-0000000FPBN-40xM
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 09:27:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4VKFpN1bt6z1RChy;
	Wed, 17 Apr 2024 17:23:56 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 93FAE18002F;
	Wed, 17 Apr 2024 17:26:54 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemd200001.china.huawei.com
 (7.185.36.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.28; Wed, 17 Apr
 2024 17:26:54 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<yangerkun@huawei.com>
Subject: [PATCH V3] ubifs: correct UBIFS_DFS_DIR_LEN macro definition and improve code clarity
Date: Wed, 17 Apr 2024 17:27:27 +0800
Message-ID: <20240417092727.3803910-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_022705_375899_B417CE0F 
X-CRM114-Status: GOOD (  20.70  )
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

The UBIFS_DFS_DIR_LEN macro, which defines the maximum length of the UBIFS
debugfs directory name, has an incorrect formula and misleading comments.
The current formula is (3 + 1 + 2*2 + 1), which assumes that both UBI device
number and volume ID are limited to 2 characters. However, UBI device number
ranges from 0 to 37 (2 characters), and volume ID ranges from 0 to 127 (up
to 3 characters).

Although the current code works due to the cancellation of mathematical
errors (9 + 1 = 10, which matches the correct UBIFS_DFS_DIR_LEN value), it
can lead to confusion and potential issues in the future.

This patch aims to improve the code clarity and maintainability by making
the following changes:

1. Corrects the UBIFS_DFS_DIR_LEN macro definition to (3 + 1 + 2 + 3 + 1),
   accommodating the maximum lengths of both UBI device number and volume ID,
   plus the separators and null terminator.
2. Updates the snprintf calls to use UBIFS_DFS_DIR_LEN instead of
   UBIFS_DFS_DIR_LEN + 1, removing the unnecessary +1.
3. Modifies the error checks to compare against UBIFS_DFS_DIR_LEN using >=
   instead of >, aligning with the corrected macro definition.
4. Removes the redundant +1 in the dfs_dir_name array definitions in ubi.h
   and debug.h.
5. Removes the duplicated UBIFS_DFS_DIR_LEN and UBIFS_DFS_DIR_NAME macro
   definitions in ubifs.h, as they are already defined in debug.h.

While these changes do not affect the runtime behavior, they make the code
more readable, maintainable, and less prone to future errors.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 4 ++--
 drivers/mtd/ubi/ubi.h   | 2 +-
 fs/ubifs/debug.c        | 4 ++--
 fs/ubifs/debug.h        | 7 ++++---
 fs/ubifs/sysfs.c        | 6 +++---
 fs/ubifs/ubifs.h        | 7 -------
 6 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index d57f52bd2ff3..9ec3b8b6a0aa 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -598,9 +598,9 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
-	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
+	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN, UBI_DFS_DIR_NAME,
 		     ubi->ubi_num);
-	if (n > UBI_DFS_DIR_LEN) {
+	if (n >= UBI_DFS_DIR_LEN) {
 		/* The array size is too small */
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 32009a24869e..da4e53ef5b0a 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -420,7 +420,7 @@ struct ubi_debug_info {
 	unsigned int power_cut_min;
 	unsigned int power_cut_max;
 	unsigned int emulate_failures;
-	char dfs_dir_name[UBI_DFS_DIR_LEN + 1];
+	char dfs_dir_name[UBI_DFS_DIR_LEN];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_chk_gen;
 	struct dentry *dfs_chk_io;
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index ac77ac1fd73e..d91cec93d968 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2827,9 +2827,9 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
 	const char *fname;
 	struct ubifs_debug_info *d = c->dbg;
 
-	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
+	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN, UBIFS_DFS_DIR_NAME,
 		     c->vi.ubi_num, c->vi.vol_id);
-	if (n > UBIFS_DFS_DIR_LEN) {
+	if (n >= UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
 		return;
 	}
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index ed966108da80..d425861e6b82 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -19,10 +19,11 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
 
 /*
  * The UBIFS debugfs directory name pattern and maximum name length (3 for "ubi"
- * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
+ * + 1 for "_" and 2 for UBI device numbers and 3 for volume number and 1 for
+ * the trailing zero byte.
  */
 #define UBIFS_DFS_DIR_NAME "ubi%d_%d"
-#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2*2 + 1)
+#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2 + 3 + 1)
 
 /**
  * ubifs_debug_info - per-FS debugging information.
@@ -103,7 +104,7 @@ struct ubifs_debug_info {
 	unsigned int chk_fs:1;
 	unsigned int tst_rcvry:1;
 
-	char dfs_dir_name[UBIFS_DFS_DIR_LEN + 1];
+	char dfs_dir_name[UBIFS_DFS_DIR_LEN];
 	struct dentry *dfs_dir;
 	struct dentry *dfs_dump_lprops;
 	struct dentry *dfs_dump_budg;
diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index 1c958148bb87..aae32222f11b 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -91,17 +91,17 @@ static struct kset ubifs_kset = {
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
 	int ret, n;
-	char dfs_dir_name[UBIFS_DFS_DIR_LEN+1];
+	char dfs_dir_name[UBIFS_DFS_DIR_LEN];
 
 	c->stats = kzalloc(sizeof(struct ubifs_stats_info), GFP_KERNEL);
 	if (!c->stats) {
 		ret = -ENOMEM;
 		goto out_last;
 	}
-	n = snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
+	n = snprintf(dfs_dir_name, UBIFS_DFS_DIR_LEN, UBIFS_DFS_DIR_NAME,
 		     c->vi.ubi_num, c->vi.vol_id);
 
-	if (n > UBIFS_DFS_DIR_LEN) {
+	if (n >= UBIFS_DFS_DIR_LEN) {
 		/* The array size is too small */
 		ret = -EINVAL;
 		goto out_free;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 1f3ea879d93a..7b6be3fb4f62 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -157,13 +157,6 @@
 #define UBIFS_HMAC_ARR_SZ 0
 #endif
 
-/*
- * The UBIFS sysfs directory name pattern and maximum name length (3 for "ubi"
- * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
- */
-#define UBIFS_DFS_DIR_NAME "ubi%d_%d"
-#define UBIFS_DFS_DIR_LEN  (3 + 1 + 2*2 + 1)
-
 /*
  * Lockdep classes for UBIFS inode @ui_mutex.
  */
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
