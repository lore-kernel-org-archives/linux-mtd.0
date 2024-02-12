Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E2DC48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJZ+qQz0V74VYQf9OwI482IrpMEjuMHtE+3OFQkRtjA=; b=JGj7VwpoBM5zQV
	3HzZmGwroQ04i7IrFu2TcaY6o4WOMNqrybDx9Ej/jbiU64Bbyw2MPrsZ50mFyPS9OHPsAol/nbHND
	ZdoLczD3OtFxBAc7900XRQSmZl6XYC4JflI49AF2uPUe2wg4QydwrmyWnKbFzJ3+VWUIGGyvo+s3Z
	7V0ZDn9/XwhR/pqPmvpTUY+PooEX5vqM/BcNE8Uu/mhCFaOa9R55YJzSVZ2N4ZSLujiFo6UkFakyn
	R3SrChRZPAl5OMguwmwN46GDryMnKqDqnI8DBQjMNU8mfooeKD2vJ70Mtt/vBdzmB8dJoyBv29Wl5
	zh3HMhvFvDgnR5bl7n7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaTq-00000006Wlm-1FaT;
	Mon, 12 Feb 2024 17:52:34 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaTn-00000006WkT-1UQj
	for linux-mtd@lists.infradead.org;
	Mon, 12 Feb 2024 17:52:32 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CBmHji021006;
	Mon, 12 Feb 2024 18:52:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=RXMt+Y7BsrK1R0K7F39FqII/k6oBa+2vVyGkF3jcPCU=; b=Z7
	QnM6jf/ZYk4zN9HoMdqQLuOVr6vcKbj5XFeG+1N8RcPM8jZPhe5ALxRLWMbb1Sft
	4z/fSw3PaUxQ7UWj1DoxMoYa9IF/Pgtm0/Dk8reBO7j8GeKWgraAgepz62yaUrsv
	MHs24DpP7fQkbs1Oye/Uo0O4oWK/fbxQHJUjH03iUcLj4M88d6YRvEb3CYSteqSC
	cAVhXOjVvKeKkUIudZZ2X76y3V9QMX4+naLhYJr1TNcI05FVmLe7cCNlOYwIG1g8
	RNo9DK3wC/FGjon4WMdI0cH8/rEwxTIFUQJYOeKZ1VMnQd/JFKUXv/GlET2h6nTC
	MQfcRaP6BxBzVg0U9gIQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w62ktfjy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:52:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9C8740044;
	Mon, 12 Feb 2024 18:52:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B9C9257A8E;
	Mon, 12 Feb 2024 18:51:37 +0100 (CET)
Received: from localhost (10.201.22.200) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 12 Feb
 2024 18:51:36 +0100
From: Christophe Kerello <christophe.kerello@foss.st.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <devicetree@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>
Subject: [PATCH 12/12] mtd: rawnand: stm32_fmc2: update the driver to support revision 2
Date: Mon, 12 Feb 2024 18:48:22 +0100
Message-ID: <20240212174822.77734-13-christophe.kerello@foss.st.com>
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
X-CRM114-CacheID: sfid-20240212_095231_699501_16F4DD7F 
X-CRM114-Status: GOOD (  13.29  )
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

Add the support of the revision 2 of FMC2 IP.
For the NAND controller, the bit used to enable the IP has moved.

Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index d71ec12cd5b1..877255b0d0fc 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -54,6 +54,7 @@
 
 /* FMC2 Controller Registers */
 #define FMC2_BCR1			0x0
+#define FMC2_CFGR			0x20
 #define FMC2_PCR			0x80
 #define FMC2_SR				0x84
 #define FMC2_PMEM			0x88
@@ -83,10 +84,14 @@
 #define FMC2_BCHDSR2			0x284
 #define FMC2_BCHDSR3			0x288
 #define FMC2_BCHDSR4			0x28c
+#define FMC2_VERR			0x3f4
 
 /* Register: FMC2_BCR1 */
 #define FMC2_BCR1_FMC2EN		BIT(31)
 
+/* Register: FMC2_CFGR */
+#define FMC2_CFGR_FMC2EN		BIT(31)
+
 /* Register: FMC2_PCR */
 #define FMC2_PCR_PWAITEN		BIT(1)
 #define FMC2_PCR_PBKEN			BIT(2)
@@ -208,6 +213,10 @@
 #define FMC2_BCHDSR4_EBP7		GENMASK(12, 0)
 #define FMC2_BCHDSR4_EBP8		GENMASK(28, 16)
 
+/* Register: FMC2_VERR */
+#define FMC2_VERR_MAJREV		GENMASK(7, 4)
+#define FMC2_VERR_MAJREV_2		2
+
 enum stm32_fmc2_ecc {
 	FMC2_ECC_HAM = 1,
 	FMC2_ECC_BCH4 = 4,
@@ -1397,9 +1406,20 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
 	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
 
 	/* Enable FMC2 controller */
-	if (nfc->dev == nfc->cdev)
-		regmap_update_bits(nfc->regmap, FMC2_BCR1,
-				   FMC2_BCR1_FMC2EN, FMC2_BCR1_FMC2EN);
+	if (nfc->dev == nfc->cdev) {
+		u32 verr;
+		u8 majrev;
+
+		regmap_read(nfc->regmap, FMC2_VERR, &verr);
+		majrev = FIELD_GET(FMC2_VERR_MAJREV, verr);
+
+		if (majrev < FMC2_VERR_MAJREV_2)
+			regmap_update_bits(nfc->regmap, FMC2_BCR1,
+					   FMC2_BCR1_FMC2EN, FMC2_BCR1_FMC2EN);
+		else
+			regmap_update_bits(nfc->regmap, FMC2_CFGR,
+					   FMC2_CFGR_FMC2EN, FMC2_CFGR_FMC2EN);
+	}
 
 	regmap_write(nfc->regmap, FMC2_PCR, pcr);
 	regmap_write(nfc->regmap, FMC2_PMEM, FMC2_PMEM_DEFAULT);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
