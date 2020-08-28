Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03D0C2BBD0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:50:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DED420B80
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fT+qBSB0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkc/VRi2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DED420B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9O03z01ss4vmoCkjBzh40jOE+wvFAjHlSoZ1nNrc8oI=; b=fT+qBSB0TMJsXW7cUfq9gfsf4P
	TUTva/2hLiW4MgbDBcnSd0kQ94FqAVUnwVqtjS66Z1e8USEbnuYIutfkRMhcsKuGVBbmSSAgX65ld
	J8SaiUKm0IIkCzvtLqvCGOCibaeBmpo9M7jbjbEal3RRoC5vaNfb2JNpfBejPSQHiUOFMlkqNSCxp
	bMoRuiSPJrs+o4niz+IU8KvEMV6pCd/2O1TcvlE2UuCaewRgprrjtGAXpOZ1xinZ44c6J54VaXbQP
	byFz2yx+xBLCCVANzYhItpyEzCY5FKZuSFUvFyY198FfyzTK6q6V2+omUmOOthSElMS5tY+4a7GDN
	QgCQbsaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhYo-0004xI-F9; Fri, 28 Aug 2020 16:49:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhYj-0004uu-3P; Fri, 28 Aug 2020 16:49:02 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E51920848;
 Fri, 28 Aug 2020 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633340;
 bh=Wwkz9ubdC4d89Hl6z0P8S1t5VHI9tjmoy/T0n7UH+bM=;
 h=From:To:Cc:Subject:Date:From;
 b=gkc/VRi2gUW3RgoERRpYudU0O5VRe+yQbUrx/D57d/pzQ7TjVGDdGDsXwbUvoWOrF
 H6r6VK8WPq9W1m+Ewx9tDO0MWuoKRPbUjxwry4LF8wHXcXbwRt3P0QQ46ZZ8ws22/d
 f4SRaz7RSIJ26cGHSv6TTjHfgZogZwaqBdC1oh9k=
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
Subject: [PATCH v2 00/19] arm64: dts: imx8: Align pins and regulators with
 dtschema
Date: Fri, 28 Aug 2020 18:47:31 +0200
Message-Id: <20200828164750.10377-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124901_275917_578A251F 
X-CRM114-Status: GOOD (  13.15  )
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

Hi,

This is a v2 of my second batch of i.MX8 DTS and bindings cleanup. It's
rebased on top of first batch [1] although it is independent.

1. For arm64/dts patches: to avoid any conflicts, better to apply
   on top of [1].
2. dt-bindings patches: independend, can be applied by Rob or subsystem
   maintainers.


Changes since v1:
=================
1. Address few comments - see individual patches.

[1] https://lore.kernel.org/lkml/20200825193536.7332-1-krzk@kernel.org/


Best regards,
Krzysztof


Krzysztof Kozlowski (19):
  dt-bindings: mfd: rohm,bd71847-pmic: Correct clock properties
    requirements
  dt-bindings: mtd: gpmi-nand: Fix matching of clocks on different SoCs
  arm64: dts: imx8mm-beacon-kit: Add missing build through Makefile
  arm64: dts: imx8mm-beacon-som: Align regulator names with schema
  arm64: dts: imx8mm-beacon-som: Fix atmel,24c64 EEPROM compatible
  arm64: dts: imx8mm-beacon: Align pin configuration group names with
    schema
  arm64: dts: imx8mm-evk: Align regulator names with schema
  arm64: dts: imx8mm-evk: Add 32.768 kHz clock to PMIC
  arm64: dts: imx8mm-evk: Align pin configuration group names with
    schema
  arm64: dts: imx8mm-ddr4-evk: Align pin configuration group names with
    schema
  arm64: dts: imx8mn-ddr4-evk: Align regulator names with schema
  arm64: dts: imx8mn-evk: Align pin configuration group names with
    schema
  arm64: dts: imx8mq-evk: Align pin configuration group names with
    schema
  arm64: dts: imx8mq-librem5-devkit: Align pin configuration group names
    with schema
  arm64: dts: imx8mq-phanbell: Align pin configuration group names with
    schema
  arm64: dts: imx8mq-pico-pi: Align pin configuration group names with
    schema
  arm64: dts: imx8mq-sr-som: Align pin configuration group names with
    schema
  arm64: dts: imx8mq-hummingboard-pulse: Align pin configuration group
    names with schema
  arm64: dts: imx8qxp-colibri: Align pin configuration group names with
    schema

 .../bindings/mfd/rohm,bd71847-pmic.yaml       |  9 ++-
 .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../freescale/imx8mm-beacon-baseboard.dtsi    |  8 +-
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi | 36 ++++-----
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 40 +++++-----
 .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 24 +++---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 14 ++--
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  2 +-
 .../freescale/imx8mq-hummingboard-pulse.dts   |  8 +-
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 12 +--
 .../boot/dts/freescale/imx8mq-phanbell.dts    | 12 +--
 .../boot/dts/freescale/imx8mq-pico-pi.dts     | 12 +--
 .../boot/dts/freescale/imx8mq-sr-som.dtsi     |  4 +-
 .../boot/dts/freescale/imx8qxp-colibri.dtsi   |  8 +-
 15 files changed, 161 insertions(+), 105 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
