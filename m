Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95090C61DA4
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Feb 2023 01:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aSkkspW59xog8WjKLs6SUak4R6q5PYd7aBkOQGPsUMo=; b=k89LEq/v2VZRNI
	lvNJVkLVqUA0rBefJ+9ye3/RREIeEpygN1FCaI2xaBifMwDxbu3AJ8ReEUD5oAUa7c5AvSTtijV9X
	KMnZWjvRa5zjMcdaB7aWBqqaG2eOzxPZqdIcBkKNtZTEIIDrv3Bef27Fh3mXumV3AyMTcMjTqtN5w
	gWeS89YVq/SYyt9qOmBUVdGXlcYB1WyCcPdVB0rs/BOlU4HoCl+utwka+X2llQ5qhCqdTBR66yPva
	exCQkc0j/BVpHoiAjwAAQK1Lt5W6nHCnGDyopSRtaWBHytE0Y3RQ5mPqM4gNxVCfdafaHaaTsEyUF
	we4ahcl5QJRLn9DQyItg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6UA-004EvD-GP; Wed, 15 Feb 2023 01:21:26 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS6U7-004Ero-7G
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2023 01:21:24 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vbhgv1j_1676424078;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Vbhgv1j_1676424078)
          by smtp.aliyun-inc.com;
          Wed, 15 Feb 2023 09:21:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Cc: vigneshr@ti.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] mtd: ubi: Simplify bool conversion
Date: Wed, 15 Feb 2023 09:21:17 +0800
Message-Id: <20230215012117.83938-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_172123_453040_E9278EC8 
X-CRM114-Status: UNSURE (   7.52  )
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

./drivers/mtd/ubi/build.c:1261:33-38: WARNING: conversion to bool not needed here

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4061
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0904eb40c95f..e9c153b7c471 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1258,7 +1258,7 @@ static int __init ubi_init(void)
 		mutex_lock(&ubi_devices_mutex);
 		err = ubi_attach_mtd_dev(mtd, p->ubi_num,
 					 p->vid_hdr_offs, p->max_beb_per1024,
-					 p->enable_fm == 0 ? true : false);
+					 p->enable_fm == 0);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
 			pr_err("UBI error: cannot attach mtd%d\n",
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
