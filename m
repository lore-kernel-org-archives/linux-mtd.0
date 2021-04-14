Return-Path: <SRS0=WaUJ=JL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7D4C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 01:33:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EFE061154
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 01:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EFE061154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/zwEsTRTEFf48vhuxzjfIpikLJCA2069bbO/hq6kdk=; b=lIBvbLJI3z3acvNuB63S7qZIOR
	LClZy06TOCQDb/yHIGKL8nO6ZMZWOQi3maON29MezZGLvxF7fbOPBuwqnbaLydRqaTvAB/g2zUaWU
	9um4qKZJZ8dMaQmFz4eiC+7jh50QqGLPMXX1cTnOZ7pknVFkMfvypL6YceWBdPJpzwssEmnpZlJGI
	wHOccZiCSjchfllOPJMJ2XZoOMu4HkcLYRhpeuLOJzPdHDvBzA2FPOcibSoA/XNlxbKI3Aq+iFfwj
	nd7xYuNim9uFgo6ZbtuBVbIzKP0fnAs7Y/hXe5At8K2SAFKc9rWwPCE3vk3BuaT2FbK06uLG8zZ+g
	vnVoURaw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWUNH-00B426-F1; Wed, 14 Apr 2021 01:31:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUND-00B41c-71
 for linux-mtd@desiato.infradead.org; Wed, 14 Apr 2021 01:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=giP9A+lQB/FJ/2evI2wmFccY4d+fQlsGp8ZVBzLH7M0=; b=Kehk15vhQfjFJVQpswYSBs9CE9
 94e5ikdlNnMQzMiTvQAC8xZTPDFn0GnmS3X2RqHvQ/0AzdG+u/HRlIFuTCaSGoxBN52IEr1OhvH9O
 srrs4DKJHFa1CfIvrdUmZ7SSyeM6XybQp4OvArN7bLV/7WWyErTfJhC1s79/qS5zcIgMSFDSTX2Hd
 YRz88B8d3vaC43RuUJTvxbhgADP/GCTsUQOikWIlZkgsdmPMrAvRwJnHvPzY4YBNWJxAZgZjmvrZP
 aBV71T7M+ppXjyoAMidkZ/mQnUDi/qWDu3BxZIF0RAqKExScxrky6Y5tzIQt+KWiTy6evGYxLSrmP
 p+ukM5Yw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWUN9-007QBS-1c
 for linux-mtd@lists.infradead.org; Wed, 14 Apr 2021 01:31:16 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FKlHN0D8cztVgX;
 Wed, 14 Apr 2021 09:28:48 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 14 Apr 2021 09:30:53 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] mtd: nftlcore: remove set but rewrite variables
Date: Wed, 14 Apr 2021 09:31:14 +0800
Message-ID: <1618363874-25113-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_183115_266657_78A00637 
X-CRM114-Status: UNSURE (   8.74  )
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

The value of lastEUN is not used at line 622, and will rewrite a new value
at line 541. so just remote the line at 622.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mtd/nftlcore.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index bcd0094..913db0dd 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -619,7 +619,6 @@ static inline u16 NFTL_findwriteunit(struct NFTLrecord *nftl, unsigned block)
 				return BLOCK_NIL;
 			}
 			//printk("Restarting scan\n");
-			lastEUN = BLOCK_NIL;
 			continue;
 		}
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
