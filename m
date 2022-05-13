Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E300C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8BK8hxkz8IbwgnsyUbdQriLEp5Cca+lMyDMlT7vbxg=; b=r2b5BvnioB5c/2
	czsgekqR1NjHvSgl9jnYGipHXlc/n7gwCZ5d9Kvyq0/uhGSfNjqcNsb6kTo38SWOnQK0UbRg5zlpJ
	N5RvFLkuQRNZcuiBSMaTpg1AFyXrOum0B9C54gql7swV/EnEpT1zXUn2pDBiz1PSHun8GfAHdqY3a
	8BdFmnxWtaz/d0QzlCt728Z8+c5ndaEJd/CUAOhnsKoQfDPaHuvyBQzuR/Eiu9qz0BZS7s5QO7sTC
	iiiFZhNQJCCrrmke0k7J5RATZNdEkv3mxeOrOvsPxPfyXFnQfLXgjp3Gkd2/NMi0tQITqsyiOxij0
	3WQUKM0gsMf/qg8bon+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npSs5-00FdoY-Hp; Fri, 13 May 2022 10:50:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npSs0-00Fdlu-S8
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 10:50:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7C5BBFF803;
 Fri, 13 May 2022 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652439003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2IC48sC2BqDK1qhGGtGZy4CQ73sH3Lc5IdbUgWh0VI=;
 b=X1mNUI2r3uApp3MzKyN+1xcS6LPWMKumNxwNcJWZul8XBEHiD3YqTdxJOg4kz4WYoJo8oF
 I4QeZjNR0pMyONGLKBiIrQiTva1PF2J2RrpJJdif7w6UIOeE/xGCn6RWPQTz2zuq9AtTdH
 vyVF0uEeCcOzYaxbqQdpHYyC81w3uGm3o7Jjr1ZYE5DTA6xxhuawD93kOOZzN599of5Rpg
 xtPvmHP11Lv3/3FgN+43owFb0kM7csyk823EbEyLaT7DPjyUmhI2WNWfpEEkM7OLuiUF80
 +rZCEFs3/zJBI7kSipeZ0zG6gDXpBQ7ym5sp+awmSEJosxj38mpVn9WKAj//FA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Milan Stevanovic <milan.stevanovic@se.com>,
 Jimmy Lalande <jimmy.lalande@se.com>,
 Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Clement Leger <clement.leger@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: mtd: renesas: Fix the NAND controller
 description
Date: Fri, 13 May 2022 12:49:56 +0200
Message-Id: <20220513104957.257721-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513104957.257721-1-miquel.raynal@bootlin.com>
References: <20220513104957.257721-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_035005_095118_186312D0 
X-CRM114-Status: UNSURE (   8.14  )
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
