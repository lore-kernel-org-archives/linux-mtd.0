Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE20EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDC760E76
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BDC760E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBOz/LfljaOr5eviOiidYlHBAP9KBgcgKdFwbMPFNIY=; b=JQBrydM9huUK76
	jjAIpqb+Ifnkl8uQNqoH2hajenJwiB1bFmlvXaUS0nRDmDbaVOOMg0Bl46CfBQCB02CadHJ8bTA3h
	mghceGsuI7qjuiSz9nq7Urx9Ir34TdGs19738yQR7w2E3qhZP46ugCc2DzVfoZ8sR5M2MXEFAwSTa
	5gBqI4wxfugR/3n6+L3Ym+VYuPJVEY8KR8EbD8Tz6IypUeKmfltSKFn0TAfouBOZnWjtfbZ+xeter
	vZKIHOZ4mbRj2QXGD4Ky7CY5y12UzgJxbfGmKDzDanZZmk3Yhu9kuH1Q+lJzQh9TSWn3pFGrJ72Uk
	UyE6EeG1EZWagPkIow9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKGd-001uIs-0P; Mon, 20 Sep 2021 14:27:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKGZ-001uHq-Jg
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:27:33 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KERQTu105736;
 Mon, 20 Sep 2021 09:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632148046;
 bh=H3QGSlcSnRS77N+PEgMD1LRiROGAMlbfA1Mi9rr2mO8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=abDlo1LjVlz5imyi8VP0vX3Sg+OYEp0gQB0L9Xnpm69LX4yJMoHZTK4qF2gHj9BYT
 LmlxnLDXdFNAx9WSYaUriWF0jtGlaKvpzBlfx+WksHEk/aE9u3WSSWcfVmrcqxc7cz
 qb7PqcvVdXfDBlAp8DRKSjrhfAFshuiBA9JeTmtk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KERQbC045016
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Sep 2021 09:27:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 09:27:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 09:27:26 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KERE43100694;
 Mon, 20 Sep 2021 09:27:21 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: <michael@walle.cc>
Subject: [PATCH v2 1/2] dt-bindings: mtd: spi-nand: Convert to DT schema format
Date: Mon, 20 Sep 2021 19:57:12 +0530
Message-ID: <20210920142713.129295-2-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920142713.129295-1-a-nandan@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_072731_815833_4D4801A9 
X-CRM114-Status: GOOD (  15.48  )
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

Convert spi-nand.txt binding to YAML format with an added example.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 .../devicetree/bindings/mtd/spi-nand.txt      |  5 --
 .../devicetree/bindings/mtd/spi-nand.yaml     | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
deleted file mode 100644
index 8b51f3b6d55c..000000000000
--- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-SPI NAND flash
-
-Required properties:
-- compatible: should be "spi-nand"
-- reg: should encode the chip-select line used to access the NAND chip
diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
new file mode 100644
index 000000000000..601beba8d971
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI NAND flash
+
+maintainers:
+  - Apurva Nandan <a-nandan@ti.com>
+
+allOf:
+  - $ref: "mtd.yaml#"
+
+properties:
+  compatible:
+    const: spi-nand
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+  spi-rx-bus-width: true
+  spi-tx-bus-width: true
+  rx-sample-delay-ns: true
+
+  '#address-cells': true
+  '#size-cells': true
+
+additionalProperties:
+  type: object
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@6 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "spi-nand";
+            reg = <0x6>;
+            spi-max-frequency = <42000000>;
+
+            partitions {
+                compatible = "fixed-partitions";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "boot";
+                    reg = <0 0x200000>;
+                };
+
+                partition@200000 {
+                    label = "rootfs";
+                    reg = <0x200000 0xce0000>;
+                };
+            };
+        };
+    };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
