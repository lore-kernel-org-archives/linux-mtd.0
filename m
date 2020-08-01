Return-Path: <SRS0=Mklv=BL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A27FC433DF
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:25:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0869B2076A
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Aug 2020 12:25:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5kLB4QV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j66cZ0ST"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0869B2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TrM2FC1hyh1DJB+JCQjmzlZy1pM3X4lS8EXmvkHR0LQ=; b=d5kLB4QVjOvVrVy3O1nMErjHYK
	N4BqHlhFsj9QQVQNGsJwqtbeLWAc6w+weVAgch3v5eWmKBNMH3hVcdnefrx538xl38I/kCgnZPWJQ
	g2uPnekeDcomzF7zzLnrKo0SEYT/dBA+bwq1grmULUD881SDs81VK4q31MkNgZqUCrofQd0HXs770
	fF3YSrt4v1Cw5YkAspg6J5Nf394JuUAbeXZtlu7i1P8RozubWKVS7hIldfxd83xkyUwrkdqRrBuMF
	sA3BwhjuO8R+yv8sD1rVfLiN3jmxe+q/B1NZpwRvF2V0/n/UUhcYFJArIEhXeNVl33LpCcj0H+0HW
	MbU2pM4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1qYz-0005ma-D0; Sat, 01 Aug 2020 12:24:33 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1qYs-0005m0-FR
 for linux-mtd@lists.infradead.org; Sat, 01 Aug 2020 12:24:27 +0000
Received: by mail-ej1-x641.google.com with SMTP id bo3so11390219ejb.11
 for <linux-mtd@lists.infradead.org>; Sat, 01 Aug 2020 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T7aPF82SA5wWWFZavl8BJzxoy0LUNqXZ1nMb9d5sWLA=;
 b=j66cZ0STMIZTim+8iu9l4yKXtG8ZTanGI8z+X1wR0aquCIkjlSQ3uq144NXbHFRqYq
 pryOrLm0Tk4WjXIpQPSZ9hc5epP0b8/seyPyQa+oa84ubNQfoqeMdFAeOwHM5c7f8gs6
 iw1UY5HeZyBDIl6k0tfTCuIswWS1yzXqU96nzIlAzw9U72XKPoXpyeW/y8zsFeP4eni7
 u92WbfkYX/y3wS58Nh5M614LPj1IL5Sgqlo04ji1dBuFIvc+ym23L2TB1sTW89cBJDl5
 Jm1eicn/zIgYkq2QWzqabG/A92wScoWb3O1Q68yCp6is3jqAAXrCric1VJ3YyUqhFsVs
 VMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T7aPF82SA5wWWFZavl8BJzxoy0LUNqXZ1nMb9d5sWLA=;
 b=ucGRJ4BfAUNOcjU1fsVv7ECrmZBh6Cv/qGxmGRagA8cnUtLFLCorYofLT5HJs14Bkf
 pqAqkXL+L+NYAYVH4rQDLhMX+TXS8SJzZQghtzLr2/70EcV755R5KMJ/+2R7YhhNGzji
 b+UD60NHARZVKJpew0O9cPnQmVYPPCr9sU7v0u0/IVW9utWdYTvk/zoot+gPGasJgmrw
 6qvP9/Lu4HKCi8P5F/nfcP/nxx0LMTFMxmUQVtC/6wmMMaCFJcOEmib0lj+3Sw+RWZvg
 9jvZoKKflvwoDwAsYiMB1Gum43noweJk/Z0jI0ir7LLWzD4WWvgJIttC7Tf+Hk/7BC2X
 nBmQ==
X-Gm-Message-State: AOAM532+KT1PdxyTgbIm8aPQrB5Nw17XUKRFr7jR2DBgyKTy8GCYXFYb
 1Hl5WtvzB0Y0dtO2/0olLBfCz3LoPWVUEw==
X-Google-Smtp-Source: ABdhPJzoUNKtZROrtg5oRTHrqWYi9kdFEI+ce31VxUN0Y2Yt/rL0DBWkJLpuSAyDhwqGzfm7zy5ymA==
X-Received: by 2002:a17:906:b146:: with SMTP id
 bt6mr8432804ejb.138.1596284663809; 
 Sat, 01 Aug 2020 05:24:23 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:22 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
Date: Sat,  1 Aug 2020 13:24:29 +0200
Message-Id: <20200801112446.149549-1-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_082426_549422_7C49ED94 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 skhan@linuxfoundation.org, bjorn@helgaas.com, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the 
dependencies on the return value of these functions are removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid value
thus it indicates some kind of error.

In some cases it madkes sence to make the calling function return void
without causing any bug. Future callers can use the value obtained from
these functions for validation. This case pertain to cs5536_read() and 
edac_pci_read_dword()

MERGE:
There is no dependency.
Merge individually

Saheed O. Bolarinwa (17):
  ata: Drop uses of pci_read_config_*() return value
  atm: Drop uses of pci_read_config_*() return value
  bcma: Drop uses of pci_read_config_*() return value
  hwrng: Drop uses of pci_read_config_*() return value
  dmaengine: ioat: Drop uses of pci_read_config_*() return value
  edac: Drop uses of pci_read_config_*() return value
  fpga: altera-cvp: Drop uses of pci_read_config_*() return value
  gpio: Drop uses of pci_read_config_*() return value
  drm/i915/vga: Drop uses of pci_read_config_*() return value
  hwmon: Drop uses of pci_read_config_*() return value
  intel_th: pci: Drop uses of pci_read_config_*() return value
  i2c: Drop uses of pci_read_config_*() return value
  ide: Drop uses of pci_read_config_*() return value
  IB: Drop uses of pci_read_config_*() return value
  iommu/vt-d: Drop uses of pci_read_config_*() return value
  mtd: Drop uses of pci_read_config_*() return value
  net: Drop uses of pci_read_config_*() return value

 drivers/ata/pata_cs5536.c                     |  6 +--
 drivers/ata/pata_rz1000.c                     |  3 +-
 drivers/atm/eni.c                             |  3 +-
 drivers/atm/he.c                              | 12 +++--
 drivers/atm/idt77252.c                        |  9 ++--
 drivers/atm/iphase.c                          | 46 ++++++++++---------
 drivers/atm/lanai.c                           |  4 +-
 drivers/atm/nicstar.c                         |  3 +-
 drivers/atm/zatm.c                            |  9 ++--
 drivers/bcma/host_pci.c                       |  6 ++-
 drivers/char/hw_random/amd-rng.c              |  6 +--
 drivers/dma/ioat/dma.c                        |  6 +--
 drivers/edac/amd64_edac.c                     |  8 ++--
 drivers/edac/amd8111_edac.c                   | 16 ++-----
 drivers/edac/amd8131_edac.c                   |  6 +--
 drivers/edac/i82443bxgx_edac.c                |  3 +-
 drivers/edac/sb_edac.c                        | 12 +++--
 drivers/edac/skx_common.c                     | 18 +++++---
 drivers/fpga/altera-cvp.c                     |  8 ++--
 drivers/gpio/gpio-amd8111.c                   |  7 ++-
 drivers/gpio/gpio-rdc321x.c                   | 21 +++++----
 drivers/gpu/drm/i915/display/intel_vga.c      |  3 +-
 drivers/hwmon/i5k_amb.c                       | 12 +++--
 drivers/hwmon/vt8231.c                        |  8 ++--
 drivers/hwtracing/intel_th/pci.c              | 12 ++---
 drivers/i2c/busses/i2c-ali15x3.c              |  6 ++-
 drivers/i2c/busses/i2c-elektor.c              |  3 +-
 drivers/i2c/busses/i2c-nforce2.c              |  4 +-
 drivers/i2c/busses/i2c-sis5595.c              | 17 ++++---
 drivers/i2c/busses/i2c-sis630.c               |  7 +--
 drivers/i2c/busses/i2c-viapro.c               | 11 +++--
 drivers/ide/cs5536.c                          |  6 +--
 drivers/ide/rz1000.c                          |  3 +-
 drivers/ide/setup-pci.c                       | 26 +++++++----
 drivers/infiniband/hw/hfi1/pcie.c             | 38 +++++++--------
 drivers/infiniband/hw/mthca/mthca_reset.c     | 19 ++++----
 drivers/iommu/intel/iommu.c                   |  6 ++-
 drivers/mtd/maps/ichxrom.c                    |  4 +-
 drivers/net/can/peak_canfd/peak_pciefd_main.c |  6 ++-
 drivers/net/can/sja1000/peak_pci.c            |  6 ++-
 drivers/net/ethernet/agere/et131x.c           | 11 +++--
 .../ethernet/broadcom/bnx2x/bnx2x_ethtool.c   |  5 +-
 .../cavium/liquidio/cn23xx_pf_device.c        |  4 +-
 drivers/net/ethernet/marvell/sky2.c           |  5 +-
 drivers/net/ethernet/mellanox/mlx4/catas.c    |  7 +--
 drivers/net/ethernet/mellanox/mlx4/reset.c    | 10 ++--
 .../net/ethernet/myricom/myri10ge/myri10ge.c  |  4 +-
 drivers/net/wan/farsync.c                     |  5 +-
 .../broadcom/brcm80211/brcmfmac/pcie.c        |  4 +-
 .../net/wireless/intel/iwlwifi/pcie/trans.c   | 15 ++++--
 50 files changed, 270 insertions(+), 209 deletions(-)

-- 
2.18.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
