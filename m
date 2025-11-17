Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D00CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yq5p/DbEah6VWv8u7J8HQKUvigIO+myDkL4+DWkx64U=; b=oWSwa/UX9Agm0/
	BfiRg/kASwRWigK6HK5PeDG391R0Ayj5oQq8Sxb8/6RHk86+TrrMx9oBS9rd41kTikicrFQxfwpOM
	cyFFMkO3PefjS1QRh9tqKmxaG/8pBSkrHNBip3bdzD4J4Iq3Jq1j2N8uUQa2nmK/8zLbRONMviTtM
	JA5UEqL2SNH+za6DRm8cpyJUH0lk9eJqAcoIwQM/wkbOtcdF3vJPBdKCLLgly7F+qA0VIGMuKENMS
	m8XSIzrVYdh/EwODzZddjJnWNFp9OGIdM76gkPYH861hq9KarBGkm6yK2Zs0u3I5iseJ1DYKawg7k
	vC/n+SRkmkupjsxyNsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2al-0000000GRkL-1sDd;
	Mon, 17 Nov 2025 17:00:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2ag-0000000GRgq-3WNk;
	Mon, 17 Nov 2025 17:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xCtNmtF9ftpetIg4Hf9F97yBZ1udfSvg+DWHKxu+fA8=; b=HcSVToZ1ZLC5H0V7UeEAlyssZK
	ynNbXpviQxZ9+fIc6mkMdAICJ2ZujB9FsskMw4qGnk0O8ddgxXqEyZjgJlh4uhuJcre+vw+Ki85z/
	IW1FWXwbQMfBP+a7I8qPDBkx4/sWzZltuUChmCfOnNsPfpjea4AqmF6QQeugQYl2kRfEZ3+ylHqsi
	vv/XqXu9Ged0IPuqimVY4NvMc1jxo4HRdO/z1LDY6bhr+SNoJsUZxEmzhXRFka0BSKkS5ujqlCv92
	54E3rmFyswJ2P0wpV0yhcrk6eAqZLMaovTB3okOt5Zuyc0clvc50qe5N2YW8oWe9/em4caNqH/dDW
	P3Lvs/hg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1j0-00000007iTX-1lhb;
	Mon, 17 Nov 2025 16:05:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 676A0C12659;
	Mon, 17 Nov 2025 17:00:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D42A606B9;
	Mon, 17 Nov 2025 17:00:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 563AC10371D02;
	Mon, 17 Nov 2025 18:00:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763398830; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xCtNmtF9ftpetIg4Hf9F97yBZ1udfSvg+DWHKxu+fA8=;
	b=bVNsauQ6+aiQFNqm1gnrEKP1milOrr7eWGqqQrZ9N1KM/B02ZUVUNi3s1/8r4+pgZlWCLv
	K5o9fIxBJ4yQb+eHnsHDoKQZHwwbKJaZbUrI7kIDqw7SXoFA9M/SkBm5lz4pcKBiSybljy
	e3m19c3A3JU69+3lZDJvkeNzulJm0RpFO2nTm+fi3g5EIE5YQmJ8IPcL9jXytDVT5KEl2k
	b4I/KW1n+ItUf+G9KZI5TNSSUoydBrM97yut876R0QXKv4ihMd0QTFLdOSCpmzsrK6D5Qw
	kJzauURsHk5U/JpxSCFSjBPFfD+zOUqfkzy9DwcBVghKxyexXp438xB+iTpSNA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 17 Nov 2025 18:00:15 +0100
Subject: [PATCH 2/3] dt-bindings: mtd: physmap: Allow using memory-region
 to access memory resources
MIME-Version: 1.0
Message-Id: <20251117-mtd-memregion-v1-2-7b35611c79a6@bootlin.com>
References: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
In-Reply-To: <20251117-mtd-memregion-v1-0-7b35611c79a6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20251117_160506_570557_2609D5C8 
X-CRM114-Status: UNSURE (   9.93  )
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

Enable access to memory resources not only via I/O address using reg,
but also through a portion of main memory using memory-region. To
achieve this, new compatible strings have been introduced: mtd-mem and
mtd-memro.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mtd/mtd-physmap.yaml       | 59 +++++++++++++++-------
 1 file changed, 40 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 1b375dee83b0c..0f75a1204b263 100644
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
@@ -116,6 +114,10 @@ properties:
     minItems: 1
     maxItems: 8
 
+  memory-region:
+    items:
+      - description: Memory regions to map into mtd
+
   '#address-cells':
     const: 1
 
@@ -129,21 +131,25 @@ properties:
 
 required:
   - compatible
-  - reg
-
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
+
+allOf:
+  - $ref: mtd.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mtd-mem
+              - mtd-memro
+    then:
+      required:
+        - memory-region
+      properties:
+        addr-gpios: false
+    else:
+      $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
+      required:
+        - reg
 
 unevaluatedProperties: false
 
@@ -223,4 +229,19 @@ examples:
             reg = <0 0x04000000>;
         };
     };
+
+  - |
+    /* An example using mtd-mem */
+    mem_logs: mem_logs@10000800 {
+        reg = <0x1 0x0000800 0x0 0x000f800>;
+        no-map;
+    };
+
+    sram {
+        compatible = "mtd-mem";
+        memory-region = <&mem_log>;
+        bank-width = <4>;
+        device-width = <1>;
+    };
+
 ...

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
