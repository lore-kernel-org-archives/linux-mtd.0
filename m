Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C16C48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZjd/y0b/ENqWFHCkxVEi29hV2cPZLLI14SmPT4W4Ng=; b=D0pw57jpJK+xWL
	VmNIOuu7OxlUvjytvVTIXQj2X0Wcv0b/BfwbyMrjUHuUZsr8t4E5KDAKBkWL3fLjtHrhHIpIHncro
	qTar1RmAE7CY/AeYathTUitahpAJqIVexCs9aTaxxbnIzrf/tMUKNDYFdJEUTjhAJBDnsX2IZvTgp
	p4pNUt8Usfwr4yCbRRcvBr5I4PdxGg2ONzA+q2a/jQ5LqZlAAkhzdnDTLQmRHG95psS7W64muMbqq
	ZXcujrv0F0r0W6wz321Ar3ej3UOkrEJ1gwlVUN0HHIurTGEXL6q4Ebys4Q86Z1wumMWRUyS/aRI6g
	+itWBdZ+acjk0+St2UyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaSv-00000006WLV-02xS;
	Mon, 12 Feb 2024 17:51:37 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaSq-00000006WJ3-2Pzg
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:51:35 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CDLYd1017013;
	Mon, 12 Feb 2024 18:51:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=gGmqZUUYdxZJD5cJg3PaUW7eiTzp+8uxvs/xF3DyUoU=; b=hr
	cfe0jQdi0LwwQRCZSL04+9skNSXiCngGyEwok+/S0OEs+ixzIInuERxFZ6Qk5rmh
	NK1aswqaKD2xCvjhK7TLlb6lv/w+84bisVlJ5SMqaIArmb53jQ3ZgmsRdBb0TgPg
	mGpEn94QjchQg5LIMLhJwbmIxqiMhqjcu7Puk0iDC8Sw21ToTlTQy9bvsnLNgCA3
	AeM4U8n2vRv1if7B3uFVV8iSmZHh6AuNJr1GUIGm8Sb5pxURSOXSFo5u78y3ltht
	jJhneNhAlClZj7Y6cPIu+6lOmiqogZXhd8dx31MTr1JnyLBGhPOQJ6y+scF0e7Gw
	0FOdycZtXV9N4DZgjAnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62js7pwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:51:26 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E851B40045;
	Mon, 12 Feb 2024 18:51:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C6B327F266;
	Mon, 12 Feb 2024 18:50:37 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:50:37 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 08/12] dt-bindings: mtd: st,stm32: add MP25 support
Date: Mon, 12 Feb 2024 18:48:18 +0100
Message-ID: <20240212174822.77734-9-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212174822.77734-1-christophe.kerello@foss.st.com>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_15,2024-02-12_03,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_095132_984808_AC5BB967 
X-CRM114-Status: UNSURE (   8.78  )
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

Add 2 new compatible strings to support MP25 SOC.
MP25 SOC supports up to 4 chip select.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index e72cb5bacaf0..33a753c8877b 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -14,10 +14,12 @@ properties:
     enum:
       - st,stm32mp15-fmc2
       - st,stm32mp1-fmc2-nfc
+      - st,stm32mp25-fmc2
+      - st,stm32mp25-fmc2-nfc
 
   reg:
     minItems: 6
-    maxItems: 7
+    maxItems: 13
 
   interrupts:
     maxItems: 1
@@ -92,6 +94,60 @@ allOf:
             - description: Chip select 1 command
             - description: Chip select 1 address space
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,stm32mp25-fmc2
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
+            - description: Chip select 2 data
+            - description: Chip select 2 command
+            - description: Chip select 2 address space
+            - description: Chip select 3 data
+            - description: Chip select 3 command
+            - description: Chip select 3 address space
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
+            const: st,stm32mp25-fmc2-nfc
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
+            - description: Chip select 2 data
+            - description: Chip select 2 command
+            - description: Chip select 2 address space
+            - description: Chip select 3 data
+            - description: Chip select 3 command
+            - description: Chip select 3 address space
+
 required:
   - compatible
   - reg
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
