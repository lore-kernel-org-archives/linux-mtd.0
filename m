Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BB0C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxBJjJnKqnxr7fNODFJGCn5c18sa8hNcUd5zVJwxe5Q=; b=u1MOAGqGz65gkM
	nOB9cjA27r49tdya66SS2W1i7UUKSZ9dLtkQZavUtawHOscufL4y6L/u+pAgo3kqM5qYzXzlfvybX
	I+JDAqLWSOBOZaZIKPqOCzLVTEw+SwwCZAmhV3b6T/rdGgScGFkYkfljD8mN0nqUbFLDX3Wb9eVOj
	0Yhyj44NNine0jq5p0rTqY/VoDGEgINua858/RQL0rz0y1NA8Yr8bACovKTcO/pAB+cHvZsN7JWP4
	LCoHmN5Gl998289sYtDHmQ2pxwssMW9Pt1RzfX5SIzkWmEiLEOLEIfWiiTSHI8zRO9YhyJR/6HOBB
	iXGg/ZHhGdDCRUrKv3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxlv-007rWw-Ay; Mon, 06 Feb 2023 09:26:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxlk-007rSm-7Y
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 09:26:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso8209890wms.4
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 01:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwrZtPOcXUePKQIBaI60m+u6D/nvaW+ae+HRsQFPGDc=;
        b=eIUU0LI7ktFTU5A1zQgrGm6wNBDmWkmdDbbGO+Zi5ISprnBjgRRN4rThN/4nLP4GXO
         JlKRER49ThuXpdMsl6CQrcXYE7qjvvBZKfLwZ/q8hkw+gNaOakr5hOGaMJy/3orDgy1x
         8sGLbSoF9/fk6xzNZv77iK3PksgJshFYdWLzuuC4DCwa9lCrEBPiNIt8ADZtO2nQp5hS
         kvK3kIGJj9fRtnMCS0wCwn0DVOp91AQfzjaYnZNfp8+G7qPQyXPv6xTTQGRB/uZ6nzLu
         uSfP8uXqJXAP6EmOgDCkRCZFggnZaQsEWKbyDU9ryle9mJ1vfu9zhRv7csdgf1+Y7R4x
         V/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwrZtPOcXUePKQIBaI60m+u6D/nvaW+ae+HRsQFPGDc=;
        b=PGIhKk7Ule9uvjZqJ4/BYYE/6Wng37dBTS8FE9Ns7+ZFqSNC/CAXgYAp3KK/kkF84D
         x8tAaXak1HbMGFPjsyyAnF6UCf0j/kFIz2R5eN9YU3wyjKtuiyeNaJ+xSzpXE7SfZqjr
         YCrbP8kjbJ6A2GL+18aVnStvMU0SU8E63jA9aUMb4Ot/bICQV3f5mvrEYEq3KDC4S2SC
         yse+GuAyFHb5IpN8ke5iV+iBzJhfRXYbZLZiV82EzUFd5+OU2hQrMb9StMJq7j7LqZDF
         TxId5IYXAbFQTigENaPmhTsxo/79XXzhAKdSG6NCQC9s5ml916/EtsjbnUysq+SS3EUD
         va0A==
X-Gm-Message-State: AO0yUKVHRk3j1d1yo4l7GIGQ4eS44NRmhptuQEaNX4auROrVbgpa8yxI
	Ear6UfK985PXvAuZUqTIlWh0Fw==
X-Google-Smtp-Source: AK7set/TBTfXKMY9HudNM1nsvxhJx87hTXejVJ+fShCAzLUu8zqLXXMZS2L/6rR1WRbllDYi+lw/vA==
X-Received: by 2002:a05:600c:b88:b0:3df:9858:c033 with SMTP id fl8-20020a05600c0b8800b003df9858c033mr10544565wmb.8.1675675592277;
        Mon, 06 Feb 2023 01:26:32 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bcb85000000b003de8a1b06c0sm15722568wmi.7.2023.02.06.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 01:26:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split out peripheral properties
Date: Mon,  6 Feb 2023 10:26:22 +0100
Message-Id: <20230206092624.22922-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
References: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_012636_303092_0FEDEB72 
X-CRM114-Status: GOOD (  17.56  )
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

The properties of devices in IXP4xx expansion bus need to be also
applied to actual devices' bindings.  Prepare for this by splitting them
to separate intel,ixp4xx-expansion-peripheral-props binding, just like
other memory-controller peripheral properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---

Changes since v2:
1. Add tags.
2. Move intel,ixp4xx-expansion-bus-controller.yaml to memory-controllers (Rob).
3. Drop | in intel,ixp4xx-expansion-peripheral-props.yaml (Rob).
---
 ...intel,ixp4xx-expansion-bus-controller.yaml | 66 +--------------
 ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
 .../mc-peripheral-props.yaml                  |  1 +
 MAINTAINERS                                   |  2 +-
 4 files changed, 84 insertions(+), 65 deletions(-)
 rename Documentation/devicetree/bindings/{bus => memory-controllers}/intel,ixp4xx-expansion-bus-controller.yaml (57%)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml

diff --git a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-bus-controller.yaml
similarity index 57%
rename from Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
rename to Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-bus-controller.yaml
index 5fb4e7bfa4da..188db821dff3 100644
--- a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-bus-controller.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/bus/intel,ixp4xx-expansion-bus-controller.yaml#
+$id: http://devicetree.org/schemas/memory-controllers/intel,ixp4xx-expansion-bus-controller.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Intel IXP4xx Expansion Bus Controller
@@ -56,69 +56,7 @@ patternProperties:
     description: Devices attached to chip selects are represented as
       subnodes.
     type: object
-
-    properties:
-      intel,ixp4xx-eb-t1:
-        description: Address timing, extend address phase with n cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 3
-
-      intel,ixp4xx-eb-t2:
-        description: Setup chip select timing, extend setup phase with n cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 3
-
-      intel,ixp4xx-eb-t3:
-        description: Strobe timing, extend strobe phase with n cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 15
-
-      intel,ixp4xx-eb-t4:
-        description: Hold timing, extend hold phase with n cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 3
-
-      intel,ixp4xx-eb-t5:
-        description: Recovery timing, extend recovery phase with n cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        maximum: 15
-
-      intel,ixp4xx-eb-cycle-type:
-        description: The type of cycles to use on the expansion bus for this
-          chip select. 0 = Intel cycles, 1 = Motorola cycles, 2 = HPI cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1, 2]
-
-      intel,ixp4xx-eb-byte-access-on-halfword:
-        description: Allow byte read access on half word devices.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-
-      intel,ixp4xx-eb-hpi-hrdy-pol-high:
-        description: Set HPI HRDY polarity to active high when using HPI.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-
-      intel,ixp4xx-eb-mux-address-and-data:
-        description: Multiplex address and data on the data bus.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-
-      intel,ixp4xx-eb-ahb-split-transfers:
-        description: Enable AHB split transfers.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-
-      intel,ixp4xx-eb-write-enable:
-        description: Enable write cycles.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
-
-      intel,ixp4xx-eb-byte-access:
-        description: Expansion bus uses only 8 bits. The default is to use
-          16 bits.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        enum: [0, 1]
+    $ref: /schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
new file mode 100644
index 000000000000..d1479a7b9c8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Peripheral properties for Intel IXP4xx Expansion Bus
+
+description:
+  The IXP4xx expansion bus controller handles access to devices on the
+  memory-mapped expansion bus on the Intel IXP4xx family of system on chips,
+  including IXP42x, IXP43x, IXP45x and IXP46x.
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  intel,ixp4xx-eb-t1:
+    description: Address timing, extend address phase with n cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 3
+
+  intel,ixp4xx-eb-t2:
+    description: Setup chip select timing, extend setup phase with n cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 3
+
+  intel,ixp4xx-eb-t3:
+    description: Strobe timing, extend strobe phase with n cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+
+  intel,ixp4xx-eb-t4:
+    description: Hold timing, extend hold phase with n cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 3
+
+  intel,ixp4xx-eb-t5:
+    description: Recovery timing, extend recovery phase with n cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+
+  intel,ixp4xx-eb-cycle-type:
+    description: The type of cycles to use on the expansion bus for this
+      chip select. 0 = Intel cycles, 1 = Motorola cycles, 2 = HPI cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+
+  intel,ixp4xx-eb-byte-access-on-halfword:
+    description: Allow byte read access on half word devices.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  intel,ixp4xx-eb-hpi-hrdy-pol-high:
+    description: Set HPI HRDY polarity to active high when using HPI.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  intel,ixp4xx-eb-mux-address-and-data:
+    description: Multiplex address and data on the data bus.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  intel,ixp4xx-eb-ahb-split-transfers:
+    description: Enable AHB split transfers.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  intel,ixp4xx-eb-write-enable:
+    description: Enable write cycles.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  intel,ixp4xx-eb-byte-access:
+    description: Expansion bus uses only 8 bits. The default is to use
+      16 bits.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
index 53ae995462db..5acfcad12bb7 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mc-peripheral-props.yaml
@@ -34,5 +34,6 @@ required:
 # The controller specific properties go here.
 allOf:
   - $ref: st,stm32-fmc2-ebi-props.yaml#
+  - $ref: intel,ixp4xx-expansion-peripheral-props.yaml#
 
 additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 91962b1f5901..bf643624c70d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2261,7 +2261,7 @@ M:	Krzysztof Halasa <khalasa@piap.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
-F:	Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
+F:	Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion*
 F:	Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
 F:	Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
