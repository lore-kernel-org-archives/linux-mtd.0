Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C301C433E3
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:36:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E950120866
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/rfFZ4q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIS7rlbZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E950120866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXy6HuOvyQCepXIXPPq/l9vmvupLZSkIMGU6TQKHKN4=; b=X/rfFZ4qrOA9jEYI5k6W/UbC8h
	shEyHXAWNWenuM6q77n+wIIINFLJGo09GVFPUF6LkOT/iqLAE6VaA7148t9PSJDx1CDJtHXkgvpo+
	X+MpBnieqAp0kSXhu1083SwlAn46hxDxbWulYpyvD32AFZny0QPbkp6BzIaMCyrFkHoLvThM5eu+9
	xkcy1MB+HxYVQGEOqEpwJwTC030NvLykM/IocZIxYZuCY3HUGpa+dyTQ8apzIxOafBmwfBrFPLI32
	SZ1iPqoegId+2KwKUy1RX/nrdmNheiIKMj9KnsPYEPl51m3sfcsSawweKXsJKlhbVPLzHmYMzR49m
	DNJKwBaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAejp-0007bb-5J; Tue, 25 Aug 2020 19:36:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAejg-0007aS-3S; Tue, 25 Aug 2020 19:36:00 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9EB72075E;
 Tue, 25 Aug 2020 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598384158;
 bh=M1J8uZpqgbBk0Tp3JOS/OOQb4fA/JLnQDLU2aYyUXZk=;
 h=From:To:Cc:Subject:Date:From;
 b=HIS7rlbZC99+PFJ+c8TL3+mAFsePhLupI704uWAszxjjQtUK0rRn26QHhWk51eWPf
 osIIVZV6O8lT/j7Ew+BLD285VUcGHCFOkYLMR0yuSzUtYuTjxNzMDHDy+Ab3kRUQYC
 hmdIrv3bnxN73fG1c+3EPyro5Z47zPoDJd5DzXyQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Han Xu <han.xu@nxp.com>, Frank Li <frank.li@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH v3 00/19] dt-bindings / arm64: Cleanup of i.MX 8 bindings
Date: Tue, 25 Aug 2020 21:35:17 +0200
Message-Id: <20200825193536.7332-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_153600_266939_D424998E 
X-CRM114-Status: GOOD (  14.48  )
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

This is a v3 of cleanup of i.XM 8 bindings and DTSes.

It is separate patchset from i.MX 8 pin configuration cleanup, which
also touch the bindings [1]. No dependencies (although in my tree this
comes first).

Merging
=======
There are no dependencies, so dt-bindings could go through Rob's tree,
DTS through SoC. I think there is no point to push dt-bindings changes
through subsystem maintainers (gpio, pwm, watchdog, mtd etc). Usually
Rob has been picking them up.

Changes since v2:
=================
1. Add Rob's review,
2. Correct things pointed during review (see individual patches and
their change logs).

[1] dt-bindings: mtd: gpmi-nand: Fix matching of clocks on different SoC

Best regards,
Krzysztof


Krzysztof Kozlowski (19):
  dt-bindings: gpio: fsl-imx-gpio: Add i.MX 8 compatibles
  dt-bindings: gpio: fsl-imx-gpio: Add gpio-ranges property
  dt-bindings: gpio: fsl-imx-gpio: Add parsing of hogs
  dt-bindings: gpio: fsl-imx-gpio: Add power-domains
  dt-bindings: perf: fsl-imx-ddr: Add i.MX 8M compatibles
  dt-bindings: pwm: imx-pwm: Add i.MX 8M compatibles
  dt-bindings: serial: fsl-imx-uart: Add i.MX 8M compatibles
  dt-bindings: watchdog: fsl-imx-wdt: Add i.MX 8M compatibles
  dt-bindings: mtd: gpmi-nand: Add i.MX 8M compatibles
  dt-bindings: reset: fsl,imx7-src: Add i.MX 8M compatibles
  dt-bindings: thermal: imx8mm-thermal: Add i.MX 8M Nano compatible
  dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8 compatible matching
  dt-bindings: nvmem: imx-ocotp: Update i.MX 8M compatibles
  dt-bindings: arm: fsl: Fix Toradex Colibri i.MX 8 binding
  dt-bindings: arm: fsl: Add ZII Ultra boards binding
  dt-bindings: interrupt-controller: fsl,irqsteer: Fix compatible
    matching
  dt-bindings: serial: fsl-lpuart: Fix compatible matching
  arm64: dts: imx8mq-evk: Add hog suffix to wl-reg-on
  arm64: dts: imx8mq-zii-ultra: Add hog suffixes to GPIO hogs

 .../devicetree/bindings/arm/fsl.yaml          | 14 ++++++
 .../bindings/gpio/fsl-imx-gpio.yaml           | 43 ++++++++++++++++---
 .../interrupt-controller/fsl,irqsteer.yaml    |  8 ++--
 .../bindings/mmc/fsl-imx-esdhc.yaml           | 37 ++++++++--------
 .../devicetree/bindings/mtd/gpmi-nand.yaml    | 18 +++++---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml  | 38 +++++++++-------
 .../devicetree/bindings/perf/fsl-imx-ddr.yaml | 16 +++++--
 .../devicetree/bindings/pwm/imx-pwm.yaml      | 14 ++++--
 .../bindings/reset/fsl,imx7-src.yaml          | 19 +++++---
 .../bindings/serial/fsl-imx-uart.yaml         |  4 ++
 .../bindings/serial/fsl-lpuart.yaml           | 17 +++++---
 .../bindings/thermal/imx8mm-thermal.yaml      | 10 +++--
 .../bindings/watchdog/fsl-imx-wdt.yaml        | 11 ++++-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  2 +-
 .../boot/dts/freescale/imx8mq-zii-ultra.dtsi  |  8 ++--
 15 files changed, 182 insertions(+), 77 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
