Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B685C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 13:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DEA60FD8
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7DEA60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GuqMN3Mchl2m2H1LAJobbVMwvGar0bNO7jdI/6aUKmA=; b=Lo7W0jrWiKX5U2
	aqe8UzZxjorFMdevTteinUZAAcTbCQbQO+A6NLYAAsu9/H7jtiLk1h1dS3ihT5CrojvqVbT/pFYtZ
	Yn91kceNIAKjlBA0ihWKdIKjw7pxxJ7HCy7OIJLqqloVwu/jnUlSxEdvIV0uo35YRfdOFQwURp+mw
	GRQL3fFrS4GjYyJqOOthbeDSQRN8u1pOCjdYo4ExtIb0Y1Nx9gDyrM/7IJGyYoJW85vXkcbmzRr1P
	ULcsJZRuY3ltlfzAjwb7Wb4mqu96QRPvG4kcdh5BZWhIPpN05hky9W/7g4W+rjo6/Lq/QaFMyjC/k
	t4VzhzVIE7B8DPLlZoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkRTv-002Lfc-Rx; Tue, 09 Nov 2021 13:48:11 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkRTr-002Les-Un
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 13:48:09 +0000
Received: from BJHW-Mail-Ex10.internal.baidu.com (unknown [10.127.64.33])
 by Forcepoint Email with ESMTPS id E07FED0C67448A1F78BC;
 Tue,  9 Nov 2021 21:48:04 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 9 Nov 2021 21:48:04 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 9 Nov 2021 21:48:04 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <miquel.raynal@bootlin.com>
CC: Cai Huoqing <caihuoqing@baidu.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] mtd: rawnand: denali: Add the dependency on HAS_IOMEM
Date: Tue, 9 Nov 2021 21:47:58 +0800
Message-ID: <20211109134758.417-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX08.internal.baidu.com (172.31.51.48) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2021-11-09 21:48:04:890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_054808_651830_FDCBB170 
X-CRM114-Status: GOOD (  10.39  )
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

The helper function devm_platform_ioremap_resource_xxx()
needs HAS_IOMEM enabled, so add the dependency on HAS_IOMEM.

Fixes: 5f14a8ca1b49 ("mtd: rawnand: denali: Make use of the helper function devm_platform_ioremap_resource_byname()")

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
v1->v2: Add a Fixes tag.

 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 67b7cb67c030..0a45d3c6c15b 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -26,7 +26,7 @@ config MTD_NAND_DENALI_PCI
 config MTD_NAND_DENALI_DT
 	tristate "Denali NAND controller as a DT device"
 	select MTD_NAND_DENALI
-	depends on HAS_DMA && HAVE_CLK && OF
+	depends on HAS_DMA && HAVE_CLK && OF && HAS_IOMEM
 	help
 	  Enable the driver for NAND flash on platforms using a Denali NAND
 	  controller as a DT device.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
