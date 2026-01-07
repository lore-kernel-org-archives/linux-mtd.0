Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FF2CFD624
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 13:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDFCpm4H99y1oGXfzGwji2T51UaDttX4LBVLjrW2/G8=; b=opx+yf+rveu38q
	tNdv4Hhe0QnrMl2L79T2IyehiWGvx4RB7RJEU8WEWeV6/QqXS6zJbvjsbLxV7pPcNB3jHyj2AdfKd
	kAvgCZPDETbWhJeIFnFua3w5YB8zpAmFVC93TKbuyQ2fxCbqtgtyhckWpK9bcuYbA/3ibYZPE07PN
	kRTZFwVfENUcDcedKmqEizAbSFamau9CNXPfuBrumyZ1L51RBjsgQ9zUarZUBScDPXdvYGlHeJni9
	XLuzQF7qGnxTquNy87HJ6tygqrKyyKROP9imKVsCG3yEcWeRBrUaSrYc49DABXxM5jKjuoyrt+ENT
	Ca4QYbOIULc5jxkWHqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE9-0000000Ex5u-2Luu;
	Wed, 07 Jan 2026 13:05:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTE4-0000000Ex1a-32bP;
	Wed, 07 Jan 2026 13:05:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 544184E41FDE;
	Wed,  7 Jan 2026 13:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 293AC606F8;
	Wed,  7 Jan 2026 13:05:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DC51103C821A;
	Wed,  7 Jan 2026 14:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v86K00C2fNx5hWbvxkan6t0DbijjMzvVsdWXGbU7/lY=;
	b=ewS7wwGIxnLGvlW1n7rbyYVE272yKtFwMLpXA5dQxwBgkXDCDIjJ/00Crbfj/yjvQoF3KO
	Tx11D+DGgmI67oFQcEmX+DLOztgWjbGAhymtnaevZ/myz5iv283sMxkj7DacsQAV4NEdVC
	nBRLthQpl9T4htROsyNVba4lV3jZbja1UpM5F/XhsaEeDHxzwnPPzt2CBAlpzfU7JrGBr5
	fuhxbzmg80sngjZygGzgi8Usi8M9d/2iqtt0Ua/gkP6KNf8aAtw82k6Ff+QZgxrkxijLu/
	FJnMWcTNqpIBmus89VnLtyDYJww8qXlPXa7us9UgAMbcfqPZtc96NXcaVqYQ0g==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 07 Jan 2026 14:04:54 +0100
Subject: [PATCH v3 3/4] dt-bindings: mtd: physmap: Allow using
 memory-region to access memory resources
MIME-Version: 1.0
Message-Id: <20260107-mtd-memregion-v3-3-f9fc9107b992@bootlin.com>
References: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
In-Reply-To: <20260107-mtd-memregion-v3-0-f9fc9107b992@bootlin.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_050524_903089_946E4FF1 
X-CRM114-Status: GOOD (  10.10  )
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

Enable access to memory resources not only via I/O address using reg,
but also through a portion of main memory using memory-region. To
achieve this, new compatible strings have been introduced: mtd-mem and
mtd-memro.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mtd/mtd-physmap.yaml       | 69 ++++++++++++++++------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index a9ec3ca002c7d..98d45982d8eb9 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -13,10 +13,6 @@ description: |
   Flash chips (Memory Technology Devices) are often used for solid state
   file systems on embedded devices.
 
-allOf:
-  - $ref: mtd.yaml#
-  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -61,6 +57,8 @@ properties:
           - jedec-flash
           - mtd-ram
           - mtd-rom
+          - mtd-mem
+          - mtd-memro
 
   reg:
     description: |
@@ -141,19 +139,37 @@ required:
   - compatible
   - reg
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: cortina,gemini-flash
-then:
-  properties:
-    syscon:
-      $ref: /schemas/types.yaml#/definitions/phandle
-      description:
-        Phandle to the syscon controller
-  required:
-    - syscon
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cortina,gemini-flash
+    then:
+      properties:
+        syscon:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            Phandle to the syscon controller
+          required:
+            - syscon
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mtd-mem
+              - mtd-memro
+    then:
+      $ref: /schemas/reserved-memory/reserved-memory.yaml
+      required:
+        - no-map
+      properties:
+        addr-gpios: false
+    else:
+      allOf:
+        - $ref: /schemas/mtd/mtd.yaml
+        - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
 
 unevaluatedProperties: false
 
@@ -233,4 +249,23 @@ examples:
             reg = <0 0x04000000>;
         };
     };
+
+  - |
+    /* An example using mtd-mem/mtd-memro */
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        bm_logs_reserved: bm_logs_reserved@10000800 {
+            compatible = "mtd-mem";
+            reg = <0x1 0x0000800 0x0 0x0010000>;
+            no-map;
+        };
+
+        sys_logs_reserved: sys_logs_reserved@100120000  {
+            compatible = "mtd-memro";
+            reg = <0x1 0x00120000 0x0 0x0010000>;
+            no-map;
+        };
+    };
 ...

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
