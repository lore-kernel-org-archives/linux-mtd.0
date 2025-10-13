Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE32CCD18D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 15:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTiS2sFv82MSFdX+40QnBgv5bu53/s46wws86eo5sOU=; b=axmw10XYzVdF2k
	MuURhqMEeQ1s8RaEW176OrBt+xWyWJ2WmBQLQkW60N2KDbaYzn8NbYV2RsSqCrNOj51K9daiTERJw
	rTuphEngUWPv/DK8SN5uiilDs1lIblzEKexv2VIfL3XLDjFYk3kvDHEYrMRGkGgKiam9hY8Mpo55t
	sNO4FPU9xdMVHwIWvTTaFfvDnyOYQW7P6IF2xAQ7F1PbN5uLzhpWRw4UHYQsNkDsKXPLXLWSZb7MX
	taI5KO+nWHcHCNGizBn0cNGfx4KqpwBlqVYTDtZyg57K1hynjfA16mvO5yahIgkQzB46NLIWkeQGa
	QIg8tv6BxiNSPBG2LoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTW-0000000Dfgf-2v3D;
	Mon, 13 Oct 2025 15:28:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTS-0000000DfZO-0rZV
	for linux-mtd@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4Yv2LZrhSOd4vz0gQ7eWw6e3151d7qoUhYTKCe+tu2E=; b=hgAebzkVCGMVMFyi6txLDBFaov
	1DKggtqKjWqxFk86cwGNinUzftmju81noSKlgw8RNt3+86i8pwQYqzmM/NTlhClzQH8lAS3eP1KPF
	w/ldMGFLE82VoJ3ax2tCHx3g1ObXNj2YRhNnTnCLQmJCd6cF9Lc1IQUAm8k4h6l62r/q6bf222wZS
	Avl1giXRCaxDuF+AXzKusaL4iZta5b9Zc87UE+PH4ggxQeqkt10EbBfihYGDIPEC5JeLS8jYETSaC
	4qxXqhIT7U4aOjJdYjxZ/RiophX+dQOMz9yh4TGq4ruIadjdJUM1NNXq72avBzM19SJmyEKZOZ6pZ
	EIezcQJw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTA-00000008iaR-4A0a
	for linux-mtd@lists.infradead.org;
	Mon, 13 Oct 2025 15:28:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B91F1A1335;
	Mon, 13 Oct 2025 15:28:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61D4C6067B;
	Mon, 13 Oct 2025 15:28:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AAB7102F2272;
	Mon, 13 Oct 2025 17:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369282; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Yv2LZrhSOd4vz0gQ7eWw6e3151d7qoUhYTKCe+tu2E=;
	b=Jzq0aJ7YVOV0T7gPWEGHQR0fG3brxvbm4L4mbuRxWs89F0KraZg/NoyQM5VhfPvN70PrLe
	NS/Q+5D1YIETc/xpwfclqv0boO379ZPq62kbeKL6BT57GRpQ0ojWaeiQoLI30CI3rsixc0
	U99Ot2ZKQcc1UI7V7i86UhcdSxPHUn9ny5sCWh9Eu9WbMYKkoOzPQ/2xGvsaJoC6QWHZW2
	XZ06I+inc5R9XUoIY0WdakuTeNlJwyVXBVEF3eKySBd0sjCy1xIPAlp+b3TvrmwLNofthI
	IG0GNG2LN6ff9jbHHlTxUJAPcVObnQlUxJQqIDMZP/cTi6CgPuK/B5R08sv60w==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
Date: Mon, 13 Oct 2025 17:26:44 +0200
Message-ID: <20251013152645.1119308-15-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_162820_760204_6ECA3708 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The H616 NAND controller is quite different from the A10 and A23 ones,
some registers offset changed, and some new one are introduced.
Also, the DMA handling is different (it uses chained descriptors)

So, introduce a new compatible to represent this version of the IP.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../mtd/allwinner,sun4i-a10-nand.yaml         | 57 ++++++++++++++++---
 1 file changed, 48 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 054b6b8bf9b9..4b82de9fae17 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 NAND Controller
 
-allOf:
-  - $ref: nand-controller.yaml
-
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Maxime Ripard <mripard@kernel.org>
@@ -18,6 +15,8 @@ properties:
     enum:
       - allwinner,sun4i-a10-nand
       - allwinner,sun8i-a23-nand-controller
+      - allwinner,sun50i-h616-nand-controller
+
   reg:
     maxItems: 1
 
@@ -25,14 +24,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+    minItems: 2
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: ahb
-      - const: mod
+    minItems: 2
+    maxItems: 4
 
   resets:
     maxItems: 1
@@ -85,6 +82,48 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: nand-controller.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-nand
+              - allwinner,sun8i-a23-nand-controller
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: mod
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-nand-controller
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+            - description: ECC Clock
+            - description: MBus Clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: mod
+            - const: ecc
+            - const: mbus
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
