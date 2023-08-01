Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC5EC001DF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Aug 2023 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xEw3mPQLXuxnzafHZYHAbgdkzuxOv/+pg/EGblvdcuo=; b=3umC+jhIDKEV6m
	UXInUn8wO9u1+PaNxh27rp14nx9bgAIaf/etJmPK+uRB7QVzQOQoMF9e8U4s+g9EgCffqmtLa4Zy8
	0r9awe6Qt6FWtpUeascuLpCJB/JRvPACrHnbWH4pQtZu/dBi+UdYjZGbDLQlhRYaBRoGIP6W9Nf37
	qrlKs5JOGHfE1oHltj6UIEj7/QDyQbqR8q9Zl7LWtzsyzKKDWZU6IuVXw06eXB2drX3i9AScAGVXG
	F8pxMF6DqMW+LGrWAg4aXN9fhueN7kGhG0exiMeikBNKBgNWqBABjWfQRbek5Q6f2KEsdKAeCf2wa
	LNNTiMiS1Gg8Fy+iPCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpiR-002U6h-1M;
	Tue, 01 Aug 2023 13:47:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpiL-002U59-28;
	Tue, 01 Aug 2023 13:47:07 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFbsp5zbWzNmbH;
	Tue,  1 Aug 2023 21:43:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 21:46:49 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <computersforpeace@gmail.com>, <kamal.dasu@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <william.zhang@broadcom.com>,
	<anand.gore@broadcom.com>, <kursad.oney@broadcom.com>,
	<florian.fainelli@broadcom.com>, <rafal@milecki.pl>, <rjui@broadcom.com>,
	<sbranden@broadcom.com>
CC: <lizetao1@huawei.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] mtd: nand: Use devm_platform_ioremap_resource_byname()
Date: Tue, 1 Aug 2023 21:46:19 +0800
Message-ID: <20230801134619.416618-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_064706_351171_81C8044E 
X-CRM114-Status: GOOD (  10.10  )
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

Convert platform_get_resource_byname() + devm_ioremap_resource() to a
single call to devm_platform_ioremap_resource_byname(), as this is
exactly what this function does.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c | 4 +---
 drivers/mtd/nand/raw/brcmnand/iproc_nand.c    | 7 ++-----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c b/drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
index 71ddcc611f6e..9596629000f4 100644
--- a/drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/bcm63138_nand.c
@@ -61,15 +61,13 @@ static int bcm63138_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct bcm63138_nand_soc *priv;
 	struct brcmnand_soc *soc;
-	struct resource *res;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	soc = &priv->soc;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand-int-base");
-	priv->base = devm_ioremap_resource(dev, res);
+	priv->base = devm_platform_ioremap_resource_byname(pdev, "nand-int-base");
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
diff --git a/drivers/mtd/nand/raw/brcmnand/iproc_nand.c b/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
index d32950847a62..089c70fc6edf 100644
--- a/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
+++ b/drivers/mtd/nand/raw/brcmnand/iproc_nand.c
@@ -103,7 +103,6 @@ static int iproc_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct iproc_nand_soc *priv;
 	struct brcmnand_soc *soc;
-	struct resource *res;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -112,13 +111,11 @@ static int iproc_nand_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->idm_lock);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "iproc-idm");
-	priv->idm_base = devm_ioremap_resource(dev, res);
+	priv->idm_base = devm_platform_ioremap_resource_byname(pdev, "iproc-idm");
 	if (IS_ERR(priv->idm_base))
 		return PTR_ERR(priv->idm_base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "iproc-ext");
-	priv->ext_base = devm_ioremap_resource(dev, res);
+	priv->ext_base = devm_platform_ioremap_resource_byname(pdev, "iproc-ext");
 	if (IS_ERR(priv->ext_base))
 		return PTR_ERR(priv->ext_base);
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
