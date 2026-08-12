Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C57EC5CFDB
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcRpmHPzhs1DCDG5GnR1fYx3eY8rXaG8d3G0iCbqJXE=; b=BWAFlb3INSH6ZJ
	ERcmoio16YYRDnVhsoz/Xugg/3dIGJysusWyc8h6utID4t1oFvkU3KfWHjlTjUhPBfTxONzmemIMc
	8nyk0jMszIyLA0giRMxZMFpqVJdKu6dKEnYElzpKZLrWF9+kmllk6836CvamWKUXmNfZKQDQ2VHZv
	651kcbsKOOe80+508jGPdTYuPquOub6aw41mXMsIIpWifitO6tPoMNTDdTTLk/dQ+NsXlfuLMD9K0
	3lbEBiqjj4A2oh8zfKpIPPiDOWVqTmAD7TPjXa8YQb6mT875mHjZb276KonAU6GicqkC3WHWoh9uf
	AoeNtTMhazsK3sEzlJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Yl-0000000FxNT-2Hse;
	Wed, 12 Aug 2026 10:51:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6YQ-0000000FxC1-1Kcu;
	Wed, 12 Aug 2026 10:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786531886; x=1818067886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z70fjpYttGJ5pF28+/q5Hw0XOwexxfwU6c0isKT50eA=;
  b=UwutCFZY1B2+Dhh4p74m1HAO601crOHhTkUVxnyXbF47OLwWW0PG7XxB
   GFLDVvxvEaMWusTJj1cisOBQyI+OVBO6aDx1nbx/nhuq5YXgSGVItLzMS
   KA7KJZpspH4jO8KI8wmQ26Hk7hdT7/qoKr+PSjiXTp8n63a5QOXHBua6y
   IP32JrsQloeBQ4ABAwSc7mAS1nypducvYG0HaXT64fX/5AxA4gjbBZSD9
   +tS6goa+gpSG4hMMAge171Vp46/3bXKCI1LvEKEa4EPpKUxtvQY0gWPId
   WSdonmxSyLRrbJWVdoJ89OT4NVtlrMyEcjndyNYYCknuCcKihD1aRYx+A
   w==;
X-CSE-ConnectionGUID: LSAcPquSSsak6epvTX2MmA==
X-CSE-MsgGUID: lzlKLKSLQnGi/vL1LfQsDw==
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="71673518"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 03:51:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 03:51:25 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 12 Aug 2026 03:51:14 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH v7 6/7] ARM: dts: microchip: sama5d27_wlsom1: read MAC address from QSPI SFDP
Date: Wed, 12 Aug 2026 16:19:54 +0530
Message-ID: <20260812104955.485667-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812104955.485667-1-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_035126_505133_CA553A7B 
X-CRM114-Status: GOOD (  10.73  )
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

Describe the QSPI flash SFDP as an NVMEM provider with the
microchip,sst26vf-sfdp-eui layout, which exposes the factory-programmed
EUI-48 as a "mac-address" cell, and point macb0 at it through
nvmem-cells. This yields a stable MAC address on boards where U-Boot does
not program one, instead of falling back to a random address.

The sama5d27_wlsom1 SoM is fitted with the factory-programmed
SST26VF064BEUI, and the QSPI flash node is only enabled on boards carrying
that part, so the EUI-48 marker and its "mac-address" cell are always
present. Boards without an EUI-programmed part simply do not reference the
cell, so macb0 never defers waiting for it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 11 +++++++++++
 .../boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts    |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index 062aa02a98ed..6016d7f2a39c 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -240,6 +240,17 @@ qspi1_flash: flash@0 {
 		m25p,fast-read;
 		status = "disabled";
 
+		sfdp {
+			compatible = "jedec,sfdp";
+
+			nvmem-layout {
+				compatible = "microchip,sst26vf-sfdp-eui";
+
+				mac_address_eui48: mac-address {
+				};
+			};
+		};
+
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
index 35a933eec573..5e87bf04bc47 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts
@@ -97,6 +97,8 @@ uart6: serial@200 {
 
 &macb0 {
 	status = "okay";
+	nvmem-cells = <&mac_address_eui48>;
+	nvmem-cell-names = "mac-address";
 };
 
 &pioA {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
