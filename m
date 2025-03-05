Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38ED9C282EC
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=my/QYXnxzTA+socDBZRMUPov16Cwfu8SEF/xk0BnI+0=; b=M7Lrn+6dORzap4
	6cUdJjDuHpqUdko5xT5knvPCFTq7AE00dSnBE6XuGQNauOUkiD30fV/hUC40/53A0aCN8ntHeHJoy
	CTh1teYWCqQtm6HpCCVDFqdSYLkYgV0K9LgtPgTQkhSb4kulKOBzGsQn96k7a5VTU92Omkxxc9a21
	cqlXUyQfpSd0Zmpe374GTBdeRpSx8U3Aucf61RgMhGk4qr95lYsckkgzMKomtanLjURT2CKAsyJro
	0iLSkrRp2NpH1gnSJvXjEjbU/kfhfWEMQ4DvvQW32ja1DqN5wGPEZ/o7UWteX22GSLEkyGN9Vh2Bf
	mUaOhc3DAMr7kKgy2YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn0N-00000007s1E-3DFQ;
	Wed, 05 Mar 2025 11:33:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplaB-00000007bRb-3tCO;
	Wed, 05 Mar 2025 10:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZdUA03Y24rGl3Mfff9gksOGDnA2StIQJya+8HaFMBNQ=; b=H28v+I2gZYhnWLzwVLPg2NANi8
	b42hrYIKDsTJ03+Erf8lfR7TZw/yJjFvpD6G+v8Nvd1Nulefrkv7K+CUI3MffXJ2lopWnmr3LcXkB
	51PBcW/gxizFykifqu62nHSblc5PjjtrVVV3T+LoBgG/NLgCYi0CXbgrRIbrtnvnmLXghEWv27oWn
	JnBL+EzXoQl2KaU6WjlHMgA7hLQME2p3fHKojaXiOTM1AnzctXmWoCx0RR54FVOESWhyXdA+IKXlB
	pkrcgiB90GcNgkuc9QymjNUk6X+du0e5ZjFJ4wqp4gyMZKIAxWL9D8uDQMjN70n5pAW+xkty+Jq1Y
	h8fDdLTw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpla7-00000005FYd-44ph;
	Wed, 05 Mar 2025 10:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741168948; x=1772704948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4JCFsrT2zb8UXbPhImj5AFIqomJ1rAKZQeo0+RoriJU=;
  b=GdjHprlbhjsxrvAgxD6Dr4XJkHf8562nBJS5zyudnIFYg+0B//t6Z1HS
   nsBBMeKEhKbbGcObxqpToFzcY4xIuXDTaSZxJx0rt5UItkjSqwaA5C6c7
   aY5m363fSxcgJTGas73X6NLg8UemPowJ5d8wRmylVXaXuJkIDQB2LbHvU
   6uz6tnGoKzxGcNVvKv29iEX//M3EuRvQGD0yFi4ABHyu95fz6hyQiBR1h
   GV3fp9OMOwUxIkyEiytpK0ivjxOC/0+DZsXl/J2lzCoI+EngNfD9qc+AY
   6at4Hd0pSz9dmdXZkwgkJIzUXTFGQxlS16oHXcdeyUJaZdklUfyGkANkM
   g==;
X-CSE-ConnectionGUID: RIEadWJlSxmIHHqHflXrKA==
X-CSE-MsgGUID: W7gZ41UASgOJJTu0KDXMpA==
X-IronPort-AV: E=Sophos;i="6.14,222,1736838000"; 
   d="scan'208";a="38444126"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Mar 2025 03:02:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 5 Mar 2025 03:02:12 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 5 Mar 2025 03:02:05 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sama5d29_curiosity: Add nvmem-layout in QSPI to describe EUI48 MAC address region
Date: Wed, 5 Mar 2025 15:31:34 +0530
Message-ID: <20250305100134.1171124-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com>
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100228_395613_7CA70327 
X-CRM114-Status: UNSURE (   8.46  )
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

Add nvmem-layout in QSPI to describe EUI48 MAC address region.
This is useful for cases where U-Boot is skipped and the Ethernet
MAC address is needed to be configured in Linux.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
index 7be215781549..81aca8502195 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
@@ -480,6 +480,16 @@ flash@0 {
 		label = "atmel_qspi1";
 		status = "okay";
 
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_address_eui48: mac-address@261 {
+				reg = <0x261 0x6>;
+			};
+		};
+
 		at91bootstrap@0 {
 			label = "at91bootstrap";
 			reg = <0x0 0x40000>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
