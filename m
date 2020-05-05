Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A256BC47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED0D20675
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RGEyXiGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED0D20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkmiCIQxKA7ZnRGAm0JgkOvojy12Q5TQynGzTWTQbCg=; b=RGEyXiGWWJtNLc
	E7zGtY/j9v1A4qrOZiqThEorP5UeolsmNbnIY2Ux21jdc/xBSJCSgppN0UBqaqUYsKjycsDC/EdLn
	qVBrh/pDgNd5tzoiOxHR8jRjJOWZ6TxgnGIjVp9mWhQMqHVx0nAOSZ/trsJ9toE30TonX+lpOgYRX
	0SvnbD+83f9dLFa8gEAyKbodGQzS7O63tZZZ+lS/2jwuy50xKcY5f/OYPH1CWncX42l+yHpOxMoFE
	zYdQVPRZeuzfEvsq8szoER+1TyCTZzAbIpXZ/PhG3LsBpZ02eYehjhs7ssnu5Z1tlggEzXwz0vKPG
	1IM/yNeSo/+6oiISJMQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVuds-0004Rq-5U; Tue, 05 May 2020 10:17:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuaR-000788-D3
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:14:07 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1D8002A19B9;
 Tue,  5 May 2020 11:14:01 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 11/19] mtd: rawnand: cafe: Explicitly inherit from
 nand_controller
Date: Tue,  5 May 2020 12:13:45 +0200
Message-Id: <20200505101353.1776394-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200505101353.1776394-1-boris.brezillon@collabora.com>
References: <20200505101353.1776394-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_031403_604543_6F25DEDE 
X-CRM114-Status: GOOD (  11.95  )
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

Explicitly inherit from nand_controller instead of using the dummy
controller object.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Lubomir Rintel <lkundrak@v3.sk>
---
Changes in v2:
* Add R-b/T-b
---
 drivers/mtd/nand/raw/cafe_nand.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index 84b8d50c7f08..e41ea95b3088 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -146,6 +146,7 @@
 #define CAFE_FIELD_GET(reg, field, val)		FIELD_GET(CAFE_##reg##_##field, val)
 
 struct cafe_priv {
+	struct nand_controller base;
 	struct nand_chip nand;
 	struct pci_dev *pdev;
 	void __iomem *mmio;
@@ -918,7 +919,9 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->usedma = 0;
 
 	/* Scan to find existence of the device */
-	cafe->nand.legacy.dummy_controller.ops = &cafe_nand_controller_ops;
+	nand_controller_init(&cafe->base);
+	cafe->base.ops = &cafe_nand_controller_ops;
+	cafe->nand.controller = &cafe->base;
 	err = nand_scan(&cafe->nand, 2);
 	if (err)
 		goto out_irq;
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
