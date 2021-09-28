Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654F7C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 354B5610A2
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 14:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 354B5610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yFf2qJPj3WTdtbrQwvVtFB9CIKi5NzS9H3DoKOJ5qk8=; b=KUew1hlbiLEn2w
	OvEo+ojNplKtN4QkYdrefEL2UUsXX+sszM112TdGhTFmlF7V6Dz2nlBY3IfyMvMl5Q7jpajffkS+H
	EEMMMlipnPN2dV7GwgIe+q+f71PShGJMdmLP3TfIo5OQTIbd99X7XeN2ew9ocDY+Yq5z5170t1sZC
	tCf8vVw+PRoOns9aEBWYX9iZhYh9vAW7iX5Bf8BkDmZ/sHy7RjwCJllQG4mQfI6MRdJozPVGY0jMH
	v+GLNPiGTvUn1l1h6xIAlvWfADkPVkEDZCzh0v5BgrRMlAaaG/WW9z6O1jNMl8mUAwSCV3RhI174j
	VhdKwyC30NbVXQ8PVIag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVDlv-007UDe-1x; Tue, 28 Sep 2021 14:07:51 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVDlh-007U9V-IS
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 14:07:39 +0000
X-IronPort-AV: E=Sophos;i="5.85,329,1624287600"; d="scan'208";a="95295281"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 28 Sep 2021 23:07:36 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 92C864007535;
 Tue, 28 Sep 2021 23:07:32 +0900 (JST)
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
Subject: [PATCH 1/6] dt-bindings: memory: renesas,
 rpc-if: Add support for the R9A07G044
Date: Tue, 28 Sep 2021 15:07:16 +0100
Message-Id: <20210928140721.8805-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_070737_781849_0BDB71B6 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
---
 .../memory-controllers/renesas,rpc-if.yaml    | 51 ++++++++++++++-----
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
index d25072c414e4..105b5157989b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
@@ -24,16 +24,22 @@ allOf:
 
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
+          - const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 or RZ/G2{E,H,M,N} device
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-rpc-if      # RZ/G2{L,LC}
+          - const: renesas,rzg2l-rpc-if       # RZ/G2L family
 
   reg:
     items:
@@ -47,8 +53,7 @@ properties:
       - const: dirmap
       - const: wbuf
 
-  clocks:
-    maxItems: 1
+  clocks: true
 
   power-domains:
     maxItems: 1
@@ -66,8 +71,6 @@ patternProperties:
             - cfi-flash
             - jedec,spi-nor
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - reg
@@ -78,6 +81,26 @@ required:
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
