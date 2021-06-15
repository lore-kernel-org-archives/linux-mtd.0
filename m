Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E916FC48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 18:23:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B903F610CD
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 18:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B903F610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1g9t/ELcj5VjoAg11ZpIAvD9bm/2O+HZlTGGBIHzzpU=; b=Ar21wW13r/vPP/
	hWJ1CfdVOO1QgiJT6IwLKIYEL0Q54nJHxzi95zBp1W4hBnD+aGRhoCl0xIC0BaIj85lBHLKhLtaXn
	uiEX67+3AeuO8PjMdibEoDRsggG+Hs1Ozs6ORKhSkQAR/TTnVPpGcKqelFsTsHkzBYhP3ArPo+OIe
	PEMOlcZQ9nlRs9ytLCHNPhERQ35ebAKyRg9PObDSS4YKvMYa7zyw5PoziuQ7pz4mP7LADTuiqFxTI
	ktm/0VNg1dza1zazElYMO8+TjmIP2t3biCnKof9yFrTja8jwvA4nRfvt8yC56xZcdsjRk+ctbRgOF
	QtF0vZW7AT+Sb6zLcS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltDhh-00252A-61; Tue, 15 Jun 2021 18:22:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9IU-000DEY-Qg
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=P+3MD2BAdmiEd9AzZlfnvDozzFTWApf3GbiqIUUDOws=; b=VkQukmIRAzlCL5XAVBYnNbX2gr
 WDBahAsO3omsewvxe0cMlXmLILl4FPIU7mbGmUe5JmNO5iqZH25p5J9jF5ahjelFvFj+abFPzYfUr
 w3xnynbcRPI6plAldQdVdYWO6j1MkJhS9Qw+gZdTGP5LiyhykqugMvrNBenQCkhXBIfXKHcrVmb8k
 MJsKvBwc5BngRWHTFxiHSKIAAoc+YmlkQYeYkC88ja/7qUZFhdPHsSkhT+nznGXMELf8zrO5x/u4R
 +2K4aD8M83i0Vr4ufpU3CPuNF8DuqzU3xjLri5t47QSHpRfQL72CjXFmOvu+XgF78L8DoVJlkSXNo
 wQzJiZ3A==;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt4zb-007XeI-BO
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 09:04:28 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G42Mn2QStz63VN;
 Tue, 15 Jun 2021 17:00:21 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 17:04:07 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 17:04:06 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <alexander.sverdlin@nokia.com>, <computersforpeace@gmail.com>,
 <maximlevitsky@gmail.com>, <David.Woodhouse@intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2] mtd: mtd_blkdevs: Get|Put mtd_device in
 add|del_mtd_blktrans
Date: Tue, 15 Jun 2021 17:13:02 +0800
Message-ID: <20210615091302.3428611-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_100426_880518_723E7D2A 
X-CRM114-Status: GOOD (  12.47  )
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

There are two reasons to move mtd_device get|put operations into mtd
blktrans adding/deleting:

* Solve an AA-deadlock problem while formating mtd device to generate
  a ftl device.
  [<0>] blktrans_open+0x47/0x340            LOCK(mtd_table_mutex)
  [<0>] __blkdev_get+0x5b/0x3e0
  [<0>] blkdev_get_by_dev+0x18f/0x370
  [<0>] __device_add_disk+0x2db/0x700
  [<0>] device_add_disk+0x17/0x20
  [<0>] add_mtd_blktrans_dev+0x39e/0x6d0
  [<0>] ftl_add_mtd+0x792/0x908 [ftl]
  [<0>] register_mtd_blktrans+0xfb/0x170    LOCK(mtd_table_mutex)
  [<0>] ftl_tr_init+0x18/0x1000 [ftl]
  [<0>] do_one_initcall+0x71/0x330
  [<0>] do_init_module+0xa6/0x350

* Hold refcount of mtd device's module if mtd blktrans still exists.
  Module                  Size  Used by
  mtdblock               20480  0
  mtdram                 20480  0
  $ lsblk
  mtdblock0  31:0    0  64M  0 disk
  $ rmmod mtdram
  # mtd device is removed unexpectedly when mtdblock exists!
  $ lsmod
  Module                  Size  Used by
  mtdblock               20480  0
  $ lsblk
  // No mtdblock found !

Patched:
  Module                  Size  Used by
  mtdblock               20480  0
  mtdram                 20480  1
  $ lsblk
  mtdblock0  31:0    0  64M  0 disk
  $ rmmod mtdram        # EBUSY, and /dev/mtdblock0 still exists

, which works just like ubi/mtd:
  Module                  Size  Used by
  ubi                   380928  0
  mtdram                 20480  1

Fixes: 073db4a51ee43c ("mtd: fix: avoid race condition when ...")
Fixes: 008c751ec78587 ("mtd: allow to unload the mtdtrans module if ...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtd_blkdevs.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..19a2870a097a 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -209,7 +209,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
-	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	if (dev->open)
@@ -227,26 +226,18 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 			goto error_put;
 	}
 
-	ret = __get_mtd_device(dev->mtd);
-	if (ret)
-		goto error_release;
 	dev->file_mode = mode;
 
 unlock:
 	dev->open++;
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 
-error_release:
-	if (dev->tr->release)
-		dev->tr->release(dev);
 error_put:
 	module_put(dev->tr->owner);
 	kref_put(&dev->ref, blktrans_dev_release);
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -258,7 +249,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return;
 
-	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	if (--dev->open)
@@ -267,14 +257,10 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 	kref_put(&dev->ref, blktrans_dev_release);
 	module_put(dev->tr->owner);
 
-	if (dev->mtd) {
-		if (dev->tr->release)
-			dev->tr->release(dev);
-		__put_mtd_device(dev->mtd);
-	}
+	if (dev->mtd && dev->tr->release)
+		dev->tr->release(dev);
 unlock:
 	mutex_unlock(&dev->lock);
-	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 }
 
@@ -425,6 +411,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 
 	gd->queue = new->rq;
+	__get_mtd_device(new->mtd);
 
 	if (new->readonly)
 		set_disk_ro(gd, 1);
@@ -474,15 +461,15 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	blk_mq_unquiesce_queue(old->rq);
 	blk_mq_unfreeze_queue(old->rq);
 
-	/* If the device is currently open, tell trans driver to close it,
-		then put mtd device, and don't touch it again */
+	/* If the device is currently open, tell trans driver to close it */
 	mutex_lock(&old->lock);
 	if (old->open) {
 		if (old->tr->release)
 			old->tr->release(old);
-		__put_mtd_device(old->mtd);
 	}
+	__put_mtd_device(old->mtd);
 
+	/* At that point, we don't touch the mtd anymore */
 	old->mtd = NULL;
 
 	mutex_unlock(&old->lock);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
