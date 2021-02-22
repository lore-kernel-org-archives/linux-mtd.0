Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CB3C433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 17:13:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E90464F02
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 17:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E90464F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nG/Wf/U6RONgIZO20HMHlguTBprG4uWFkPN8sXrN7dM=; b=kyZWuSr7h63KWJEJJ9fS0YXY1T
	ACRPgYThp3x27Kv1owA9mCTL2QRRMG1czoZSOefpBeF/+OAUpQb4ivAj8AYXXL6MO9U383WmU9deB
	UB/nwmeYy3RjdJYmeafaZncYz8l+rYoqXWgxu33kMMYMH+nzgEGzS43cvHlTDlP+LHAKGJRkdKJDZ
	L3b6Jw2GRhfh9JCKf9iRe7XXBXCrPLTC7B9g5qeHLpC3N+YUOkgtxbglUgrIkgp91hj5CqPeZsPDY
	fcQj+h386gD5sMILmrhv1Zz0rIOrDwGhxCAa8AdLY93fY/8Gjmbo+wLULCEoy9RmJLbjfyKzyJYyS
	MYdyW0qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEElZ-0008AG-3Q; Mon, 22 Feb 2021 17:13:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEElV-000895-2v; Mon, 22 Feb 2021 17:12:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BB2A91F44325
Received: by jupiter.universe (Postfix, from userid 1000)
 id 4BBAD4800C3; Mon, 22 Feb 2021 18:12:51 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCHv1 0/6] Support for GE B1x5v2
Date: Mon, 22 Feb 2021 18:12:41 +0100
Message-Id: <20210222171247.97609-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_121257_570545_9F0E80F8 
X-CRM114-Status: GOOD (  20.34  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

Patch 5 adds missing sst25vf032b to spi-nor bindings. Checkpatch
still complains, since the binding lists all chips without vendor
prefix. This probably should be fixed when the files is moved to
YAML, but is non-trivial since those chips are manufactured by
multiple vendors. E.g. sst25vf032b can be sourced from at least
sst and microchip.

Finally patch 6 adds the board files.

Thanks,

[0] There has been a discussion for the problem on the mailinglists
last year. The discussion died off, when I told people their ideas
don't work. I hope using protected-clocks is fine for this usecase.

https://lore.kernel.org/linux-clk/20191108170135.9053-1-sebastian.reichel@collabora.com/

[1] I've sent this before as a separate patch in September, but
nobody seemed to care. This adds full context for the problem.

https://lore.kernel.org/dri-devel/20200910162831.321556-1-sebastian.reichel@collabora.com/

-- Sebastian

Sebastian Reichel (6):
  rtc: m41t80: add support for protected clock
  drm/imx: Add 8 pixel alignment fix
  dt-bindings: vendor-prefixes: add congatec
  dt-bindings: arm: fsl: add GE B1x5pv2 boards
  dt-bindings: mtd: jedec,spi-nor: add sst25vf032b
  ARM: dts: imx6: Add GE B1x5v2

 .../devicetree/bindings/arm/fsl.yaml          |  11 +
 .../devicetree/bindings/mtd/jedec,spi-nor.txt |   1 +
 .../devicetree/bindings/rtc/rtc-m41t80.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   5 +
 arch/arm/boot/dts/imx6dl-b105pv2.dts          |  35 +
 arch/arm/boot/dts/imx6dl-b105v2.dts           |  35 +
 arch/arm/boot/dts/imx6dl-b125pv2.dts          |  33 +
 arch/arm/boot/dts/imx6dl-b125v2.dts           |  33 +
 arch/arm/boot/dts/imx6dl-b155v2.dts           |  36 +
 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi         | 434 ++++++++++++
 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi          |  61 ++
 arch/arm/boot/dts/imx6dl-qmx6.dtsi            | 623 ++++++++++++++++++
 drivers/gpu/drm/imx/imx-drm-core.c            |  19 +-
 drivers/gpu/drm/imx/imx-ldb.c                 |   5 +
 drivers/gpu/drm/imx/ipuv3-crtc.c              |  11 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  19 +-
 drivers/gpu/ipu-v3/ipu-dc.c                   |   5 +
 drivers/gpu/ipu-v3/ipu-di.c                   |   7 +
 drivers/rtc/rtc-m41t80.c                      |   3 +
 20 files changed, 1373 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6dl-b105pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b105v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125pv2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b125v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b155v2.dts
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5pv2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-b1x5v2.dtsi
 create mode 100644 arch/arm/boot/dts/imx6dl-qmx6.dtsi

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
