Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4335CD129C
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 03:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hc+91DhN/wARuT5KcRS3JUkBMPpag6uPAEDxhbgcDgw=; b=nhyTqDAJv/5dFS
	QeRphJy3AP8vfUhjxU5ZdwCzKmFmiYPXs45Be8cpYC5QR+WxLAVYvbUIsYhWxcMTVkMiZz1uMa3KX
	DjiiiNWwfDSk1GDpIW3HL8r/be+cdnxof0Waq40BrnK5PVnmTi9MNW0ZWaQSHDnf8hV49Yvc+lgpl
	wMvyk1OGXCipLs7AFtNsEVRNV9b5/moa8MG19GXjcA/N3VPuGjkdcGXUe6Xl+rG9H0n0gJKNhDFfB
	07R8S8amNMSeusk8sdX+F49m44sDEFkAPz3bsVgkH1ZuoJBDmoByqfGH6Y4KCdxJyUKu8JLs10JVw
	dqMzzMQNKtT5sLapeuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6M-0000000A9HX-2z9y;
	Thu, 11 Apr 2024 03:27:50 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rul6G-0000000A9E0-48qY
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 03:27:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4VFQ923Rjpz1GGdb;
	Thu, 11 Apr 2024 11:26:46 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D2541A0172;
	Thu, 11 Apr 2024 11:27:33 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 11 Apr
 2024 11:27:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <ben.hutchings@mind.be>,
	<daniel@makrotopia.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] ubi: ubi_init: Fix missed debugfs cleanup in error handling path
Date: Thu, 11 Apr 2024 11:19:00 +0800
Message-ID: <20240411031903.3050278-2-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411031903.3050278-1-chengzhihao1@huawei.com>
References: <20240411031903.3050278-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_202745_224906_218A17A9 
X-CRM114-Status: GOOD (  10.30  )
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
