Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E47C4320E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269B161059
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 269B161059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1wi2btkx19G5n7V+cAjiopLNZgATXdtjw4q208sg5U=; b=lPw96Hw3zS0kA1
	st+WiLugZ+JG6qgDB+xE5vIUdGUEYPIVGMcm+9UB8uwo8ydJznpw+0rGbZTJGExyQWC5EuBzP35uF
	e5r7wOOySZsHyEDFoZiV7OC6wm8axdYh7Rv7Ux/QZEmAFEHO5A+BUR5EQEB0jiCPCfEmR5P4PntTk
	gQk0VDRllDximgZmR4xShIhTFsPU5eH7UZ8PHmIw/emsJ5cl8JdAdDcckG/4PAiP7Kqz/PHsUOfyl
	iKx2a0nKnfRQtSpTpvAndLCBn+0+aRPjTJMW0a444N4KDgCli+TwP3xYfsxi8H8/3mfJyT/J9bZ70
	3T9iIHorInnBII5vL8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKs3-004MRP-C0; Wed, 01 Sep 2021 07:41:19 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKs0-004MPn-2Q
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:41:17 +0000
Received: from BJHW-Mail-Ex02.internal.baidu.com (unknown [10.127.64.12])
 by Forcepoint Email with ESMTPS id 1812528F637BA0B217D7;
 Wed,  1 Sep 2021 15:41:15 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex02.internal.baidu.com (10.127.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:14 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:14 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: bcm6368: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Date: Wed, 1 Sep 2021 15:40:38 +0800
Message-ID: <20210901074108.8933-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_004116_318967_DE08B6A2 
X-CRM114-Status: GOOD (  10.44  )
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
index 7c17ec4ce8b6..a06cd87f839a 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm6368_nand.c
@@ -88,16 +88,13 @@ static int bcm6368_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm6368_nand_soc *priv;
 	struct brcmnand_soc *soc;
-	struct resource *res;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	soc = &priv->soc;
 
-	res = platform_get_resource_byname(pdev,
-		IORESOURCE_MEM, "nand-int-base");
-	priv->base = devm_ioremap_resource(dev, res);
+	priv->base = devm_platform_ioremap_resource_byname(pdev, "nand-int-base");
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
