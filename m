Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8560EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jV7MZZW8lr8yxoUGic2dt47tbzz7yF3lo4qUQVyVFdI=; b=DPF1pqFEFMjvUM
	0Jj/DcVWrKHBx+162SpgvKbTwh+hI8rmmjPm9pYBVInTOoTFiLhrw2COk68twXgKgZWhoWeG7jlmc
	vJlfH8tTh/BvrhZlMSnqfCX+YIOVGD/2+kfC2e2hPKvKNxNhlMuApTDDEJKm/8ReIa8uOIMXx3DDG
	fv2goAGzxeunKJifWB25coUe8P/o6+u20wDPTEWomusVq1GuK2lIYkvqMaltZIGqzbnC5+w25D7o+
	1JzTkirTeFV1QQFkEJ1I7Ttd1cad0sm23m3rtug2KGlALQmdTZpfKqWg3l3EpRu57kvUBwtOOY0RQ
	yEt6IX2WIPbJZLA9SFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM16n-005z8Z-3B;
	Wed, 19 Jul 2023 06:56:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM16m-005z7S-14
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=odZRLqyWhTI+RBKweEfLBIe+YOiV+pzEDHF+kD1TAjs=; b=W/jDyKSqeOMhPzrmovWb8cuT23
	0G/dvFqGVRxLRVqlkkYVARv0riderNjfIZmwa2+M8Yfu7Zj6Cr0l8knqZ/sbyYyneNCKTorWTMSA7
	PkxzHHbo1bYV2yvUPL09A+30xzJhGFDS8bODzPUgBDEFXkRZFClZlxj4aDjGt6X/jtwjFBQ7fOa5+
	SRQz41mS/lp87vUEYz9BcnOdR2K/7jWXiMyA2HH5udbMq36ExdIupOqtX9giKD/W4U0SdzD7lvAte
	kzi6truMmuv5P0/AhQQABxrIQyD5nBQgkygxmAL7ZwUaB7vT6gajY1ykby9ocrU7QeSeg7c1olZA3
	TbLR9bdQ==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgU3-00BK2O-1W
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 08:55:05 +0000
Received: from dggpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R4t503sJqzVjbd;
	Tue, 18 Jul 2023 16:52:52 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 16:54:14 +0800
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <wangzhaolong1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH V2 5/5] mtd: Add several functions to the fail_function list
Date: Tue, 18 Jul 2023 16:51:19 +0800
Message-ID: <20230718085119.3885747-6-wangzhaolong1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
References: <20230718085119.3885747-1-wangzhaolong1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_095504_051968_7D966927 
X-CRM114-Status: GOOD (  10.26  )
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

add mtd_read(), mtd_write(), mtd_erase(), mtd_block_markbad() to
fail_function list for testing purpose

Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>
---
 drivers/mtd/mtdcore.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e00b12aa5ec9..ecf1c5e68479 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -30,6 +30,7 @@
 #include <linux/debugfs.h>
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
+#include <linux/error-injection.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -1396,6 +1397,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
+ALLOW_ERROR_INJECTION(mtd_erase, ERRNO);
 
 /*
  * This stuff for eXecute-In-Place. phys is optional and may be set to NULL.
@@ -1493,6 +1495,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_read);
+ALLOW_ERROR_INJECTION(mtd_read, ERRNO);
 
 int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	      const u_char *buf)
@@ -1509,6 +1512,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_write);
+ALLOW_ERROR_INJECTION(mtd_write, ERRNO);
 
 /*
  * In blackbox flight recorder like scenarios we want to make successful writes
@@ -2329,7 +2333,7 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtd_block_markbad);
-
+ALLOW_ERROR_INJECTION(mtd_block_markbad, ERRNO);
 /*
  * default_mtd_writev - the default writev method
  * @mtd: mtd device description object pointer
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
