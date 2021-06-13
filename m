Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF079C48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6266100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6266100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZLUn4By5pzGb2nYK6rDfc+tBf8dT3ACEJteBBEuupA=; b=lD1tfVE3d7kDE8
	YF/KxDKswjX9dtTTWRe4W+eIeEG/sfqnE1RwOHkEs36XAqGdp1ahSoBvtX/IXvxUWxdgZ019K1mN3
	HBKbKk6NBxEP9leLV7gFf1hxRjpTTtjsHKbTMofjJi91WLtCovxkSI89BjQiAwkpDGcXHObJV07Br
	RWd4vV2ZEsaBelPezxNglcZM9RzBgdYAc4mLH5qoSVDY/HGEvqhF9P+bKqJNH3IZM92erOhKxr/Mg
	FQcrVug6OIyFvP+DekePFSBRw073CO/e8hwrD4UQVYeZAGsIJVrLV+4oPgb3kwLQ+r4XSEz1KgC35
	222plOTYewlpgxbFwLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOCj-00AIdv-3z; Sun, 13 Jun 2021 11:23:01 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOC1-00AIS7-9V
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:20 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G2sY50jW8zZcxP;
 Sun, 13 Jun 2021 19:19:21 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:22:14 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:22:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 5/6] Revert "mtd: Remove redundant mutex from mtd_blkdevs.c"
Date: Sun, 13 Jun 2021 19:30:34 +0800
Message-ID: <20210613113035.2329421-6-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042217_610252_8DE22763 
X-CRM114-Status: UNSURE (   7.34  )
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

This reverts commit 8cc9de3ebdf654601db51a516267dff89c49acc3.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 41dd3b955136..e8a77f10ae24 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -22,6 +22,7 @@
 
 #include "mtdcore.h"
 
+static DEFINE_MUTEX(mtd_blkdevs_mutex);
 static LIST_HEAD(blktrans_majors);
 static DEFINE_MUTEX(blktrans_ref_mutex);
 
@@ -209,6 +210,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
+	mutex_lock(&mtd_blkdevs_mutex);
 	mutex_lock(&dev->lock);
 
 	if (dev->open++)
@@ -227,6 +229,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
+	mutex_unlock(&mtd_blkdevs_mutex);
 	return ret;
 }
 
@@ -237,6 +240,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return;
 
+	mutex_lock(&mtd_blkdevs_mutex);
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -253,6 +257,7 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
+	mutex_unlock(&mtd_blkdevs_mutex);
 }
 
 static int blktrans_getgeo(struct block_device *bdev, struct hd_geometry *geo)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
