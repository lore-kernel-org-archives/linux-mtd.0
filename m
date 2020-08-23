Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E75BC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:25:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9242075B
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnO5Utpx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoaAR81i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9242075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cd0sP5ef8zOQg22FoOfFa9OluKX9xz/ywcd+Qfd5nK8=; b=OnO5Utpxo+aZZzYDbhN0F/nTb8
	OOnoZanM1FORwfEKbYe7UMbh1RDh8cJlLSKOzd7XIPqP+HuQbhBE/R4DPvgGE3afznA/oIjdKqPtl
	TgcDSXkX9DqNLS71IVK6kHLNhQ8hY5vgws3EjoOiEGXHV0m7rnYMc9lMR7gPpM+54IivNPWs6D68C
	sfoNCSdvD20iK+rZ3UVAEjClzZh173ORb81y5RXvFZwV9+HXmrl+DPb2KgTOlSn8UTWz3GTn0WYZq
	oIuB0YRhTkPlPuKTztOMf8BP+Y9MIQ9MXOfij4Xs0RltUkCgJfeyNkpmXADiiQCJepkEWr7cQwFxt
	hySTuRsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9sms-0000Xq-0t; Sun, 23 Aug 2020 16:24:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sgh-0004oC-JQ; Sun, 23 Aug 2020 16:17:46 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9218120767;
 Sun, 23 Aug 2020 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199460;
 bh=om9ESAnTN0kLIHeSYqTWxWWUBVqyKQ5oPt5eaHUA+2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NoaAR81iHPTZTaeVWIysT1dgDiueIU1wsfTlQmwilaHTXOgNAp2Kiv1ZDYbmTEZyi
 DbkAGv4UahUvhmnSz7YofRG8QUC2usXaH+ng4qRtMnjpwEwJ0MYFy+B7fPsiKiAjUy
 4a6SBWOT+dxnoeMz6fUlewNe3Rk55M2pp2KWemUs=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 22/22] arm64: dts: imx8mp: Remove i.MX7 compatible from DDR PMU
Date: Sun, 23 Aug 2020 18:15:50 +0200
Message-Id: <20200823161550.3981-22-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121744_947901_2483464B 
X-CRM114-Status: GOOD (  14.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anson Huang <Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The DDR PMU on i.MX 8MP has its own compatible described in bindings and
used in the driver (with its own quirks).  Remove additional
fsl,imx8m-ddr-pmu compatible to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dt.yaml: ddr-pmu@3d800000:
    compatible: ['fsl,imx8mq-ddr-pmu', 'fsl,imx8m-ddr-pmu'] is not valid under any of the given schemas (Possible causes of the failure):
    arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dt.yaml: ddr-pmu@3d800000: compatible: ['fsl,imx8mq-ddr-pmu', 'fsl,imx8m-ddr-pmu'] is too long
    From schema: Docmentation/devicetree/bindings/perf/fsl-imx-ddr.yaml

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9de2aa1c573c..e34eff19fcae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -746,7 +746,7 @@
 		};
 
 		ddr-pmu@3d800000 {
-			compatible = "fsl,imx8mp-ddr-pmu", "fsl,imx8m-ddr-pmu";
+			compatible = "fsl,imx8mp-ddr-pmu";
 			reg = <0x3d800000 0x400000>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 		};
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
