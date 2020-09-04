Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCBDC433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F662074D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w507VE6u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sV58pfGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F662074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+Ru9c+mA7zkdpP1v60mf83H+eDHnFYxwpEB4X5ARPo=; b=w507VE6uvCMkACz9icr8R+m1Jf
	xbBPYImmT/FN4BDVCJJZF9c6VJZT7Q8YS6x6BR5sSm5M66N6hxkOCNjn+ixNdTlD/pE5Y69n9VCuL
	DQWdLTSSwJYvYap3ooPl9nVPM5ICjFPSKsn+Jjmt1vZdhM2uMGx7/dxRjpK5AFgQkFJ6OZuthfknm
	NDjdEunRK41JVj7l4E2wHhnAdom62T5rAYd/nMi3Y4xMB3EKxw5DTBAstXjKLZDiKSHovwG5ARX7y
	JUr2jLabxiLu5FR3Yq7jBawI0CuunWcM9jxoJd/UD/Onh2tc5QVQeXrfIQ7Hp52fmGYXApOVt9UeX
	giet1B8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDZf-0007Mq-MS; Fri, 04 Sep 2020 15:24:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDZc-0007M3-8L; Fri, 04 Sep 2020 15:24:21 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB3F420770;
 Fri,  4 Sep 2020 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233059;
 bh=sKvZCsZobU7Bh4Xu+fGf9ZJCYmD7SquliyFmgqG50Oo=;
 h=From:To:Cc:Subject:Date:From;
 b=sV58pfGmmWQn8uohb/hknW48UOzALop3pIk3iQCR4uyFQ0gZyZbkeRJ5Qu8MEqccx
 Mkiwo6Wf3oJFhnVa4ToV7+vibP0Ihhvq3O5bvcBpigvWvC8sLMGLbJFQuBKgZhExcg
 M/98mPuaOqB0LDnKCPaiqseidOtLyrZLK/gWkZYU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 00/14] dt-bindings: Cleanup of i.MX 8
Date: Fri,  4 Sep 2020 17:23:50 +0200
Message-Id: <20200904152404.20636-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112420_451209_F6913046 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

I am resending the series (v3) without actual changes.  You already
reviewed many of them.  I think that subsystem maintainers are hesitant
to pick them up, so maybe this could go via your tree (all of them)?

Changes against previous revisions are in individual patches.

Best regards,
Krzysztof


Krzysztof Kozlowski (14):
  dt-bindings: perf: fsl-imx-ddr: Add i.MX 8M compatibles
  dt-bindings: pwm: imx-pwm: Add i.MX 8M compatibles
  dt-bindings: serial: fsl-imx-uart: Add i.MX 8M compatibles
  dt-bindings: serial: fsl-lpuart: Fix compatible matching
  dt-bindings: watchdog: fsl-imx-wdt: Add i.MX 8M compatibles
  dt-bindings: reset: fsl,imx7-src: Add i.MX 8M compatibles
  dt-bindings: thermal: imx8mm-thermal: Add i.MX 8M Nano compatible
  dt-bindings: nvmem: imx-ocotp: Update i.MX 8M compatibles
  dt-bindings: mfd: rohm,bd71847-pmic: Correct clock properties
    requirements
  dt-bindings: interrupt-controller: fsl,irqsteer: Fix compatible
    matching
  dt-bindings: mtd: gpmi-nand: Add i.MX 8M compatibles
  dt-bindings: mtd: gpmi-nand: Fix matching of clocks on different SoCs
  dt-bindings: mtd: nand-controller: Fix matching with size-cells==1
  dt-bindings: clock: imx8m: Integrate duplicated i.MX 8M schemas

 .../bindings/clock/imx8m-clock.yaml           | 125 ++++++++++++++++++
 .../bindings/clock/imx8mm-clock.yaml          |  68 ----------
 .../bindings/clock/imx8mn-clock.yaml          |  70 ----------
 .../bindings/clock/imx8mp-clock.yaml          |  70 ----------
 .../bindings/clock/imx8mq-clock.yaml          |  72 ----------
 .../interrupt-controller/fsl,irqsteer.yaml    |   8 +-
 .../bindings/mfd/rohm,bd71847-pmic.yaml       |   9 +-
 .../devicetree/bindings/mtd/gpmi-nand.yaml    |  94 ++++++++++---
 .../bindings/mtd/nand-controller.yaml         |   5 +-
 .../devicetree/bindings/nvmem/imx-ocotp.yaml  |  38 +++---
 .../devicetree/bindings/perf/fsl-imx-ddr.yaml |  16 ++-
 .../devicetree/bindings/pwm/imx-pwm.yaml      |  14 +-
 .../bindings/reset/fsl,imx7-src.yaml          |  19 ++-
 .../bindings/serial/fsl-imx-uart.yaml         |   4 +
 .../bindings/serial/fsl-lpuart.yaml           |  17 ++-
 .../bindings/thermal/imx8mm-thermal.yaml      |  10 +-
 .../bindings/watchdog/fsl-imx-wdt.yaml        |  11 +-
 17 files changed, 303 insertions(+), 347 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx8m-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mp-clock.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/imx8mq-clock.yaml

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
