Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B624C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yc1zrLO0D5YLhDvjpqKAATf++bNfKZYlv8qR36SjpU=; b=iPrAMFoWBaiTQV
	nANfm3jbA16TPFZ4NADCGtbRc6H+mnr8xHT2RButRc44G8k+w1Op7it8uk0aqm9Fcm0mN9IbcLDqb
	0VW3oNnaHpZykGRiNmBhSvH2npZHU+g5clfiMKmv9jczXXEZTtlItbbaQGgt2NYOpZRAtBA38aQPf
	rCdocrhiZwtD4S5sRGk3O0DcIT9L8TlV53u2kEdVc5S5PW9arcSWNuvOJiUDVgRNp/ET3xfyv/0wH
	T1BjvZEnLVAGfsUO4qbwPkbGA/mq+dIukQ4NDrwqFui5/nmjQ5nAU7pRiXjzlZPV7NE8wRYvVrg4u
	YEVoRneGsoVF8YXqMoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzf28-006v6w-JJ; Tue, 21 Dec 2021 13:18:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzf1u-006v29-BB
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:18:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB7EA615AC;
 Tue, 21 Dec 2021 13:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C24C36AE8;
 Tue, 21 Dec 2021 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092688;
 bh=u60Gy+HM2Cz89/HOSt7nvfcnD1OA0GjqWTWcgPWp9g8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GW3KEkW84d4/UGEyZIm2MPN+ABDDa0dQtMkLgqKipAc0mjwvInIp/ZSHzUc2LNnET
 aRVbyR+GAZruHQSe/nY/y8tYEcmODyCqW5cUqEgaCEmGc3uuMHUA0B6P1Cf3QCrBfb
 FTurQWgTUaHQptQstGP/h3yDtDZvzKk0dlZWI2bPCszmGbWygcwMDkhQmzj0f5m9Cu
 TkMa86OgbbXQA+6twpBgjOe9NQBD3FgE1733BV1ZGcMSyCoGUVf9dJSmJ5jL7xhb1Y
 zm/h4NlxN9Fbd5XyrksSqZIwNuGFP/vcer5CVxiZI162bf413A9k224tSaWFtFw08I
 0uMlGncBM4Lvw==
From: Roger Quadros <rogerq@kernel.org>
To: krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: memory-controllers: ti,
 gpmc: Add compatible for AM64
Date: Tue, 21 Dec 2021 15:17:54 +0200
Message-Id: <20211221131757.2030-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_051810_445283_E0D542EF 
X-CRM114-Status: GOOD (  10.80  )
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

AM64 SoC contains the GPMC module. Add compatible for it.

Newer SoCs don't necessarily map GPMC data region at the same place
as legacy SoCs. Add reg-names "data", to provide this information to
the device driver.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/memory-controllers/ti,gpmc.yaml  | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
index 25b42d68f9b3..64dc9d398d9a 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
@@ -23,13 +23,20 @@ properties:
     items:
       - enum:
           - ti,am3352-gpmc
+          - ti,am64-gpmc
           - ti,omap2420-gpmc
           - ti,omap2430-gpmc
           - ti,omap3430-gpmc
           - ti,omap4430-gpmc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: data
 
   interrupts:
     maxItems: 1
@@ -44,6 +51,9 @@ properties:
     items:
       - const: fck
 
+  power-domains:
+    maxItems: 1
+
   dmas:
     items:
       - description: DMA channel for GPMC NAND prefetch
@@ -133,6 +143,17 @@ required:
   - "#address-cells"
   - "#size-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,am64-gpmc
+    then:
+      required:
+        - reg-names
+        - power-domains
+
 additionalProperties: false
 
 examples:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
