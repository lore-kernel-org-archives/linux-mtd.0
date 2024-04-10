Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7208CD1297
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1Cq/Qf1+9Dxw8YWCv+auk/V86JO2apUXAu8gznOXDo=; b=3Y/DIr7Uzqol3S
	3KZQUKZKqrDQaPKLmDMKrgNt1Yvb4kptb5SMSjCAUNS1X4VG2ysXJOkj/+FtxHez9cAX6/+0E44TB
	zGjIeLIi8Ph8/IcIgBaEzyJyMDeBV0BU6AM9+nSvFlAtTMeIT8yTTU3TfiPOolUQsMR18OcuYbZ4N
	CKfW7wf0f+qrS6QOmgR6KMt9wApKpNm/QldS3t/1QHJvtW7q2VLK9fK503bnYfJrfjMggRfIItNXi
	Dij6JHuC7wJP1+HhN0isgVg8nURrX2bEwYSpUJuY1bdYcFMDOLuxfGqsVgjGX3cdgLu8L6jWoC5tC
	W7qffJ90vor1UYhtkGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruShl-00000005hW2-3k1I;
	Wed, 10 Apr 2024 07:49:13 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruShi-00000005hUX-3uGJ
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:49:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VDvyp4kMszwRt4;
	Wed, 10 Apr 2024 15:46:10 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 01296180072;
	Wed, 10 Apr 2024 15:49:06 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:49:05 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ubi: ubi_init: Fix missed ubiblock cleanup in error handling path
Date: Wed, 10 Apr 2024 15:40:33 +0800
Message-ID: <20240410074033.2523399-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410074033.2523399-1-chengzhihao1@huawei.com>
References: <20240410074033.2523399-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004911_239578_CC6252E1 
X-CRM114-Status: GOOD (  11.35  )
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

The ubiblock_init called by ubi_init will register device number, but
device number is not released in error handling path of ubi_init when
ubi is loaded by inserting module (eg. attaching failure), which leads
to subsequent ubi_init calls failed by running out of device number
(dmesg shows that "__register_blkdev: failed to get major for ubiblock").
Fix it by invoking ubiblock_exit() in corresponding error handling path.

Fixes: 927c145208b0 ("mtd: ubi: attach from device tree")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7f95fd7968a8..354517194099 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1380,12 +1380,13 @@ static int __init ubi_init(void)
 	if (ubi_is_module()) {
 		err = ubi_init_attach();
 		if (err)
-			goto out_mtd_notifier;
+			goto out_block_exit;
 	}
 
 	return 0;
 
-out_mtd_notifier:
+out_block_exit:
+	ubiblock_exit();
 	unregister_mtd_user(&ubi_mtd_notifier);
 out_debugfs:
 	ubi_debugfs_exit();
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
