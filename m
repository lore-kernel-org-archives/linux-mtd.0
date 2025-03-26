Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642E7C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aed1LlydXua3us0wzTlQGbPrI7q2hi8ly8NAl/aI5gM=; b=AjUvHthp3pkBlx
	qWCX7OpkMF+Mu3ZWAIHmfXUE+KEZnPlrCBBqVtBiQoAUT0A1rNPAnGHGr2Yf6W3807CG9aHrkVXxv
	u5p92UaVMQsxUegXFt70fDXuLXvTbg7p622zAECB50Zh12o0mPV4olAlVqd7r3gMlyd1zgKeFh5Qd
	dvmyQ5s6l4QylvVcv+e6ssEAImy60plMawal0WwWUFA+B/ZrA7TWLsllHbBTU/PfQBnBmXz1rf7mx
	+aaR5EcHDU1lojEc/i6UTbJfLw+WqCUhTIUtR+qx+SCTq82kC1LbwjbF2jVi3W+/vK+1tY/uDE0dY
	sJ2osYZMBL/ZYet+vCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLCQ-00000007mdc-2gP9;
	Wed, 26 Mar 2025 07:29:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txL5l-00000007lOh-0rIz;
	Wed, 26 Mar 2025 07:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742973746; x=1774509746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S1fjsSj00xmhu6OCChhz0tKM0pQCmdFU6YLAley0nKc=;
  b=v58qXIBPxYpSVM9dcKK3lTHD5XLPVKZ+LYHirR6NI/cIPlMpzdeV86JN
   jPsvRobsxyGqU0bGENL7KXnNpIWh0bWpRGT0JDlr66AjC1GcNLc37eaEr
   Hxlfd127ouXC0z8RAORRVomMwr2jypcF6QuxH0cROR8ONGVecYdtyYX5j
   JiHMB+KYFBYVGZR6tCIwyTpXf86u8cDP0jNnL7VopVwsdtmegduxfnrYi
   DAXxyY3EStkoGSUDluMN/5yMzqDn4f/YF2yL61qmkiiub0RUq+AtxfKW1
   wc7pagitmX1wQB4/boH9Fi4LLik94mbtwcssj4sSJ9gk3wghjTFC7MQXr
   A==;
X-CSE-ConnectionGUID: QApF+UAWRZutY2upgn7tGQ==
X-CSE-MsgGUID: yqyq6tBRSRWUKm5lvgvVQg==
X-IronPort-AV: E=Sophos;i="6.14,277,1736838000"; 
   d="scan'208";a="271100167"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 00:22:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 00:22:15 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 00:22:08 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 2/3] ARM: dts: microchip: sama5d29_curiosity: update the QSPI partitions using "fixed-partition" binding
Date: Wed, 26 Mar 2025 12:51:39 +0530
Message-ID: <20250326072140.172244-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326072140.172244-1-manikandan.m@microchip.com>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_002225_246418_1091DECC 
X-CRM114-Status: UNSURE (   9.06  )
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

update the QSPI partitions using "fixed-partition" binding

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../dts/microchip/at91-sama5d29_curiosity.dts | 54 ++++++++++---------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
index 7be215781549..35756cc01e68 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
@@ -469,8 +469,6 @@ &qspi1 {
 	status = "okay";
 
 	flash@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <80000000>;
@@ -480,34 +478,40 @@ flash@0 {
 		label = "atmel_qspi1";
 		status = "okay";
 
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
