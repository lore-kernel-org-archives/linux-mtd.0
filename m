Return-Path: <SRS0=9i30=ZW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AE6C432C0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Nov 2019 09:33:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE55D20732
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Nov 2019 09:33:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bXtoT8Nu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE55D20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d5wG31C5DLzvgTDRchSO3UCTYBSBNB5ZhYFEXGMq4OM=; b=bXtoT8NuXuFdCf
	wJUlGUEYLocE5aoGBzz5WVkGeBH0UwDXuqltwwFIY7jpFMEGn5UoWAGBQ33Mwb5tBWOF8h5HoqsL7
	e7H7KYyjPrq7NwtpPN6RJdZxTG6+5QR8RBhiZ4gidH0gVe4W5/zRjpcgAbunLtNWzBFsgqA9BVwgs
	y1IV0hEP+jwlJQPUaQz2lEJIszBycEt6iEu9EBj4KVpdJJ8We7HC1SjdgA2wlKXNK/VAUWXvwRRaT
	NzPk0SXfnKvbuSVEym0gYDRHev1f6WAtCXq7hCgNND9rCr2LfWRDd8Q1c0mPorcy0039IfF6ILZMQ
	WwqRsAUFWP1sZbNULfsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaz8D-0003SZ-KY; Sat, 30 Nov 2019 09:33:37 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaz89-0003Rk-BP
 for linux-mtd@lists.infradead.org; Sat, 30 Nov 2019 09:33:35 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R221e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04446; MF=wenyang@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0TjSu.65_1575106399; 
Received: from localhost(mailfrom:wenyang@linux.alibaba.com
 fp:SMTPD_---0TjSu.65_1575106399) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 30 Nov 2019 17:33:26 +0800
From: Wen Yang <wenyang@linux.alibaba.com>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] UBI: fix use after free in ubi_remove_volume()
Date: Sat, 30 Nov 2019 17:33:17 +0800
Message-Id: <20191130093317.31352-1-wenyang@linux.alibaba.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_013333_572072_A564F163 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 xlpang@linux.alibaba.com, Wen Yang <wenyang@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We can't use "vol" after it has been freed.

Fixes: 493cfaeaa0c9 ("mtd: utilize new cdev_device_add helper function")
Signed-off-by: Wen Yang <wenyang@linux.alibaba.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/ubi/vmt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 139ee13..8ff1478 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -375,7 +375,6 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	}
 
 	cdev_device_del(&vol->cdev, &vol->dev);
-	put_device(&vol->dev);
 
 	spin_lock(&ubi->volumes_lock);
 	ubi->rsvd_pebs -= reserved_pebs;
@@ -388,6 +387,8 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	if (!no_vtbl)
 		self_check_volumes(ubi);
 
+	put_device(&vol->dev);
+
 	return 0;
 
 out_err:
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
