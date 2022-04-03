Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E668C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9gpz1CtDo4DV0nE69rQ2wMueq1kKP4wty0woP6cXAY=; b=uwQoNoBtxt+YNq
	JpS36/hzRu5LBvEczxI1vjBDdNDloxz6oymuYQ+JWBuNbfrfJYO/K8SyGtuPBje7KVL+C56NBCxgC
	FLiAUlBLGCAnDJF2dBYLKSt6eefzpPt55HEs0yiLwnPd9162u2DrZC3FYwpoAJQR4l8izVUHrE4Jo
	jaS1iu5wmWFKGlUawg93ydWsBjNinGz5swcpDbQno4ylyGMnuzYTgo5WITu5i/Vw5tYT1RjV/F2xx
	dwLrQDRLLYg6yOiOf1Dx0aUSuDt0GW4z0B46atzQErYg0KxpRbB1iIfoLkGbEK323Pp2SJcMa/bdO
	XlSqNgGWiC8FvVTVHcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb0EB-00BUZK-Hk; Sun, 03 Apr 2022 13:25:11 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb05J-00BROf-Hi; Sun, 03 Apr 2022 13:16:02 +0000
Received: by mail-pg1-x52b.google.com with SMTP id w21so6171049pgm.7;
 Sun, 03 Apr 2022 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PfNnbuCnnrrI2HGCtTaPf9X8eo27J8q+BtzO2NSDh9k=;
 b=W3nkE02niUtCrxE60qZnIXFqTLuGGvXDYFbmnRBXtm/ZI/VAaXcw5Xqus7HTQbkvdf
 KcTVM2bCrQvDizRqNs1kkHCoCJPAFWRVua/OlPfzEv3KPcxO7/5QbM/9q7tzL4fgz1fU
 QMhjc7VCxFA0/uoNb81LtTr1T7dEuey8rdOs2vRA8HrrwjpRyIDLFN7eSi1zhku9usof
 YTqs4werHRBOJCiInOUh9+WTLSSKsDMLf6wqqwaSz4jFavLDz1CAX8FhNygGWLzjNVPL
 4mUBwf4QV0foNL6m3R+QPVRfvtelSWp8AkxV+NiybpiRY7EULKXGctBBK4DhcaH+VY31
 Aa3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PfNnbuCnnrrI2HGCtTaPf9X8eo27J8q+BtzO2NSDh9k=;
 b=UzYU37UTzdH6W6/kAWexiB5UUpfe5MZRKZCObw8CgSGq0ZA2wniTtvUUw95YDm+Wbu
 +yV9AILyROchP426A9csdu/Lwuo+UTqqkzb2VB0u6y3AeKwotS+LI9cmUWmXGrE52Dj5
 k4X71hK0F0Hmq/t4Lq4E6uVp0JUl1pv4k+wjy927M7J4pjnaE4wkNZiyH/Aq5fzE5jjo
 sobhqh6ot7jmqdp3GsagMrB7pzj0w7s/8nEuoONIVXwXO3VOaowZfy4zB40sw/k//PqA
 UdNE2Bi8Tn68susKhqEZlj+Sby+hft6HBpWjVhE5Cp8rlBIgRVVZf2stYX38aaGaJhjh
 GBpA==
X-Gm-Message-State: AOAM533Ym+CaTwWNNZt5ZfAijHCt2SbDYfN1yqK5a/VJdXCjltjqXMK8
 uezZLsDW/3ykNv/z6vN1y2g=
X-Google-Smtp-Source: ABdhPJx/jqW9K6zA3FxhpAum6lnTJzCHjiUWOeOnYjnncDZjy24UF+xT1PnUpPoXV4vMBSuGDYAStw==
X-Received: by 2002:a05:6a00:124f:b0:4fb:2608:78de with SMTP id
 u15-20020a056a00124f00b004fb260878demr19139111pfi.27.1648991760243; 
 Sun, 03 Apr 2022 06:16:00 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm9272416pfu.35.2022.04.03.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:16:00 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH resend 4/4] arm64: dts: mediatek: add dt node for MTK SNFI
Date: Sun,  3 Apr 2022 21:14:53 +0800
Message-Id: <20220403131453.1269229-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403131453.1269229-1-gch981213@gmail.com>
References: <20220403131453.1269229-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061601_609479_49B2F14D 
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

This patch adds a device-tree node for the MTK SPI-NAND Flash Interface.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..40112fdca67e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -545,6 +545,18 @@ nandc: nfi@1100d000 {
 		status = "disabled";
 	};
 
+	snfi: spi@1100d000 {
+		compatible = "mediatek,mt7622-snand";
+		reg = <0 0x1100d000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI_PD>, <&pericfg CLK_PERI_SNFI_PD>;
+		clock-names = "nfi_clk", "pad_clk";
+		ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	bch: ecc@1100e000 {
 		compatible = "mediatek,mt7622-ecc";
 		reg = <0 0x1100e000 0 0x1000>;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
