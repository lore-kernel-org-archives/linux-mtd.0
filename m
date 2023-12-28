Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB24C46CD4
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Dec 2023 01:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ptKGRpCS8aLxezStp1tbf+QMIa5IZjbd1YfaMybotao=; b=S64xbvYBMmrFug
	aGs4MHk6NglHjtgc76Iy77+I4rgY53UaWrP/Pg9Y7iAyjNeCNyxv7o3i/n4dIaq+U3jEc0OqtaioA
	BqNCAdSVRm9Je+dTW5c2F2gSvYSauip6peg8o/sED5rTdQr3oMbDXZnig1Dv75rTYWwIGq48WzY3i
	FgyxxadWrZxGF2PVkzBiMmvmZ3N1g3lHEzfa6/GjxmhLYYoG4/UfkPu2l7bP7/wmt2tXAZhUPTkU1
	IK8l5X0Q2SM+/KjTF8AeKVO2iUd1CnWa8g2hq2A0JNfiN595MHVakKbqOxNas/aOOBiz/PEWAJFRR
	QyMiNw3mwv/JeTlhAZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfNH-00FqqD-1p;
	Thu, 28 Dec 2023 01:39:51 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfNB-00Fqjt-1g
	for linux-mtd@lists.infradead.org;
	Thu, 28 Dec 2023 01:39:49 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4T0rlX6Fjjz1wqCg;
	Thu, 28 Dec 2023 09:39:20 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id AF5441A019A;
	Thu, 28 Dec 2023 09:39:28 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Dec
 2023 09:38:15 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <david.oberhollenzer@sigma-star.at>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<Tudor.Ambarus@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 16/17] ubifs: Enable ubifs_repair in '/sys/kernel/debug/ubifs/repair_fs'
Date: Thu, 28 Dec 2023 09:41:11 +0800
Message-ID: <20231228014112.2836317-17-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231228014112.2836317-1-chengzhihao1@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_173945_969919_2C09A148 
X-CRM114-Status: GOOD (  13.03  )
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

Add new interface '/sys/kernel/debug/ubifs/repair_fs' to enable
ubifs repair.

Invoke UBIFS repair by:
 echo UBIFS_DEV > /sys/kernel/debug/ubifs/repair_fs, UBIFS_DEV could be:
 1. ubiX_Y: X means UBI device number and Y means UBI volume number.
    For example: echo "ubi0_0" > /sys/kernel/debug/ubifs/repair_fs
 2. /dev/ubiX_Y: X means UBI device number and Y means UBI volume number.
    For example: echo "/dev/ubi0_0" > /sys/kernel/debug/ubifs/repair_fs
 3. ubiX:NAME: X means UBI device number and NAME means UBI volume name.
    For example: echo "ubi0:userdata" > /sys/kernel/debug/ubifs/repair_fs

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/debug.c  | 33 +++++++++++++++++++++++++++++++++
 fs/ubifs/repair.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 1fe180c22b96..e8d6e948c32c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -22,6 +22,7 @@
 #include <linux/random.h>
 #include <linux/ctype.h>
 #include "ubifs.h"
+#include "repair.h"
 
 static DEFINE_SPINLOCK(dbg_lock);
 
@@ -2868,6 +2869,7 @@ static struct dentry *dfs_chk_orph;
 static struct dentry *dfs_chk_lprops;
 static struct dentry *dfs_chk_fs;
 static struct dentry *dfs_tst_rcvry;
+static struct dentry *dfs_repair_fs;
 
 static ssize_t dfs_global_file_read(struct file *file, char __user *u,
 				    size_t count, loff_t *ppos)
@@ -2899,6 +2901,33 @@ static ssize_t dfs_global_file_write(struct file *file, const char __user *u,
 	struct dentry *dent = file->f_path.dentry;
 	int val;
 
+	if (dent == dfs_repair_fs) {
+		int ret, i;
+		size_t buf_size;
+		char *dev_name;
+
+		dev_name = vmalloc(PAGE_SIZE);
+		if (!dev_name)
+			return -ENOMEM;
+
+		buf_size = min_t(size_t, count, PAGE_SIZE - 1);
+		if (copy_from_user(dev_name, u, buf_size)) {
+			vfree(dev_name);
+			return -EFAULT;
+		}
+
+		/* Filter '\n' */
+		for (i = 0; i < buf_size; ++i)
+			if (dev_name[i] == '\n' || dev_name[i] == '\0')
+				break;
+		dev_name[i] = '\0';
+
+		ret = ubifs_repair(dev_name);
+		vfree(dev_name);
+
+		return ret < 0 ? ret : count;
+	}
+
 	val = interpret_user_input(u, count);
 	if (val < 0)
 		return val;
@@ -2965,6 +2994,10 @@ void dbg_debugfs_init(void)
 	fname = "tst_recovery";
 	dfs_tst_rcvry = debugfs_create_file(fname, S_IRUSR | S_IWUSR,
 					    dfs_rootdir, NULL, &dfs_global_fops);
+
+	fname = "repair_fs";
+	dfs_repair_fs = debugfs_create_file(fname, S_IWUSR, dfs_rootdir,
+					    NULL, &dfs_global_fops);
 }
 
 /**
diff --git a/fs/ubifs/repair.h b/fs/ubifs/repair.h
index f8d18f07e324..3dcf94787cbe 100644
--- a/fs/ubifs/repair.h
+++ b/fs/ubifs/repair.h
@@ -171,4 +171,6 @@ struct ubifs_repair_info {
 	bool need_update_lpt;
 };
 
+int ubifs_repair(const char *dev_name);
+
 #endif /* !__UBIFS_REPAIR_H__ */
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
