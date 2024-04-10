Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C86CD129A
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hc+91DhN/wARuT5KcRS3JUkBMPpag6uPAEDxhbgcDgw=; b=n+lCDU0F6VfV3V
	R8T/2Of7upZSGCXRUAT7lDaf+eglb5NXMJWU0YpSHWFx/Y8bf2n9iBMSwWoIXI/XIN9tiDFmbP4jG
	7b3AfEcQb0KxTqsqnQX2PElI0qd/cRRu6cb0rUFuN79ZyQDt5UDdSsUGJOBxK36olDJEaNmOZU+D7
	wdttIcSDYRlxelMaD1OPj7RUx6hc+37FQhP1tIOcmO/NEPdjhg9mIKIKhdWXFL5D5EVXHdBhBARoL
	jg6MPY5oUGwlJo6x5NFAlxAE4cg0uS5ZQvMyg8QfDxeDr8whBL0G3VSxvpLrg2ifnyOI0rhxfrsuk
	kkT4zuJDm6HrYPjN4wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSho-00000005hX0-31vp;
	Wed, 10 Apr 2024 07:49:16 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruShl-00000005hUs-0R9O
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 07:49:14 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VDvzY3YCfzNnVX;
	Wed, 10 Apr 2024 15:46:49 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7510118005D;
	Wed, 10 Apr 2024 15:49:05 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 10 Apr
 2024 15:49:04 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ubi: ubi_init: Fix missed debugfs cleanup in error handling path
Date: Wed, 10 Apr 2024 15:40:32 +0800
Message-ID: <20240410074033.2523399-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240410074033.2523399-1-chengzhihao1@huawei.com>
References: <20240410074033.2523399-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_004913_337553_5C064716 
X-CRM114-Status: GOOD (  10.12  )
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

The debugfs dir is created in ubi_init, but it is not destroyed in error
handling path of ubi_init when ubi is loaded by inserting module (eg.
attaching failure), which leads to subsequent ubi_init calls failed.
Fix it by destroying debugfs dir in corresponding error handling path.

Fixes: 927c145208b0 ("mtd: ubi: attach from device tree")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a7e3a6246c0e..7f95fd7968a8 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1372,7 +1372,7 @@ static int __init ubi_init(void)
 
 		/* See comment above re-ubi_is_module(). */
 		if (ubi_is_module())
-			goto out_slab;
+			goto out_debugfs;
 	}
 
 	register_mtd_user(&ubi_mtd_notifier);
@@ -1387,6 +1387,8 @@ static int __init ubi_init(void)
 
 out_mtd_notifier:
 	unregister_mtd_user(&ubi_mtd_notifier);
+out_debugfs:
+	ubi_debugfs_exit();
 out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
