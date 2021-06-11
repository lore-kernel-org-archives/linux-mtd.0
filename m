Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04657C4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD0496008E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD0496008E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjcNuTbIkSlgA3yfHg0+UcFDpYrtcRJwa0x9l1a3YSA=; b=bt1NdLOyD1DHLr
	oBCSMMnYuqlD//UuIbMTRDjYWm5dAZ5BMYGa/dxcFdWX+wwV5Nd6h+yhZaZb5ClzprS7kut/Zmv63
	ZNB5U19kdAm6fBn8XbOE3kFSl1DghCoOX0kLC9pO2UJd1S3V/i0pr387j4oGrAeVbhuMOVAPovIgo
	u4iIRi5RnlHcBvp/dzRo3pXg3mysiPzooSTRc8aAmgrKwweDorKUeFXbLKyMV9L9YHkjjpeTykh+a
	Tu5b6REASadB+jM88E4tbyP+VjNjN9BIdHLFfg8V9nv/CV2LbwSLJDir+97Rr12GUaQ/Qj6VK5PMi
	Jj3+6KR30HM9aIDvwf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrZqf-003ep6-R5; Fri, 11 Jun 2021 05:36:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrZpe-003edP-5z; Fri, 11 Jun 2021 05:35:51 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B5ZlUY016598;
 Fri, 11 Jun 2021 00:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623389747;
 bh=NXuVIY1Kl8L78ZqAhGsA8T32PIX084zq9t7ePZhWDtM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=cWZ3I4IGE4aTBbwQMZ+9deFYbIE0SK6+8WRMwAAwDKcGL3O6TwyC3rFWAEorhEzZM
 DAHyP5PWoWzmGhz1aB0tNioTQ98F/QX6RR8BNnkYe++pg9raNxCaNywdgx2gNFBo1X
 EGeCXKyBEmysAD7T7waFGKLQauSxwXoukPDnzMeU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B5ZlmV033116
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 00:35:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 00:35:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 00:35:46 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B5ZbTM088083;
 Fri, 11 Jun 2021 00:35:44 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, Linux ARM
 Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] dt-bindings: mtd: Convert ti,
 am654-hbmc.txt to YAML schema
Date: Fri, 11 Jun 2021 11:05:33 +0530
Message-ID: <20210611053533.16701-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611053533.16701-1-vigneshr@ti.com>
References: <20210611053533.16701-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_223550_341753_C79E3C78 
X-CRM114-Status: GOOD (  15.69  )
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

Convert ti,am654-hbmc.txt to YAML schema for better checks and
validations of DT.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 51 --------------
 .../bindings/mtd/ti,am654-hbmc.yaml           | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
deleted file mode 100644
index ccfd37b8a0ad..000000000000
--- a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
-
-Required properties:
-- compatible : "ti,am654-hbmc" for AM654 SoC
-- reg : Two entries:
-	First entry pointed to the register space of HBMC controller
-	Second entry pointing to the memory map region dedicated for
-	MMIO access to attached flash devices
-- ranges : Address translation from offset within CS to allocated MMIO
-	   space in SoC
-
-Optional properties:
-- mux-controls : phandle to the multiplexer that controls selection of
-		 HBMC vs OSPI inside Flash SubSystem (FSS). Default is OSPI,
-		 if property is absent.
-		 See Documentation/devicetree/bindings/mux/reg-mux.yaml
-		 for mmio-mux binding details
-
-Example:
-
-	system-controller@47000000 {
-		compatible = "syscon", "simple-mfd";
-		reg = <0x0 0x47000000 0x0 0x100>;
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		hbmc_mux: multiplexer {
-			compatible = "mmio-mux";
-			#mux-control-cells = <1>;
-			mux-reg-masks = <0x4 0x2>; /* 0: reg 0x4, bit 1 */
-		};
-	};
-
-	hbmc: hyperbus@47034000 {
-		compatible = "ti,am654-hbmc";
-		reg = <0x0 0x47034000 0x0 0x100>,
-			<0x5 0x00000000 0x1 0x0000000>;
-		power-domains = <&k3_pds 55>;
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
-			 <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
-		mux-controls = <&hbmc_mux 0>;
-
-		/* Slave flash node */
-		flash@0,0 {
-			compatible = "cypress,hyperflash", "cfi-flash";
-			reg = <0x0 0x0 0x4000000>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
new file mode 100644
index 000000000000..30b458c41cac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ti,am654-hbmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+properties:
+  compatible:
+    const: ti,am654-hbmc
+
+  reg:
+    maxItems: 2
+
+  power-domains: true
+  '#address-cells': true
+  '#size-cells': true
+  ranges: true
+
+  mux-controls:
+    description: MMIO mux controller node to select b/w OSPI and HBMC.
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  "^flash@[0-1],[0-9a-f]+$":
+    type: object
+
+required:
+  - compatible
+  - reg
+  - ranges
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      hbmc: memory-controller@47034000 {
+        compatible = "ti,am654-hbmc";
+        reg = <0x0 0x47034000 0x0 0x100>,
+              <0x5 0x00000000 0x1 0x0000000>;
+        ranges = <0x0 0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
+                 <0x1 0x0 0x5 0x04000000 0x4000000>; /* CS1 - 64MB */
+        clocks = <&k3_clks 102 0>;
+        #address-cells = <2>;
+        #size-cells = <1>;
+        power-domains = <&k3_pds 55>;
+        mux-controls = <&hbmc_mux 0>;
+
+        flash@0,0 {
+            compatible = "cypress,hyperflash", "cfi-flash";
+            reg = <0x0 0x0 0x4000000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+        };
+      };
+    };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
