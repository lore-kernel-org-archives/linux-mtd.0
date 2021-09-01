Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7187BC4320E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D08F61056
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 07:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D08F61056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyw8Q8L3dDBcWqJwdrQrlj8V+hPkerUfHAlTw4VtxMc=; b=QZHiCLGqGJ4Hgl
	6V18PlpBc69cwdQlu2PdRH8JA4sx/teoA/QjpKi5uC6Y7YdNNKs9AaoJlIml/TKNPeQTOYtOFq6g/
	M8tipkKGbXeXWaIt8+Zxa7DrRLoF391wyUraAWcyMaiSTjWmXo0XdvnJDqSWkdkW50NXQBmZXDKEg
	elb7gKe9GT6Ud3zFNIGG/0cymbPU4YIjSJxjy5EI/5tmmpNqTov/XPG0lAa8d+nRg3srHnejjOcXS
	K/GtlOYg75o3fUy0oEsy4B99DDYJ1BEuEr1EVWxf/mydN000ck+NszKN+TMmcTUpY4dbwYaj9V9GE
	j4PAR3W0i4vskTSV9jJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLKuY-004Nhq-Re; Wed, 01 Sep 2021 07:43:55 +0000
Received: from mx21.baidu.com ([220.181.3.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLKsT-004Mcz-FL
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 07:41:47 +0000
Received: from BJHW-Mail-Ex13.internal.baidu.com (unknown [10.127.64.36])
 by Forcepoint Email with ESMTPS id 7E42664326BC0EA88C69;
 Wed,  1 Sep 2021 15:41:44 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:44 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 1 Sep 2021 15:41:43 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: rawnand: hisi504: Make use of the helper function
 devm_platform_ioremap_resource()
Date: Wed, 1 Sep 2021 15:41:37 +0800
Message-ID: <20210901074138.9133-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex07.internal.baidu.com (10.127.64.17) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex13_2021-09-01 15:41:44:533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_004145_755979_E1FA422B 
X-CRM114-Status: GOOD (  10.30  )
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
 drivers/mtd/nand/raw/hisi504_nand.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index 78c4e05434e2..c74f6b2192fc 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -738,7 +738,6 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct hinfc_host *host;
 	struct nand_chip  *chip;
 	struct mtd_info   *mtd;
-	struct resource	  *res;
 	struct device_node *np = dev->of_node;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
@@ -754,13 +753,11 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -ENXIO;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->iobase = devm_ioremap_resource(dev, res);
+	host->iobase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->iobase))
 		return PTR_ERR(host->iobase);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	host->mmio = devm_ioremap_resource(dev, res);
+	host->mmio = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(host->mmio))
 		return PTR_ERR(host->mmio);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
