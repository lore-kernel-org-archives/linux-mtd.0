Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF9C2BA18
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCrpqMG52v3B14RKaV774XyNGpe5rvu8NTw69lOA2J8=; b=rNx1gLyl3DVv0L
	8HEYhjZU6/2WYbuqn7Gj/VTxo3a7kgDZ89VvL9cV/V+qhSN0mAsZEVxBqsFiWKt/7J0f434eUvRJg
	F1Btt50YHgWUFb8k1ALXwUm9vu9M6P4ulKgTNjJTWcZLZJ+ThuCZQraZS2uKfmT7diymTQjCrPdeh
	iNS5l5qeXWMfCxGaQbQiyVfs/is7fAtnilg8qQpiI+Gr4Fx2mkmU+NycRQ/oLhfiqmsOpZ7FBgxba
	CDgo1FCcgimAlgStNUpOYBTBcKV7ppOg1awbew/lMr3Pdmpu/Es5ANgjUWALsnnr4OFDrwuZRyr8r
	+vuNFysyuFvdXyU/SdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8ou-0000000A4ew-3Fnb;
	Mon, 17 Jun 2024 09:38:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8ok-0000000A4ZD-2g8h
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 09:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A81926126D;
	Mon, 17 Jun 2024 09:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F68DC4DE15;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718617104;
	bh=9XRADCykKASXBd5xpAHe0JIYlPfbmXG6/ToHGes8RsE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kCgOAQbAYJU2rzDMuRHN9l7/d1asQ4cqqDaFxmpq+kNAZVex6EA3YQVodDbbLQUVB
	 ZVoJfGbl6ClHE4/d32VLBKBgpI5yNQhfJOyYZC7L/UA9WiUA+HUiFxF4VnbnLmY/fM
	 WH+JEfJVSESTW8ZrfBNd6X5x8C+mKOO7tH/5QgqYMxPfhAN9/+MxS0OFfoRrh+Opz9
	 KAsMBdD/IX+Y5o1qT4YvnvzIouYlc0pG80WLrjirGCU+HC5w/T6pjTTX8lV4IdkU3o
	 qdbpE5ku6oestraUs+0KkajacWrYKG1GWUT/VmJ3Q5OevaTvlUxjCIS8kbXNy++tPQ
	 obe11m4X1+DoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768D6C2BB85;
	Mon, 17 Jun 2024 09:38:24 +0000 (UTC)
From: Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Date: Mon, 17 Jun 2024 12:36:52 +0300
Subject: [PATCH v10 18/38] dt-bindings: mtd: Add ts7200 nand-controller
MIME-Version: 1.0
Message-Id: <20240617-ep93xx-v10-18-662e640ed811@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
In-Reply-To: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-e3e53
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718617100; l=1633;
 i=nikita.shubin@maquefel.me; s=20230718; h=from:subject:message-id;
 bh=7r17/fFhBG5Dh5YlKHGbUghicWp/sbQ+SRw1TNILVrU=;
 b=EssRn/6CfCBk1kkHft+lmeGLmVHtPh6dbRjUAYgemW+BdqICnInEo9BJH7TvMQs0mFIaTxjvEArB
 4wc5W6+jDbPpSMt/O2hf+d5Ycr2h5jln+pKHVRK+zzbstECN0Vxz
X-Developer-Key: i=nikita.shubin@maquefel.me; a=ed25519;
 pk=vqf5YIUJ7BJv3EJFaNNxWZgGuMgDH6rwufTLflwU9ac=
X-Endpoint-Received: by B4 Relay for nikita.shubin@maquefel.me/20230718
 with auth_id=65
X-Original-From: Nikita Shubin <nikita.shubin@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_023827_252740_A13EFF35 
X-CRM114-Status: UNSURE (   9.41  )
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
Reply-To: nikita.shubin@maquefel.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Nikita Shubin <nikita.shubin@maquefel.me>

Add YAML bindings for ts7200 NAND Controller.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mtd/technologic,nand.yaml  | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/technologic,nand.yaml b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
new file mode 100644
index 000000000000..f9d87c46094b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/technologic,nand.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/technologic,nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems NAND controller
+
+maintainers:
+  - Nikita Shubin <nikita.shubin@maquefel.me>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - const: technologic,ts7200-nand
+      - items:
+          - enum:
+              - technologic,ts7300-nand
+              - technologic,ts7260-nand
+              - technologic,ts7250-nand
+          - const: technologic,ts7200-nand
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@60000000 {
+        compatible = "technologic,ts7200-nand";
+        reg = <0x60000000 0x8000000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        nand@0 {
+           reg = <0>;
+        };
+    };

-- 
2.43.2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
