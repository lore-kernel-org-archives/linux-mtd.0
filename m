Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BBC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYKJ31TvirJwu2gq7KRBkgZSC1DQtlM390UP46D1XQY=; b=4dPAlTrvrrWdSK
	jAtVIBf7ptU8scISiv7Ft9Hibjn4kAO4PyaPDpUmZ2f6OFSFITT+TE5eHm31FmwHx31Q/WV3jMJuh
	Oe2aJiz3TwQkNDWHK+3SWcGbtaJDHJaj6OaaMWNaeOmVxwvBbBK1hduCsb8ZmDzDVqfsoEWhlCSTz
	1QddJikm6raJEiZr7Lo6FLdL8kgi4iIJN4eqZNPXpxUEseaWnbMGvHIkEotL2JfcVJXm5BvZZnVFv
	4jXlRMNb2Fb2JBEOz/LoGKGHQkvXHd6/fVvJhTZaAcIccsmJvifE/foKXb+NBtLPBQpFSnlmgr1Ap
	+RJu9u4zVvL4W8O4lewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd9-0041Kc-0N;
	Wed, 08 Nov 2023 14:34:07 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jd4-0041GX-0J
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-509109104e2so9189052e87.3
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454040; x=1700058840; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2oP0CAwM9fqA+0Dgb2EoSHPOfdHteJ6dO8seqEUSC8=;
        b=AoBiF3CHSXfI+2NaewNPrbHQLXfmLX2mQFESmLZf7hnfokJwSeV40OqNV6wGLsOWks
         lPX0Di+D/ao9i589Yi+oI0xzDpIdxhpjFlXAqtN79n7FDLfcDmvdzqtcl9BJ5gPjT0u2
         yY4WpxWXJ/6zHvn7fC8dRGf07WyLRtyF056wRH1CtdvvBKzGP2H6MHGTxiaPhl3KifSR
         YBFQSWgbUwDZRxQriLOAl/iqt3QQsPiDqs1EFd7DZ/0a+kj68gxfM0/pertNK6Gm2/5i
         uN+RXJ7KaxnlnwLSbXcNij5jO1X+1lnTFaT2Yc/Rd6n/8EYZLtDY9o42nzlQ1Kq/4Hrw
         /P8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454040; x=1700058840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2oP0CAwM9fqA+0Dgb2EoSHPOfdHteJ6dO8seqEUSC8=;
        b=pfS70pdE6A7bQ/aQZM9lOhuLZaoYEtkAjcpJ7uqpP6ovM5ek6ToI41u6uRBxjwuIK8
         itHMmNNRZWf09aP9VH0RjA3PP02qzrWGWv7VW0yD0rNeNRBxVD04tP/9YakSaXwBy+F3
         CJoP9CEkhkyTxALiDV6IRVEuQ7DF0qCXMDL1dwujNr3RmU4Zv/LWZV3mrPzb7NMZLGQc
         5veEHbalBLm+ukItB7zkaLWfXCrjRKAcxWjhBNFt5Lm3Qsf+oz9C/XnLA/R5XMJS94sN
         qcZ/nbLnKxIr9QOR3nwpZl1mr7KVRc1ukC22zIBVrKBoSP26FkcVEc/6mV6bsE+DC2iV
         hJOw==
X-Gm-Message-State: AOJu0YzKBGtcAQI/q3sOprouNMxvSFaaPw5IMnwTe+Y88eCtxPuSxyf7
	xao5pcL+Fk+802kl3Z+vmlrlCQ==
X-Google-Smtp-Source: AGHT+IFeXnsMtyy2DU5D81yc59LJjJ/iZ2FiMOZRYehCSURuyYWkuW9aCmnGrNB56MFltC8JL+AJdA==
X-Received: by 2002:a05:6512:2808:b0:509:45ed:1083 with SMTP id cf8-20020a056512280800b0050945ed1083mr2130529lfb.40.1699454040709;
        Wed, 08 Nov 2023 06:34:00 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Nov 2023 15:33:50 +0100
Subject: [PATCH 2/6] dt-bindings: mtd: Rewrite gpio-control-nand in schema
MIME-Version: 1.0
Message-Id: <20231108-fix-mips-nand-v1-2-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Howard Harte <hharte@magicandroidapps.com>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063402_177668_79AB8BB2 
X-CRM114-Status: GOOD (  35.72  )
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

This creates a schema for GPIO controlled NAND. The txt
schema was old and wrong.

Mark the old way of passing GPIOs in a long array as
deprecated and encourage per-pin GPIO assignments with
the named nnn-gpios phandles.

I was unable to re-use raw-nand-chip.yaml or even
nand-chip.yaml: the reason is that they both assume
that we have potentially several NAND chips with chip
selects and thus enforce a node name "nand@0" etc,
which doesn't quite work for this device.

Since the GPIO controlled NAND is both a NAND controller
and a NAND chip jitted together, I have to modify the
mtd.yaml nodename requirement to include nand-controller@
as this is the nodename that this device should use.

Deprecate the custom "band-width" property in favor of
"nand-bus-width".

Reported-by: Howard Harte <hharte@magicandroidapps.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Check the required section especially. Since there is no
hardware default for anything when using GPIOs for this,
I think all these parameters are compulsory.
---
 .../devicetree/bindings/mtd/gpio-control-nand.txt  |  47 ------
 .../devicetree/bindings/mtd/gpio-control-nand.yaml | 168 +++++++++++++++++++++
 Documentation/devicetree/bindings/mtd/mtd.yaml     |   2 +-
 3 files changed, 169 insertions(+), 48 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
deleted file mode 100644
index 486a17d533d7..000000000000
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-GPIO assisted NAND flash
-
-The GPIO assisted NAND flash uses a memory mapped interface to
-read/write the NAND commands and data and GPIO pins for the control
-signals.
-
-Required properties:
-- compatible : "gpio-control-nand"
-- reg : should specify localbus chip select and size used for the chip.  The
-  resource describes the data bus connected to the NAND flash and all accesses
-  are made in native endianness.
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- gpios : Specifies the GPIO pins to control the NAND device.  The order of
-  GPIO references is:  RDY, nCE, ALE, CLE, and nWP. nCE and nWP are optional.
-
-Optional properties:
-- bank-width : Width (in bytes) of the device.  If not present, the width
-  defaults to 1 byte.
-- chip-delay : chip dependent delay for transferring data from array to
-  read registers (tR).  If not present then a default of 20us is used.
-- gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
-  location used to guard against bus reordering with regards to accesses to
-  the GPIO's and the NAND flash data bus.  If present, then after changing
-  GPIO state and before and after command byte writes, this register will be
-  read to ensure that the GPIO accesses have completed.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Examples:
-
-gpio-nand@1,0 {
-	compatible = "gpio-control-nand";
-	reg = <1 0x0000 0x2>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-	gpios = <&banka 1 0>,	/* RDY */
-		<0>, 		/* nCE */
-		<&banka 3 0>, 	/* ALE */
-		<&banka 4 0>, 	/* CLE */
-		<0>;		/* nWP */
-
-	partition@0 {
-	...
-	};
-};
diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.yaml b/Documentation/devicetree/bindings/mtd/gpio-control-nand.yaml
new file mode 100644
index 000000000000..5b30ee7ad4a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.yaml
@@ -0,0 +1,168 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/gpio-control-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND memory exclusively connected to GPIO lines
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  It is possible to connect a NAND flash memory without any
+  dedicated NAND controller hardware, using just general purpose
+  I/O (GPIO) pins. This will not be fast, but it will work.
+  The address and data lines of the chip will still need to be
+  connected so that the contents of a NAND page can be
+  memory-mapped and accessed after the special lines are toggled
+  by GPIO.
+
+# The GPIO controlled NAND has wires going directly to one single
+# NAND chip, so it is both a nand controller and a nand chip at
+# the same time, but it does not have things such as chip select
+# since the use is hammered down to one single chip only.
+# There is no point for the chip itself to be a subnode of the
+# controller so the raw NAND chip properties are added right into
+# the controller node like this.
+
+allOf:
+  - $ref: mtd.yaml#
+
+properties:
+  $nodename:
+    pattern: "^(nand|nand-controller)@[a-f0-9]+$"
+
+  compatible:
+    const: gpio-control-nand
+
+  reg:
+    description: |
+      This should specify the address where the NAND page currently
+      accessed gets memory-mapped, and the size of the page. Usually
+      this will be the same as the page size of the NAND.
+
+  label: true
+
+  partitions: true
+
+  nand-ecc-algo: true
+
+  nand-ecc-step-size: true
+
+  nand-ecc-strength: true
+
+  nand-use-soft-ecc-engine: true
+
+  gpio-control-nand,io-sync-reg:
+    description: |
+      A 64-bit physical address for a read location used to guard
+      against bus reordering with regards to accesses to the GPIOs and
+      the NAND flash data bus. If present, then after changing GPIO state
+      and before and after command byte writes, this register will be
+      read to ensure that the GPIO accesses have completed.
+    $ref: /schemas/types.yaml#/definitions/uint64
+
+  gpios:
+    description:
+      Legacy GPIO array for the NAND chip lines, order RDY,
+      NCE, ALE, CLE, NWP.
+    deprecated: true
+    maxItems: 5
+
+  rdy-gpios:
+    description:
+      GPIO for the NAND chip RDY line
+    maxItems: 1
+
+  ce-gpios:
+    description:
+      GPIO for the NAND chip CE chip enable line, usually
+      this is active low, so it should be tagged with the GPIO
+      flag GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  ale-gpios:
+    description:
+      GPIO for the NAND chip ALE line
+    maxItems: 1
+
+  cle-gpios:
+    description:
+      GPIO for the NAND chip CLE line
+    maxItems: 1
+
+  wp-gpios:
+    description:
+      GPIO for the NAND chip WP line, usually this is
+      active low, so it should be tagged with the GPIO
+      flag GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  bank-width:
+    description:
+      Width (in bytes) of the device.  If not present, the
+      width defaults to 1 byte. This is deprecated, use
+      nand-bus-width instead.
+    deprecated: true
+    enum: [ 1, 2 ]
+    default: 1
+
+  nand-bus-width:
+    description:
+      Bus width to the NAND chip
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16]
+    default: 8
+
+  chip-delay:
+    description:
+      chip dependent delay for transferring data from array to
+      read registers (tR). If not present then a default of 20us
+      is used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - ale-gpios
+  - cle-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    nand@20200000 {
+      compatible = "gpio-control-nand";
+      /* 512 bytes memory window at 0x20200000 */
+      reg = <0x20200000 0x200>;
+      rdy-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+      ce-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+      ale-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+      cle-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+      wp-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+
+      label = "ixp400 NAND";
+
+      nand-use-soft-ecc-engine;
+      nand-ecc-algo = "bch";
+      nand-ecc-step-size = <512>;
+      nand-ecc-strength = <4>;
+
+      partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        fs@0 {
+            label = "SysA Kernel";
+            reg = <0x0 0x400000>;
+        };
+
+        fs@400000 {
+            label = "SysA Code";
+            reg = <0x400000 0x7C00000>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index f322290ee516..e6fd82cbc35d 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^(flash|.*sram|nand)(@.*)?$"
+    pattern: "^(flash|.*sram|nand|nand-controller)(@.*)?$"
 
   label:
     description:

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
