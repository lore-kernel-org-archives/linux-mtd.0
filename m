Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCD4C47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9C7820675
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:16:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVpjVOSt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9C7820675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjXEO567fErDztl+zkFAgGjnUAhfANf/JGuXhOG4gV8=; b=gVpjVOStCEF8W6
	QDnqZXV908rztQs4b7Nfv9N4ZfRCnNCFoh39zIh347vRIxAm9yYRb1IBeNVqxFb6f8mRavOx14A/5
	Y8pIcKHnvSuC+1FnBgtYswlSsHDILZj7+UUCx05Xx+vi35dEDOb4vkSa/DsH1M+XyF08H3/xLqRSp
	x/HirfoGoPayyHsIiy85lI3R/hcQQCwuWIWINJmKnLJNHeM5BlGfA8cnUsKgujft9Rk1fds7a7SKC
	47aNtjMYo831FpuLcKjPVEcAYwK1hfQl24v+XlhUbrdXLvTCtUzJDyc3AEb5bG6LHA7mizNuaNnl1
	4Njon4aAt/zJPJXYR06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVuci-0003C6-JA; Tue, 05 May 2020 10:16:24 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaR-00077g-2G
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:06 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8ACF62A1AFF;
 Tue,  5 May 2020 11:14:00 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 09/19] mtd: rawnand: cafe: Use devm_kzalloc and
 devm_request_irq()
Date: Tue,  5 May 2020 12:13:43 +0200
Message-Id: <20200505101353.1776394-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031403_264163_2B839A36 
X-CRM114-Status: GOOD (  12.01  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This simplifies the error/remove path.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* Add R-b/T-b
---
 drivers/mtd/nand/raw/cafe_nand.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index fedf434a563f..93e8e124df45 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -846,7 +846,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	cafe = kzalloc(sizeof(*cafe), GFP_KERNEL);
+	cafe = devm_kzalloc(&pdev->dev, sizeof(*cafe), GFP_KERNEL);
 	if (!cafe)
 		return  -ENOMEM;
 
@@ -858,8 +858,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->mmio = pci_iomap(pdev, 0, 0);
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
-		err = -ENOMEM;
-		goto out_free_mtd;
+		return -ENOMEM;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -908,8 +907,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 
 	cafe_nand_init(cafe);
 
-	err = request_irq(pdev->irq, &cafe_nand_interrupt, IRQF_SHARED,
-			  "CAFE NAND", mtd);
+	err = devm_request_irq(&pdev->dev, pdev->irq, cafe_nand_interrupt,
+			       IRQF_SHARED, "CAFE NAND", mtd);
 	if (err) {
 		dev_warn(&pdev->dev, "Could not register IRQ %d\n", pdev->irq);
 		goto out_ior;
@@ -940,11 +939,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe_writel(cafe,
 		    cafe_readl(cafe, GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
 		    GLOBAL_IRQ_MASK);
-	free_irq(pdev->irq, mtd);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out:
 	return err;
 }
@@ -959,12 +955,10 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	cafe_writel(cafe,
 		    cafe_readl(cafe, GLOBAL_IRQ_MASK) & ~CAFE_GLOBAL_IRQ_NAND,
 		    GLOBAL_IRQ_MASK);
-	free_irq(pdev->irq, mtd);
 	nand_release(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
 	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
