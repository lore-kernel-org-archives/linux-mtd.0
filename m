Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DD4C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:24:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78B7520835
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 15:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSvOvetv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="fEgX2kv5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78B7520835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AHV/yPEfWJjw6WqXjpdF+n3gZdCn147AlJhotWpb+c=; b=CSvOvetvm53poj
	Gr8cjch4uXf4QZYjCV4GFtTuKSv/IXnEuWXI0KJPgTsuSsXUbf+K6cFrGOmFcmNXjD8l3EwPSmb2G
	CFrMjDjJ0jVQ9eYhTmeweziVKPuEVqapKIYOPb/mtg1xcAjCRQQUTsJvbDiQtEyoyBZ4FgelrWtLM
	BvHLsw228P0d9Q1G0gK+hAJ2xwG/PJGbxQDGRtkijsVrKj2uu4v0TuqCNNOKjp0r0fY2t2ALxuCaY
	QNhSFEEjSVtycBgxg3rX/sYYQ99OqkRMncnuNeJr7x1jQLF9QqzUjtFifH9TOAmZBjZb0WL+wICKK
	M77QTh5oGBRiQPdL3Z+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjlX8-0002TT-KX; Fri, 12 Jun 2020 15:23:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjlWp-00025N-0w
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 15:23:36 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05CFNR3S018151; Fri, 12 Jun 2020 17:23:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aotqVRLL0Rv78d4dsdQZWxOc139fY0Xhw2sAed8qeIA=;
 b=fEgX2kv5x7WTL9UfUpzuiap63u1jEKWgU6rK2x3nokwbFjPt9Kl/gXKGYa142iztEYJ8
 5aigDFZV9McRu3HlTYb23IAO2lEdZdCPqkLM9fUDVScSc7BpDjgIuYXhEtRxG9iBGGkm
 RbbW2oJx7vTgQTOTMrRv9mlI7v9T6ZkaTW9ve0WTFb48FPHyWaBEjB+3ctYNH1gRHBso
 sU9lkqEAQosI10Hn15USqlnTsblgAEus9fssmjVVXjyjQhdHBVHFDvbvbohUhSmMoOwL
 o1giU9uWfU0y4XOoSupKm0y1Xqj5ueDRLuBAF7iJMjfdnn2Z152/yMt5Gz2AOXHpNnpr rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31g21ggmvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 17:23:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BE9D10002A;
 Fri, 12 Jun 2020 17:23:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10C9F2B9918;
 Fri, 12 Jun 2020 17:23:28 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 12 Jun 2020 17:23:27 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <arnd@linaro.org>,
 <alexandre.torgue@st.com>
Subject: [PATCH v5 2/6] dt-bindings: mtd: update STM32 FMC2 NAND controller
 documentation
Date: Fri, 12 Jun 2020 17:22:38 +0200
Message-ID: <1591975362-22009-3-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-12_11:2020-06-12,
 2020-06-12 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_082335_360102_2F118A14 
X-CRM114-Status: GOOD (  13.67  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, devicetree@vger.kernel.org,
 Christophe Kerello <christophe.kerello@st.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

These bindings can be used on SOCs where the FMC2 NAND controller is
in standalone. In case that the FMC2 embeds 2 controllers (an external
bus controller and a raw NAND controller), the register base address,
the clock and the reset will be defined in the parent node.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
Changes in v4:
 - add new NFC compatible string to handle reg number of entries.

 .../bindings/mtd/st,stm32-fmc2-nand.yaml           | 83 +++++++++++++++-------
 1 file changed, 57 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index b059267..6ae7de1 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -9,32 +9,19 @@ title: STMicroelectronics Flexible Memory Controller 2 (FMC2) Bindings
 maintainers:
   - Christophe Kerello <christophe.kerello@st.com>
 
-allOf:
-  - $ref: "nand-controller.yaml#"
-
 properties:
   compatible:
-    const: st,stm32mp15-fmc2
+    enum:
+      - st,stm32mp15-fmc2
+      - st,stm32mp1-fmc2-nfc
 
   reg:
-    items:
-      - description: Registers
-      - description: Chip select 0 data
-      - description: Chip select 0 command
-      - description: Chip select 0 address space
-      - description: Chip select 1 data
-      - description: Chip select 1 command
-      - description: Chip select 1 address space
+    minItems: 6
+    maxItems: 7
 
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
-
-  resets:
-    maxItems: 1
-
   dmas:
     items:
       - description: tx DMA channel
@@ -57,11 +44,55 @@ patternProperties:
       nand-ecc-strength:
         enum: [1, 4 ,8 ]
 
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp15-fmc2
+    then:
+      properties:
+        reg:
+          items:
+            - description: Registers
+            - description: Chip select 0 data
+            - description: Chip select 0 command
+            - description: Chip select 0 address space
+            - description: Chip select 1 data
+            - description: Chip select 1 command
+            - description: Chip select 1 address space
+
+        clocks:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp1-fmc2-nfc
+    then:
+      properties:
+        reg:
+          items:
+            - description: Chip select 0 data
+            - description: Chip select 0 command
+            - description: Chip select 0 address space
+            - description: Chip select 1 data
+            - description: Chip select 1 command
+            - description: Chip select 1 address space
+
 required:
   - compatible
   - reg
   - interrupts
-  - clocks
 
 examples:
   - |
@@ -77,13 +108,13 @@ examples:
             <0x81000000 0x1000>,
             <0x89010000 0x1000>,
             <0x89020000 0x1000>;
-            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
-            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
-                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
-                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
-            dma-names = "tx", "rx", "ecc";
-            clocks = <&rcc FMC_K>;
-            resets = <&rcc FMC_R>;
+      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
+             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
+             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
+      dma-names = "tx", "rx", "ecc";
+      clocks = <&rcc FMC_K>;
+      resets = <&rcc FMC_R>;
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
