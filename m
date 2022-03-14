Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEFFC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 11:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K0ygSGwt7AtcgxBQKbPBO2Cx5WgiVi8l/B5dXZCloIc=; b=vTejQIFRIDogRa
	MmYHyL43s2EGBwiWKTIoi4c05/iz2aZFjKLyHwNpqurcUzPuHGMjMV9OBqMfKLQRMNJ1t7fWB/X/5
	IkckowbQEeMOZTFrGKYy1vtEjnmxzqvNRLlDlLeszPJ36BJOEKe8ubQ+OdSM5aVgumx7gG1C/upil
	+XZrutV7G3maNmryFKFR1Hdi8yZnA+uwTYK1RjVwLAVsvFjBsd7i1yig8eA+fG0PczU/Qfgjk2FZE
	qKIufUWLrDKDWMTKlJ/fVOvpMhBD8mnPDVqv/CfJPbp2Su2wvLRDL9UHeI8gStHAih4nePxknb6Rp
	lBZu+RU2fphryoidhf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjH6-005FTP-Hm; Mon, 14 Mar 2022 11:54:08 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjH3-005FQy-0C; Mon, 14 Mar 2022 11:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=41PUcU9tzULCiIgb8Uibh/5DuRgn44vcqHlit9be1ys=;
 b=da5ZDADTYjfUb4CkZvv1ifI5i+2sUHWvJw+dkr6l96rFI9+3qCoi3gnv
 q0ycGdD5ccrm59796HzJuglqTi/Zn7sM07eq2eqJ7FQY8P7GtUxL24J6z
 5W/zcd3/E6fo/TuVnTzoYm6lik0f+KcMTza69NkDCls6kpW1/h8PdxP5f k=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997332"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:53:59 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-can@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-spi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, platform-driver-x86@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-leds@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-clk@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-rdma@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-power@fi.rohmeurope.com, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 linux-perf-users@vger.kernel.org
Subject: [PATCH 00/30] fix typos in comments
Date: Mon, 14 Mar 2022 12:53:24 +0100
Message-Id: <20220314115354.144023-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_045405_357632_69DC0AF4 
X-CRM114-Status: UNSURE (   5.53  )
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

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

---

 drivers/base/devres.c                               |    4 ++--
 drivers/clk/qcom/gcc-sm6125.c                       |    2 +-
 drivers/clk/ti/clkctrl.c                            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c              |    4 ++--
 drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                  |    2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |    4 ++--
 drivers/gpu/drm/sti/sti_gdp.c                       |    2 +-
 drivers/infiniband/hw/qib/qib_iba7220.c             |    4 ++--
 drivers/leds/leds-pca963x.c                         |    2 +-
 drivers/media/i2c/ov5695.c                          |    2 +-
 drivers/mfd/rohm-bd9576.c                           |    2 +-
 drivers/mtd/ubi/block.c                             |    2 +-
 drivers/net/can/usb/ucan.c                          |    4 ++--
 drivers/net/ethernet/packetengines/yellowfin.c      |    2 +-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c          |    2 +-
 drivers/net/wireless/cisco/airo.c                   |    2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c    |    2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c |    6 +++---
 drivers/platform/x86/uv_sysfs.c                     |    2 +-
 drivers/s390/crypto/pkey_api.c                      |    2 +-
 drivers/scsi/aic7xxx/aicasm/aicasm.c                |    2 +-
 drivers/scsi/elx/libefc_sli/sli4.c                  |    2 +-
 drivers/scsi/lpfc/lpfc_mbox.c                       |    2 +-
 drivers/scsi/qla2xxx/qla_gs.c                       |    2 +-
 drivers/spi/spi-sun4i.c                             |    2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c           |    2 +-
 drivers/usb/gadget/udc/snps_udc_core.c              |    2 +-
 fs/kernfs/file.c                                    |    2 +-
 kernel/events/core.c                                |    2 +-
 30 files changed, 39 insertions(+), 39 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
