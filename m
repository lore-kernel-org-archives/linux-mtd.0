Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A2DC47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:17:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A66860FE9
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A66860FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+awvYQkUdj488NiDzKmgKYvv9pqCWzzekRrfJg3dnGo=; b=Ia8KlE4nN6Bsjn
	Y9GlQK066L7N9OVlxQT2OBZXHp79zU++F0oh+SarRaikiyb/AMZAYSWAfpVthLy/9Fku0o1cF7Smt
	UWEoyesmOWX9CwpUOqcehnAdq2KIqhNtQ+w9jmfA8QCz1U9Jq63lTSGXM+QlazKH/2nGHayM8Sw+N
	jRKUFKFbflIqRNE8IrYbEOz4sdB2WSOIq2LIbFt6siHhN6S6GlaSNjhkwsNkHPOrbYUZnOQvE/KnU
	Oixv+Nh88zqwbRDocF5oigrcFCwZg3VwEd0kLE9GBs0jyKgrvaie7RyYrU2kyRWZrfLoJ8/P6puLl
	NW6LY7VL+gMn6RFrboYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llz1M-00GslN-PU; Wed, 26 May 2021 19:16:49 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lly5K-00GRJv-7Y; Wed, 26 May 2021 18:16:51 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so1882258oty.7; 
 Wed, 26 May 2021 11:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1e+2IIjlGxptaH7YBAsoGKlpTSpcg1yqw57SuGkSKU=;
 b=fyKwOFbIF/BlXTzrKlyGP95eoT0JsMhDGzqX0NuS5ZwqBhS0lelhAwYCuv6j2hOGmS
 xG63pjpNHN0zLqjR0zRQYeGrpDmEA7EBaLeNn4e1rkvQXOronL5K5MzFet2uJX35nNtk
 JRwsN1zqz79dqajnyGoxpDoLAXsi+qxzwOsXSjigDhntSlTBuzF8qN7/w45SkBBNiXUg
 S+wbHIxNVDkDHfAMS7gCUzerbc9o4lERLozGZ8lY+GarsyEMnG0V6Ex7Nsh38zW0ZePo
 aPElKvIi5WycpASUGMxfENfT1dAM3nxp4Woz+M5WikGZ/iSmO+bpJZd1RBdPpS3HbE6r
 tbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1e+2IIjlGxptaH7YBAsoGKlpTSpcg1yqw57SuGkSKU=;
 b=mti/5V0QJ06lS9u7KBkpj2p/K0m0bFt4Lj8uQieCtQmDnKQWOGsPtdl3BSCw+n7GZN
 0TP5Idjr82LVnMIr0hOvc+MLK4BWaa96DX0zZDHFtFcsKKHNNMfxxtCM4evVovirBNei
 DwGPF8CCR4JcKYXpHSrAsrg0J3JpIPVhcIAO9zgUYEUf6r++aWOYXtqaIRc38vtzFFl8
 8tnRTiiuDcrUrY+KMM1/hwz5hv6F3YiHPYMV6iTZGZSgmeMjGlYSAkJO+sAtlf3o8YJu
 sCkIvqsgpORw9/oYVausT1Zo3tvkfj9+rZ2kmtcAlkJatKLMy1MTtmh9T0i5Z7UXkMDV
 gynw==
X-Gm-Message-State: AOAM531oHHT1vQRj5EXZXxNDgPYFPWGQJru5DsUQ5aqxyGZMNPISAUeg
 sNelYyUVWU6fzoyYp4V3Eu1jijtc5g4=
X-Google-Smtp-Source: ABdhPJx43qmjdM+zoKHDfOljWPhtZmRDSX+RICJPj5F/gE8NQ1MWqBPR/NCSZzMH3LdqwOtBAs7Jog==
X-Received: by 2002:a05:6830:1594:: with SMTP id
 i20mr3334029otr.279.1622053007920; 
 Wed, 26 May 2021 11:16:47 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id j20sm4148311oot.29.2021.05.26.11.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 11:16:47 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Add Rockchip SFC(serial flash controller) support
Date: Wed, 26 May 2021 13:16:33 -0500
Message-Id: <20210526181636.1130-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_111650_320464_55B09431 
X-CRM114-Status: GOOD (  15.87  )
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

Chris Morgan (3):
  mtd: spi-nor: add rockchip serial flash controller driver
  mtd: spi-nor: Bindings for Rockchip serial flash controller
  arm64: dts: rockchip: Add SFC to PX30

 .../mtd/rockchip,serialflash-controller.yaml  | 100 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi        |  38 +
 drivers/mtd/spi-nor/controllers/Kconfig       |   7 +
 drivers/mtd/spi-nor/controllers/Makefile      |   1 +
 .../mtd/spi-nor/controllers/rockchip-sfc.c    | 944 ++++++++++++++++++
 5 files changed, 1090 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,serialflash-controller.yaml
 create mode 100644 drivers/mtd/spi-nor/controllers/rockchip-sfc.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
