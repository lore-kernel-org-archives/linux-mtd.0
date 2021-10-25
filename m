Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B13AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3161D6105A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3161D6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h17ysjypVWOaykCltXzZDCsNEzOQAtHcaGI1ZaL+Nf0=; b=cJzuSZJlNDpjj5
	80+/K6WI5Mb3g3QoODak6PmmUFWIvueXtG466LrWEF9KXSLKKyy2CaIz15iejybav/kAXOUTRRjDT
	H8Mh00vVqwFVpaAoG4wKxf6onGUHDFsJFtFOK0XvRWKjH27ReDLAAPvnZ2Z/5EX+GsbQG/DrpLRFM
	K9Qm9y9Xn84HXaCKxPlPQKgo9tQbaS4I0Otj9+9S3urN1HGAoM2iJhAnZBUOA3dh+/vJe/jgxC7ru
	OYzOlAYOwRhN6FnLwrDHCeD4EarFN7kO8rgXV8qIia3tUrOk4eoPgbeXwUFDTiFhSqNPUUaH5XbZB
	7aIEJXw4Hc+50I6PaJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf72z-0001Zp-Lu; Mon, 25 Oct 2021 20:58:21 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf71j-00019C-B1
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:57:04 +0000
X-IronPort-AV: E=Sophos;i="5.87,181,1631545200"; d="scan'208";a="98142156"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 26 Oct 2021 05:57:02 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5D67C41003BB;
 Tue, 26 Oct 2021 05:56:59 +0900 (JST)
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
Subject: [PATCH v2 6/7] memory: renesas-rpc-if: Drop usage of
 RPCIF_DIRMAP_SIZE macro
Date: Mon, 25 Oct 2021 21:56:30 +0100
Message-Id: <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135703_524260_A9A253EF 
X-CRM114-Status: GOOD (  11.44  )
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
 * New patch (split from patch 5 of v1)
 * Included RB tags
---
 drivers/memory/renesas-rpc-if.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index ff8bcbccac63..0c56decc91f2 100644
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
@@ -588,8 +586,8 @@ static void memcpy_fromio_readw(void *to,
 
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
