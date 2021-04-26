Return-Path: <SRS0=STJJ=JX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E94EC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 09:33:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC7460E0C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Apr 2021 09:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC7460E0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5VCR6kP+mSCy19frEvP8Sa6QsyLTNUYidpuo2Gnzmo=; b=N2UwjRXZ6ReCSOi1BNB3vDuWDN
	vr43GOsHy27gScwbLqNZFa3PGa5scLxOlYKsdVyMDUXMdAYyeUMeQSNSitfcusKDhBHkF3830mZSh
	VTf8BEiuD0xZA8HQXP4WB4093xdZ7CE4MoKLUrfprsLvxS+Gb+Cq9f851SBo8jy/wQ32Kbb9ihZCo
	C2k/oVkczHDa7EbzKxxJCl0wz0AQ4UESVlyn21Mj+tommvmcOdWGaa47vOulYMQ9Hozi760HcS2nK
	+R/92nPXr+oogaCqoIRzk1vzO1O9/xriistUtn4UioyO7g6O5pq/0zcNx5S50Nhah6HxddSHF91Q8
	vYEKzB4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laxbi-007K6C-Ca; Mon, 26 Apr 2021 09:32:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laxbf-007K5W-81
 for linux-mtd@desiato.infradead.org; Mon, 26 Apr 2021 09:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SewEIJLB4CBWLDqJmBR3fF5f+WJRSXPFliLpN9wht8M=; b=BLLghYqf7KSyxtOgwkdPWKCgos
 TrZOU8gZb4t9dksMJFv1h3SDTjEhdMDILf+hf4cQRhFpTeUor+UXqjeHj66uWzdQcGLBblUBPGx1s
 5lLkqiYuWdSsmKdWl/l+l0WBHRj+lZcykgfDWlmBxduGK3mKcd0ROkWuz4qEe6B4t84WWT2QUuhV1
 pkB5ndTbrSxD6D5kJcEweHltR49f5MaqSrEfHTeDqc2J014WOSg+NiAErt2Nu1RHGR8B+Xcix9y8Z
 D2V55e9rsTPpVt6xT7jTdPJVRWfhR5mlrdXsN5IO4QyrnXbR04unDNTc3Op8NiKRVH35cSNW38C6b
 XnIQsAeg==;
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laxbb-00FrRK-55
 for linux-mtd@lists.infradead.org; Mon, 26 Apr 2021 09:32:40 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0UWpMjTz_1619429550; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UWpMjTz_1619429550) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 26 Apr 2021 17:32:31 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] mtd: return -ENOMEM when kmalloc failed
Date: Mon, 26 Apr 2021 17:32:23 +0800
Message-Id: <1619429543-52234-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_023239_405246_B4A3CCF7 
X-CRM114-Status: GOOD (  10.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The driver is using -1 instead of the -ENOMEM defined macro to
specify that a buffer allocation failed. Using the correct error
code is more intuitive

Smatch tool warning:
drivers/mtd/inftlmount.c:333 check_free_sectors() warn: returning -1
instead of -ENOMEM is sloppy
drivers/mtd/nftlmount.c:272 check_free_sectors() warn: returning -1
instead of -ENOMEM is sloppy

No functional change, just more standardized.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/mtd/inftlmount.c | 2 +-
 drivers/mtd/nftlmount.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/inftlmount.c b/drivers/mtd/inftlmount.c
index af16d34..39d0241 100644
--- a/drivers/mtd/inftlmount.c
+++ b/drivers/mtd/inftlmount.c
@@ -330,7 +330,7 @@ static int check_free_sectors(struct INFTLrecord *inftl, unsigned int address,
 
 	buf = kmalloc(SECTORSIZE + mtd->oobsize, GFP_KERNEL);
 	if (!buf)
-		return -1;
+		return -ENOMEM;
 
 	ret = -1;
 	for (i = 0; i < len; i += SECTORSIZE) {
diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
index 444a77b..fd331bc 100644
--- a/drivers/mtd/nftlmount.c
+++ b/drivers/mtd/nftlmount.c
@@ -269,7 +269,7 @@ static int check_free_sectors(struct NFTLrecord *nftl, unsigned int address, int
 
 	buf = kmalloc(SECTORSIZE + mtd->oobsize, GFP_KERNEL);
 	if (!buf)
-		return -1;
+		return -ENOMEM;
 
 	ret = -1;
 	for (i = 0; i < len; i += SECTORSIZE) {
-- 
1.8.3.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
