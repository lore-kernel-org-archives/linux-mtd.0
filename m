Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD7FC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ndJetv5+LWEXPBb+p9upRGi35EcykqCSBHIHavs2auk=; b=5AqP6U6fQsZZs2
	rwsnbw3Jtclfr75USF4ZeGxOtsY6WPoOTjbs2unAxgLBX8kdoTHbtu5jH23WbK5CT7zdPafLu34+Z
	KgNmkDMllX/1AKxzsH4ktahuKb82xd/ZxObNIRxB1j7OFgYD/R47EU3Llr0OTN/uo0/crb69j5MZ3
	PstyGm//4ssNvOEmX+YXYyFNO83Tq0dimkfQzs0+91rz35aBpu756fI2gUhY42qAdAj20Wy8a+XWn
	jXDdrxrJExrvNFCmeaxCZyd9829eHZFAcLLVnQxSskZn3GM5cthLMe0XmvtvHMeDfU1+ye+oA5xx/
	A1EQdlRMqnwYg5N4xzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKgO-002wft-1r;
	Fri, 28 Jul 2023 10:26:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKgL-002weu-1O;
	Fri, 28 Jul 2023 10:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690540010; x=1722076010;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=igHDeF92LiyJV6CYdDteCC2bRTjg8rQRg4+bhnAd1mA=;
  b=2aQ6dp3mhXjaG+/OpgWx/9TENq8VR9gDG7tN/Dh6fkOX0BJODLClIXhZ
   rYH7AUpKSDYaVNWDrMzwxKj+rfowipoUA4iCvNVDL+QwA3zhl2rfOFhLW
   Kyzfea7tlsdN08Ccq/bOrdzxMRtbQmp1K/EDdhmlt0R/BTdnl7Lo56qyE
   o8VWrnAjCwUPzASrH19ov9mMQlyVlhuVn24Xc5QBluQRkYQKGQQ4PHnc+
   Ne8rkp+F6a+e/8RRR/a4+LVwlip6gW+MLqckv5k/yOWHzK2379LatPBSz
   JRYBE9EHmgWwaKrZOnCLXefW/n6Z2ljSr56W2xhQMcCjVXGUaSw3TIsUd
   g==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="226623140"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2023 03:26:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 03:26:45 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 03:26:39 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v3 20/50] dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
Date: Fri, 28 Jul 2023 15:56:36 +0530
Message-ID: <20230728102636.266309-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_032649_475185_DBC4B41E 
X-CRM114-Status: UNSURE (   7.42  )
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

Add microchip,sam9x7-pmecc to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 50645828ac20..4598930851d9 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -56,6 +56,7 @@ Required properties:
 	"atmel,sama5d4-pmecc"
 	"atmel,sama5d2-pmecc"
 	"microchip,sam9x60-pmecc"
+	"microchip,sam9x7-pmecc", "atmel,at91sam9g45-pmecc"
 - reg: should contain 2 register ranges. The first one is pointing to the PMECC
        block, and the second one to the PMECC_ERRLOC block.
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
