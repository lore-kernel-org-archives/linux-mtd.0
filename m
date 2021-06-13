Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CE5C48BDF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F3D6100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F3D6100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UK5EUjI4yipQ1fCTU9n8augTymjgY+6ctXdOKzmkhRk=; b=xeE/x8II6wgzkr
	1oZ2DfLEF4NS7iBIadrC7wXBlPy1iByFivHbFIhYDVeoCQFV/++nv6a38CH39O4riFUqcj4B3USTL
	nFlHGV2jtxAZ4CQz3dTgnPZB+zstSgGhfctx4rTP0QBMl1JJS8hlOBb+5Sq1A9NK8EJtpdhRWAFRf
	7B3t4roERyN54EvRjJxu9Eks3JETTft/jxGSfxQT7PzXsRh3ohVAu/07BNXKIhPC/5LsXWjCVpXG4
	u2In//4VF+fEpdPyWdYQ+kSS13aJHvYxTNyRhUxuOH2RGwzQ8PBjIWKLnIKvwDYh/1UmE7aBkW+Iv
	TNOp+GyPa6COAIMpOhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOD2-00AIkB-9G; Sun, 13 Jun 2021 11:23:20 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOC1-00AIS5-9W
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:20 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G2sVg2wSrzXfLW;
 Sun, 13 Jun 2021 19:17:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:22:12 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:22:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 2/6] Revert "mtd: fix: avoid race condition when accessing
 mtd->usecount"
Date: Sun, 13 Jun 2021 19:30:31 +0800
Message-ID: <20210613113035.2329421-3-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042217_623133_CAA1007C 
X-CRM114-Status: UNSURE (   6.55  )
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

This reverts commit 073db4a51ee43ccb827f54a4261c0583b028d5ab.
---
 drivers/mtd/mtd_blkdevs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 16ccce3e7fdb..00b13f71ccf3 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -210,7 +210,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
 
 	mutex_lock(&dev->lock);
-	mutex_lock(&mtd_table_mutex);
 
 	if (dev->open)
 		goto unlock;
@@ -234,7 +233,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 
 unlock:
 	dev->open++;
-	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
@@ -245,7 +243,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 error_put:
 	module_put(dev->tr->owner);
 	kref_put(&dev->ref, blktrans_dev_release);
-	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
@@ -259,7 +256,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 		return;
 
 	mutex_lock(&dev->lock);
-	mutex_lock(&mtd_table_mutex);
 
 	if (--dev->open)
 		goto unlock;
@@ -273,7 +269,6 @@ static void blktrans_release(struct gendisk *disk, fmode_t mode)
 		__put_mtd_device(dev->mtd);
 	}
 unlock:
-	mutex_unlock(&mtd_table_mutex);
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 }
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
