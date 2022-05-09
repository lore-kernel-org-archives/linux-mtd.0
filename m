Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B45CC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8BK8hxkz8IbwgnsyUbdQriLEp5Cca+lMyDMlT7vbxg=; b=ghXEmFeda5HHo5
	2wJe6GYGlvc933fckz5K4BcU9Wqbj6vMlaReT6Fb8WhtQzXZtV6R/oQbWI/77YhigEYb8MdeKsEoN
	798vUmgdaQLv4j69OQMcmvqyu1t3Q6k5Nr0w7XQmC0ZIR7MXMy1oVjgbojZN/1ZhtjgTG8aTCAxi3
	FMsYfNqgqz0pBGQfszLXG2ezjmtsVbgefXB6GPbCFd6jcoH0afN4/pJIIY4aa/8qy60CU8WS7W9ue
	3CygH/75JrMnHFm1njZ0B0Gi4XIEcPT4V0o6HjwpLHKta0yBiCSxlaq6jeM8faCwLgsp+vSCJ83Rs
	yvCwLfv/8VdcSsi8oHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no5dx-00FCjp-88; Mon, 09 May 2022 15:49:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no5du-00FCiN-Uj
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 15:49:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DE395FF80C;
 Mon,  9 May 2022 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652111389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2IC48sC2BqDK1qhGGtGZy4CQ73sH3Lc5IdbUgWh0VI=;
 b=kHxU3QzY0hIgY7ZDATQ3jVv8uYbQgVvIwQ1PKQ1mG9DD3tP2TrK9RIh0Ia5cZpR7JFU2I5
 d6DiLUPLwnKNcgqRVLEAemVep0Ff2Y8N5MmihpJNOzBVKxsCKHP7nNXl3vLomdufKtCH3e
 P1jYRrub3+9Fy2e4fHU6NLlsGMAxxfWUtsODs86mRHp3MLE9Hxkfc5U/GoP7sCU/ORSW38
 9g70/SqNZp2l4/gd/FYuzkr+MX18F0okKtJ0xm/EER67q5tDADjaITVhGknL906qUXsJTG
 nTaHvbQXZu8VQRySbEAoy1FiBIQoy/nvTTXYJJ8Jp2TC20v2NoDXPC26rRX3CA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: mtd: renesas: Fix the NAND controller
 description
Date: Mon,  9 May 2022 17:49:42 +0200
Message-Id: <20220509154943.25422-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220509154943.25422-1-miquel.raynal@bootlin.com>
References: <20220509154943.25422-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_084951_188623_7DA63DD8 
X-CRM114-Status: UNSURE (   8.93  )
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

Add the missing power-domain property which is needed on all the
RZ/N1 SoC IPs.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/renesas-nandc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
index 2870d36361c4..7b18bc5cc8b3 100644
--- a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
@@ -36,11 +36,15 @@ properties:
       - const: hclk
       - const: eclk
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
+  - power-domains
   - interrupts
 
 unevaluatedProperties: false
@@ -56,6 +60,7 @@ examples:
         interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
         clock-names = "hclk", "eclk";
+        power-domains = <&sysctrl>;
         #address-cells = <1>;
         #size-cells = <0>;
     };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
