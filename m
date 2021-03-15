Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E636C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 01:09:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCF9F64E10
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 01:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCF9F64E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4LeZHn+tnTH37oSaGIkF4Do1AGd5AzHKWBjPbQu2wI=; b=AqUbg8MOTykysKFAQnrAp51i9C
	/zc4dUeQED4azy8yCnNwnVTopLQZqyyLKBCQ83Z0GEnquDmJ/UKTE3zudGWUxiOjaPe+ralSzV7+T
	r2fvm2c+CbkeKF6GZFKvwRU88bTn94jnYW4YoHwe6r1030Yd5SDZPKOKq7YDyljrqd1m85Emc++qC
	+VAsreAq7gqExXHoT5LJ2Idjn8dWyV2X74gpFTddVy5XVy1uvg11zDZ2DUhC/hynNP+N1i4fHf1fI
	c0jmv8W59e1RezIbN2lfHHLkTRc/JjVtqkYJSA61D3Tmhk9QThWbUt7NMBGpxb935MUnpPHo+F6zC
	+jbtGC9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLbiE-00EiNS-QH; Mon, 15 Mar 2021 01:08:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLbi6-00EiMr-72
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 01:07:57 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzJB33GCGzNmtp;
 Mon, 15 Mar 2021 09:05:15 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 09:07:33 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <maximlevitsky@gmail.com>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: rawnand: r852: replace spin_lock_irqsave by spin_lock in
 hard IRQ
Date: Mon, 15 Mar 2021 09:08:15 +0800
Message-ID: <1615770495-31939-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_010754_625316_43720DC3 
X-CRM114-Status: GOOD (  10.05  )
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

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mtd/nand/raw/r852.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index c742354..ebe859c 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -724,10 +724,9 @@ static irqreturn_t r852_irq(int irq, void *data)
 	struct r852_device *dev = (struct r852_device *)data;
 
 	uint8_t card_status, dma_status;
-	unsigned long flags;
 	irqreturn_t ret = IRQ_NONE;
 
-	spin_lock_irqsave(&dev->irqlock, flags);
+	spin_lock(&dev->irqlock);
 
 	/* handle card detection interrupts first */
 	card_status = r852_read_reg(dev, R852_CARD_IRQ_STA);
@@ -813,7 +812,7 @@ static irqreturn_t r852_irq(int irq, void *data)
 		dbg("strange card status = %x", card_status);
 
 out:
-	spin_unlock_irqrestore(&dev->irqlock, flags);
+	spin_unlock(&dev->irqlock);
 	return ret;
 }
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
