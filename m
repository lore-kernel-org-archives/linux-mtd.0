Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E296606A32E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 12:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fg66aZ9M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=arY4JI6O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SxhDSS0IV+eBzZVpPE9RdtOdohEs0PvnMYgTJvnO4lA=; b=fg66aZ9MIxOFXKjU2lbTerzAx1
	96NjIgTLnnOpvxEElYl1xMB8Elwp8QCEF5SDNQmseyo2L1okGogIQhT7efnXbIYlrlZajBzgg66Rv
	l6hUBxf/GqU3WkMpN84HoqbNL6NlQyfpuWhbRqXVwORZUkhq3rVH4WNfvH1mCaOKJJ7sjM79q6Nrt
	wwSYUm/zpg7KRuXEmIkFeiltiw0oYfuWMviJiDQ7cqeuWDQScAnFJ3TBAXU5fp1agmWYnZ0hKIddy
	9iTk2oM4vGmYJVHmE+B7DHiyLGDQbF1j6+6q0FBzylFoiqooYyv5O+ouOaibFu/ttsiZDmVTt0vaD
	WYafLcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr9-0000000DDKa-38sz;
	Thu, 26 Nov 2026 12:45:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYr8-0000000DDJW-2RKZ
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 12:45:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E782F62937;
	Thu, 26 Nov 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795697141;
	b=bRY9cu4nENqz6xn63HNMcj8U26HaHftD9xZ4rXySfoc2IOV82GvEXr/F0c6gTK+l7aZE
	 Wukd41aKaPyNacFj1iGlkRG+xiWkS2Cl002BWFN2M+og7DAPS/MKlL8gbmb4bgXskEuyD
	 d/lKQACpqVaFuv1/X9vhn2jlKDvqlQskpGa+YdfDJ4FL0lrc/DXxDhOaJrNF1JpbSummw
	 /L3V41pt5PyCbLvYJogeGkVCVBCq7gvWXPMIwXssq1jS/wVb5QVs9IbuSby1gWF0jTzrn
	 Cbf8Zmq23iQ0ZPG9fI21gGzS3gQZMZIH+hXbWxhI6AfJgDa58lqbup0KZ5WXgNcJxFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795697141;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Hf4PCkVLe4C9mj55hr0JQem2q97kwDEzG8r1Ux4pINo=;
	b=ARP+jqimcbrKQEWP7YA6DBDHjGnaCj60gOMIXoZJB1KJpDhf8cwK0J9jNDcPRD3dG5mN
	 vpQ1rN5URSbWO3tV04GO7gR2K9V8P9Y7Wic5U4yMCD6OgYVLRKXhF8zabr69qT4Rb7KFn
	 WwB6Ztp5BuGEqayhUg/AZwP2HRVLDEazijsdJS+AySCnMw+VCiUOi2TtQk9O/WFKKlYC9
	 00k7xF+xJIjJPHjC5rdi/6csf0ZSxTgFTGqYEw+pZ+qcN4aTxbdF/ctPrI+D4MDsEJTB1
	 DTmYNOObv342woKCD13nTynKu+uMhYGheoabJNkKnmK6P1lL5hqR6/YXzV17eDc+dvw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 740E11F000C6;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697141;
	bh=Hf4PCkVLe4C9mj55hr0JQem2q97kwDEzG8r1Ux4pINo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=arY4JI6OGgYSSALNRvASQidDTghflXDYh2KuOuOmubJuRuzsytdsZx2Tpx5XPNjDr
	 ZAPGlzMSZh8sN/mycNXM5bYnLhJEpuX8dS4Abpj4Yjxbxing3yCHY+thsCd2tVmMJN
	 4YW5QFrsd4cAWyOCKirfpHWujZUcUxnZ67piXTOHOWnftMnB0++YNDJvZ4urxcFtVq
	 nwwSJxXxAEb1du2EqX9XQWXP8Jm3/LgkcIR1OSgZ+g5PuY0zPjyTFQa2SRyIj99ayd
	 hnE/IrSG5f2Q6wQ5Qn7ReVzENkqGcrDoYbxwUThEQ14OmBBoKzZkwYGiIUI18mEspp
	 TUZLwQv9tO9ww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 04E3E4D4F3;
	Thu, 26 Nov 2026 12:45:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 15:45:27 +0300
Subject: [PATCH v4 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-b4-cs7542-nand-v4-1-38e488f6f8b1@gmail.com>
References: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
In-Reply-To: <20261126-b4-cs7542-nand-v4-0-38e488f6f8b1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795697127; l=3294;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=0qXWSMESZjG+Rrjv+OyLzyU3xQh2VijD/dbwXnwp4EU=;
 b=6Xh007pP+0rd3BhzNs8CxzXOIzhKTw55L6h1HFjQJ0aVw7ilbZ7Np1dNQLfgAofC2AjR+7EE5
 l5OoepbX0OoBivjd1PnsGTKpS3LlBLJLZ6p9YXCGpzX8xNjZ8tn7CD7
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
