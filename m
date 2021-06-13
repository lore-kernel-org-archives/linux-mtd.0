Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5DAC48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28FF561279
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28FF561279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6F3DawuNjrPZeilLNngsNA9g1yvifAfDdMx+l1kkJc=; b=WmrQNqIzBEGu7B
	I8P8vWpKigHxDwmo26OKTEvbTtHnxd4bJlLzJcz0mIimGteO8Ht64WOuVF9BBv5a6O9CehLA5G/5A
	OY2qNDbrXwKZCGcfJX35z70Vx3iIvTKGEjLAHbne+Qr5/8QxSf9pZ1tvdNO9KAkWr2aBNaSofVkch
	5EncO9O1Ux8fp92/T206P9KM5Uf7ToCNpH+JWGgm4iWIr3kRExNQPDxCKuDP6hge6gCqHvjP4jEUH
	yqH1crJQa3/IdWIqu3sa3DK7mmiiX4TyvtwrjxyR2upUqSzKMAXxWjr8B0h0OwKVXKnDVd4tYdHqC
	HqeakERWVTjEi89W49qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOBD-00AIO2-8l; Sun, 13 Jun 2021 11:21:27 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOBA-00AINS-34
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:21:25 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G2sVg6Mmtz6xBX;
 Sun, 13 Jun 2021 19:17:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:21:11 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:21:11 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@bootlin.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] mtd: ftl: Initialize rq.limits.discard_granularity
Date: Sun, 13 Jun 2021 19:29:42 +0800
Message-ID: <20210613112942.2329192-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042124_321132_FFA0E7E1 
X-CRM114-Status: UNSURE (   8.43  )
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

Since commit b35fd7422c2f8("block: check queue's limits.discard_granularity
in __blkdev_issue_discard()") checks rq.limits.discard_granularity in
__blkdev_issue_discard(), we may get following warnings while formating ftl:

  WARNING: CPU: 2 PID: 7313 at block/blk-lib.c:51
  __blkdev_issue_discard+0x2a7/0x390

Reproducer:
  1. ftl_format /dev/mtd0
  2. modprobe ftl
  3. mkfs.vfat /dev/ftla
  4. mount -odiscard /dev/ftla temp
  5. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct
  6. dd if=/dev/zero of=temp/tst bs=1M count=10 oflag=direct

Fix it by initializing rq.limits.discard_granularity in ftl_add_mtd().

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ftl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 9b33c082179d..fb31e33b8a77 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -70,6 +70,7 @@
 #include <linux/hdreg.h>
 #include <linux/vmalloc.h>
 #include <linux/blkpg.h>
+#include <linux/blkdev.h>
 #include <linux/uaccess.h>
 
 #include <linux/mtd/ftl.h>
@@ -1029,8 +1030,11 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 		partition->mbd.tr = tr;
 		partition->mbd.devnum = -1;
-		if (!add_mtd_blktrans_dev((void *)partition))
+		if (!add_mtd_blktrans_dev((void *)partition)) {
+			partition->mbd.rq->limits.discard_granularity =
+								tr->blksize;
 			return;
+		}
 	}
 
 	kfree(partition);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
