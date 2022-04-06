Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3I93eJH2qiVa9Zl3J1yZUEdIEicJ9r9LZyp6keQ4I2I=; b=BTzbfGlgNw8It2
	iBn7R2tKsmi5GHeCFhxUc9nZ4buDDGrrqrpgGMgwFQ5BW71EzIYQ8dApOWbFRXaQofZ+UnQGfNhH2
	xMBcj4ph0gVIfdgPWxzmeJfHiNzUODTGkxwmzpnT8WGticYgDqRh9qiB+9vY7AuvDa/g4LijAbg4p
	+JBbq8HWJYdbnj5OB4lbV/ombQINFmTh3QGaJH0ds/lcllQ5t8z72VtSsdmjbeSeUfExzO+I2aV4C
	WqMFZrK09TB+1rDvDdh1CYLbeQ6IgeHj0jR4Xx4mqIMslSEtRjXEZjKcxu7RAvI6VtEhTCgRB3B7F
	1H4VL5/EV68N8GGZn2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncBoq-007med-9w; Wed, 06 Apr 2022 19:59:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncBon-007mdl-IY
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 19:59:55 +0000
Received: by mail-lf1-x12b.google.com with SMTP id f16so1139233lfe.11
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2022 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UsV1ITimuhURq05XOE0qRsHZpUCDSsJJ67E/Znzm550=;
 b=ldznlsYntX697YHfppKvxltReRjb4PF626sqTcBzNAv2c3S+3/FUwRaU6EAZT/k6th
 Fu3pQ/khq3bN/fPm4/3V3Q2emn1AFsvSvrJ/kjHs8sfbo+HbHIq7/aM8iLvYCQ0S3PXm
 fA8FmfSCMT48DbnVYIfPfKtR1TSxartPcZrxnUTUdMh54EN9B1uPY0xm93jympGQZjaB
 4/CPIJ2lcWXMy3QFlp3Rw2MtkqR1xKdB8FRlwfR1rmgk3xh26pcjNNH2Uu54y+FUKIkv
 UjXspNdE8G7Yan4NF0zeLJaW182lbhJrqDdjFDU2K4z7co74R/rXYmfLkbKtCif9I3fv
 tbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsV1ITimuhURq05XOE0qRsHZpUCDSsJJ67E/Znzm550=;
 b=NkmM71K4xpL/UXRbI2PSWb9pv5TnS8AgbCNl0P++bOEs2ycpMiCDLozyCM73PCyGfn
 ka0lvXJCkwoGIacc/q3hZg+/+fzaxf0ZJYYYJtJ31tfUL/YfQoByGT4/83jUM+T4nc3S
 zJaDqQXPnHmHjwMCvIlBxnaW1cLF4J25k0BvIpJ2iyeiXA0muCkpBqEnDlHhe7B82i8L
 bnTbN2/rLU4Pllx8h+xjMXUGRlKY69AhY8FpjIY4DkaofYJk1NNHi5C71QvK9Mois0rG
 u626BWNk0xd/ieczI4tWpdxeY4/UhbqeoDn8eLnDhgyE5XFNgDOPXj0zKhMEKwHL6MpJ
 BpdQ==
X-Gm-Message-State: AOAM532DPU8Ov5B27vn7KdLNRzCOonS9y6M9nkr55EKgeEd/lUeplP8L
 wbWH49FA44ceFCwnFOefnonT8krfnKAVdrTtH24=
X-Google-Smtp-Source: ABdhPJyvqgx4F/WKNa5aYwdfb36cRFg+7qpkiAIyoClFgG90ziZXADFI6QbV/PFH3Ao9GtmEc90L8w==
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id
 z3-20020a0565120c0300b0044779127e6bmr7163436lfu.508.1649275190202; 
 Wed, 06 Apr 2022 12:59:50 -0700 (PDT)
Received: from vmu1804.lan ([2a09:bac0:87::815:6e3d])
 by smtp.googlemail.com with ESMTPSA id
 q4-20020a2eb4a4000000b0024985ed51cdsm1772295ljm.114.2022.04.06.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 12:59:49 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Date: Wed,  6 Apr 2022 19:59:46 +0000
Message-Id: <20220406195946.2019-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406195557.1956-1-csharper2005@gmail.com>
References: <20220406195557.1956-1-csharper2005@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_125953_648671_708431AE 
X-CRM114-Status: GOOD (  13.57  )
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

Add YAML binding for Sercomm partition parser.

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
---
 .../mtd/partitions/sercomm,sc-partitions.yaml | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml
new file mode 100644
index 000000000000..07ea5596200c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/sercomm,sc-partitions.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/sercomm,sc-partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sercomm Partitions
+
+description: |
+  Sercomm is one of hardware manufacturers providing SoCs used in home routers.
+  The Sercomm partition map table contains information about non-standard
+  partition offsets and sizes (depending on the bad blocks presence and their
+  locations). Partition map is used by many Sercomm-based Ralink devices
+  (e.g. Beeline, Netgear).
+
+maintainers:
+  - Mikhail Zhilkin <csharper2005@gmail.com>
+
+properties:
+  compatible:
+    const: sercomm,sc-partitions
+
+  scpart-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Partition id in Sercomm partition map
+
+required:
+  - compatible
+  - scpart-id
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions
+        compatible = "sercomm,sc-partitions", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "u-boot";
+            reg = <0x0 0x100000>;
+            scpart-id = <0>;
+            read-only;
+        };
+
+        partition@100000 {
+            label = "dynamic partition map";
+            reg = <0x100000 0x100000>;
+            scpart-id = <1>;
+        };
+
+        factory: partition@200000 {
+            label = "Factory";
+            reg = <0x200000 0x100000>;
+            scpart-id = <2>;
+            read-only;
+
+            compatible = "nvmem-cells";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            macaddr_factory_21000: macaddr@21000 {
+                reg = <0x21000 0x6>;
+            };
+        };
+
+        /* ... */
+
+    };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
