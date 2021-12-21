Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758D5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 21:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sV70jLWtxabhyPrMu6iYfbTkpLA9uP1GDMbLIdXe2y0=; b=WdhYItohZWllmp
	vx/hlkMMUpChPt2tdkylR6KWJxUWupnh/PI/5Oq/NeqmLmhfbOqE/8tFQQegpotRMBp2fQtj+g86R
	edlZhJrdxwWTe0XhSaUwj5EomfGFFRoVDCR5H0MhrvONf4V2LnEJR1JGqLRFZnCPhqqM5XHiMDViL
	M5uDJMyxfWZpgZO/6AjeVNqWJmO7POJAkPNelnUiUPrLrpWyFB79Moew5YnCH3udLtmslFKcZ9xrI
	E5/aVmf6ITdSWNBhkmM9dKul95ToJX6kk6Yq6WfqocMEIDc8tLg4CkfXPg1aVMGQqIsj+p87p1dAL
	yHVuAEPrFvi2TyW6GkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzmfZ-008XKv-Mi; Tue, 21 Dec 2021 21:27:37 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzmf8-008XIF-QD
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 21:27:13 +0000
X-IronPort-AV: E=Sophos;i="5.88,224,1635174000"; d="scan'208";a="104266477"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 22 Dec 2021 06:27:10 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 490DA41082DB;
 Wed, 22 Dec 2021 06:27:08 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] mtd: rawnand: gpmi: Use platform_get_irq_byname() to get
 the interrupt
Date: Tue, 21 Dec 2021 21:26:09 +0000
Message-Id: <20211221212609.31290-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221212609.31290-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211221212609.31290-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_132710_980408_F4F13731 
X-CRM114-Status: GOOD (  10.83  )
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

platform_get_resource_byname(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq_byname().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index feccff8bdd15..1b64c5a5140d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -991,16 +991,13 @@ static int acquire_bch_irq(struct gpmi_nand_data *this, irq_handler_t irq_h)
 {
 	struct platform_device *pdev = this->pdev;
 	const char *res_name = GPMI_NAND_BCH_INTERRUPT_RES_NAME;
-	struct resource *r;
 	int err;
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_IRQ, res_name);
-	if (!r) {
-		dev_err(this->dev, "Can't get resource for %s\n", res_name);
-		return -ENODEV;
-	}
+	err = platform_get_irq_byname(pdev, res_name);
+	if (err < 0)
+		return err;
 
-	err = devm_request_irq(this->dev, r->start, irq_h, 0, res_name, this);
+	err = devm_request_irq(this->dev, err, irq_h, 0, res_name, this);
 	if (err)
 		dev_err(this->dev, "error requesting BCH IRQ\n");
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
