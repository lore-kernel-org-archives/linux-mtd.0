Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D5C0C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:52:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D870920848
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:52:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxejeae7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSklfYl4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D870920848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3CLr2iBTMZ7vKTp0LaXI2jRKPMCTvHYYyztni5G18g=; b=bxejeae7kO6r1n6lhCbW/k/bLG
	vvr2OlUZJkVOaPbmZXihB9tXMyjA0bo1ItzYmyrwbedP+OcRWiqH6BdcgGqlRO8D673jrIhlWaTWS
	yxv5ECO+MnGI/M7xa39gpF2DrlJ8Kqhcy1AmBRD2kh2yEh+YGs9yRKrtoc/vZwl51SrHRBq3+t7/4
	1n1JKDQh5nyvvkYAUt/zKui5wpYP+TqqKbi7cnVuxxQ732OIV2elAWQaSH4BIWWxnqfZI78kbImSt
	ZpG35cpWoLhytpnxlHZa1xtNx230PAYESIpq8Wvxj0PsSYCRILCFrRCtGXgt05lA9N77PO1GPnCfa
	OfVLBWDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhb0-00063S-L3; Fri, 28 Aug 2020 16:51:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZ5-00057c-0g; Fri, 28 Aug 2020 16:49:24 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50AB120DD4;
 Fri, 28 Aug 2020 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633362;
 bh=CqYRHo/0iH7tLsT9o8PS32qjWWTfkPRR9VIUe5p42aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eSklfYl41kFc+J0Aj8bXANgqLZVGqcVZ0Rdp5/SZ5IrcrS0MOQr1enNadM4FrWnnp
 WduYBjISLtOOAixoNDAZPiXuyo0kY3e9WUoVx7uOwCgPRFUl58m8C+NzHdbQuTUp3h
 rxSv7/jTXhDHNj3luqFogfJtYLFjlqDPdDF14zIM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/19] arm64: dts: imx8mm-beacon-som: Fix atmel,
 24c64 EEPROM compatible
Date: Fri, 28 Aug 2020 18:47:36 +0200
Message-Id: <20200828164750.10377-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124923_174481_FB7C5BE5 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Correct the EEPROM node compatible to match device tree schema (invalid
space, unknown ID) to fix dtbs_check warnings:

  arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: eeprom@50:
    compatible: ['microchip, at24c64d', 'atmel,24c64'] is not valid under any of the given schemas
  arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: eeprom@50:
    compatible:0: 'microchip, at24c64d' does not match '^[a-zA-Z][a-zA-Z0-9,+\\-._]+$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index f627e82ad929..620a124dfb5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -184,7 +184,7 @@
 	status = "okay";
 
 	eeprom@50 {
-		compatible = "microchip, at24c64d", "atmel,24c64";
+		compatible = "microchip,24c64", "atmel,24c64";
 		pagesize = <32>;
 		read-only;	/* Manufacturing EEPROM programmed at factory */
 		reg = <0x50>;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
