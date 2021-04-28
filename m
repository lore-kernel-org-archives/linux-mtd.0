Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89829C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:33:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FFD6143A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FFD6143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lk6lzE0yvQ/pMqbvAhO/UNBuo0WOa10+ywALPKTVpnQ=; b=UdYfyslqPioWtENrNYo1//Mvpp
	muWkFtw6UiNKZ1Oxo9r8NOBI4TEdAa/29jiY0eMsxD40wU2h2X06OMJQwImXEv2lsNWhc8an3PQsR
	li8/UqEmYItg5XYg0qofz7B4MBmGyBpyRJ64uV2fz3+5a1F3qaKHBOpGCqkvK0Au92f/ygN4kdYgI
	MmWrGkXW1dWMo8GvKSodd7J45mP+qrHtBfeXAC/hVdJlTtcJJGX/oKMqIAcUBh3U7JnnYKOStFHNL
	MZKSY1VlYJpfYBFnj62XgZqma5Wh/qof/6R3JPmPILzbID3SCApubLwcpN4JATjT4ECF5ZuLlYO52
	M9IacTwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbsjX-004OEl-MX; Wed, 28 Apr 2021 22:32:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsh2-004Nkh-Fk; Wed, 28 Apr 2021 22:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TgpU7XeGitLuJquP8RHImYZ5ug4YpancRv5+CJ8csmI=; b=xMzXJVQN9YYjpctUCTJIXIcDl4
 W0ac2iPtoOBax06LFExJndKENrmWw5CHCynK6ElqIOpwggTITA4VapB1cv01a4L96cctjXio9TP6e
 tWFfn1K92cRuGJVBqSnJqPPktSJYk0pc2mudfNbcEMHOofn+s7Db/JVQGua7VQGGz1zXWQr5t6DeA
 ZMKIeOHVv77T6+3sbCbZ0Y91ueAGn1/LXKfrNolJ+CD8m+qMOTg56Ki/dm+QcO7hqfGmqNxUbXIBc
 Lp1WEyHZzd7N/5IRlv97X5lrqCo+1FJTr4cddjV3brRI/TzhlTAcS1WlBNzhs+zpUZQ475JN4OZv6
 pYdpW9VA==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsgy-000EAJ-5v; Wed, 28 Apr 2021 22:30:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id C9C991F42CA8
Received: by jupiter.universe (Postfix, from userid 1000)
 id A528F4800BA; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@collabora.com
Subject: [PATCHv2 0/5] Support for GE B1x5v2 and B1x5Pv2
Date: Thu, 29 Apr 2021 00:29:48 +0200
Message-Id: <20210428222953.235280-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_153000_391349_82FCD0B7 
X-CRM114-Status: GOOD (  18.07  )
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

Hi,

This series adds support for another General Electric patient
monitor series (similar to existing Bx50v3), which is based on
i.MX6DL using Congatec's QMX6 module.

The module uses an I2C RTC to provide the i.MX6 32768 Hz clock,
so it's important to keep it enabled. Not doing so results in
incorrect timings of watchdog and i.MX6 RTC. The bootloader
enables the watchdog, so disabling the clock results in system
reboot. [0]

The second patch is required for B155v2, which uses a 1366x768
G156XTN01 panel. The 1366 width is not supported by the display
pipeline and result in boot hanging without the patch. [1]

Patches 3+4 are updating DT bindings for the new board compatible
values.

Patch 5 adds the board files.

Changes since PATCHv1:
 * https://lore.kernel.org/lkml/20210222171247.97609-1-sebastian.reichel@collabora.com/
 * drop patch 5 (applied)
 * instead of using 'protected-clocks' in RTC node, add fixed-clock
   node as suggested by Saravana Kannan
 * rebased to current master (68a32ba14177)

Thanks,

[0] There has been a discussion for the problem on the mailinglists
last year. The discussion died off, when I told people their ideas
don't work. I hope using protected-clocks is fine for this usecase.

https://lore.kernel.org/linux-clk/20191108170135.9053-1-sebastian.reichel@collabora.com/

[1] I've sent this before as a separate patch in September, but
nobody seemed to care. This adds full context for the problem.

https://lore.kernel.org/dri-devel/20200910162831.321556-1-sebastian.reichel@collabora.com/

-- Sebastian

Sebastian Reichel (5):
  rtc: m41t80: add support for fixed clock
  drm/imx: Add 8 pixel alignment fix
  dt-bindings: vendor-prefixes: add congatec
  dt-bindings: arm: fsl: add GE B1x5pv2 boards
  ARM: dts: imx6: Add GE B1x5v2

 .../devicetree/bindings/arm/fsl.yaml          |  11 +
 .../devicetree/bindings/rtc/rtc-m41t80.txt    |   9 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-b105pv2.dts          |  35 +
 arch/arm/boot/dts/imx6dl-b105v2.dts           |  35 +
 arch/arm/boot/dts/imx6dl-b125pv2.dts          |  33 +
 arch/arm/boot/dts/imx6dl-b125v2.dts           |  33 +
 arch/arm/boot/dts/imx6dl-b155v2.dts           |  36 +
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi         | 434 ++++++++++++
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi          |  61 ++
 arch/arm/boot/dts/imx6dl-qmx6.dtsi            | 624 ++++++++++++++++++
 drivers/gpu/drm/imx/imx-drm-core.c            |  19 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |   5 +
 drivers/gpu/drm/imx/ipuv3-crtc.c              |  11 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  19 +-
 drivers/gpu/ipu-v3/ipu-dc.c                   |   5 +
 drivers/gpu/ipu-v3/ipu-di.c                   |   7 +
 drivers/rtc/rtc-m41t80.c                      |  12 +
 19 files changed, 1390 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-b105pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b105v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b155v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-qmx6.dtsi

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
