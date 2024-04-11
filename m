Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCE8CD129D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 03:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMq9pbF5VWf0muWIkINQyh1ui0rlfVi2iyaEqZSOKR8=; b=FUyovdcOOlaau9
	yffN1re5dcZPTjOk+Vgg53q4tj6AS6BkapYEk/V+sRybVB7w0bh+MbWMV5g1/GFyw+JPMD/m9WNge
	5NUFwelJELSCGj0YoFPSpx+oPFO3QwBEway6+WsPg9G1rGaeiVDLN1nnJfaZ6eqR9B14Y6ebfGHDn
	JK0jR6CqPIdIgOXVV1+qH648NUfNJZqHK4FNrGhufLtdC8jDi6CFsvTgWP1BVgwyhL7Yb9yxmI/2C
	MWHb6rgG2+JhMNt9wTNgiYBhL6inwUCKABBzKt/GK/noDoaXZd3V6jOjjtGvP9qFi72aD0/Y+hBVl
	LzhAZm2YMAmVXu9T6wCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6N-0000000A9IW-4A3d;
	Thu, 11 Apr 2024 03:27:52 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6G-0000000A9E1-48mT
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 03:27:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VFQ8r0LBrzShb4;
	Thu, 11 Apr 2024 11:26:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7F64518007A;
	Thu, 11 Apr 2024 11:27:34 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Apr
 2024 11:27:33 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <ben.hutchings@mind.be>,
	<daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] mtd: ubi: Ignore all debugfs initialisation failures
Date: Thu, 11 Apr 2024 11:19:02 +0800
Message-ID: <20240411031903.3050278-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411031903.3050278-1-chengzhihao1@huawei.com>
References: <20240411031903.3050278-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_202745_428505_CFEF80CF 
X-CRM114-Status: GOOD (  17.68  )
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

From: Ben Hutchings <ben.hutchings@mind.be>

Drivers should never stop initialising or probing because of a failure
to create debugfs entries.  Such failures are harmless and could be
the intended result of setting the kernel parameter debugfs=off.

This was partially fixed in 2019, but some error checks were missed
and another one was been added since.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Fixes: 2a734bb8d502 ("UBI: use debugfs for the extra checks knobs")
Fixes: c2d73ba892ea ("mtd: no need to check return value of ...")
Fixes: 6931fb44858c ("ubi: Use the fault injection framework to enhance ...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 10 ++--------
 drivers/mtd/ubi/debug.c | 25 ++++++++++---------------
 drivers/mtd/ubi/debug.h |  4 ++--
 3 files changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index bc63fbf5e947..6d8212a51fec 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1018,9 +1018,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (err)
 		goto out_detach;
 
-	err = ubi_debugfs_init_dev(ubi);
-	if (err)
-		goto out_uif;
+	ubi_debugfs_init_dev(ubi);
 
 	ubi->bgt_thread = kthread_create(ubi_thread, ubi, "%s", ubi->bgt_name);
 	if (IS_ERR(ubi->bgt_thread)) {
@@ -1064,7 +1062,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 
 out_debugfs:
 	ubi_debugfs_exit_dev(ubi);
-out_uif:
 	uif_close(ubi);
 out_detach:
 	ubi_wl_close(ubi);
@@ -1369,9 +1366,7 @@ static int __init ubi_init(void)
 		goto out_dev_unreg;
 	}
 
-	err = ubi_debugfs_init();
-	if (err)
-		goto out_slab;
+	ubi_debugfs_init();
 
 	register_mtd_user(&ubi_mtd_notifier);
 
@@ -1397,7 +1392,6 @@ static int __init ubi_init(void)
 out_mtd_notifier:
 	unregister_mtd_user(&ubi_mtd_notifier);
 	ubi_debugfs_exit();
-out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
 	misc_deregister(&ubi_ctrl_cdev);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index d57f52bd2ff3..989744eb85a5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -291,28 +291,25 @@ static void dfs_create_fault_entry(struct dentry *parent)
 /**
  * ubi_debugfs_init - create UBI debugfs directory.
  *
- * Create UBI debugfs directory. Returns zero in case of success and a negative
- * error code in case of failure.
+ * Try to create UBI debugfs directory.
  */
-int ubi_debugfs_init(void)
+void ubi_debugfs_init(void)
 {
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
+		return;
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
 	if (IS_ERR_OR_NULL(dfs_rootdir)) {
 		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
 
-		pr_err("UBI error: cannot create \"ubi\" debugfs directory, error %d\n",
-		       err);
-		return err;
+		pr_warn("UBI error: cannot create \"ubi\" debugfs directory, error %d\n",
+			err);
+		return;
 	}
 
 #ifdef CONFIG_MTD_UBI_FAULT_INJECTION
 	dfs_create_fault_entry(dfs_rootdir);
 #endif
-
-	return 0;
 }
 
 /**
@@ -585,10 +582,9 @@ static const struct file_operations eraseblk_count_fops = {
  * ubi_debugfs_init_dev - initialize debugfs for an UBI device.
  * @ubi: UBI device description object
  *
- * This function creates all debugfs files for UBI device @ubi. Returns zero in
- * case of success and a negative error code in case of failure.
+ * This function tries to create all debugfs files for UBI device @ubi.
  */
-int ubi_debugfs_init_dev(struct ubi_device *ubi)
+void ubi_debugfs_init_dev(struct ubi_device *ubi)
 {
 	unsigned long ubi_num = ubi->ubi_num;
 	struct ubi_debug_info *d = &ubi->dbg;
@@ -596,13 +592,13 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	int n;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
-		return 0;
+		return;
 
 	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
 		     ubi->ubi_num);
 	if (n > UBI_DFS_DIR_LEN) {
 		/* The array size is too small */
-		return -EINVAL;
+		return;
 	}
 
 	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
@@ -653,7 +649,6 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 						       (void *)ubi_num,
 						       &dfs_fops);
 #endif
-	return 0;
 }
 
 /**
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index b2fd97548808..1dc430d3f482 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -47,9 +47,9 @@ void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
 			  int len);
-int ubi_debugfs_init(void);
+void ubi_debugfs_init(void);
 void ubi_debugfs_exit(void);
-int ubi_debugfs_init_dev(struct ubi_device *ubi);
+void ubi_debugfs_init_dev(struct ubi_device *ubi);
 void ubi_debugfs_exit_dev(struct ubi_device *ubi);
 
 /**
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
