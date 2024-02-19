Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A60BC48BF8
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTRiuckePBH56GDUuf51ff5FpRZDthLdchkls9AQhtc=; b=HabzS+0Q7zlw0h
	2LHYJxeVhWts+IP8vJ1kseJgy6z0qX7YSaQO2c2eK/iRA68QSmSqwYFd7fnQGYVCS5dLDu+aabgpc
	3WapcQCXdidpXGUozBrHxYQTFDyYePUXr+XGOmhrALCZ/sfD7S7QGThXN6tvLvbnudNDim/ovHKi1
	x+Dg/hqHwnbHotDwBTZTtKLY/r88wyKJrOmM5Dkwn1IH6x+uunDETT4kgt2aescqHy+AuwrsBMVoY
	MzX5jOnj+rS+mRBri9E+l6shAD+jSd1LI91admbq+XzJZ7mecdxcJ3dU0er4YS9MeFgaBflXYhepF
	aFB40EYsmHkrh/+z80sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4Hr-0000000AleQ-1j67;
	Mon, 19 Feb 2024 14:06:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4Ho-0000000Aldc-3RXK
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 14:06:26 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41JAMD8W022490;
	Mon, 19 Feb 2024 15:06:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=JYQK68WjD0E3OCM0k3crw9aHBw4IldV3tXIDnreP/Po=; b=ks
	UnUJneUhSgsAmai3fJMBhw3BIol6++VOXpzG58GndNnKgbwX0BKvBwBxR9aM7l/B
	gR2HfUjAH3lHFrTONnHxmdZ19kpvkVUnLLSVVJctx6UH4KNNHgyg+fooB4olLv5S
	xrpRs7Q1HBwiHbIHguwgy9O4F2rs2bkX3BMRM6BgW+VS2aaSdiRq8jb7HegtXnTB
	bLbAyA/kmI6iOgKVAf/toSmLnkESIGKZn26z2id9D5KXXr8y/Fe/97d3l4nEsBTy
	Yf4LH5f1iLz21s+44u5w9Y0LUjb9qRRT0FCFZiDs67P3fpasPsT2KWQQdXvVuij8
	LU8UaCTkW6HNHMC9P+mg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wak3m78u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 15:06:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C34B4002D;
	Mon, 19 Feb 2024 15:06:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88FD326A99A;
	Mon, 19 Feb 2024 15:05:38 +0100 (CET)
Received: from localhost (10.201.21.177) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 19 Feb
 2024 15:05:38 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH v2 1/3] dt-bindings: mtd: st,stm32: add MP25 support
Date: Mon, 19 Feb 2024 15:05:03 +0100
Message-ID: <20240219140505.85794-2-christophe.kerello@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240219140505.85794-1-christophe.kerello@foss.st.com>
References: <20240219140505.85794-1-christophe.kerello@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_10,2024-02-19_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_060625_179320_117FA41D 
X-CRM114-Status: GOOD (  10.55  )
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

Add a compatible string to support MP25 SoC.

FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
available when on MP25 SoC, the 4 chip select are available.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
Changes in v2:
 - commit message has been updated.

 .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index e72cb5bacaf0..b8ef9ba88e92 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -14,10 +14,11 @@ properties:
     enum:
       - st,stm32mp15-fmc2
       - st,stm32mp1-fmc2-nfc
+      - st,stm32mp25-fmc2-nfc
 
   reg:
     minItems: 6
-    maxItems: 7
+    maxItems: 12
 
   interrupts:
     maxItems: 1
@@ -92,6 +93,28 @@ allOf:
             - description: Chip select 1 command
             - description: Chip select 1 address space
 
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
