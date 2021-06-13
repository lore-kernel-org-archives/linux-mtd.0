Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D611C48BDF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A646100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2A646100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mg4R78vsaZuVHPBP8bf/mHTrVK+xOLXO5Nv/AO+B3OQ=; b=Jg8SOno2raMaXc
	Lgdh+ixyEZL5jLG0JQFhcL2z7N4fAUfHAeuLbfc1UmbLxGaUFJBS2iyR6D/DYteMFLe25tXuzgjnA
	0yaUfh+FTXk79tGtPbRnJ3Il9j8NMHhoNgHkIVS8JAHr3PtmwHp59uvnm+e3VkZGUy7PrsWiHKeTh
	+SQj57QxaU1Z5uwslQZvoLoYS9udPZIo7H7X9LC54VO6wlDQeW9/0RJrcDrtsiRTxzrWgVWTN51/R
	/bh/hiDOjVOw3t2fIq/poEJFKiovpqMSYlISZGI+JQF/CZTk5SCEiEylnreKwJooZSdHJf5x/UjZr
	yheRpMYBmgT9UADIQ0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsODx-00AJ3M-5N; Sun, 13 Jun 2021 11:24:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOC1-00AIS9-9X
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:20 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G2sXq2Yn0z6wKG;
 Sun, 13 Jun 2021 19:19:07 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
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
Subject: [PATCH 6/6] Revert "mtd: allow to unload the mtdtrans module if its
 block devices aren't open"
Date: Sun, 13 Jun 2021 19:30:35 +0800
Message-ID: <20210613113035.2329421-7-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042217_747909_CD8AC3CB 
X-CRM114-Status: GOOD (  15.04  )
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

This reverts commit 008c751ec78587dd9b48bb62d4b10d616554fea2.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 49 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index e8a77f10ae24..4d386617fd8a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -205,7 +205,7 @@ static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
-	int ret = 0;
+	int ret;
 
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
@@ -213,17 +213,17 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	mutex_lock(&mtd_blkdevs_mutex);
 	mutex_lock(&dev->lock);
 
-	if (dev->open++)
+	if (!dev->mtd) {
+		ret = -ENXIO;
 		goto unlock;
-
-	kref_get(&dev->ref);
-	__module_get(dev->tr->owner);
-
-	if (dev->mtd) {
-		ret = dev->tr->open ? dev->tr->open(dev) : 0;
-		__get_mtd_device(dev->mtd);
 	}
 
+	ret = !dev->open++ && dev->tr->open ? dev->tr->open(dev) : 0;
+	/* Take another reference on the device so it won't go away till
+	 * last release */
+	if (!ret)
+		kref_get(&dev->ref);
+
 	dev->file_mode = mode;
 
 unlock:
@@ -243,17 +243,14 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	mutex_lock(&mtd_blkdevs_mutex);
 	mutex_lock(&dev->lock);
 
-	if (--dev->open)
-		goto unlock;
-
+	/* Release one reference, we sure its not the last one here*/
 	kref_put(&dev->ref, blktrans_dev_release);
-	module_put(dev->tr->owner);
 
-	if (dev->mtd) {
-		if (dev->tr->release)
-			dev->tr->release(dev);
-		__put_mtd_device(dev->mtd);
-	}
+	if (!dev->mtd)
+		goto unlock;
+
+	if (!--dev->open && dev->tr->release)
+		dev->tr->release(dev);
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
@@ -408,6 +405,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	gd->queue = new->rq;
 
+	__get_mtd_device(new->mtd);
+	__module_get(tr->owner);
+
 	if (new->readonly)
 		set_disk_ro(gd, 1);
 
@@ -456,15 +456,16 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	blk_mq_unquiesce_queue(old->rq);
 	blk_mq_unfreeze_queue(old->rq);
 
-	/* If the device is currently open, tell trans driver to close it,
-		then put mtd device, and don't touch it again */
+	/* Ask trans driver for release to the mtd device */
 	mutex_lock(&old->lock);
-	if (old->open) {
-		if (old->tr->release)
-			old->tr->release(old);
-		__put_mtd_device(old->mtd);
+	if (old->open && old->tr->release) {
+		old->tr->release(old);
+		old->open = 0;
 	}
+	__put_mtd_device(old->mtd);
+	module_put(old->tr->owner);
 
+	/* At that point, we don't touch the mtd anymore */
 	old->mtd = NULL;
 
 	mutex_unlock(&old->lock);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
