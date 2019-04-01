Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BC7C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A89820880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:15:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNMhndDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A89820880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEud1WNQ8qhAu210A31yBv2x9lDiYz20e4W6Q8RT1sc=; b=KNMhndDkpF/RPm
	/MlZi9IkFHxaqflDOEb8LKxqz/QDsk9AW3vnawX7iVREtMe59aS9BWyCQ5ZLDldrrIRBEXmvC7hsy
	y097m5lvXj1+KWGUA4gU7PGS81dbabiIsAxjSuyzFP8KCo0V0SmN7Fl6t6rAtwlu4B2lptOqcVhoR
	otlFwX7gP85Rf4/+i9R/sxsXyvmdmz0kLAlTnQCbo/HClzBD00OKUGV/ztIWv1KyNERP6V9i4wY+y
	manh87JuSm8jqwVjtOoDOtXtcQ6fjnzkOquCR65Y7E7MZC0a+V9aD34YqddiJEoPaHpb4N8g/r9CR
	B/GxxklZvM9dvxa5zd1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB4H0-0004JU-3a; Mon, 01 Apr 2019 21:15:18 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB4Fx-0001mW-4O; Mon, 01 Apr 2019 21:14:15 +0000
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 00F28E000B;
 Mon,  1 Apr 2019 21:14:08 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/4] ARM: dts: sunxi: Remove useless address and size cells
Date: Mon,  1 Apr 2019 23:13:56 +0200
Message-Id: <8774db23f87fe401f8ac7b775decba3cde2a56ea.1554153146.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
References: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_141413_318225_04FD8607 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The NAND chips in our DTs have address and size cells, even though they
don't have any child nodes. Remove them.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun5i-gr8-chip-pro.dts             | 2 --
 arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
index 533a4ecc05e2..a32cde3e32eb 100644
--- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
+++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
@@ -133,8 +133,6 @@
 	status = "okay";
 
 	nand@0 {
-		#address-cells = <2>;
-		#size-cells = <2>;
 		reg = <0>;
 		allwinner,rb = <0>;
 		nand-ecc-mode = "hw";
diff --git a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
index 32cf1ab33aab..246dec5846a4 100644
--- a/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
+++ b/arch/arm/boot/dts/sun8i-r16-nintendo-nes-classic.dts
@@ -34,8 +34,6 @@
 
 	/* 2Gb Macronix MX30LF2G18AC (3V) */
 	nand@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
 		reg = <0>;
 		allwinner,rb = <0>;
 		nand-ecc-mode = "hw";
-- 
git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
