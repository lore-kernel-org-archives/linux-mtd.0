Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C608BC54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ndJetv5+LWEXPBb+p9upRGi35EcykqCSBHIHavs2auk=; b=EHf/qVXp5fkJk0
	9AlCm23uM7alP/ldHJcaF78E6r5CU0i2x2RdrUZvdqy2ubFUwclf7Mhhd2xAZcGxf8WqeWGeXTd0X
	mwyDeToJNl1U3/3wy7exMOz5CesPs0xE6tT/HvIGfvlkDLTNwGyoRcJbqcMALepBg/GXGo6ghGgMH
	q7zQlud6eekoK/U6xzR1TzF3gUzOaFJLoBxBWjIqs8YkwoA6b2ebpGySFmuP0e1jzVKvmes3djmfs
	6VkuDJkpBJH1uWFikTq3qWfzqNtkemBmUvMRdAX5i1aTRk8I+OvzXgZ9EuD6aQyZImdrvnk5vH967
	stsNU7zM3TNPWI4UTPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZLm-0000000AUC0-2jIS;
	Fri, 23 Feb 2024 17:28:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZJE-0000000ATH9-0fkM;
	Fri, 23 Feb 2024 17:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708709165; x=1740245165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=igHDeF92LiyJV6CYdDteCC2bRTjg8rQRg4+bhnAd1mA=;
  b=bBhbVyAEeHxQ8Oq/ZVNyDc1kOjWHfgcOpsx6YH3IWVwiV4zrS8UGvxGx
   djp4Ghk25URVm081HNIqwKb1JUp+Io8iNWd+AhPsEeR2t6HH1TA9L/A4x
   JQf5T7UjlPTE7hC3oDFSBrLODFm/lrvR44EHLTRbjm3Gn3lbuJs/Yk5mf
   2rtcnBf/jJyCjiQJzSsqXQuOteJtd4YSm2mqsgM/t1i3KtyuvpI5koFiz
   Ehg6MF+eQ4tPujLUpAv0kD9A75eCeaJfLnVYoOtniR0KGi8SPY/1D9hVs
   sGzLW4wF82RI6vMzy5n5Da/9ZCVPntYD4h5j2SzKC8c2c+Y/vWyw3Fn4n
   g==;
X-CSE-ConnectionGUID: yqAR4j5MT/u3WWYb46nLgA==
X-CSE-MsgGUID: BwHaQGmTRgSiNQnK3eo0Rw==
X-IronPort-AV: E=Sophos;i="6.06,180,1705388400"; 
   d="scan'208";a="247481342"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2024 10:25:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:25:30 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:25:25 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v4 08/39] dt-bindings: atmel-nand: add microchip,sam9x7-pmecc
Date: Fri, 23 Feb 2024 22:55:20 +0530
Message-ID: <20240223172520.671940-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_092604_954410_E9B6B152 
X-CRM114-Status: UNSURE (   7.20  )
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
