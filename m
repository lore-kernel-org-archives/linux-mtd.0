Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1DEC43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:49:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 435B5206A5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDbHy69I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 435B5206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7IxcznKF5/vnSz1t1lDMovmeW6NWuwMGda5e9MIM5j8=; b=HDbHy69IZIQG458R3vRBhwp90f
	MYNT4AvdJfnZQyMuv4L+680e9jLqiqp2xLJn2IBFveFLt9q/oCjF8EXyqjfSATTh6PVLVcEW/5Ji+
	fhcHEl++21fsOYVgcs7GW4XrA8frc6RvxIxrHWVCrAw5lppxQe9cQEGp6IEJYn3qh+hkrb3G0JmV6
	nc1OGxDmEaBhLarflI9O7Q5UDuyXlQaVjzjqyOVUicq056hqTnFV6lSGsr5c1qYG5jRxyNzv26GXJ
	M2DT8IP8kZ2dtn9QMbtEiF/Lk7n9sRU2TOoDbMi3jgHFjQRWBcrbOV8jo+wEogJs2srt5UT8OzY3y
	jMzVkusA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6Sp-0003Or-87; Fri, 04 Sep 2020 07:48:51 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6Sl-0003NZ-Sw
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 07:48:49 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F41703FFBCD29CF67798;
 Fri,  4 Sep 2020 15:48:33 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Sep 2020 15:48:24 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <m.weisser.m@gmail.com>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] Revert "mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()"
Date: Fri, 4 Sep 2020 15:47:19 +0800
Message-ID: <1599205640-26690-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_034848_833336_E2E3FC6F 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Previous patch intends to restore the flash's QE bit when removed/shutdown,
but may have some problems and break the flash:

- for those originally in Quad mode, this patch will clear the QE bit
  when unloaded the flash, which is incorrect.
- even with above problem solved, it may still break the flash as some
  flash's QE bit is non-volatile and lots of set/reset will wear out
  the bit.
- the restore method cannot be proved to be valid as if a hard
  reset or accident crash happened, the spi_nor_restore() won't be
  performed the the QE bit will not be restored as we expected to.

So let's revert it to fix this. The discussion can be found at [1].

This reverts commit cc59e6bb6cd69d3347c06ccce088c5c6052e041e.

[1] https://lore.kernel.org/linux-mtd/CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com/
Reported-by: Matthias Weisser <m.weisser.m@gmail.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 65eff4c..ab8f554 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3000,8 +3000,6 @@ void spi_nor_restore(struct spi_nor *nor)
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
 		nor->params->set_4byte_addr_mode(nor, false);
-
-	spi_nor_quad_enable(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
