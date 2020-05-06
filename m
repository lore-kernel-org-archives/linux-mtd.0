Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53070C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 09:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1733920714
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 09:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvrytEwX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="ojwkKvsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1733920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPkm0TATRIggL0iRzR6g/Nspvft2JW+nu6a+39BBge8=; b=RvrytEwXwAaOGM
	S3mYKHFbFndNaVFt8cAhFTd92e+gJRheaV/FkFDR2PvKwIyUw23Sq4R91jJZJj5C7XcoLkjnbOY91
	gXRxNXpQ8H+e2LYfx58QO8EbJrLGxLHy75saxp9HjKq/Tx9LqsNr8WaYFjNAj5LaqfkCEzScoJBDJ
	9NZdYo8S1MNBTOeNXpoHmv3RpQ1ZVf8tcJ6h1NQ9I6EADgt+BkGVtVMg6TI2flUCSUrFplr9dx49g
	95eoKLdWjtrZWlfuwYhpwj0Z4bFBwbnFrftLzXUHOMytVIeHxca/e+7NFh5FyZDxnG8gQHotC0pnq
	yOlzF+ch3PlYi9zeA1GA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWG7W-0008Tq-RO; Wed, 06 May 2020 09:13:38 +0000
Received: from mx07-00178001.pphosted.com ([62.209.51.94])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWG6O-0007NC-N6
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 09:12:31 +0000
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04697Gwn001991; Wed, 6 May 2020 11:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ELImG/KZ21ZmINUzXocTq1UfGpbeAi7O5VA5zgJo2H8=;
 b=ojwkKvsf9Q1wQ6QvGUbGLwdCkFmbKmajE1PoAwpYPPJa6bXPjDdeDQLPoAiUvreIMpVY
 Zqdfpku922bGodNY/Y2MW4DiO+qD5bJWAsM7147t2RlOna1WTde8dGJym3iYWsNGA3c0
 Vxpqwcyp5aku2z0s4dNoDH9+n7OadTSxjhtf4ScwjWSs+jiFtFCk/TcP+vLbkogzCyY5
 fuLmsZeQqZUkCnqK9jhx+cWFTb+laXLsp6RzFHebbWfJLbHfb0ClJjZePhvcLYlgafiA
 uJKaKFXEhmRyNt4vyTtKr0+ascFE/ruZ8PvCvOWOGscjyPLu3XGYCtevcL1mCTwP9Jfr 6A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb254yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 11:12:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 42E9B10002A;
 Wed,  6 May 2020 11:12:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32ACC2AB477;
 Wed,  6 May 2020 11:12:20 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Wed, 6 May 2020 11:12:19 +0200
From: Christophe Kerello <christophe.kerello@st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <gregkh@linuxfoundation.org>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 06/10] dt-bindings: mtd: update STM32 FMC2 NAND controller
 documentation
Date: Wed, 6 May 2020 11:11:15 +0200
Message-ID: <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-04,
 2020-05-06 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_021229_060747_75452089 
X-CRM114-Status: GOOD (  14.37  )
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
bus controller and a raw NAND controller), the register base and the
clock will be defined in the parent node. It is the reason why the
register base address and the clock are now optional.

Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
---
 .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
index b059267..68fac1a 100644
--- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
@@ -18,13 +18,15 @@ properties:
 
   reg:
     items:
-      - description: Registers
+      - description: Registers (optional)
       - description: Chip select 0 data
       - description: Chip select 0 command
       - description: Chip select 0 address space
       - description: Chip select 1 data
       - description: Chip select 1 command
       - description: Chip select 1 address space
+    minItems: 6
+    maxItems: 7
 
   interrupts:
     maxItems: 1
@@ -61,7 +63,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
 
 examples:
   - |
@@ -77,13 +78,13 @@ examples:
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
