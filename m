Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C0DCC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ICWukgnHTqqM+jYPAMa9y/zdsANvttJZikFa9jLHOw=; b=xmKtUnZAcEwNEe
	n42/6q8HlAJ9+tbFbayuhBvHjKpE3ozEh4NCoUCDgn4CeoMn1IXPYWe0Ry0p0G5YJMNDV/dxCmeMx
	d69E53B2JBp6gAiFAnsOpNvwCmYfF+HEzEXGZICsz4P+o2M+DCEfztiL3qfDScGCQnwoOE9wfezhG
	QtB5sQONcdu1VaMI3csQp/IizvRbRCsnT6POgk3ARHO+aOj1S72NB1s+fDrOqwty56EDzmnP+fhFi
	rYdCYLkCWdNH1E/oO2xnqFvHskUQaZrcXk0fun9QoMtCKp8NgGUfbFOsRhD7Pv80XDZv0Ci7/GAjW
	KxmPLtthw2z3B60LvK5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsgW-0000000EdH5-3WPh;
	Wed, 14 Oct 2026 06:41:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsgT-0000000EdE0-3LaR;
	Wed, 14 Oct 2026 06:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8lnx/G36wQX2KBTPTBYE57accH8GQJDJeddzWFtnJbc=; b=DvnJcGLcgN0sdOBtPd3jJB8d5G
	MHnhuPqlfpRnQIFjJO52ByAdApKoP9VTqoujWzW1gHM2VTdN7FJnvmG63CpM16n1uixywW7B/ASYM
	n2ZXtODqXFRE9mvY34UV0o++oe+kbqACWQoilrTJ9AWQkDRSRIfjJwBsfd7XU1lpY8XrmjnJZP0b+
	n0sS/9fdnHzvT9CT7M+AVnVOXA6uuEPB3tnXH1aY00XR2eiQI6jvdQ4gEuMkHnyesRBL1uElsUwbd
	PRtTdMSrB8Y7hN2Pu1ByLjC6ZWGx6aUnA7EtLUVihUqVrn9Gw2oUtuB/FNu/cxRuQ3Pbm4KxZ4FHk
	YE0L3ZZg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGsgP-0000000GPFv-36zc;
	Wed, 14 Oct 2026 06:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791960110; x=1823496110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vrwYmM5Vth4AIix4/4mGQ4sTGgffKjR1GLZyy+Li7o0=;
  b=wS3F35srycpsiBK8u6cC9sjwq4aKeuw6jQq2Bgv/IL2dn1nBKQOb7OS3
   uw8UuuPAhX4yg9h7Q5d+lEqIP9YPhRe/soBICYWVAo6jpNF5A1xAn4lfP
   bCuLGPWpiVq1sIgYLMWPytzTYcBT/Xdz762d4vAF+GNWTT7b9dmPPJeb/
   Gsi2vBa1DEFKmRqOzjnUpS1/+oEqdG5HHeVlrqqNh+8tXTeBEONfeMxXP
   cobY29TYXI7eVGJ4XTzuXdwcyVO9BtBIrmBPaNVx1cXHGDTgM6alJ1QX7
   s0KGA+EL+/wHS0EcF5ZjigSxT7brSzzGNoF446Kruc9wdk6che6qvU169
   A==;
X-CSE-ConnectionGUID: GLBYWGQOTzW6B7xcbU6cfA==
X-CSE-MsgGUID: vO/EN+ZwQn6axeg2P/CocQ==
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="296426236"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2026 23:41:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 13 Oct 2026 23:41:38 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 13 Oct 2026 23:41:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
	<arnd@arndb.de>, <aaro.koskinen@iki.fi>, <gregkh@linuxfoundation.org>,
	<mathieu.dubois-briand@bootlin.com>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v8 6/8] ARM: dts: microchip: sama5d27_wlsom1: use fixed-partitions for QSPI flash
Date: Wed, 14 Oct 2026 12:10:10 +0530
Message-ID: <57b6d9c4664727ca16a3ff3c3005342db5f64d78.1790847519.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_074150_441297_1B419691 
X-CRM114-Status: GOOD (  10.83  )
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

Move the QSPI flash partitions under a "partitions" node with the
"fixed-partitions" compatible, as required by the current MTD partition
binding, instead of declaring them as direct children of the flash node.
No functional change.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../dts/microchip/at91-sama5d27_wlsom1.dtsi   | 54 ++++++++++---------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index 0417f53b3e96..6ce42a42a1bf 100644
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
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
