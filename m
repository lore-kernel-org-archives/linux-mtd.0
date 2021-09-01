Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FA8C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F53560249
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F53560249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=evARilZiXQMx8NXgx6yh74FRO1qCkcD9PNN7mLhqpTw=; b=ux4bNvuOhxV+cQ
	JDB1StLaF9fCcLerM8ScZpyRYOnB0WesTmvvYbaeJsrYK7C3smp0UXXrQq2mniLvUhgKMpedV9xEE
	KaaPQJKJ0MBOIdH/G3dwIJ6/Lyo4cDs9kKMp2oLMubt9XgE+8kPht7oTiNNuMFjP5hHizDWYZzMEl
	+eb7DtrOkqaziOx5u02MNYgzeBpPZFGbcpLn/Oxv2MoEGJA6coI0/yTjo5Hkxk22ikFSBHLQFtiMP
	Kmd7rRTAM/OmvILSh9HuvDYk6duzeMLcCAFuEwBGdMJoT9U7ILr6Rc3hyy1R8rLasLCgA4+j+jXeS
	y6ajzUud9Ntny4Jv9qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKrf-004MI9-5R; Wed, 01 Sep 2021 07:40:55 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKrO-004MBL-LZ; Wed, 01 Sep 2021 07:40:40 +0000
Received: from BJHW-Mail-Ex07.internal.baidu.com (unknown [10.127.64.17])
 by Forcepoint Email with ESMTPS id 9C92A3482D16142C890C;
 Wed,  1 Sep 2021 15:40:37 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:40:37 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:40:36 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: atmel: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 15:40:30 +0800
Message-ID: <20210901074031.8883-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex07_2021-09-01 15:40:37:499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_004038_919079_824EA920 
X-CRM114-Status: UNSURE (   9.95  )
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

Use the devm_platform_ioremap_resource() helper instead of
calling platform_get_resource() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index cbb023bf00f7..498e41ccabbd 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -834,7 +834,6 @@ static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct atmel_pmecc *pmecc;
-	struct resource *res;
 
 	pmecc = devm_kzalloc(dev, sizeof(*pmecc), GFP_KERNEL);
 	if (!pmecc)
@@ -844,13 +843,11 @@ static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
 	pmecc->dev = dev;
 	mutex_init(&pmecc->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, pmecc_res_idx);
-	pmecc->regs.base = devm_ioremap_resource(dev, res);
+	pmecc->regs.base = devm_platform_ioremap_resource(pdev, pmecc_res_idx);
 	if (IS_ERR(pmecc->regs.base))
 		return ERR_CAST(pmecc->regs.base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, errloc_res_idx);
-	pmecc->regs.errloc = devm_ioremap_resource(dev, res);
+	pmecc->regs.errloc = devm_platform_ioremap_resource(pdev, errloc_res_idx);
 	if (IS_ERR(pmecc->regs.errloc))
 		return ERR_CAST(pmecc->regs.errloc);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
