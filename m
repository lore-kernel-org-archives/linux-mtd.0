Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E413C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9F9761130
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9F9761130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ij2xigzjh0Eh2rHZ2nU9Sshmx923dQQEEBb+/mhfnkc=; b=xaHFOflBd7xB6I
	54Wsb5YG6j3WlRxFceu4EXn4Ty3k8d4zHp59CGMouz+7J7PVXM/bFv8bdZGL1HfZ4hOWdC9UWv6Sy
	C7be6kvd2emU1deJORU+Dm95OPGTJHGYV5F32AFhOrHm0bzY85KTVQrlCZ+RX/MWMjWMBgpiXCgxa
	myxH9ppt2pwt+1beITNi/Xmmg3daWPt6dYY61wWfP2xWH2snoXdA5raAFPD5Sj6HiomHn+g1PLzH6
	0MBNgrXE9dGVjWlXHvtyy16NrgLscWXhf+wD3G0ESu6FdZwmDfvadFIykdhQNy+mcL9Dj36Z/vW/D
	liZv4H3QtvMYDUtoA1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDnG-007Ue2-8g; Tue, 28 Sep 2021 14:09:14 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDlw-007UCz-4Q
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 14:07:53 +0000
X-IronPort-AV: E=Sophos;i="5.85,329,1624287600"; d="scan'208";a="95295300"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Sep 2021 23:07:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 452A74007535;
 Tue, 28 Sep 2021 23:07:48 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE
 macro
Date: Tue, 28 Sep 2021 15:07:20 +0100
Message-Id: <20210928140721.8805-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_070752_320902_C1B0C77D 
X-CRM114-Status: GOOD (  11.96  )
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

RPCIF_DIRMAP_SIZE may differ on various SoC's. Instead of using
RPCIF_DIRMAP_SIZE macro use resource size to get dirmap size
which is already part of struct rpcif.

Also make sure we return error in case devm_ioremap_resource()
fails for dirmap.

Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
Fixes: 59e27d7c94aa ("memory: renesas-rpc-if: fix possible NULL pointer dereference of resource")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 77a011d5ff8c..140cb4e2b789 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -147,8 +147,6 @@
 #define RPCIF_PHYINT		0x0088	/* R/W */
 #define RPCIF_PHYINT_WPVAL	BIT(1)
 
-#define RPCIF_DIRMAP_SIZE	0x4000000
-
 static const struct regmap_range rpcif_volatile_ranges[] = {
 	regmap_reg_range(RPCIF_SMRDR0, RPCIF_SMRDR1),
 	regmap_reg_range(RPCIF_SMWDR0, RPCIF_SMWDR1),
@@ -244,7 +242,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
 	rpc->dirmap = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(rpc->dirmap))
-		rpc->dirmap = NULL;
+		return PTR_ERR(rpc->dirmap);
 	rpc->size = resource_size(res);
 
 	rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
@@ -547,8 +545,8 @@ EXPORT_SYMBOL(rpcif_manual_xfer);
 
 ssize_t rpcif_dirmap_read(struct rpcif *rpc, u64 offs, size_t len, void *buf)
 {
-	loff_t from = offs & (RPCIF_DIRMAP_SIZE - 1);
-	size_t size = RPCIF_DIRMAP_SIZE - from;
+	loff_t from = offs & (rpc->size - 1);
+	size_t size = rpc->size - from;
 
 	if (len > size)
 		len = size;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
