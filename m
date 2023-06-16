Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D4EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jun 2023 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BgY0zAVtV1MzVK6qqMHWsTiZ/9LX+gBfoN4dZswymQ=; b=qRToJQL/PpjhHm
	Qc7MX7viNoDx/xtub6GCpOpn+jgKU6JYrcmRibgd97e2AUOy9L3lpBK0sO2BtGK1T+/UJGCjGYj6g
	yerd1FIrqZqs76JR9+40D3lp6Fimlb03H0jytSnDWAdk4Jzz8Nmb7k9alri3AUkeuygrF0p3U8WFI
	nn6JIiZ4T2+WBU3g0Bm5TG3IHw1hJQljePlR8I5wKpXh2CF4YjDl6w0F3cl1psNS+eeoTpIeZb+lS
	ogqC5FehEDZEW0mcHrS+V63B4or7SDnxgzKMEeC54zwCu+NXI/z9B7WBaUi1sM7zRQl4i8mWyZEBN
	aHwgxBy1wbr3xteGLytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA0e-000k8I-24;
	Fri, 16 Jun 2023 14:01:04 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAA0Z-000k72-0D
	for linux-mtd@lists.infradead.org;
	Fri, 16 Jun 2023 14:01:00 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686924056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vUuQah/jLut+5JCdepeOJ/jXlhpXt0heS9hreLKMNHo=;
	b=I7NzJG0qWy+YP4gvzB4eyBw8PnR5wozl7o3Vr7pl1cbNo32TDit+ANwC/gie06z3BCa52c
	YLqUlSBsKwpLCHeRXRgQF4TyTEMrFiz1ZS/Pm8E1TYA6ZEBbbqwtGef6Rtsat3lvVTehoV
	Z0uGKeMWhElOny7aBsmo9heu6Rb6hxmIdglRJc+MYaWtrteuJ1Nnw3Ml50w9UQPX+YoDe6
	nxdyxYb71nOA3OGV121NZEx2QlHbg0N8H1i0caMbNeW95wbb8vkdcmTo5sHQXOqrkueeoc
	zDSVga4gO/+k+gQq54ChVSB6ELFekZFmsthZrsYuyrr4YA9dgr6X8+sjUS3E6g==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3615340007;
	Fri, 16 Jun 2023 14:00:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] dt-bindings: mtd: spi-nor: clarify the need for spi-nor compatibles
Date: Fri, 16 Jun 2023 16:00:54 +0200
Message-Id: <20230616140054.2788684-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_070059_234091_7CAE4527 
X-CRM114-Status: UNSURE (   7.85  )
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

Most SPI NOR devices do not require a specific compatible, their ID can
in general be discovered with the JEDEC READ ID opcode. In this case,
only the "jedec,spi-nor" generic compatible is expected. Clarify this
information in the compatible description to (i) help device-tree
writers and (ii) prevent further attempts to extend this list with
useless information.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..bef071163e38 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -43,8 +43,10 @@ properties:
           - const: jedec,spi-nor
       - const: jedec,spi-nor
     description:
-      Must also include "jedec,spi-nor" for any SPI NOR flash that can be
-      identified by the JEDEC READ ID opcode (0x9F).
+      SPI NOR flashes compatible with the JEDEC standard or which may be
+      identified with the JEDEC READ ID opcode (0x9F) do not deserve a
+      specific compatible. They should instead only be matched against
+      the generic "jedec,spi-nor" compatible.
 
   reg:
     minItems: 1
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
