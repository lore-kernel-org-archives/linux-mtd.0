Return-Path: <SRS0=LBUh=NI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D1BC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B132B60F41
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Aug 2021 03:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B132B60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SLRI6wDDvft4+K02sMhQQjYieh2YZTo9/KR/DKc/J9M=; b=o41Qi2WZ24frVq
	JVz9qjUYyMT/ijVnZBp5x4AmjOQLIWl0UhuP5/JnEk9pHfdEDqXD8FL+K+Um4KhypQEi/ifjiY3IM
	OYaGWrGTxM3Ripsa+vn+ceoN1AB3HSJw/xU6aKlTDHoAdmFWgHbIcfFNhorbPkKPRsPWIwN/USZ0m
	SD3UOLzcXAg5T2GKNAwz7/JDRNKyWwECWGnapgIhLmWKzgB+wTnbCCEaRj2TgIt2IosgCLJbMx0SL
	ctyfigRrgnNuRVSnVC/mo39vWxv0lOHhlalABN46TG1ENui2Y1vu8n5KyL9o6Dv3kwt4aN4uaz6tn
	WnapyOi8bldRXl3j53Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFpWb-000udP-4K; Tue, 17 Aug 2021 03:12:25 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFowo-000q3W-28
 for linux-mtd@lists.infradead.org; Tue, 17 Aug 2021 02:35:30 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GpZr14DFvzYqMs;
 Tue, 17 Aug 2021 10:34:57 +0800 (CST)
Received: from dggema761-chm.china.huawei.com (10.1.198.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 10:35:20 +0800
Received: from huawei.com (10.175.127.227) by dggema761-chm.china.huawei.com
 (10.1.198.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 17
 Aug 2021 10:35:19 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <bbrezillon@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2] mtd: mtdconcat: Check existence of _read|_write from
 subdev'master device before assigning
Date: Tue, 17 Aug 2021 10:45:52 +0800
Message-ID: <20210817024552.1691649-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema761-chm.china.huawei.com (10.1.198.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_193526_339578_1230F7F7 
X-CRM114-Status: UNSURE (   9.81  )
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

Since 2431c4f5b46c3 ("mtd: Implement mtd_{read,write}() as wrappers
around mtd_{read,write}_oob()") don't allow _write|_read and
_write_oob|_read_oob existing at the same time. We should check the
existence of callbacks "_read and _write" from subdev's master device
(We can trust master device since it has been registered) before
assigning, otherwise following warning occurs while making
concatenated device:

  WARNING: CPU: 2 PID: 6728 at drivers/mtd/mtdcore.c:595
  add_mtd_device+0x7f/0x7b0

Fixes: 2431c4f5b46c3 ("mtd: Implement mtd_{read,write}() around ...")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/mtdconcat.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index af51eee6b5e8..f685a581df48 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -694,6 +694,10 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 		concat->mtd._block_markbad = concat_block_markbad;
 	if (subdev_master->_panic_write)
 		concat->mtd._panic_write = concat_panic_write;
+	if (subdev_master->_read)
+		concat->mtd._read = concat_read;
+	if (subdev_master->_write)
+		concat->mtd._write = concat_write;
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
 
@@ -755,8 +759,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	concat->mtd.name = name;
 
 	concat->mtd._erase = concat_erase;
-	concat->mtd._read = concat_read;
-	concat->mtd._write = concat_write;
 	concat->mtd._sync = concat_sync;
 	concat->mtd._lock = concat_lock;
 	concat->mtd._unlock = concat_unlock;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
