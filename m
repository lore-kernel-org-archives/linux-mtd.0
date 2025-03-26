Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673AC36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 07:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uzGM5V0YkgQCjv8PFg73KCs7jf23l1o1EBh5Vxkygw=; b=pYWPObAFF719i8
	+YzbJUcXY8FMPfPd2g73Oh8dwMqaHF18lVYWZBvb4C1gwa9JXUkqJlSCwJzsROqvfzl6S7hTmq4FL
	6JzsJumjQz2vvIHLIefpnXuhveKqLHuhBYWhASP3iP9EC7v0lksA7hlVH8CChbYte6ULzd7E7R5ge
	63RE+hFp4scsykxcr4Lg3Wyf712gv/NQkIHwyQDkS4Rudvk225irmUN+bOnDsPfz+f7cmHH0EUH7n
	mPdaAALu7TIcvreilO24il/hG8JoiGDuMtJrI3FpP+nYMdaL4C+U8TgbL+w0IhRz+EmXdRqZnvZ90
	C2ug2dF4gn63KhYAPWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLFq-00000007nA0-2UJl;
	Wed, 26 Mar 2025 07:32:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txL6F-00000007lXD-1rQs;
	Wed, 26 Mar 2025 07:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742973775; x=1774509775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxCn43o1ihJ7Lubb3/UrAKd1VNrvg+hbLnroVKlybMg=;
  b=Kea5o65RjF8uZ+X3sOeeu8HWlGVZN44+v7CkYPNxqbP5HkxXaC1FIUFY
   9vt3Q/8TOShcbhHJEsuelh8CAfLM/1F5B9RRm6OET3VrbmE/VUoByH60x
   OP3ZbiVTQI1ErJ9vnVlqYeexxPJYExD8DWkpOqT1YYDyxS0xJG3I6t6+d
   p5uFSUXd/2bqEBxg45i4DuzXdArl0F3W3WjRm3lP+XKVM/bSbpLqKwM6i
   NL5PYWgZJXvP3e+mIwAwycyONEQ/tpcBhFPuhDSXfxKtJly5tFGtLaadN
   mwJRmhr88By0pqssMiCP7eDrPymORRqXBTKprXk/gkCjOwne9dyN5rTYc
   A==;
X-CSE-ConnectionGUID: fNQgDXBrQGWw5+E3ZnPSgg==
X-CSE-MsgGUID: qSyP69NURbKOY18dqN0TFw==
X-IronPort-AV: E=Sophos;i="6.14,277,1736838000"; 
   d="scan'208";a="40182266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 00:22:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 00:22:27 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 00:22:20 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <tudor.ambarus@linaro.org>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 3/3] ARM: dts: microchip: sama5d29_curiosity: Add nvmem-layout in QSPI for EUI48 MAC Address
Date: Wed, 26 Mar 2025 12:51:40 +0530
Message-ID: <20250326072140.172244-4-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326072140.172244-1-manikandan.m@microchip.com>
References: <20250326072140.172244-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_002255_596058_6471E05D 
X-CRM114-Status: GOOD (  11.93  )
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
 .../arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
index 35756cc01e68..6c5ff08f0b3f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
@@ -478,6 +478,16 @@ flash@0 {
 		label = "atmel_qspi1";
 		status = "okay";
 
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
