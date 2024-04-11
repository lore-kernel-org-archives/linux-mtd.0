Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C9ACD1292
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 03:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrNWmeTE2reLNCfNWEDle6mgN+0HWP7OZSMBnufNgac=; b=zw/10gpfkGD0Qs
	ZKCw91WLX/c/Fnz8vVTFyFOdbM1cIE2X9xpcOeu9pdJQcZVpGATWqohGGC0qcActlgMaX3ibwcqU2
	8Xllah8oQD/C1pJuiWiilii7vhEEZ/KJ6A6Vm8pb57XYYuUu+QwEywHcVyGs1hmRmx3DC3zzg1f1a
	FeOk0R2hcNSFBmTyr3U7lB74YNEM4S/Z777aOyn8EFn0FXWwxTmqyAq35v4jcQT7O0A3IqjCzUFEE
	995S1fnyQ1P8g9qVN5+pDahwP+KOKszx3iePQXSm+lFne5PdhycywvAg9QxY7nwTI6sYCYOEtKg+i
	NRfIaMkWbLN/F1Wrdr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6K-0000000A9GJ-1Cka;
	Thu, 11 Apr 2024 03:27:48 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6G-0000000A9Dz-48vb
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 03:27:46 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VFQ6f5T02z2NW6b;
	Thu, 11 Apr 2024 11:24:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 1698B1400D9;
	Thu, 11 Apr 2024 11:27:35 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Apr
 2024 11:27:34 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <ben.hutchings@mind.be>,
	<daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 4/4] ubi: debugfs: Replace IS_ERR_OR_NULL with IS_ERR in error checking path
Date: Thu, 11 Apr 2024 11:19:03 +0800
Message-ID: <20240411031903.3050278-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411031903.3050278-1-chengzhihao1@huawei.com>
References: <20240411031903.3050278-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_202745_237631_5C3B33B8 
X-CRM114-Status: UNSURE (   8.91  )
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

Function debugfs_create_dir will return error pointer rather than NULL
if it fails, replace IS_ERR_OR_NULL with IS_ERR just like other places
(eg. fault_create_debugfs_attr).

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/debug.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 989744eb85a5..3bcdf4e70a0a 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -248,11 +248,9 @@ static void dfs_create_fault_entry(struct dentry *parent)
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("fault_inject", parent);
-	if (IS_ERR_OR_NULL(dir)) {
-		int err = dir ? PTR_ERR(dir) : -ENODEV;
-
+	if (IS_ERR(dir)) {
 		pr_warn("UBI error: cannot create \"fault_inject\" debugfs directory, error %d\n",
-			 err);
+			(int)PTR_ERR(dir));
 		return;
 	}
 
@@ -299,11 +297,9 @@ void ubi_debugfs_init(void)
 		return;
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
-	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
-
+	if (IS_ERR(dfs_rootdir)) {
 		pr_warn("UBI error: cannot create \"ubi\" debugfs directory, error %d\n",
-			err);
+			(int)PTR_ERR(dfs_rootdir));
 		return;
 	}
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
