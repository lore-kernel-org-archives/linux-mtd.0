Return-Path: <SRS0=3X/b=OC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972ABC28B57
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C2F161039
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Sep 2021 20:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C2F161039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p8DyMOfX++9jqeL7P9kgvNhDtMCbHFX17a0q+A93MhQ=; b=hzhF0115D0yd7O
	NUcw4+dmmZXAIYKvaS6otRp5Ealo7UDZEzNfM0+wZJptzgngC9uttm0msi8jKD/AoouvZfAJZTKmI
	s4/iH0RihbIE1Vb6RzjPxc7fm/RnvBX2xzrtZlKoZ5P6JH2k172dXqUjQO+clrJ7s6lHNc5u+lO0w
	uNo/KAd546HnuoDriBBKkrRPpZJX20iGi/FXfD/GgYbhPKIm/8cQVi1EkkL3Fpv1t+Xo6D5dmOOgl
	N8PshP81LiBepzLUc1YQplZcN/Syc9jqtNpUTSvZ7qikNDSNdJRIARiDJKrlA8Qst7U4L1Bt2aXlS
	U0WAhuFqwngb8wTRpEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPVnx-00H6nV-RK; Sun, 12 Sep 2021 20:10:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPVnI-00H6HL-8H
 for linux-mtd@lists.infradead.org; Sun, 12 Sep 2021 20:09:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q26so11304712wrc.7
 for <linux-mtd@lists.infradead.org>; Sun, 12 Sep 2021 13:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiqPbDCwFmlbxuuQ8fWiazbK8+HJRDKZSDH45j5yDS4=;
 b=THwDQW5aW0tqS6hx7IbEh4k3R6LOg61YJp4dnkYQ0rdPvyVHzJXXIOpL2+LusxvMfe
 a4wrGLBOOr3Diq7eVvzWwFTfU9NRkOXi4vbtd8Qpke8OuPNPvFTR2y6y3CuEfRrI5oC9
 uTm7qvw6IKca1gnycpnH/2kw1QRLZCrc8lDSyol8PKdMJ+qDBw912wpsyS9H8SF79xZ5
 4ecuFobb7f4TheRTr7knx28d+twYQ8LzYcwQY/i/Ji6/N75JZwhhgeHtILkg7bH4aG29
 udp1ydDMxBKGq/VR7UnS9J5xRZHrPvHiJDNbzZK3mdc3ZVE24yGr8nKj/lusGr1/KDmj
 Fbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiqPbDCwFmlbxuuQ8fWiazbK8+HJRDKZSDH45j5yDS4=;
 b=jD6yQBA9AqL7XP+SeF6DqoL0fqqDzvNd15nUC13yoiFJLkr49w4kSCsi5LeGGr/Qar
 I3ecOnsi81jU/Td5Mjkd9orPSJQYgIrj3b0c2W8qLa+3BOjBo4c6PiNYz19OktjNhdvo
 YgpOAh+pPHvsbYoKTrC3a96cTZvC6Oly5e2RuYZ3U5Vim9OqEop9w7wLGdQawFy12hmT
 /PigKJ7pMh+YzdSZZ90L7cNlVhnmKpoAA0DEUQUQNwaMSMOXx6LffBkJDHw6z7iG6REa
 6LyEuGoV4NkOhPYrLtF+/a4/SqA4un/bHsKE574ukgSyYFb51OVHpGzfLJPtuJy5lP84
 BF7w==
X-Gm-Message-State: AOAM532ABbzT78429BDGVPlHc+zv54y+lmfn58ZnKsML4t5U8v1Fu3pz
 GcUC6w/SSMeCeGOyEwPtyLzf/jbYAQE=
X-Google-Smtp-Source: ABdhPJx+cwbh1xTxO952gJLAARzpJGlg4ZSY4Z/pn0vStAUvtPTnJq1wrXO//SEeNwlkWFML1MlvyQ==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr8944757wro.264.1631477372674; 
 Sun, 12 Sep 2021 13:09:32 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru.
 [46.138.83.36])
 by smtp.gmail.com with ESMTPSA id v10sm5463476wrg.15.2021.09.12.13.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 13:09:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v11 00/34] NVIDIA Tegra power management patches for 5.16
Date: Sun, 12 Sep 2021 23:07:58 +0300
Message-Id: <20210912200832.12312-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_130940_329946_00054E85 
X-CRM114-Status: GOOD (  19.76  )
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

This series adds runtime PM support to Tegra drivers and enables core
voltage scaling for Tegra20/30 SoCs, resolving overheating troubles.

All patches in this series are interdependent and should go via Tegra tree.

Changelog:

v11: - Added acks and r-b from Rob Herring, Mark Brown and Miquel Raynal
       that were given to v8.

     - Corrected order of the new memory controller reset entry in
       device-trees and host1x DT binding patch, which was requested by
       Rob Herring.

     - Switched consumer drivers to use power domain state syncing done
       by new Tegra's common OPP-initialization helper.

     - Made use of new devm_pm_runtime_enable() helper that was added to
       v5.15 kernel, where appropriate.

     - Added "fuse: Use resource-managed helpers" patch.

     - Converted Tegra20/30 clk drivers to a proper platform drivers,
       which was requested by Thierry Reding.

     - Removed clk-bulk API usage from the MMC patch, which was requested
       by Thierry Reding.

     - Changed CORE power domain name to "core" in a new patch
       "Change name of core power domain".

     - Misc small fixes for problems that I found since v8, like couple
       typos in error code paths and restored working RPM for Tegra DRM
       UAPI v1 that was removed in v8 by accident.

v9-v10: Figured out remaining GENPD API changes with Ulf Hansson and
        Viresh Kumar. The OPP-sync helper that was used in v8 isn't needed
        anymore because GENPD API now allows consumer drivers to
        init rpm_pstate of power domains.

v8: - Added new generic dev_pm_opp_sync() helper that syncs OPP state with
      hardware. All drivers changed to use it. This replaces GENPD attach_dev
      callback hacks that were used in v7.

    - Added new patch patch "soc/tegra: regulators: Prepare for suspend"
      that fixes dying Tegra20 SoC after enabling VENC power domain during
      resume from suspend. It matches to what downstream kernel does on
      suspend/resume.

    - After a second thought, I dropped patches which added RPM to memory
      drivers since hardware is always-on and RPM not needed.

    - Replaced the "dummy host1x driver" patch with new "Disable unused
      host1x hardware" patch, since it's a cleaner solution.

Dmitry Osipenko (34):
  opp: Change type of dev_pm_opp_attach_genpd(names) argument
  soc/tegra: Add devm_tegra_core_dev_init_opp_table_common()
  soc/tegra: pmc: Disable PMC state syncing
  soc/tegra: Don't print error message when OPPs not available
  dt-bindings: clock: tegra-car: Document new clock sub-nodes
  clk: tegra: Support runtime PM and power domain
  dt-bindings: host1x: Document OPP and power domain properties
  dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and
    GR3D
  gpu: host1x: Add runtime PM and OPP support
  gpu: host1x: Add host1x_channel_stop()
  drm/tegra: dc: Support OPP and SoC core voltage scaling
  drm/tegra: hdmi: Add OPP support
  drm/tegra: gr2d: Support generic power domain and runtime PM
  drm/tegra: gr3d: Support generic power domain and runtime PM
  drm/tegra: vic: Support system suspend
  usb: chipidea: tegra: Add runtime PM and OPP support
  bus: tegra-gmi: Add runtime PM and OPP support
  pwm: tegra: Add runtime PM and OPP support
  mmc: sdhci-tegra: Add runtime PM and OPP support
  mtd: rawnand: tegra: Add runtime PM and OPP support
  spi: tegra20-slink: Add OPP support
  media: dt: bindings: tegra-vde: Convert to schema
  media: dt: bindings: tegra-vde: Document OPP and power domain
  media: staging: tegra-vde: Support generic power domain
  soc/tegra: fuse: Reset hardware
  soc/tegra: fuse: Use resource-managed helpers
  soc/tegra: regulators: Prepare for suspend
  soc/tegra: pmc: Change name of core power domain
  soc/tegra: pmc: Enable core domain support for Tegra20 and Tegra30
  ARM: tegra: Add OPP tables and power domains to Tegra20 device-trees
  ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
  ARM: tegra: Add Memory Client resets to Tegra20 GR2D, GR3D and Host1x
  ARM: tegra: Add Memory Client resets to Tegra30 GR2D, GR3D and Host1x
  ARM: tegra20/30: Disable unused host1x hardware

 .../bindings/clock/nvidia,tegra20-car.yaml    |   37 +
 .../display/tegra/nvidia,tegra20-host1x.txt   |   53 +
 .../bindings/media/nvidia,tegra-vde.txt       |   64 -
 .../bindings/media/nvidia,tegra-vde.yaml      |  119 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |    1 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |    3 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |    3 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |    1 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  941 +++++++++++
 arch/arm/boot/dts/tegra20-seaboard.dts        |    3 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    3 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |    9 +
 arch/arm/boot/dts/tegra20-ventana.dts         |    1 +
 arch/arm/boot/dts/tegra20.dtsi                |  116 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    1 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  175 +-
 drivers/bus/tegra-gmi.c                       |   52 +-
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-device.c                |  222 +++
 drivers/clk/tegra/clk-pll.c                   |    2 +-
 drivers/clk/tegra/clk-super.c                 |    2 +-
 drivers/clk/tegra/clk-tegra20.c               |   77 +-
 drivers/clk/tegra/clk-tegra30.c               |  116 +-
 drivers/clk/tegra/clk.c                       |   75 +-
 drivers/clk/tegra/clk.h                       |    2 +
 drivers/gpu/drm/tegra/dc.c                    |   74 +
 drivers/gpu/drm/tegra/dc.h                    |    2 +
 drivers/gpu/drm/tegra/gr2d.c                  |  155 +-
 drivers/gpu/drm/tegra/gr3d.c                  |  388 ++++-
 drivers/gpu/drm/tegra/hdmi.c                  |   16 +-
 drivers/gpu/drm/tegra/vic.c                   |    4 +
 drivers/gpu/host1x/channel.c                  |    8 +
 drivers/gpu/host1x/debug.c                    |   15 +
 drivers/gpu/host1x/dev.c                      |  151 +-
 drivers/gpu/host1x/dev.h                      |    3 +-
 drivers/gpu/host1x/hw/channel_hw.c            |   44 +-
 drivers/gpu/host1x/intr.c                     |    3 -
 drivers/gpu/host1x/syncpt.c                   |    5 +-
 drivers/mmc/host/sdhci-tegra.c                |   82 +-
 drivers/mtd/nand/raw/tegra_nand.c             |   55 +-
 drivers/opp/core.c                            |    6 +-
 drivers/pwm/pwm-tegra.c                       |   88 +-
 drivers/soc/tegra/common.c                    |    4 +-
 drivers/soc/tegra/fuse/fuse-tegra.c           |   51 +-
 drivers/soc/tegra/fuse/fuse-tegra20.c         |   33 +-
 drivers/soc/tegra/fuse/fuse.h                 |    1 +
 drivers/soc/tegra/pmc.c                       |   19 +-
 drivers/soc/tegra/regulators-tegra20.c        |   99 ++
 drivers/soc/tegra/regulators-tegra30.c        |  122 ++
 drivers/spi/spi-tegra20-slink.c               |   10 +-
 drivers/staging/media/tegra-vde/vde.c         |   57 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c          |   53 +-
 include/linux/host1x.h                        |    1 +
 include/linux/pm_opp.h                        |    8 +-
 include/soc/tegra/common.h                    |   24 +
 60 files changed, 4739 insertions(+), 353 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 create mode 100644 drivers/clk/tegra/clk-device.c

-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
