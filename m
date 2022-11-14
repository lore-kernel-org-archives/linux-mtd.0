Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA25C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsVvleffVHL5P9t3SrA0BbuPW8O6nV9uXJ1PfIBdyjE=; b=aykgrDRFsBVNZd
	LxcP7UoysCtCza/HkRHXeIz5+dNGvR9wO3hwA6ZIr9dL58G6WQMW3OHs3Iem72/Peci72usOBi9sX
	5qL84LdWYTiflxG0ndPu9pwzp9I+rz7q8OObe8chFmGPFDVdR9n7jTBjmCDf+LIwbtzEn0jAy4fXj
	HPbL07zEN/4i9B7DLvW9YGoDoy4q5AZ8uH6gxfyDpXBwM89COooQsgUKlxUq5NWo/OO8eCkQ0lQVh
	57kAPftvea6h16qOi4HEtgNbNkm3JsXyEm6Blpk1yYy5s9X7Ov2szz5y97Cv/HSCE00OhsO/eFkP5
	c3bZKPyu7uKCFh8Bk8+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouaVj-001knJ-Lp; Mon, 14 Nov 2022 14:32:31 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouaVf-001kfu-6s
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 14:32:29 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4N9sFk6yHsz15M0R;
	Mon, 14 Nov 2022 22:31:54 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 22:32:14 +0800
Received: from huawei.com (10.175.101.6) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 14 Nov
 2022 22:32:13 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<patchwork@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>,
	<miaoxie@huawei.com>, <guohanjun@huawei.com>, <huawei.libin@huawei.com>,
	<yuehaibing@huawei.com>, <johnny.chenyi@huawei.com>, <weiyongjun1@huawei.com>
Subject: [PATCH -next] ubi: Fix permission display of the debugfs files
Date: Mon, 14 Nov 2022 22:46:46 +0800
Message-ID: <20221114144646.3828749-1-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_063227_630839_1636CB39 
X-CRM114-Status: GOOD (  11.48  )
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

Some interface files in debugfs support the read method
dfs_file_read(), but their rwx permissions is shown as
unreadable.

In the user mode, the following problem can be clearly seen:

 # ls -l /sys/kernel/debug/ubi/ubi0/
 total 0
 --w------- 1 root root 0 Oct 22 16:26 chk_fastmap
 --w------- 1 root root 0 Oct 22 16:26 chk_gen
 --w------- 1 root root 0 Oct 22 16:26 chk_io
 -r-------- 1 root root 0 Oct 22 16:26 detailed_erase_block_info
 --w------- 1 root root 0 Oct 22 16:26 tst_disable_bgt
 --w------- 1 root root 0 Oct 22 16:26 tst_emulate_bitflips
 --w------- 1 root root 0 Oct 22 16:26 tst_emulate_io_failures
 --w------- 1 root root 0 Oct 22 16:26 tst_emulate_power_cut
 --w------- 1 root root 0 Oct 22 16:26 tst_emulate_power_cut_max
 --w------- 1 root root 0 Oct 22 16:26 tst_emulate_power_cut_min

It shows that these files do not have read permission 'r',
but we can actually read their contents.

 # echo 1 > /sys/kernel/debug/ubi/ubi0/chk_io
 # cat /sys/kernel/debug/ubi/ubi0/chk_io
 1

User's permission access is determined by capabilities.
Of course, the root user is not restricted from reading
these files.

When reading a debugfs file, the process is as follows:

 ksys_read()
   vfs_read()
     if (file->f_op->read)
       file->f_op->read()
         full_proxy_open()
           real_fops->read()
             dfs_file_read() -- Read method of debugfs file.
     else if (file->f_op->read_iter)
       new_sync_read()
     else
       ret = -EINVAL -- Return -EINVAL if no read method.

This indicates that the debugfs file can be read as long as the read
method of the debugfs file is registered. This patch adds the read
permission display for file that support the read method.

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 908d0e088557..552b765af810 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -504,6 +504,7 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 {
 	unsigned long ubi_num = ubi->ubi_num;
 	struct ubi_debug_info *d = &ubi->dbg;
+	umode_t mode = S_IRUSR | S_IWUSR;
 	int n;
 
 	if (!IS_ENABLED(CONFIG_DEBUG_FS))
@@ -518,41 +519,41 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 
 	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
 
-	d->dfs_chk_gen = debugfs_create_file("chk_gen", S_IWUSR, d->dfs_dir,
+	d->dfs_chk_gen = debugfs_create_file("chk_gen", mode, d->dfs_dir,
 					     (void *)ubi_num, &dfs_fops);
 
-	d->dfs_chk_io = debugfs_create_file("chk_io", S_IWUSR, d->dfs_dir,
+	d->dfs_chk_io = debugfs_create_file("chk_io", mode, d->dfs_dir,
 					    (void *)ubi_num, &dfs_fops);
 
-	d->dfs_chk_fastmap = debugfs_create_file("chk_fastmap", S_IWUSR,
+	d->dfs_chk_fastmap = debugfs_create_file("chk_fastmap", mode,
 						 d->dfs_dir, (void *)ubi_num,
 						 &dfs_fops);
 
-	d->dfs_disable_bgt = debugfs_create_file("tst_disable_bgt", S_IWUSR,
+	d->dfs_disable_bgt = debugfs_create_file("tst_disable_bgt", mode,
 						 d->dfs_dir, (void *)ubi_num,
 						 &dfs_fops);
 
 	d->dfs_emulate_bitflips = debugfs_create_file("tst_emulate_bitflips",
-						      S_IWUSR, d->dfs_dir,
+						      mode, d->dfs_dir,
 						      (void *)ubi_num,
 						      &dfs_fops);
 
 	d->dfs_emulate_io_failures = debugfs_create_file("tst_emulate_io_failures",
-							 S_IWUSR, d->dfs_dir,
+							 mode, d->dfs_dir,
 							 (void *)ubi_num,
 							 &dfs_fops);
 
 	d->dfs_emulate_power_cut = debugfs_create_file("tst_emulate_power_cut",
-						       S_IWUSR, d->dfs_dir,
+						       mode, d->dfs_dir,
 						       (void *)ubi_num,
 						       &dfs_fops);
 
 	d->dfs_power_cut_min = debugfs_create_file("tst_emulate_power_cut_min",
-						   S_IWUSR, d->dfs_dir,
+						   mode, d->dfs_dir,
 						   (void *)ubi_num, &dfs_fops);
 
 	d->dfs_power_cut_max = debugfs_create_file("tst_emulate_power_cut_max",
-						   S_IWUSR, d->dfs_dir,
+						   mode, d->dfs_dir,
 						   (void *)ubi_num, &dfs_fops);
 
 	debugfs_create_file("detailed_erase_block_info", S_IRUSR, d->dfs_dir,
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
