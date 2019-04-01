Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9F1C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE2872075E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imuWrTqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE2872075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1sH00i8Un+cu7WRNElopkuycp9pma2qrVO1xAyvQas=; b=imuWrTqzo/dH6z
	ZEzZ4tAqUGIBimXpDbyOFME3UMd/S7eo43OOupJaRmlm9kECs8/hZ6hK49QzCZRtFCsGnsQ41UgJR
	kCNeMG/RY3cd4R6kTvg7nRYttYqt0H1OMf1vYuT/zX2HvSL/uVkshW7+y2ddqf0O3ZJXs3OIPXbDS
	bA23A0o52c9za/gjyVmcFY+VVmYmsNBs3+jZGq/GsHdrPVG9G6YMlqQfvLfo9ZV6SH8W9T8SJwElk
	7j1yyeLvkowg5ruMi31z8lrt2RtVMm5FOtpLDAONGLpsySNvZUYKYwsS1f923drSizlZdQj7JnB08
	wEID1GC7Zg4Yl7ZlnsPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB4G5-0001vQ-2I; Mon, 01 Apr 2019 21:14:21 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB4Fw-0001mC-6Z; Mon, 01 Apr 2019 21:14:13 +0000
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1E1BAC0006;
 Mon,  1 Apr 2019 21:14:06 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/4] ARM: dts: sunxi: Conform to DT spec for NAND controller
Date: Mon,  1 Apr 2019 23:13:55 +0200
Message-Id: <44951643435f35ab205abff6dc14f672f27eb896.1554153146.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_141412_397300_1D5232BE 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The NAND controller node name should be nand-controller and not nand as we
used previously according to the devicetree specification. Let's fix our
DTs.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun4i-a10.dtsi     | 2 +-
 arch/arm/boot/dts/sun5i.dtsi         | 2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi     | 2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index b16595a69cba..ef6ec526f394 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -267,7 +267,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@1c03000 {
+		nfc: nand-controller@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <37>;
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index f69ab288678b..8dd49016eb1e 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -189,7 +189,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@1c03000 {
+		nfc: nand-controller@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <37>;
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 28e1045853fc..794c915f504b 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -333,7 +333,7 @@
 			#dma-cells = <2>;
 		};
 
-		nfc: nand@1c03000 {
+		nfc: nand-controller@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index a0247b4b5a1e..c17bd7677ffb 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -161,7 +161,7 @@
 			#dma-cells = <1>;
 		};
 
-		nfc: nand@1c03000 {
+		nfc: nand-controller@1c03000 {
 			compatible = "allwinner,sun4i-a10-nand";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
-- 
git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
