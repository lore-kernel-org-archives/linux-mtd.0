Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AC5C38142
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Jan 2023 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjnNweoXeWZxtnF016L64MfRCGrklxelh34xWAjU/oc=; b=bh/RYxhhvSiS4I
	0wNVTWuTH0dR5O6pKyo/3oxQjHlvjZA/mYCJgl07kAv/WBRNmht0LgMPfbg9uYIbroaXeE3S4JHBW
	9fJJ5B5hM865scO2KVeMd4yezaKp+j76ZtRpTCS9Fk4ZMSJsGmQ504qgtfIhG5wj7jRZhpXZwcgSF
	ufSHRVV+Djpgh9b9NyxI2f+3Kf5Q9jvZRrglfntnxIATWxnD1ReP25QSkX4BuJH/c8rxJzhJNtzCd
	StP+8x+tpLAzr0MZK2eH77pA+KLGhPRwIduNMryj7aikEqiBPR17kgnFb8IpkDq4fZwTfaSZj96pK
	SylI1hPiSMKM3/mPE0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL75-00Dgf1-E3; Fri, 27 Jan 2023 09:33:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLL5v-00DgE0-HG
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2023 09:32:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so4986957wma.1
        for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2023 01:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh/x/a6o8xybh22CsW0o8TRhzB/ULQ7ChTPkQyGYFLY=;
        b=vEkUCeeFxVijPNvK82jJFC9LTmsPqwtk+dBvjXd4Uh8k5flGUvoKCpFlIQ6a83//fv
         XUFUZgeukJeo5Ym50BXzUxX0SNa4r+hWeF4k+YEeAWaLFqmVmJM46tvq67CSy3/XkPQ4
         f2RqygDr5HAhVfqWhEN4DEgr399h3JkudwTzaPwQXuT9cjC7xiwZ3Iaj6FdJ8CXXpAel
         5JWMgSZ8l9GEi+MfkkxE9LmoU9ohaoPsX1mCTUKM6XIgHiFp79crA0X9GAU9GfDSjfPd
         o/3nBI6UCDMvcQiSVFm8mzVU6M/NmnFkUv+qjVSQmks/Yi99F7cjUBvDh0SI40Lzg8QS
         CnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh/x/a6o8xybh22CsW0o8TRhzB/ULQ7ChTPkQyGYFLY=;
        b=Ue8PWbGmRjT5eNVBy5nHPmCcoYc70IcFjQ6z9TDNSV2mQWavsNHezgGC+GBwUFOABM
         f/b7mSZLWmOcEgDp3pcZbGNAzd9FmyTZNkp6ZBT6qrhl1uUK4VV0RLJb2+giGFfPiK1a
         tRhw1wMD2abC85LYAZVGCyNKb2BK5UpOwdb5bybyFGp59EZYR8bZ0u1ad/J6ofTd2eBx
         2/hMOn6KtK+3UXBogjO72+YEeKHLR3x51TOo2w4j7XzFzPGMoXYwthm4uBkEKbL7b5cW
         N7nNzuDkrUQrhjJ23HD8fyQCQlamH5qmHc+c24veR1nc8VpOkpXgPMGVT7MvbJuuIBtO
         1PLw==
X-Gm-Message-State: AFqh2kpTO7PMAm/qp9ZKga8Jnjqy4ggCWTECzwNTt2bBDRBp5E1+L53o
	vweN1ifikYZLCDnuYOD2rhp3Hw==
X-Google-Smtp-Source: AMrXdXvpxcjdwmSs5t3L+OHymUyV3RYinLEzmtf3G5pKRxthZCrogWLLzZy1bSuWhU2/RY6RifADzw==
X-Received: by 2002:a05:600c:304a:b0:3d9:8635:a916 with SMTP id n10-20020a05600c304a00b003d98635a916mr40773249wmh.9.1674811945855;
        Fri, 27 Jan 2023 01:32:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:25 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: intel,ixp4xx-expansion-bus: split out peripheral properties
Date: Fri, 27 Jan 2023 10:32:15 +0100
Message-Id: <20230127093217.60818-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_013228_155621_9BA9EC44 
X-CRM114-Status: GOOD (  16.46  )
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
---
 ...intel,ixp4xx-expansion-bus-controller.yaml | 64 +--------------
 ...tel,ixp4xx-expansion-peripheral-props.yaml | 80 +++++++++++++++++++
 .../mc-peripheral-props.yaml                  |  1 +
 3 files changed, 82 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/intel,ixp4xx-expansion-peripheral-props.yaml

diff --git a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
index 5fb4e7bfa4da..a771796ec499 100644
--- a/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
+++ b/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml
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
index 000000000000..8f782c80e88b
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
+description: |
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
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
