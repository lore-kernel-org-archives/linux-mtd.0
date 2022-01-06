Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51090C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jan 2022 03:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j25kxXbiwVhiTwoO/mFWKdsLzTXJaUHIua0oIopwECo=; b=nVmN9kzWwWRYIT
	fXNDURTehW83CwE1KZERqewsgpBjXtnJqGqyphScrISOU6IwBjcE1BOjCt1z2BGzsspv4iaSBuD77
	EO7CG9KKzgZfsXfofRirqTbw3cgGYlw/bFiZrzrJvpHEFtO4T6sQAmNH1EqaO6fzFYnl5YUrJiVmq
	Mrdz9ZJxU0Lc0YeT6r/UF9p1YhZrXMB7uRE1uGseiU+3acYq0N6kNMQFU0y4QIuiPMQzEO8AU3t3L
	0rWtMwlwa37ZI1Cg8VbohCPWt62b9seEwdRC/xnyEcf+fZe6BGVUWeN2l0WiAplHiaV70cW21j44d
	ikbESBGgSaBEjoIdtstQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5JVQ-00GKY2-R9; Thu, 06 Jan 2022 03:32:00 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5JVA-00GKQD-06; Thu, 06 Jan 2022 03:31:45 +0000
Received: from droid11-sz.amlogic.com (10.28.8.21) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 6 Jan 2022
 11:31:42 +0800
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
CC: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, 
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin Zhang
 <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>, YongHui
 Yu <yonghui.yu@amlogic.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH] dt-bindings: nand: meson: fix controller clock
Date: Thu, 6 Jan 2022 11:31:30 +0800
Message-ID: <20220106033130.37623-1-liang.yang@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.21]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_193144_085437_BC28F6CF 
X-CRM114-Status: UNSURE (   6.15  )
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

Change-Id: I1425b491d8b95061e1ce358ef33143433fc94d24
---
 .../bindings/mtd/amlogic,meson-nand.txt        | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
index 5794ab1147c1..37f16fe4fe66 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
@@ -14,11 +14,6 @@ Required properties:
 - clock-names: Should contain the following:
 	"core" - NFC module gate clock
 	"device" - device clock from eMMC sub clock controller
-	"rx" - rx clock phase
-	"tx" - tx clock phase
-
-- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
-				controller port C
 
 Optional children nodes:
 Children nodes represent the available nand chips.
@@ -28,11 +23,6 @@ see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindi
 
 Example demonstrate on AXG SoC:
 
-	sd_emmc_c_clkc: mmc@7000 {
-		compatible = "amlogic,meson-axg-mmc-clkc", "syscon";
-		reg = <0x0 0x7000 0x0 0x800>;
-	};
-
 	nand-controller@7800 {
 		compatible = "amlogic,meson-axg-nfc";
 		reg = <0x0 0x7800 0x0 0x100>;
@@ -41,11 +31,9 @@ Example demonstrate on AXG SoC:
 		interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
 
 		clocks = <&clkc CLKID_SD_EMMC_C>,
-			<&sd_emmc_c_clkc CLKID_MMC_DIV>,
-			<&sd_emmc_c_clkc CLKID_MMC_PHASE_RX>,
-			<&sd_emmc_c_clkc CLKID_MMC_PHASE_TX>;
-		clock-names = "core", "device", "rx", "tx";
-		amlogic,mmc-syscon = <&sd_emmc_c_clkc>;
+			<&clkc CLKID_FCLK_DIV2>;
+		clock-names = "core", "device";
+		sd_emmc_c_clkc = <0xffe07000>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&nand_pins>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
