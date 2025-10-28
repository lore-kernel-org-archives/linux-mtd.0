Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5018CCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WX45I8uZx3Afadw3gMQNypcMXxnlSdNJs73per16Ydg=; b=lbLPHL+pNnrBTK
	EHgsAn5E86T+CcnHFnP+QCHPbSzqTWFQOkIECjQR4FaQR6CNadUMqyrZf6tdU4CSCIOVvZGPwA7f0
	dfQf7BI7OC1Yg7nmhfY2UqqFe+vF7E0apW02SrvuMQ0LGVPjIlLGGfPzWrcvbyKvCC4FOWus554Rx
	rsdvMJUiSK5IRyMB/QKIMndZd8+1whdBXsYg37qBTh1uOPAhGwV5LVuZY5wGAcCOfW5dsns3Dq9e1
	qOkBjtdJDuYSsFHuCP2BBrGxTsLj6XNfHpsCCuuT5vlzEpLcR5omMPXqG2D9u5o/mCix4nhnCG5P2
	aKHxhI+NhrjcVDhVPZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFZ-0000000FQUl-3e7c;
	Tue, 28 Oct 2025 07:36:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFR-0000000FQOw-3AjQ;
	Tue, 28 Oct 2025 07:36:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5B82C0BE99;
	Tue, 28 Oct 2025 07:35:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2673606AB;
	Tue, 28 Oct 2025 07:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D631102F2514;
	Tue, 28 Oct 2025 08:35:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636962; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K9NMURKSRoyeMVqqgVeeGVItJOP1Hv8pxe6jBsnxXTg=;
	b=CMnUw3UBO9cRxyNZe7elGCFZfhaL7szZxONp7LtNOFGp9Okwc2B3fqeZZR9KMjHT/7uGoy
	Bl1s1X5YyL2RtF6Zz0EpueLVE+0MHBxqf4xxYpSoEzbXnHA1mlyQUW2Slm9NExXO8eRyp9
	nZVdZ3GCr+a8IKWF/f91nDB0WniEg1se/59cuZpzvNua++bqO4rzPPk4StrTW440LzUN4r
	ZzK2goZmTz18YQltYF51cpFHwbIRQy6g411Rz/Gz8lMCS+y057Opl8qOzF0p6OOuoLv+Lu
	YxgKo7RIOEaAHpFldAe2VYhAGL6pnvcAgu7lq3uRroC8eeOYM1hoFQMP75sQYw==
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
	Richard Genoud <richard.genoud@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 01/16] dt-bindings: mtd: sunxi: Add H616 compatible
Date: Tue, 28 Oct 2025 08:34:54 +0100
Message-ID: <20251028073534.526992-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_003605_945458_F090F95F 
X-CRM114-Status: UNSURE (   8.89  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 054b6b8bf9b9..9d061e2216cb 100644
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
 
@@ -25,14 +24,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: ECC Clock
+      - description: MBus Clock
 
   clock-names:
+    minItems: 2
     items:
       - const: ahb
       - const: mod
+      - const: ecc
+      - const: mbus
 
   resets:
     maxItems: 1
@@ -85,6 +90,36 @@ required:
 
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
+          maxItems: 2
+        clock-names:
+          maxItems: 2
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
+          minItems: 4
+        clock-names:
+          minItems: 4
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
