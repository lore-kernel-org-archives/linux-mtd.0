Return-Path: <SRS0=mnyj=MK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FDAC636C9
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Jul 2021 00:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11AA61153
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Jul 2021 00:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11AA61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ryFf+uZUFACj6Vpnn7rupT300epuPfs8Lg0SVZdRqyg=; b=nVu2F87pKtnAsG
	z2uTak0lz0BqL5I3GcQFB2PU92GelkJNT5mzdJJf/ROdAUUjfJrigIlQSwnyzS7SKBch9frh5JHSt
	a41l44py1+JcCtHL6I7phPdnjSvRQW7jzk/ZocIRtZup2rM06GsoTiX3rJZRd0uppKS+1w6U4SIWp
	FogyrAmZecyf4kFpM3pbffZ0unF3859PteJJnKxqq0wHcOm4ffPc9oZk/Ushi5jT4cWfM20qzJoOV
	0ZV88fwxpwV5XL2+of2ulBFA5+hbysz5rsY6v6yzbJHpsa0++7MMk1vperUkkgCeh+NI7XtqWPLs6
	OPO18i/mC1f0GqNWRE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4usJ-007EVY-0v; Sun, 18 Jul 2021 00:41:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4usG-007EVC-G4
 for linux-mtd@lists.infradead.org; Sun, 18 Jul 2021 00:41:42 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16I0fVOg068128;
 Sat, 17 Jul 2021 19:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1626568891;
 bh=PiqmPCh8Le/+a2lKDpBMpR+4Ut+G4awxjwCJtRnmK5E=;
 h=From:To:CC:Subject:Date;
 b=K1k82Cex/RiKNWYOnJntgl++ZbNBWeZMMbxK7/u3336HMFYgpktTW4Pyltl20yGyi
 sg4hxH5RMaS1WEiN8yka1nTXNxhfCtrr1hpDQItvfjq09FpE92m9LiGJdbZ16Q0ij2
 OVwmiXCdOaZ0zxcL9raTUkAcGhlmNqpqpoQMy3b0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16I0fVl2004765
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 17 Jul 2021 19:41:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 17
 Jul 2021 19:41:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sat, 17 Jul 2021 19:41:31 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16I0fQW1038673;
 Sat, 17 Jul 2021 19:41:27 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Apurva
 Nandan <a-nandan@ti.com>
Subject: [PATCH] dt-bindings: mtd: spi-nand: Convert to DT schema format
Date: Sun, 18 Jul 2021 00:41:25 +0000
Message-ID: <20210718004125.733-1-a-nandan@ti.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_174140_724416_D7E0C421 
X-CRM114-Status: GOOD (  13.53  )
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
 .../devicetree/bindings/mtd/spi-nand.yaml     | 74 +++++++++++++++++++
 2 files changed, 74 insertions(+), 5 deletions(-)
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
index 000000000000..366b86e1b19c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
@@ -0,0 +1,74 @@
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
+    oneOf:
+      - const: spi-nand
+
+  reg:
+    items:
+      description:
+        should encode the chip-select line used to access the NAND chip
+
+  spi-max-frequency: true
+  spi-rx-bus-width: true
+  spi-tx-bus-width: true
+
+  partitions:
+    type: object
+
+  '#address-cells': true
+  '#size-cells': true
+
+patternProperties:
+  # Note: use 'partitions' node for new users
+  '^partition@':
+    type: object
+
+  "^otp(-[0-9]+)?$":
+    type: object
+
+additionalProperties: false
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
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
