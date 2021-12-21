Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23537C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uo29tAk8Q05QdSJbDIces1AqOEwZDpiSAz+4WmnHhVg=; b=FnGgITYazKvITB
	dER1yNT6RHXt2aP8Wb1aUpzSBfoKc/+N9YokJXJE1EPBDlk0m+f9er8mXQf5Rmsy1DNQVguedkrfm
	ySkUfPgjBN2a55n7isFIV6HlkBdk47tWZmZTyUaP3dfj5XmZ8uKQqZ5rD0BV7LcEtzInJYUYXtSt5
	bvbVgPwBYzkzkrZTx7JZeCaWyBwIJkKJHa4ecw0GhgES5Ty0YeUaQ9KEeUO14mQpd4/wqJcv/kxtJ
	YXp78oN/G/wbWIc/4n7C/J+UIrW6a8zZtCsFSHw1TIWi3ZyCKpogfQQY4B5XRJzp1pVDZlPQ5V4YE
	5zgxET7H2Xb02pDRxgWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzmfB-008XJW-PN; Tue, 21 Dec 2021 21:27:13 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzmf8-008XHx-PN
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 21:27:12 +0000
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; d="scan'208";a="104266473"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 22 Dec 2021 06:27:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 11EDC41082DB;
 Wed, 22 Dec 2021 06:27:05 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] mtd: rawnand: omap_elm: Use platform_get_irq() to get the
 interrupt
Date: Tue, 21 Dec 2021 21:26:08 +0000
Message-Id: <20211221212609.31290-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221212609.31290-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211221212609.31290-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_132710_958904_089C90B7 
X-CRM114-Status: GOOD (  12.59  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mtd/nand/raw/omap_elm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap_elm.c b/drivers/mtd/nand/raw/omap_elm.c
index 8bab753211e9..db105d9b560c 100644
--- a/drivers/mtd/nand/raw/omap_elm.c
+++ b/drivers/mtd/nand/raw/omap_elm.c
@@ -384,8 +384,8 @@ static irqreturn_t elm_isr(int this_irq, void *dev_id)
 static int elm_probe(struct platform_device *pdev)
 {
 	int ret = 0;
-	struct resource *irq;
 	struct elm_info *info;
+	int irq;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -393,20 +393,18 @@ static int elm_probe(struct platform_device *pdev)
 
 	info->dev = &pdev->dev;
 
-	irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!irq) {
-		dev_err(&pdev->dev, "no irq resource defined\n");
-		return -ENODEV;
-	}
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
 
 	info->elm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->elm_base))
 		return PTR_ERR(info->elm_base);
 
-	ret = devm_request_irq(&pdev->dev, irq->start, elm_isr, 0,
-			pdev->name, info);
+	ret = devm_request_irq(&pdev->dev, irq, elm_isr, 0,
+			       pdev->name, info);
 	if (ret) {
-		dev_err(&pdev->dev, "failure requesting %pr\n", irq);
+		dev_err(&pdev->dev, "failure requesting %d\n", irq);
 		return ret;
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
