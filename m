Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9973E606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LW+sZOP1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Of3Y1b8m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SxhDSS0IV+eBzZVpPE9RdtOdohEs0PvnMYgTJvnO4lA=; b=LW+sZOP1fhFztTnupVgUXaK7cZ
	ja+Bf0jv78gmUWZ0Ii/hV7j4IHs3G/TjBHsld4eHui/ptS4jmOir/XaMhju5kE0M0uVPlolzJLxoU
	fXdC/eaAEq8RfY2c3Veo/+taRZIlqJ/PFMB33mfIIdhb56KPT769igNWdXZCZQpg2TnQOPQfxV7k9
	pDQw/nI+Dy2LjsotQJAJUsJXjbICeEKjjtpCZQKKP2g+EoOBGWBCfwcG0RjwdC6rvZ2wKoOp3GhU2
	eZ7RPDQwTZ93XjG7fzc6mjYeYOWM6JFqlv9H7ZeAgcsbb54mln2FSr9QrX1BPdp74b9FkA2OlXcSN
	UE4QQ76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyH8-0000000GvPb-49g1;
	Fri, 27 Nov 2026 15:54:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyH7-0000000GvP1-0xIh
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 15:54:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2CCF45089;
	Fri, 27 Nov 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795794852;
	b=FiVQMT3mYZys1IXkr24Ba6gdLTXcy36v4YzxGq1xpcwtDhMgQYmJh2D11UWc5mjXYPlZ
	 bf8t8DKWdPDTWXNtJhHYdlcWmOzHxEF6O3lH0HYCv6RJaa7Ov3X2/BrwU33p2OXwstf0e
	 mcHlxiMKoIOGYjUIGcAQOUrx2nNKJDqUMbIPvpoK+uY9YLTcHkzVK//kKLj+SASBk1OYH
	 3ifrQKs6smQuCnYl08bQXnhint7Lx/ZhQ2KhYv7sdtupBYK14yHRo45xbfPmt2eNJXv3A
	 UVWhX4/20iyATfkC6S6WQFJjViljS4KJE2or9E9IVjp2tgoNBQxzU5crlAQTSHHf1Sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795794852;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Hf4PCkVLe4C9mj55hr0JQem2q97kwDEzG8r1Ux4pINo=;
	b=NEdH6yspBEWM5upRweqmD0uYK3yZTibtlTxjJzDzFCUOYpoLe1+5E+uIEWuaMvOY2qTY
	 Hv5pF9PchM1d3MI3jFmcXTHpK2DYfLJaKjzeS/eIKXa1GrGkfN+yPshfZo4ysmPQQ0XMz
	 XYWIcJmDVGNto/pR0ahQBn1dN5/bIGxLbVs2GcM3RKmnMTZxqfikK1ci2PAGpuV8/F6oP
	 bRy+IPyKRZzgPllZK5Z36sWF2CYbrtAgOGgjMKDNtdiu/Ykhu46JxTyncLGLzNn74hSc7
	 WYfMpMghwVXYjg6/ooJf1ISZEgZ8dYYeeQmRzT3OSG5mGqreYsDM9ll3qdLfFaaAF3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4184F1F00893;
	Fri, 27 Nov 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794852;
	bh=Hf4PCkVLe4C9mj55hr0JQem2q97kwDEzG8r1Ux4pINo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Of3Y1b8mGjYXoWrEMOc9eV5eRjOROO+aq/3seaVfK909SCqUV6v8OSH5p1wowi34U
	 vi/METI0irMhZWjuX5a32FFOCqbxz6W3w3Ywz+Ee0750w4FLD1H1h3TXhWiqqW9GLB
	 6Zh4ijA6AoX4h195IiNe/dg36PdlnAKHMYSE8T6rQCMCFF9tCwK8Htx+vi9V/ETflB
	 kEGfc4+5Ooymk8XhdFooAOoSC68LY17BTkT99ph3mgIRyVbjnvX6oU6VYJMFt5YvbC
	 gQda7bQ7KtGzk/GYHBXh77KuUJVIJ3PQXM0y6Ct85LPnPhkjN8UNzYqT2Qt/2aXlGc
	 1jtmIgTSzbvDw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C29814DCA4;
	Fri, 27 Nov 2026 15:54:04 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 18:54:04 +0300
Subject: [PATCH v5 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261127-b4-cs7542-nand-v5-1-45b1a92bd13d@gmail.com>
References: <20261127-b4-cs7542-nand-v5-0-45b1a92bd13d@gmail.com>
In-Reply-To: <20261127-b4-cs7542-nand-v5-0-45b1a92bd13d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795794843; l=3294;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=0qXWSMESZjG+Rrjv+OyLzyU3xQh2VijD/dbwXnwp4EU=;
 b=jkWb9Pau7RG6hxAZSD/Kn/Y9TZ/aKA2CNRJUrFo+DiJDFo1sxbpW4CxGG4PklMyG/EkblQ5Ur
 4uZIRbb9OppB5udL8K2r5Oo3E8tGJ6bZsCGdWhx5+5Ho5bzHj+r4M9A
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the flash controller registers, optional banked data aperture,
AXI bus clock, flash interrupt and shared flash reset. The controller has
two chip selects, 8/16-bit bus support and Hamming/BCH hardware, rather
than only the configuration supported by the initial driver.

Inherit the standard NAND chip ECC properties. The example explicitly
selects the ROM-compatible 256-byte Hamming layout used on Almond+.
Firmware initializes the NAND bus timing.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/mtd/cortina,cs7542-nand.yaml          | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
new file mode 100644
index 000000000..3b7fdf6ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cortina,cs7542-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 NAND controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The flash controller has two NAND chip selects and supports 8-bit and
+  16-bit devices, programmed I/O, hardware Hamming ECC with 256-byte or
+  512-byte steps, and hardware BCH ECC. It is on the AXI peripheral bus.
+  The data aperture selects a bank through the controller registers.
+  The flash controller also has access to the shared SSP DMA engine;
+  the programmed-I/O interface does not require that DMA resource.
+  Firmware initializes the NAND bus timing.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-nand
+
+  reg:
+    minItems: 1
+    items:
+      - description: Flash controller registers
+      - description: Banked NAND data aperture
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: regs
+      - const: data
+
+  clocks:
+    maxItems: 1
+    description: AXI bus clock
+
+  interrupts:
+    maxItems: 1
+    description: Flash controller interrupt
+
+  resets:
+    maxItems: 1
+    description: Shared flash controller reset
+
+patternProperties:
+  "^nand@[01]$":
+    type: object
+    $ref: raw-nand-chip.yaml#
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    nand-controller@f0050000 {
+        compatible = "cortina,cs7542-nand";
+        reg = <0xf0050000 0x300>, <0xe0000000 0x08000000>;
+        reg-names = "regs", "data";
+        clocks = <&axi_clk>;
+        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            nand-ecc-mode = "hw";
+            nand-ecc-algo = "hamming";
+            nand-ecc-step-size = <256>;
+            nand-ecc-strength = <1>;
+        };
+    };

-- 
2.53.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
