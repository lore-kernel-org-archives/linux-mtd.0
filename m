Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524FDC43219
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFrKqeZDs2VJmW5d6S+L8qktHQEqXnEi7F6fPhDWu6A=; b=pJQFttlkvTjVxK
	k2mwofH4/v8nhFR5aTiWY6wqwsAqf3d2BA7gqK47T0J1Wsrbp5sfk3/25xDIlqmBebgg1p/rMTEsv
	4mm2LPIGDPk4EeJlDf1zOAZ+Bc3Og+jFy9bIT+221d8+/BbbzJJjE9FmTj9mJ9yGntDMIjVO8NJba
	5PBgHQu9RMk7/mpQtiLh7iI6sUsTT5t/DSpkepxxfCHCa7b1QFCLtfTdiK+xKOWUvNjwDg6aA3T+Y
	Nrro98MfX2rzOD64t5n+aoTPiyJB8b6hepg03vWZVeibfgIOVpR+BNz22p/eQ8WKkEEGJIP156H16
	oiac/9ospsBwsw3D7K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrm-004WW0-T7; Fri, 04 Nov 2022 16:48:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqs-004Vtv-8u
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:33 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E073440015;
	Fri,  4 Nov 2022 16:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRDFGN+zRO7AC+X4pkKNuDHyPBAeUFzjW6kshWON1O0=;
	b=j60Y7aIsofHslJoIacsEQGtjo0nM1/27uO6nXcszwdWCIxxEJqr6vUscDjY6J5i63BFMbp
	3TYA5sCjL1oTMDdBzsfPAUtD2+p9NT7B3NI1oIt5d3OAb4lkshrm9GkXERRJ6zZ/Zb0aVd
	1v5PRs78PMysm+O8OacpszphDDASGuBDj4QdkZK8SCVFest8Chw1r7tkFTJfz3/0kTf3Tp
	D9bpQJ7bddiYBX7GnOyyOSn2eGaDGbW/0izcnJfmgFsQAPVYqaf1bWJ49yO75cfCY9Udrr
	H585MAQI250G7MPzZaQfut3GwVsMIYOYQcWENUtZyqRWJGRetiExdP/8PBEMwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 08/17] dt-bindings: mtd: sunxi-nand: Add an example to validate the bindings
Date: Fri,  4 Nov 2022 17:47:09 +0100
Message-Id: <20221104164718.1290859-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094730_543413_81A1B368 
X-CRM114-Status: UNSURE (   8.31  )
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
