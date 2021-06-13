Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6DEC48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5216100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5216100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJZRu3W2LnitsXWKnYIEwC8uyM/HNslN8QINbbqvdMk=; b=vRDidwXRAVcP2V
	eWOlNLXZsCmjZagwjWAOOw/4Kb5KACLkIX32hVe2AhlfT0y5N8PmZO56JjrbpXn9PXPQSxSxXG6eA
	HOkwn/AAn4KTtdWV1HLx50CiBa9Kouuii1BSpUcxG62DORm/kTii/ZatMIBszUVaZtzAXKpfPHSPM
	RrFjJi2rcwdU30JbAafkTHEmry7CuY8THYdIgqzaFOLLUMLuoslJNB6BJSxbhK+9sdFJEiBqsDI8Q
	UADE+EIJNklk4ZpZNcqhowmpnspJyuPrc4fH6ZfouvDtP54r18lVNdzIy8xsBkkBGzdFntbF738dt
	eZ/o94/FRUx5KYA48iNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOCT-00AIaV-Fc; Sun, 13 Jun 2021 11:22:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOC1-00AIS4-8P
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:19 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G2sVh3GsKz1BLsp;
 Sun, 13 Jun 2021 19:17:16 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:22:13 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:22:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 4/6] Revert "mtd: mtd_blkdevs: fix error path in blktrans_open"
Date: Sun, 13 Jun 2021 19:30:33 +0800
Message-ID: <20210613113035.2329421-5-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042217_536756_8BCF46E8 
X-CRM114-Status: UNSURE (   7.92  )
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

This reverts commit 94735ec4044a6d318b83ad3c5794e931ed168d10.
---
 drivers/mtd/mtd_blkdevs.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 100a3c96760c..41dd3b955136 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -217,34 +217,17 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	kref_get(&dev->ref);
 	__module_get(dev->tr->owner);
 
-	if (!dev->mtd)
-		goto unlock;
-
-	if (dev->tr->open) {
-		ret = dev->tr->open(dev);
-		if (ret)
-			goto error_put;
+	if (dev->mtd) {
+		ret = dev->tr->open ? dev->tr->open(dev) : 0;
+		__get_mtd_device(dev->mtd);
 	}
 
-	ret = __get_mtd_device(dev->mtd);
-	if (ret)
-		goto error_release;
 	dev->file_mode = mode;
 
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
-
-error_release:
-	if (dev->tr->release)
-		dev->tr->release(dev);
-error_put:
-	module_put(dev->tr->owner);
-	kref_put(&dev->ref, blktrans_dev_release);
-	mutex_unlock(&dev->lock);
-	blktrans_dev_put(dev);
-	return ret;
 }
 
 static void blktrans_release(struct gendisk *disk, fmode_t mode)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
