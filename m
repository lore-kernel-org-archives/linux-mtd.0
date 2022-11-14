Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A8C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2gfSWss2DKMCJFCeg9xx7lPkzMQtHpUMxVVMLNFRlI=; b=wlR/zSiog4l9a9
	XQx34Bo7UEMQQN8NnLdECVFk+lpKryC1cdVXF+QigkQ3uQG2aOXcuDtPXpFz0PGyFfNsK+zAJhpE/
	c6KCd7rTnzqUbMUqazJMoRSZA2M8KTsvGpa2VfIWWk/hXPKNFMyMBcU7tL7XVKWzNNuvqIVgjMAVG
	PtvoHcoDUlltvavfSuR/lrJfRDcTer3jNLhaGyNXmCL7XFG+73c0oX4nsQ8EpWF6PtoGKRNV0Wdbu
	ENHpGAWO2gOl56jfb75vRv/oJhhPnnnLUaL1B9NAxAEa0/dtE9i2L7aUrZm51678y3LNb3HsLNIAE
	OB6GrHrTmPIC3/8jmp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPR-00H3Kc-2R; Mon, 14 Nov 2022 09:05:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNX-00H1wz-53
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:44 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D7972FF808;
	Mon, 14 Nov 2022 09:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyU/TfI7zG+vFv5AqFpSCNXPLiST9CWSE91HtqUC5QU=;
	b=ALFHtwkDEZnD7s7RXo5XGBYtlV7xf8OA/UzzOLAwjOup3Lso7zhlnRXwQ0gRLSPRMDiwyk
	5VIBEbN4EJ9FqjF1yg5dTQ/PfpMrjY+GRq1dQOhOtvdPucEj6SuwBOzBTpXipmhPGE/Huh
	NZtGVLpnEqIKjqCZS0491w5CIECHeZQTnDg7O+Rkq4KQsQAPkEm3Ue0eDIw372+kX0G+jV
	H5IBVXOg1q7upLRwHhSqXVJoOBE8kxAiJeDFAdpQfXU+O7qesB/H225NJke+gMIMOMc+i6
	KZIG2ZID2RtzqEkB5CJVQuyKR/zXRJ4Wo297+z1IL/N5dVoeQ3AVEbZXVW4JYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 08/17] dt-bindings: mtd: sunxi-nand: Add an example to validate the bindings
Date: Mon, 14 Nov 2022 10:03:06 +0100
Message-Id: <20221114090315.848208-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010343_415278_8C554685 
X-CRM114-Status: UNSURE (   7.69  )
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

Copy-paste an existing DT node to ensure the dt_binding_check target
would catch any unforeseen difference.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../mtd/allwinner,sun4i-a10-nand.yaml         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 465aa69f0f10..e7ec0c59bca6 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -86,4 +86,27 @@ required:
 
 unevaluatedProperties: false
 
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun6i-rtc.h>
+    #include <dt-bindings/clock/sun8i-a23-a33-ccu.h>
+    #include <dt-bindings/reset/sun8i-a23-a33-ccu.h>
+
+    nand-controller@1c03000 {
+        compatible = "allwinner,sun8i-a23-nand-controller";
+        reg = <0x01c03000 0x1000>;
+        interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND>;
+        clock-names = "ahb", "mod";
+        resets = <&ccu RST_BUS_NAND>;
+        reset-names = "ahb";
+        dmas = <&dma 5>;
+        dma-names = "rxtx";
+        pinctrl-names = "default";
+        pinctrl-0 = <&nand_pins &nand_cs0_pin &nand_rb0_pin>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
+
 ...
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
