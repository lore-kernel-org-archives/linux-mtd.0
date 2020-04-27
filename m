Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AC5C5519B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09754206D4
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtsTGO57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09754206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4RhdOJZuzUGjql9cyQQ1jm/qPiiE/8MZwX5vLRjI+U=; b=BtsTGO57k7GZOj
	6wfSfcl668NtDm6YgeJXM0xsY+mTa/iGVmg9yZceEpw/wog8hhR1i/sF4dD1ftBSr24iN4aNjLLIh
	oDdcZRbtut61htRjUFCcg8gYD5WGAhHRDmUqp/pZzohKtYjWa01BMyY/yd9M1sn3ksvJcHbkgl7xk
	UgXO5I812U4ztMD4HJK8PEmFg7ientgNfdsGQvi+WrbB+C8SdaRudbSMJMYQotUP2M9TElg+zo+9J
	Me7/1XgWgqb+RcdA51+iBy847gP7pcmNv0S94P05HtEsx0F42ibmBsRX09ySisdZRnyX1SYhX0DZQ
	fAv4GuP8q5LHdW0WPd/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSz4o-0003h5-KL; Mon, 27 Apr 2020 08:25:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSz0J-00068N-RP
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:20:42 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 22F612A0A17;
 Mon, 27 Apr 2020 09:20:38 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 08/17] mtd: rawnand: cafe: Use devm_kzalloc and
 devm_request_irq()
Date: Mon, 27 Apr 2020 10:20:18 +0200
Message-Id: <20200427082028.394719-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200427082028.394719-1-boris.brezillon@collabora.com>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_012040_050319_C8B94632 
X-CRM114-Status: GOOD (  12.44  )
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
---
 drivers/mtd/nand/raw/cafe_nand.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 55fa0bf2806a..3eab57e63215 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -848,7 +848,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	cafe = kzalloc(sizeof(*cafe), GFP_KERNEL);
+	cafe = devm_kzalloc(&pdev->dev, sizeof(*cafe), GFP_KERNEL);
 	if (!cafe)
 		return  -ENOMEM;
 
@@ -860,8 +860,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->mmio = pci_iomap(pdev, 0, 0);
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
-		err = -ENOMEM;
-		goto out_free_mtd;
+		return -ENOMEM;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -910,8 +909,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 
 	cafe_nand_init(cafe);
 
-	err = request_irq(pdev->irq, &cafe_nand_interrupt, IRQF_SHARED,
-			  "CAFE NAND", mtd);
+	err = devm_request_irq(&pdev->dev, pdev->irq, cafe_nand_interrupt,
+			       IRQF_SHARED, "CAFE NAND", mtd);
 	if (err) {
 		dev_warn(&pdev->dev, "Could not register IRQ %d\n", pdev->irq);
 		goto out_ior;
@@ -942,11 +941,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
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
@@ -961,12 +957,10 @@ static void cafe_nand_remove(struct pci_dev *pdev)
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
