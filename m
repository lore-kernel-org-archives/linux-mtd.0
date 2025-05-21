Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB0C2D0CD
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 07:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQOgkkWi1Qcmt4IvWuWLO2NfSLQx0RmlpUwk3ynkoqA=; b=pMhJhkEJLPSINk
	MYVR7Qp3eRfx7yIj3bVzJDP0y7xdKkACtX/nsXerpovyoUIQy2792czQietCDSieAWQlueKAJYsIF
	Sp4jTbNrwYeMnz9m2iFXaCw4ak/V563Qw1/bGWQCfj6V/qTsK6l7OdYaid/hjPUBQFek0cnn3hxao
	ocJ7uV48FBRd/lV7s2YxZWCR9mREd3n2L1rp/RJJvvyvXcWQVavsu1ogiCc+es7p6P7P8kt8t3DHj
	cEYMXBjbuGKRklZkwl2VB6n/SRTUxIcVktWIRYXk89IUMFVZemrjc40DszUPa1NmCy0izHpwyHlSH
	eRmG/fbkc9EPetbpig1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdcS-0000000F1l0-2oAl;
	Wed, 21 May 2025 07:12:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdV4-0000000F0Zz-1HXQ;
	Wed, 21 May 2025 07:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747811066; x=1779347066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iv5T9qJGjAuYhEOrek8F9qUC06vafgVKFIQs02HNtUo=;
  b=QPyx7VN9Xy7cFRtdFrmsyRhGI4T+icExhsjl10frJUZDxFOu9LgfqEfV
   5gF4hjVUrUJt54BRc/W+23WHt/po3R6C1M/ZT7i5cjNzvRW2ucHT+HKmE
   T0HnDxviTzbviDjn36toNH/2ytcj9JLnMRwHnAtIyeJlF5RyqJGUbCiuf
   TmnfI0xb5kZuapKAQYdwGQVNMJDiljANXYFi3C5Dh7RyhLvKpR4lKiplw
   Kp66ZYOlVQWRTPJcxK9lc0GNsR1sW+y/t6QLDC8WNdDIzJtPO7actWJ8R
   OBW0I8Thzd6CvdxHAZTodMzIN8OR5dF5utikCTaGvjsQkQwDt4vuCeUMm
   Q==;
X-CSE-ConnectionGUID: FbsnMwfxQ/m/aHhgRKMOWQ==
X-CSE-MsgGUID: ZgkLjbi9R16/ingWuhQZ9g==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="41888230"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2025 00:04:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 21 May 2025 00:04:16 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 21 May 2025 00:04:09 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add nvmem-layout in QSPI for EUI48 MAC Address
Date: Wed, 21 May 2025 12:33:36 +0530
Message-ID: <20250521070336.402202-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521070336.402202-1-manikandan.m@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000426_345374_F0F25DD7 
X-CRM114-Status: GOOD (  13.50  )
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

Add nvmem-layout in QSPI to read the EUI48 Mac address by the
net drivers using the nvmem property.The offset is set to 0x0
since the factory programmed address is available in the
resource managed space and the size determine if the requested
address is of EUI48 (0x6) or EUI-64 (0x8) type.
This is useful for cases where U-Boot is skipped and the Ethernet
MAC address is needed to be configured by the kernel

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index b34c5072425a..be06df1b7d66 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -210,6 +210,9 @@ &macb0 {
 	#size-cells = <0>;
 	phy-mode = "rmii";
 
+	nvmem-cells = <&mac_address_eui48>;
+	nvmem-cell-names = "mac-address";
+
 	ethernet-phy@0 {
 		reg = <0x0>;
 		interrupt-parent = <&pioA>;
@@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
 		m25p,fast-read;
 		status = "disabled";
 
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			mac_address_eui48: mac-address@0 {
+				reg = <0x0 0x6>;
+			};
+		};
+
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
