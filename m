Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27059C2D0CD
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCRJdyc7O8/V3VYmy7OeJojAzLcaCsihEiRp7IjN+uU=; b=BTGvcKads/471M
	9my8aqZS72V805y6mNiYc+Dv0qIp9l3fBzH8xkGKITlEP9FrmyMkbee+Q4Wxzokjsf6YuCK2PqEfE
	xUmHYri8CL/CgAKgiFSNWTEPnxpPZcYnzwsmO09DLJ8uHhij7n1qMkUuXkxQ5LTlsZcz+21oBVYi6
	qUxI5Upa96E2Svm+9bkd/uuJ8JkK8SBLLx8fVhRnOiGI5jD5HDFFqBPc7DJg+H1BlVlWyrBIu31Kz
	txPn3sj72itZC7ate8F/OaQruaG2kt4JZid9rWW55wtnuHQnykGG9eiaeyolaPQgCfJhOXzGSnp2X
	hXRq64hEEsO+yIS98d8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdeT-0000000F23L-3bZI;
	Wed, 21 May 2025 07:14:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdV8-0000000F0au-3khM;
	Wed, 21 May 2025 07:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747811070; x=1779347070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2DeoV9NVpmkJFiAHnImpl+I7mTrck3WLp13yWezHkLk=;
  b=gieykq6lw9OpeJxXT2XQEfu8PgL1Z3ecAXeKjXpLq2dI5YK4vJHV0LPn
   9tx2mk6NG/E+ctCnFqel7CM4BTWo0viqpFf+bf3KIi7zdGzZmJ5e7Z1/t
   lU1sa2N+owhbEocE57U0e5g4pVWfcalVKQolCYYi9xw+UkQKzn2KFKMDZ
   TJs3mYP/fTyvTA4slBQK2Z8JVLPexAa2Uk3YsQpXYsWIb2LfwaOFV7E6O
   7HcZ92pljZDu6LbRUG8ijCYKLSgRYhxOQsfWx0mtq+Vi9h9hLmwx0ajMy
   akvSo+KlEoYOIbt24QvfZgcRACkPKnpQigifmEiJJDc7q50ClmLpS/jl4
   Q==;
X-CSE-ConnectionGUID: 3KNJWgZeSmKF61v88cWcwA==
X-CSE-MsgGUID: QpdtkuDUR3aPep0UaKoi9w==
X-IronPort-AV: E=Sophos;i="6.15,303,1739862000"; 
   d="scan'208";a="42432076"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 May 2025 00:04:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 21 May 2025 00:04:09 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 21 May 2025 00:04:02 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v3 2/3] ARM: dts: microchip: sama5d27_wlsom1: update the QSPI partitions using "fixed-partition" binding
Date: Wed, 21 May 2025 12:33:35 +0530
Message-ID: <20250521070336.402202-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521070336.402202-1-manikandan.m@microchip.com>
References: <20250521070336.402202-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_000430_994740_F5F75E6B 
X-CRM114-Status: GOOD (  10.23  )
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

update the QSPI partitions using "fixed-partition" binding

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   | 54 ++++++++++---------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index 9543214adc9f..b34c5072425a 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -229,8 +229,6 @@ &qspi1 {
 	status = "disabled";
 
 	qspi1_flash: flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <104000000>;
@@ -240,34 +238,40 @@ qspi1_flash: flash@0 {
 		m25p,fast-read;
 		status = "disabled";
 
-		at91bootstrap@0 {
-			label = "at91bootstrap";
-			reg = <0x0 0x40000>;
-		};
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
 
-		bootloader@40000 {
-			label = "bootloader";
-			reg = <0x40000 0xc0000>;
-		};
+			at91bootstrap@0 {
+				label = "at91bootstrap";
+				reg = <0x0 0x40000>;
+			};
 
-		bootloaderenvred@100000 {
-			label = "bootloader env redundant";
-			reg = <0x100000 0x40000>;
-		};
+			bootloader@40000 {
+				label = "bootloader";
+				reg = <0x40000 0xc0000>;
+			};
 
-		bootloaderenv@140000 {
-			label = "bootloader env";
-			reg = <0x140000 0x40000>;
-		};
+			bootloaderenvred@100000 {
+				label = "bootloader env redundant";
+				reg = <0x100000 0x40000>;
+			};
 
-		dtb@180000 {
-			label = "device tree";
-			reg = <0x180000 0x80000>;
-		};
+			bootloaderenv@140000 {
+				label = "bootloader env";
+				reg = <0x140000 0x40000>;
+			};
 
-		kernel@200000 {
-			label = "kernel";
-			reg = <0x200000 0x600000>;
+			dtb@180000 {
+				label = "device tree";
+				reg = <0x180000 0x80000>;
+			};
+
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x200000 0x600000>;
+			};
 		};
 	};
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
