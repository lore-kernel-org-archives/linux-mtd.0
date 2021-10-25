Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD74DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:58:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA4D6105A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FA4D6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bamlWRphWWY6EzgeYSQx4dxWEGHPrkFaqpzwYigOk0=; b=Aq+Qqhk8/L3snP
	BvWXSdApFuHsYrQo4bmo8Af6hicN5Jflz3U6liQiKW6kXQHUoVm9wFEFSy44YYKT/69EHXzDRIhgB
	iPGqvR0wMRQgWNrs1BJ6IeQVKeBK7Xf04rLqX4vtrn4mivyrnMHC2iSK6+FIfSe5PfYQ4jCgEwKcR
	NatBJbJ3Rwu2osMTPQDphMvRiaDmzKBnQVYyMJ9lOjOCDarqDxvtXXThPOgLki0gVV80CSSfeaB5D
	Y6qzkfIDuQ+iDsm/OgRu7S3Is7lNlapv6OP52In3mUNqM2Nd9Kfp7YuRoVntUKsS/otfgfP1vFRkX
	xmWQvOg3BpC8MeA850TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf72f-0001QW-6d; Mon, 25 Oct 2021 20:58:01 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf71h-00019C-H2
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:57:02 +0000
X-IronPort-AV: E=Sophos;i="5.87,181,1631545200"; d="scan'208";a="98142147"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 26 Oct 2021 05:56:59 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B1E841003BB;
 Tue, 26 Oct 2021 05:56:54 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/7] memory: renesas-rpc-if: Return error in case
 devm_ioremap_resource() fails
Date: Mon, 25 Oct 2021 21:56:29 +0100
Message-Id: <20211025205631.21151-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135701_714035_09765321 
X-CRM114-Status: GOOD (  10.93  )
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

Make sure we return error in case devm_ioremap_resource() fails for dirmap
resource.

Fixes: ca7d8b980b67 ("memory: add Renesas RPC-IF driver")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
 * New patch (split from patch 5 of v1)
 * Included RB tags
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 7435baad0007..ff8bcbccac63 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -243,7 +243,7 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirmap");
 	rpc->dirmap = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(rpc->dirmap))
-		rpc->dirmap = NULL;
+		return PTR_ERR(rpc->dirmap);
 	rpc->size = resource_size(res);
 
 	rpc->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
