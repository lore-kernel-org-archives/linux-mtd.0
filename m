Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FA2C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1jHDAvtk6fT7OOaZuH8wnoedNw/b9bid218izQrmfq0=; b=IHYvLe2RmeJ/rT
	sstRzgjfb8z2B0aZdu4E5k9djT0xP0f8h2ZBj/fvBTJbdWh95dQRNUIaw78/uw6bbE099EOMqRYnt
	Wg+1ifYa38ZEqnMGJJEelaiMExMPiC9+g3gF5zLXxMH3ir/4Vk9+d+K/iS2oXYXE9AbklzAsIY9Pt
	7PWOtMWg/Se1V9V6YtnmkYaQ1JvYIc0tzlCocIotZBASzr7nxSo6FFtrEaCd4agbf0D1vQ3tcaU2g
	JaE6QtocTutffGjuEvEWW+2tVZ0+pDwkWj9HTgNJxSsAV5i3DrDHWQoMRson1LRTXAHsKSVDt8E6r
	Vb+nUgtTxDE7X+Z0wZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DKG-004izY-07; Mon, 05 Dec 2022 15:24:12 +0000
Received: from smtp-out-05.comm2000.it ([212.97.32.73])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DJq-004ilj-H6; Mon, 05 Dec 2022 15:23:48 +0000
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch [31.10.206.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-05.comm2000.it (Postfix) with ESMTPSA id E8EAA8240D3;
	Mon,  5 Dec 2022 16:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1670253819;
	bh=kHr0aTjYplJsrICaBlaf8mmyRJ9l5EZ0Gq7KL8EAlqE=;
	h=From:To:Cc:Subject:Date;
	b=cBPD/nURivJ8O5RZoA8hzMlVtiZuEZgWhN4Wj8BDRChGtKFKVdWF4sane+Zcr1Jzs
	 RqSIfZWiRpnxRFre97ab42h1KMU4/LbK6kceQMQegJsbIAHZ4PBTLBu2v4PrEP3581
	 B7BuQMvFC2UoGobIRy8/W9DRCwxHFvHrYoiAcuWI53oNo6BnFsCazJHTDMw25hJOKB
	 QP+AYYkOBeDyEe2vdN0q0lKTZb279ljQVlf62Nzm8amMGJRdym4Z/VrLWM4+QWxkR7
	 kLcSYsi6QEMHUYTOAIP5vMZX9ICmGlOchHLaJHF5WLb4epdEzoB8EIxSJQBsz/69D1
	 FO+fk/0FDzurg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller size-cells"
Date: Mon,  5 Dec 2022 16:23:27 +0100
Message-Id: <20221205152327.26881-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_072346_749812_84872A35 
X-CRM114-Status: GOOD (  11.54  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This reverts commit 753395ea1e45c724150070b5785900b6a44bd5fb.

It introduced a boot regression on colibri-imx7, and potentially any
other i.MX7 boards with MTD partition list generated into the fdt by
U-Boot.

While the commit we are reverting here is not obviously wrong, it fixes
only a dt binding checker warning that is non-functional, while it
introduces a boot regression and there is no obvious fix ready.

Cc: stable@vger.kernel.org
Fixes: 753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/
Link: https://lore.kernel.org/all/20221205144917.6514168a@xps-13/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 03d2e8544a4e..0fc9e6b8b05d 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -1270,10 +1270,10 @@ dma_apbh: dma-apbh@33000000 {
 			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
 		};
 
-		gpmi: nand-controller@33002000 {
+		gpmi: nand-controller@33002000{
 			compatible = "fsl,imx7d-gpmi-nand";
 			#address-cells = <1>;
-			#size-cells = <0>;
+			#size-cells = <1>;
 			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
 			reg-names = "gpmi-nand", "bch";
 			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
