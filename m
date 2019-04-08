Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D231C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49EF120883
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 07:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oc1t0Xce";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J1kaModF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49EF120883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6M9fgho+f7QuPHGYX0DG4T+/2T9uSQA8074nM861jg=; b=oc1t0Xceie/jIc
	B+fnZyorkDTfEY76K/njGwbzXqQso4pKriIwp2qS8BnNPiMT1BUpCeCKKIuFqQmCG18p2HnsLNcOT
	7zboz0MYaQk531OFD1bAifvqYILwhfELY37MgF2tvp6xlkkCuSEIofyaG46XXxi6+8DXYKUJCJbU9
	SHECURP8LvhqI+gq8GWGb80dx0jLzQtZ4gKBbuT3HysqTNNjLjEgguwamWFybFUuMRkAjm3EL7FYq
	4jF04glnfQLYcWJ3Y0WQruZEPJbRxEqE88TA/BG7FUSISqg0ZJ4kpLbKn16MS7PaZOEtx6dONxIDf
	pUL5L2z1pu64SwY6UYfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPBb-0003jH-DZ; Mon, 08 Apr 2019 07:59:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPBS-0003L7-8K; Mon, 08 Apr 2019 07:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwrNKkTVtrIXwTpTCFMaEwlShG/N1vL3GGZd20NE9Jg=; b=J1kaModFWP3meWjJxJCsqb7t+C
 1qc9DiFlTe96UVFsAm78oWRDyJdEeAur/CPtjLvIE5/DzYpFIVbAbWNhcGkhvXRV18L0CHAsKKJxK
 hWHaOEHq9zFmY7ZgfcOmpd7OwVdqF1nu1UNJCYsLZJy08WdiMZBiOMn4kyUPHCUl/1uCbiZTI0HcJ
 Tgm4z7CZnP9i3UfXaXQEz9CExVkSEg8al9MAX8TMp5sDGEP/nTB75ZapuPEJuSzRSh9w35cO2zJ4Q
 TmXO8NtnixDjqhpga2BuEGfSCra4Ro6FRX8QgfATOMm0iMETiXTirkTWlk56P8FrZKqcfv8c0PN7C
 aZTqIo3Q==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDOv6-0000AD-OO; Mon, 08 Apr 2019 07:42:22 +0000
X-Originating-IP: 90.88.30.125
Received: from localhost.localdomain
 (aaubervilliers-681-1-89-125.w90-88.abo.wanadoo.fr [90.88.30.125])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 099CB1C000B;
 Mon,  8 Apr 2019 07:41:57 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v2 4/4] ARM: dts: sunxi: Improve A33 NAND transfers by using
 DMA
Date: Mon,  8 Apr 2019 09:41:47 +0200
Message-Id: <20190408074147.26797-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_084220_854851_35C5D50D 
X-CRM114-Status: GOOD (  13.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In the current state, A33 NAND controllers use PIO during
transfers. Throughput can be increased thanks to the use of DMA
(mostly during reads, because of the ECC pipelining feature).

Besides the usual addition of DMA DT properties, because the A33
NAND DMA handling is different than for older SoCs, we must also
update the compatible which has recently been introduced for this
purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Use 'A33' in the commit log instead of sun8i.

 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 14a7d0288b45..f928b4bceb22 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -162,11 +162,13 @@
 		};
 
 		nfc: nand@1c03000 {
-			compatible = "allwinner,sun4i-a10-nand";
+			compatible = "allwinner,sun8i-a33-nand-controller";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 5>;
+			dma-names = "rxtx";
 			resets = <&ccu RST_BUS_NAND>;
 			reset-names = "ahb";
 			pinctrl-names = "default";
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
