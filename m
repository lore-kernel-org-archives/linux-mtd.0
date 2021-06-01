Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AD9C47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EBD60FD8
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EBD60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2x8D/sUlRHLGhE5js0e9jxlPPhgRyJ0K6ceGsU4UJa8=; b=ANwI+aT1LhEk9q
	EFEV99tLbTLlmdZXjLQHjiEUZZ+jrnNRTMMVSo8SnMWqLg0YJjfD7Vui9oIc4Ybp9KapBk9vmvSXr
	h5wWhvGbe7N+wSIpagsQt7HZi9fA/ihaCcqHq3fucxNzwMJWkjwXZGQ7WE712ud9izi15aQhdnlVv
	EIXfMkH4hV1Op5buq1klULiJyMnaeZwBi7kEMVaM2V/owoMduY6Mhak0hvgEtlWrUS3t6PfJbO65o
	elBZPuOtRSOjp8gC9xlW/e59QZhcxFt2gAfWwUKqJljIcaROk2842EFw46/qIJozPrABX1jKo2Q6f
	+SMsdYS4ewLNZ61rccEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loAig-000hen-1J; Tue, 01 Jun 2021 20:10:34 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loAic-000hdP-3w; Tue, 01 Jun 2021 20:10:31 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so467461otp.4; 
 Tue, 01 Jun 2021 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mVzJbLz4avCQ6iqrDP+6FIaD1/lSBVo1cZUC0xRIGSg=;
 b=MGSQa6HI1+FfVt33IV019bZ9jcReWkaWmALHx9O1efEdzlLjhTkkZr4p8g2hpx/X9f
 MDDJQbFRwlW81g5nu9+s/FnF+EL+7aTgZoXAZYHKR63tdQDDh9VF1Dw2NVo0jDi1J+U9
 8A6M3HHFo1CwU2fDHNq0wJfEbtShF0C9Pwj/TSUbTgSqRp9vwnL+cmi/lVJoGYb3r4yj
 YnV4htVFYCvLKkJR+J5muOPIhG2wRusY7FybrdV5lTsY3cfx1vt3sr+qQEia6XlXkpwP
 Xsb6i8OEHotaM0Zp8P7Vj3sObNdJpw04N9pHYfe7VWBpkBbjmLn0beTXIVJfX+nuxUKa
 /sQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mVzJbLz4avCQ6iqrDP+6FIaD1/lSBVo1cZUC0xRIGSg=;
 b=iabiGDBF5u6A6guB0X85x/3riVSv5rxiT/Tu6mXdDM3HEHcNmDIGb+B8SkewuEx5/C
 zdRO97e2zpImTJwMB5efuTr1LiatVht2OQWue6zQ00duv/zlPwRQ2JfyT/P/Jf7fjf2M
 VhU2jSte+J1VdG4N5g8APc7276ftE7RW23ZBRBI6I1IYCcOCAF8Vdn+VvQiMkYDAe+Q/
 AaaNohYzbWL2sGbJ3xtsmYlRYhVmGL9rlR+5eLZuGrwYWQJJ1z9DaEsBLZc6XzMrCEGC
 pSXzzQCveG7+c7usGiIEj+Qlh/fKBiLhDz9fjl8BV8gQ0Zmbs9jrIJ9G/CZoYlQ25NWG
 iyPg==
X-Gm-Message-State: AOAM531aIs5mRhBQ15+EMFvUxE5Im9hk4acwmM/CWC0mlWYAUqaVTHyv
 LmKDMOFB0zAp2WSW19XfPBs=
X-Google-Smtp-Source: ABdhPJy27nnsH60MFLgfdysVusgNgz+AOH7FfCeHXGCEMhWPeuQy5PQF5oTBspIRGQnxMdGHv/NrGQ==
X-Received: by 2002:a05:6830:838:: with SMTP id
 t24mr21941698ots.119.1622578229060; 
 Tue, 01 Jun 2021 13:10:29 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id p25sm468118ood.4.2021.06.01.13.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:10:28 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de, jbx6244@gmail.com,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 0/4] Add Rockchip SFC(serial flash controller) support
Date: Tue,  1 Jun 2021 15:10:17 -0500
Message-Id: <20210601201021.4406-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_131030_209951_9A807578 
X-CRM114-Status: GOOD (  20.14  )
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

Changes made in v3:
 - Changed the name of the clocks to sfc/ahb (from clk-sfc/clk-hsfc).
 - Changed the compatible string from rockchip,sfc to
   rockchip,rk3036-sfc. A quick glance at the datasheets suggests this
   driver should work for the PX30, RK180x, RK3036, RK312x, RK3308 and
   RV1108 SoCs, and possibly more. However, I am currently only able
   to test this on a PX30 (an RK3326). The technical reference manuals
   appear to list the same registers for each device.
 - Corrected devicetree documentation for formatting and to note these
   changes.
 - Replaced the maintainer with Heiko Stuebner and myself, as we will
   take ownership of this going forward.
 - Noted that the device (per the reference manual) supports 4 CS, but
   I am only able to test a single CS (CS 0).
 - Reordered patches to comply with upstream rules.

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
  dt-bindings: rockchip-sfc: Bindings for Rockchip serial flash
    controller
  spi: rockchip-sfc: add rockchip serial flash controller driver
  arm64: dts: rockchip: Add SFC to PX30
  arm64: dts: rockchip: Enable SFC for Odroid Go Advance

 .../devicetree/bindings/spi/rockchip,sfc.yaml |  87 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  38 +
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  16 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-rockchip-sfc.c                | 861 ++++++++++++++++++
 6 files changed, 1012 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/rockchip,sfc.yaml
 create mode 100644 drivers/spi/spi-rockchip-sfc.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
