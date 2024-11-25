Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3969D58D41
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YCtuZqUSM/cCz7fEEWSZRkMrz+/BTdmmJgOp8A/Q+fE=; b=dS6C4YQOuyGLE4
	bJM5X3Seua6pS+PCUB2PBoVYiahNdlUMYk0CkaN/7Yqzd1HppIKgel4QtDsExbXzMsQ10J7m3tyDl
	SIsDR6oiLKQG9iEfKtglCYEp+lxFMT5vk3h9EtHMOJg7gjXEBhEEh1XETikkNjJxrTNk42TMMjs0E
	Oje0fPFbVHz/hXStyicdIxOtHanc6WJkzKXce3cvhx4kg1pHkrPG+pROv7SsXBmhXgIGNlJe3PItQ
	1kWPJOX8BSfkU/PPTgGGFSt1aDapoD9bv52auW8sP6d/J/DlXHJDsCkqQo3vzktV3tQc6576LWO30
	tSOBxdQEwuXs9e77YLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ4O-000000087St-1pHJ;
	Mon, 25 Nov 2024 13:24:04 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ4L-000000087RM-1jzG
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:24:03 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1732541034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFKDfOJD5MtsvM9qPgyBIcDPWdEyT/n1xOdmdxQMH/U=;
	b=Xwanjh2Mf1uPIgyu0Y6ffQ2pqj3KN5z1ZCDYAYmYyxCZtRFN9HK5ZD56PUJqYP/hHPDDsu
	qtSb0ebngnhjyLHLGgwlnPKvrmTRtf2L28UPw3RcR3DfJnXHN2z6+VA0IOiYUlqM1DNwvD
	z7I4etOQIJHpqBA6/lLcHLx+9k6n84M=
To: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: Added a check for ubi_num
Date: Mon, 25 Nov 2024 16:23:54 +0300
Message-Id: <20241125132354.16188-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_052401_951699_6331BBEF 
X-CRM114-Status: UNSURE (   9.57  )
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

Added a check for ubi_num for negative numbers
If the variable ubi_num takes negative values then we get:

qemu-system-arm ... -append "ubi.mtd=0,0,0,-22222345" ...
[    0.745065]  ubi_attach_mtd_dev from ubi_init+0x178/0x218
[    0.745230]  ubi_init from do_one_initcall+0x70/0x1ac
[    0.745344]  do_one_initcall from kernel_init_freeable+0x198/0x224
[    0.745474]  kernel_init_freeable from kernel_init+0x18/0x134
[    0.745600]  kernel_init from ret_from_fork+0x14/0x28
[    0.745727] Exception stack(0x90015fb0 to 0x90015ff8)

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 897a316c9e6f ("UBI: handle attach ioctl")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/ubi/build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 30be4ed68fad..dae569f48b87 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -920,7 +920,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 			return -ENFILE;
 		}
 	} else {
-		if (ubi_num >= UBI_MAX_DEVICES)
+		if (ubi_num < UBI_DEV_NUM_AUTO || ubi_num >= UBI_MAX_DEVICES)
 			return -EINVAL;
 
 		/* Make sure ubi_num is not busy */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
