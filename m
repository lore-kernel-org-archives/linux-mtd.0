Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC68C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D28C610F8
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D28C610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YCulfuAytQRcNZ6YYLRq9AbPy1r+0/Uh+IXoFexf25A=; b=AlAYT+LzS0tS5z
	4DkDpwlEw8DtHIy0UOloqcyTd8dMGv9/XWfWC9Qy6VW7TgrzZoAiPjz1LTVM2Pg068a+ZyhRLpEO5
	G9i8jfNPW6cGc3xtwKQbzc2Dea4ih2tfb8K47Iefrzz5wUHgOmSEJcT7dC+4KbiHmm1v57RihX2dZ
	Wr8e8KC1BnK7eD62KB/WFX7yYhDarteuioWnFQQlcJm9WgRTgzFbluWrX2dwO4XARCmJXaFUh5YAP
	XAdDyUZc6u/ZaQlgjXltnAn+lj7a1BIjOvL3Nh617tD5vKQRjTo3MwXN+ZEvEpc0QBwC+knz4vSRC
	sCf0AI3kerU1hvGV+XcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQek-0029XU-2Y; Tue, 09 Nov 2021 12:55:18 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQeh-0029QH-Bq
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 12:55:17 +0000
Received: from BC-Mail-Ex24.internal.baidu.com (unknown [172.31.51.18])
 by Forcepoint Email with ESMTPS id 288BCCBA614954A7DA0A;
 Tue,  9 Nov 2021 20:55:03 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex24.internal.baidu.com (172.31.51.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Tue, 9 Nov 2021 20:55:02 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 9 Nov 2021 20:55:02 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <miquel.raynal@bootlin.com>
CC: Cai Huoqing <caihuoqing@baidu.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: denali: Add the dependency on HAS_IOMEM
Date: Tue, 9 Nov 2021 20:54:55 +0800
Message-ID: <20211109125457.213-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex11.internal.baidu.com (10.127.64.34) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_045515_631031_362DF94C 
X-CRM114-Status: GOOD (  10.57  )
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

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
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
