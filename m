Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A395C369CB
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MlXrFLTRkDEyv03L/cq0X/82li9MPEbxUeBeJMFumY=; b=HuVnp/OhEN+Wcy
	9cCYmu5gCy5z748fSXHCp0Fs6DPXhurJRbgEX5gVnpr4NRB3GJtusgxMDyIzsiNX0+7JHA3jkaWMW
	fni876qyk0jWA02oZKc3DNeYP757+/1CSDcdU718VUbc02lf1zvQYv8SOK7yAwBf2MVRwpuPTGTj6
	n+w392RTyu8pJa+bmSLvn8nFM9w5HEcIGKIJLYIDfQ6kxrNSjVyPhGf/A1aE87c36WmlHEeSs3+r6
	bDabQ22wKnBZUmSKMPboe8JXIX9boFT5jsPFPZItQTOJIBNHZ1Gknf7t+QrbV5IcVka/G2WU2RwA3
	gckkAkv10TZCfrLH21rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP3E-00000004iso-1OZG;
	Wed, 25 Sep 2024 10:15:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP3B-00000004irS-08ae
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 10:15:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so61130935e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 03:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727259311; x=1727864111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0yqjz/vLAoslnLJDGa7eN7K2Pvc9Kf7CmkO2W3efDk=;
        b=J7yHKGUhNdfE/hLDx9wcfQ6B3aM37X/Y5DBq9HeW2NQo75PQrxcUEidlTQmyGpSPOE
         Ww2tZKbKPyueLGh+MKpoF5P0mb0k3Gr78BYNBdqKgPlZ4qxKXIhbPBqseiY/pRMX6v+n
         GmCrQzmdb5wIa9uKMiAMwqyrk4barj8wYddwyqjoTAx0iuPHcXLlBRcui0Ds6fkIKyOD
         lrKJqGo88z9FrBTbrA+KjQY48o912b+49NLUrVO1qNDG2TSXrhsOLC2NsmEEjNlNofaH
         mvdsHWJxYcWceCc2UhagogObghCVSzq0nw2J5ghAkZX9jwKdOx9xqHZcDc3+Hgvhyaqa
         EO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259311; x=1727864111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0yqjz/vLAoslnLJDGa7eN7K2Pvc9Kf7CmkO2W3efDk=;
        b=Az2i52qKAJo0sCCwqlEb68WBvFvtUd2pWKhkuQ9bAnKVZibNrUp258n85gOIsedmWE
         fnwb8fW7+nxt9mxq+vx9Ry3Ab0lzVHka+Js+lF6qrILukU6zAiWOzOioPUn+nDLg21Wh
         OnYoCK5zJeLprraCwkyF+I9ildZi9CfCUPEL6dpxSINE7V/9OyRqkR0nfqYOwin8bEg7
         ny9SMHtDeZ9SHrIyOqBoAJofOeBfhwca8VZjsdB0lm6oH9gztUXeq6agH2nNYcTxE09B
         Y6iNq13HA5nrzIODRScqesTRB8DjYjN4CkdsOzLC2Csy7Mhdl9RN/Ek56USCZHyGCtfW
         P63w==
X-Forwarded-Encrypted: i=1; AJvYcCVLoHUprN/0sQjiqzsTD/8dIAUt4mxIMZptNHbBGxHZZnBLaP4/E6WurVEUP7TeFXUw5+uEb3wPwEA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsCn66aeMsikdYGcK/eWkIcuzx0P3ZB/cxt08kxOWHt2qYDpP3
	5QlWIPb/kRWyA6wLYTmLobvjVqz4BuDAqUzaVbsWCxtDKhoCECX8
X-Google-Smtp-Source: AGHT+IGGrksQqujrE8tWrONIU2RpDc8dp9sRezir+8ahhKdtMo+RszPM/Z6hhXo38BC01/GaWh/h6Q==
X-Received: by 2002:a05:600c:4689:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-42e9610d52fmr15491985e9.12.1727259311130;
        Wed, 25 Sep 2024 03:15:11 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cbc1560a7sm3628194f8f.0.2024.09.25.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:15:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	upstream@airoha.com
Subject: [PATCH 2/3] dt-bindings: mtd: Add Documentation for Airoha fixed-partitions
Date: Wed, 25 Sep 2024 12:13:58 +0200
Message-ID: <20240925101422.8373-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925101422.8373-1-ansuelsmth@gmail.com>
References: <20240925101422.8373-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031513_097455_C1740F2C 
X-CRM114-Status: GOOD (  18.47  )
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

Add Documentation for Airoha fixed-partitions compatibles.

Airoha based SoC declare a dedicated partition at the end of the flash to
store calibration and device specific data, in addition to fixed
partitions.

The offset of this special partition is not well defined as a custom bad
block management driver is used that reserve space at the end of the flash.

This binding allows defining all fixed partitions and marking the last one
to detect the correct offset.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../partitions/airoha,fixed-partitions.yaml   | 80 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
new file mode 100644
index 000000000000..a45df51065af
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/airoha,fixed-partitions.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/airoha,fixed-partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha SoC partitioning
+
+description: |
+  Airoha based SoC declare a dedicated partition at the end of the flash to
+  store calibration and device specific data, in addition to fixed partitions.
+
+  The offset of this special partition is not well defined as a custom bad block
+  management driver is used that reserve space at the end of the flash.
+
+  This binding allows defining all fixed partitions and marking the last one to
+  detect the correct offset from the new end of the flash.
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+select: false
+
+properties:
+  compatible:
+    const: airoha,fixed-partitions
+
+  "#address-cells":
+    enum: [ 1, 2 ]
+
+  "#size-cells":
+    enum: [ 1, 2 ]
+
+patternProperties:
+  "^partition@[0-9a-f]+$":
+    $ref: partition.yaml#
+    properties:
+      compatible:
+        const: airoha,dynamic-art
+    unevaluatedProperties: false
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "airoha,fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+          label = "bootloader";
+          reg = <0x00000000 0x00080000>;
+        };
+
+        partition@80000 {
+          label = "tclinux";
+          reg = <0x00080000 0x02800000>;
+        };
+
+        partition@2880000 {
+          label = "tclinux_slave";
+          reg = <0x02880000 0x02800000>;
+        };
+
+        partition@5080000 {
+          label = "rootfs_data";
+          reg = <0x5080000 0x00800000>;
+        };
+
+        partition@ffffffff {
+          compatible = "airoha,dynamic-art";
+          label = "art";
+          reg = <0xffffffff 0x00300000>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747b..ec254e03adf0 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -14,6 +14,7 @@ maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
 oneOf:
+  - $ref: airoha,fixed-partitions.yaml
   - $ref: arm,arm-firmware-suite.yaml
   - $ref: brcm,bcm4908-partitions.yaml
   - $ref: brcm,bcm947xx-cfe-partitions.yaml
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
