Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14119C001DF
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Aug 2023 01:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nk6x18eNicVJjEhz8GU5MhZ27EXaX3cGdM+GqM8aRGk=; b=UVZaFFG3fbVnCD
	pqCcxGV0bySirs+obTMmAYNONv0XyIqjroYbzX8Q3nAVS3eXT7r31S8gHxraSd8oij5IYmp4hBDiW
	bTYjLG89Dc5ZnN0FG+mZZFeiPovMCPgiOtj843Wyu2WSq9tE2eMM39eAw0T3QCzOP9RgVsKbSji9S
	pQ8D+ZGSXfat5uNf0nAmk9U4vvnxEHzDIdkLRGL78ncmMLgy0noZgWRe0tthpaeiZCfQ8gzerOPHd
	m+ChVU9JSsAJFtRShv+zpD/vRi3EL/UNWCMceYLXBAfBRU97xjhP1545YnaZgeYutTQOiBhPemkZu
	Hwx0pwJtJaKy15UZIoSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0m6-003hlJ-2h;
	Wed, 02 Aug 2023 01:35:42 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0m2-003hjn-0s;
	Wed, 02 Aug 2023 01:35:40 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFvdS3P1bzVjmP;
	Wed,  2 Aug 2023 09:33:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 2 Aug
 2023 09:35:31 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lizetao1@huawei.com>
CC: <anand.gore@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<computersforpeace@gmail.com>, <florian.fainelli@broadcom.com>,
	<kamal.dasu@broadcom.com>, <kursad.oney@broadcom.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <rafal@milecki.pl>, <richard@nod.at>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <vigneshr@ti.com>,
	<william.zhang@broadcom.com>
Subject: [PATCH -next v2] mtd: rawnand: brcmnand: Use devm_platform_ioremap_resource_byname()
Date: Wed, 2 Aug 2023 09:35:00 +0800
Message-ID: <20230802013500.1030853-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801134619.416618-1-lizetao1@huawei.com>
References: <20230801134619.416618-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_183538_642031_A80A7A1D 
X-CRM114-Status: UNSURE (   9.89  )
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

Convert platform_get_resource_byname() + devm_ioremap_resource() to a
single call to devm_platform_ioremap_resource_byname(), as this is
exactly what this function does.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: modify the subject prefix to "mtd: rawnand: brcmnand:"
v1: https://lore.kernel.org/all/20230801134619.416618-1-lizetao1@huawei.com/

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
