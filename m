Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B784C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yaVsv3I91v5AbKLHcLVD8b2E/jHMGy1y+Epg9Ny8k0=; b=tk01l9PBV9gpJk
	a9/8B4cDSz4GG3IbPaSNnU63N1gAtV1VNQ2iww1xpK89Xf5vQo4r+tKwLZEkGh2N7wTsXr5MXPEfC
	72IlWw0svBV9S+u9KF9EysRF8uS0zkm56+YBYezxBQy0zHtV6i2O/XznttsheBtJZgZwmuVP3Y+5i
	9zGTLEGv7STUH2tWz9FD3gnJRDFhaK3zL7rc59QsqTmvWLcT6Qug8Bwm07VFlQKq6fcVaCXHJTGt+
	fXDtwTXmF65jSq3xdrJ+GHW8dRdUQwtufc6upACo5sPZKUttBQc/KXoBqDtQqr+BugUQP+Bs0QKe/
	SOJr9ZnD0gw135doWpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovchf-00CuxS-Bb; Thu, 17 Nov 2022 11:05:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcWM-00CoMz-07; Thu, 17 Nov 2022 10:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1668682407; x=1700218407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uWkuOl/J8eDUGqINokgFVHKc4s1F8Y1WbCaW1XUAocc=;
  b=h8YW220uZYycXNF+d+P+4j5sjN3rNwggUMtEg+0BNnb1KCeEnibR5OX5
   jb6XZFxwVcW5hFTiM+/6Ced6CZ2XJgRano4rrXmg2Bv9UwiwnhWCDR57Q
   F2FZVn1YwqI55+UI9hrF+pE8LOutURSAYSTq6IHVQPWSFllaQBw8R5kU+
   0Yf4sk2f2FXDNbFxNn+5ZmKtrQGvI0wzn6p5t87ZicpO7lNhcQoxGpgqa
   5obCbOUg4vZrbgbdFfLygbwRcDWGF3Ca6oMdZ/Ph+pgOZhUb1MXxMNIxE
   XBPGrt2FszY1Cn+Hu7iImpRCth9SvKzbeaqsHpf/TrRQYPd6hts1oYmZz
   g==;
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="183965664"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Nov 2022 03:53:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 17 Nov 2022 03:53:17 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Thu, 17 Nov 2022 03:53:15 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mtd@lists.infradead.org>, Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 8/8] ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency
Date: Thu, 17 Nov 2022 12:52:49 +0200
Message-ID: <20221117105249.115649-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117105249.115649-1-tudor.ambarus@microchip.com>
References: <20221117105249.115649-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_025326_176930_53400D1A 
X-CRM114-Status: UNSURE (   9.92  )
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

sam9x60ek populates an sst26vf064b SPI NOR flash. Its maximum operating
frequency for 2.7-3.6V is 104 MHz. As the flash is operated at 3.3V,
increase its maximum supported frequency to 104MHz. The increasing of the
spi-max-frequency value requires the setting of the
"CE# Not Active Hold Time", thus set the spi-cs-setup-ns to a value of 7.

The sst26vf064b datasheet specifies just a minimum value for the
"CE# Not Active Hold Time" and it advertises it to 5 ns. There's no
maximum time specified. I determined experimentally that 5 ns for the
spi-cs-setup-ns is not enough when the flash is operated close to its
maximum frequency and tests showed that 7 ns is just fine, so set the
spi-cs-setup-ns dt property to 7.

With the increase of frequency the reads are now faster with ~33%.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 4ba52ba11dc6..6cbb4e0d9938 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -612,7 +612,8 @@ flash@0 {
 		#size-cells = <1>;
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <104000000>;
+		spi-cs-setup-ns = /bits/ 16 <7>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
 		m25p,fast-read;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
