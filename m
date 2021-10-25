Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A83AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96656105A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D96656105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaVfAjyEENfQhbF9ejKPPgNqEDInais3r/tGrOsVdd0=; b=XhqC9iaHViWsgn
	t/phCtXCbs1wfxb4IbhbCaIGxRlo4+0DmqB/u8NKaDqSGgid86lvVH+euKigGBaSLjGMO+l8zifbV
	979ffQstrudHCB0sWKJV5IDityGGfY7VC9/J033gOuAdPfkgRr1nRqyFPDVogNPj1V60iIkyQded+
	nJm1ImW6S+nrI5Z2XeAvXy9dOqfcRP5PyU/IlI9Gg/2jvJw6pSbjJ8g4hCnE+NK+2DQMmXovtl62Z
	EYOKJOUqrP4z1MU3d2UEjOVBNdCHVxeyTn16duJN5iRxs1x4uVpANDYzpVm4HeFeCSGQWx38enUeC
	zsT9cDCY+MRy1v7WYSFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf71f-00019E-Jb; Mon, 25 Oct 2021 20:56:59 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf71R-00014w-4h
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:56:46 +0000
X-IronPort-AV: E=Sophos;i="5.87,181,1631545200"; d="scan'208";a="98385686"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 26 Oct 2021 05:56:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E61C41003BB;
 Tue, 26 Oct 2021 05:56:39 +0900 (JST)
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
Subject: [PATCH v2 1/7] dt-bindings: memory: renesas,
 rpc-if: Add support for the R9A07G044
Date: Mon, 25 Oct 2021 21:56:25 +0100
Message-Id: <20211025205631.21151-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135645_347871_BD602E4F 
X-CRM114-Status: GOOD (  10.33  )
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

SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
the RPC-IF interface found on R-Car Gen3 SoC's.

This patch adds a new compatible string to identify the RZ/G2L family
so that the timing values on RZ/G2L can be adjusted.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Rebased patch on top of V3U bindings
 * Included RB tags
---
 .../memory-controllers/renesas,rpc-if.yaml    | 53 +++++++++++++------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index 9da80e8f2444..43391a2d5bc5 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -24,17 +24,23 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r8a774a1-rpc-if       # RZ/G2M
-          - renesas,r8a774b1-rpc-if       # RZ/G2N
-          - renesas,r8a774c0-rpc-if       # RZ/G2E
-          - renesas,r8a774e1-rpc-if       # RZ/G2H
-          - renesas,r8a77970-rpc-if       # R-Car V3M
-          - renesas,r8a77980-rpc-if       # R-Car V3H
-          - renesas,r8a77995-rpc-if       # R-Car D3
-          - renesas,r8a779a0-rpc-if       # R-Car V3U
-      - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2 device
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a774a1-rpc-if       # RZ/G2M
+              - renesas,r8a774b1-rpc-if       # RZ/G2N
+              - renesas,r8a774c0-rpc-if       # RZ/G2E
+              - renesas,r8a774e1-rpc-if       # RZ/G2H
+              - renesas,r8a77970-rpc-if       # R-Car V3M
+              - renesas,r8a77980-rpc-if       # R-Car V3H
+              - renesas,r8a77995-rpc-if       # R-Car D3
+              - renesas,r8a779a0-rpc-if       # R-Car V3U
+          - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2{E,H,M,N} device
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-rpc-if      # RZ/G2{L,LC}
+          - const: renesas,rzg2l-rpc-if       # RZ/G2L family
 
   reg:
     items:
@@ -48,8 +54,7 @@ properties:
       - const: dirmap
       - const: wbuf
 
-  clocks:
-    maxItems: 1
+  clocks: true
 
   power-domains:
     maxItems: 1
@@ -67,8 +72,6 @@ patternProperties:
             - cfi-flash
             - jedec,spi-nor
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - reg
@@ -79,6 +82,26 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rzg2l-rpc-if
+then:
+  properties:
+    clocks:
+      items:
+        - description: SPI Multi IO Register access clock (SPI_CLK2)
+        - description: SPI Multi IO Main clock (SPI_CLK).
+
+else:
+  properties:
+    clocks:
+      maxItems: 1
+
+unevaluatedProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
