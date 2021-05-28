Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9782FC2B9F7
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBC061163
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 17:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBC061163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ntFAPbtpE5EKbTNxGD/bffXB336loC2eBU6nBkfKYCw=; b=YBTUca1yNaWkr4
	TVAD6j+qjfBfahWP/m/bD2vUwXc7bkJG0JuGuECx2bDAD4gFJVUIJy3TuLaZNDUmPT5mAzGBYre7K
	7S0S3vp8YsnfO9Esf/SeHRI0QJ9t3srddf0l1UN6IP2rXUgWU0pdesQoauRxhqC8mgDtRirx2E7Hs
	zf6B2Fe0dcnyNxP9rHsCOdYX8fkV/XyZGLgsSZ08/jGJ3Ug4EObsitKgmoLe693UNSf1Y0Wr0Ji4W
	ZuQM6ffZNIPRVFN8eu+oTYbG8coAQjghVK3NYYBOJGsKz7sqpavBStpS0fsqNUF7nncRGhRnjeXXW
	dMibIV5Rr3mtXPFQ7rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmfqj-00HEqa-NR; Fri, 28 May 2021 17:00:41 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmfqY-00HElC-SY; Fri, 28 May 2021 17:00:32 +0000
Received: by mail-oi1-x230.google.com with SMTP id d21so4856027oic.11;
 Fri, 28 May 2021 10:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXtOfRO6o5GclIA7TtaJiSxnvQli9KNbyA3MpTHlCbY=;
 b=Oq4qC8OrIHvZ6noXbRSA4WPmOct99FiatceU2CygDw8+FAVGnxRottlCscAwl82XSD
 jJd6MaSQQ9TP+FwSJQ1cCRxHyDPRml0DrzLyLZtxVEfGYsiELUGb5qoQM/9IwiXTaHN4
 KyuiKObQRuoEWNCletiUTR7ffUIWw9PODeJY8ACiTHPlFD6wnbgEHMvqBvMnPXMPuII8
 IZkSTWy/nvvbWzamfjyWJtK3FHLhHJKIrRUT6cHwT6Pr97QOI4jt5uwhDHfKtqVm9Vfk
 6I3j2XcjBefOood7wvYybxtC+IjVX17SdAwyOpTsD+JYvhnqC43ATjb1NTTqe6QXQP8z
 iqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wXtOfRO6o5GclIA7TtaJiSxnvQli9KNbyA3MpTHlCbY=;
 b=qYb4JeXJ1g8jHIO0R7vcIQAnf69HaYsesak4bCpIGT7UU8LGXfdAV+kYjaXJSeYE4w
 9fTPLLVp8RZfG1rBOJ/X58ygzrKx5pzZ1B6HO9wpKhlCTfOnCWC4uKm0yDiE/eYb0bzI
 tFyi71z09ryeG+LqXVruhhSsatltb8shGlSc1+W3uPluqxhWgJyRkDg1aAED2QJh40HV
 tUmpFZjQX5d/DCH2+7DsBlJuI2uLRVY5vjbb/jiIFTmIWRZnhSa7U+UimZWlGuCqH9+F
 Ps1johgLGPry3XxvtvdoloxtST3zzeQ2IK0QBTBRLmQgsUWRTZlcTdFiwDEpFNOKA2zp
 MCBA==
X-Gm-Message-State: AOAM531eYoUvvuDEJK7+x3nhF4ZSbypMb8dAa7yp2mhCHxPzmTqC6HqI
 FbX1i+JrueKtE0jZNJjyvxoXu9CC7eI=
X-Google-Smtp-Source: ABdhPJyRkZYKSMiFgVHe7xn9oMzdiJXKj76SC9iMqsjAi7U9A19tjobZ7UvT6AaveVTr4rGZLOiKgg==
X-Received: by 2002:a05:6808:144e:: with SMTP id
 x14mr10215948oiv.166.1622221228657; 
 Fri, 28 May 2021 10:00:28 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id r7sm1219084oom.46.2021.05.28.10.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 10:00:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 0/4] Add Rockchip SFC(serial flash controller) support
Date: Fri, 28 May 2021 12:00:16 -0500
Message-Id: <20210528170020.26219-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_100030_953480_1D86B36C 
X-CRM114-Status: GOOD (  16.36  )
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

From: Chris Morgan <macromorgan@hotmail.com>

I'm trying to revive an abandoned patch series for the Rockchip serial
flash controller (SFC) found on the Rockchip PX30 SOC, as well as other
SOCs by Rockchip. I'm picking this up from version 8 of the patch
series located from here:

http://patchwork.ozlabs.org/project/linux-mtd/cover/1518091958-3672-1-git-send-email-andy.yan@rock-chips.com/

Changes made in v2:
 - Reimplemented driver using spi-mem subsystem.
 - Removed power management code as I couldn't get it working properly.
 - Added device tree bindings for Odroid Go Advance.

Changes made in this new series versus the v8 of the old series:
 - Added function to read spi-rx-bus-width from device tree, in the
   event that the SPI chip supports 4x mode but only has 2 pins
   wired (such as the Odroid Go Advance).
 - Changed device tree documentation from txt to yaml format.
 - Made "reset" message a dev_dbg from a dev_info.
 - Changed read and write fifo functions to remove redundant checks.
 - Changed the write and read from relaxed to non-relaxed when
   starting the DMA transfer or reading the DMA IRQ.
 - Changed from dma_coerce_mask_and_coherent to just
   dma_set_mask_and_coherent.
 - Changed name of get_if_type to rockchip_sfc_get_if_type.

Chris Morgan (4):
  spi: rockchip-sfc: add rockchip serial flash controller driver
  spi: rockchip-sfc: Bindings for Rockchip serial flash controller
  arm64: dts: rockchip: Add SFC to PX30
  arm64: dts: rockchip: Enable SFC for Odroid Go Advance

 .../spi/rockchip,serialflash-controller.yaml  | 107 +++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  38 +
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  16 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-rockchip-sfc.c                | 856 ++++++++++++++++++
 6 files changed, 1027 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
 create mode 100644 drivers/spi/spi-rockchip-sfc.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
