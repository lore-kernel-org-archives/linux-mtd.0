Return-Path: <SRS0=Sdmk=LH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5562FC48BCF
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE8E6100B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Jun 2021 11:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE8E6100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wh2gHZhZ5ENQmw38/rPKBaMdTVF2t91PPCnNgNvwf1A=; b=UYpUhuwJ8HBrnu
	HAVqfOZ4EWM6luVRh3v8BAsPziPXFUJadj1lh9w5TbAq8FCeIhiJsn5sJLSXX+WlLnHaXJIOvtkNt
	PN+gUPIxPl8Xn6ZChhJ22G+eo2ojSdLm3Dw4n5qN7pUDrxZwHBdd10DSNP3+K7IVRpuT6qVS28VTv
	KeUBJXv5DHgts5SzIzsrK4Uf8PiVtFrCus3FQsFOtTQ/6D8q0tiIusM/nfWp4k3v5VtiwsZqfri8U
	q6KCN0P+Fm+whqQ717yGO0+fNWDosVPhFFd3gF0AA2RtWU3koFvXZD1wSCGHnJk0YSVYPBvPCPbh9
	CUFaeHaS9GxW+BBZNgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsOCF-00AIWQ-8R; Sun, 13 Jun 2021 11:22:31 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsOC1-00AIS6-9T
 for linux-mtd@lists.infradead.org; Sun, 13 Jun 2021 11:22:19 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G2sVg5vjlzXfLX;
 Sun, 13 Jun 2021 19:17:15 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sun, 13 Jun 2021 19:22:13 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 13
 Jun 2021 19:22:12 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 3/6] Revert "mtd: mtd_blkdevs: don't increase 'open' count on
 error path"
Date: Sun, 13 Jun 2021 19:30:32 +0800
Message-ID: <20210613113035.2329421-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210613113035.2329421-1-chengzhihao1@huawei.com>
References: <20210613113035.2329421-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_042217_556737_08C9B159 
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

This reverts commit 342ff28f5a2e5aa3236617bd2bddf6c749677ef2.
---
 drivers/mtd/mtd_blkdevs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 00b13f71ccf3..100a3c96760c 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -211,7 +211,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 
 	mutex_lock(&dev->lock);
 
-	if (dev->open)
+	if (dev->open++)
 		goto unlock;
 
 	kref_get(&dev->ref);
@@ -232,7 +232,6 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	dev->file_mode = mode;
 
 unlock:
-	dev->open++;
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
 	return ret;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
