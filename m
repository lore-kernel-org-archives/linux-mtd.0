Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FD6C2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qUYArb0vHNQ4jS3qJqR+yveqdIdaOOrXsDbvOgQY/SY=; b=Qu2d4sGC0DmOs8
	iUvk5YP2m62l9/gN9P6WSFS/2t1PzioOMoCS6A8zGgISg3IY0iPs+zbOOhBpXuk8wmH5oQpc6o0wY
	Wkrtv4BOUws7dmw/mPIpCkQWYmmCGoGSvSzlgvrH6PSwuULnzICyS0nwnPqciIx2jWvbvkbPYywCd
	NJ1otkzJTEya8z6p7AOCOUg5ls7iysMfLrn3CXa/7ey2LzVv5+raKqGaY/IIyqCFE1pvFmskLEs9o
	VowFRAc9eMahR4oR+buo7vEfauDeY7EI5xG2LSPPtpZyQqK/SvMKndDelYSDw9kFFKURe0pgIWpUh
	6bbvyXj2A8QO4WwCZovQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2O-00000006AGi-1DKC;
	Thu, 20 Jun 2024 17:57:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2G-00000006AAN-2DnJ
	for linux-mtd@bombadil.infradead.org;
	Thu, 20 Jun 2024 17:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=; b=IqJLLbkw0yqbmZ0XbZtgNSDT4q
	Ff/oXAndXse5gfvrKbRAj61xgHuabQyGj3b1ohba4Pkq978Y6PfimJvpk5pe5m9aCGq8fyFsG6FtA
	+OttMbmBje4b53d+dZS8aCx6+PlYeJKj/jlAVudg4yWH9DYF5ZQEkC2b2Ckcab2ZOApRCuEYeqXQw
	M5xmLdjC+LqhRcmjoGzjqgt1BRQ/gdh70PoowfVoXiOQswFw2Zbp+u/Ier9YxzEXu2Vp2NLGj5D/e
	mFxazAbTVFJk+JmUPXIZALMyL8BcxbPlxgTIYFNpg6I0DNRVuwXpgOYeSnC+KtN4ifTUnmuc6zMNL
	Y9jkL6Og==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2A-00000007ac3-1Pm2
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 17:57:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a62ef52e837so134826866b.3
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906235; x=1719511035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=15HSo2ezmX/RnimCD35puWc7eZJztgOxAJLqYEv5r8XzUZdzgZUxmBDcCNvqvo9TmA
         eEKPeHYVGYKl5A7Nk1lGqp1cMTq027RZY/6qAj9LNEP6oCuvOl2XBl+p5nmrULTyJ7RC
         HT+7eE2JbjTg1bCsi0qJp7fS9iJyocdeMC3TVItsDWbWNTQWAsEiX9tU4LBPJaXN2SH5
         705En9ohwj2QzjVBt/UkfDnhYvpa+8Ps9iZcY+003kbWQFzbDcSwGv4x4kEuZz5L6504
         q8rLaYTkF9m16eRXBcCg/V70Eyslesi3CkvP9OyJsZIqhqJx/ruRDYcZTRd4cMO3sn8I
         pnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906235; x=1719511035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UP/GNN9hhxz4nMUGrLaNfWrPk3mVaVMWtBi9huNJxPk=;
        b=CC28L804DKdEOP694zwj1DFmua3PBV4CqEGyykoMRbz/snD6G0jqdxcBZT4hrE5hES
         RGUodD9WS8cGkWbG7F1DOkHijw02Sgp03+8Ukrcdi4myajGVOlkpffW3DU2STYisBYp8
         WIqIQqtcY67wizAxU8rnws4ZJuVmlfgU6C4mM89xxALwwCZI7albRHNlr/NWF3+mgc3G
         vNHxpDhCKh0Jxdk3FG5pxb6mkH7qct+Ek6qbsKIYTy/j2O4b0QFcMBYjnRCrnOcK/Sz2
         wvO2nrgUBCLX656LVnkLqBv+rub8Cb11RTauWwma/4c7V1VVLQipFJWeSTBX26YgSTA1
         9yGg==
X-Forwarded-Encrypted: i=1; AJvYcCW/hP1ji3s8lzLG99WquDQBNIlETUFg1qjaE9DLxD5Nn16+1izAX3ZHc6pmaib7fVTG/ZXAI9FjatSjra+nkDkL14z/mueB5wMBw3XGlg==
X-Gm-Message-State: AOJu0Yy3/n9Ito6LI7vPWlbw+tUpus2u9ZzdirvFGdHfUNdPNJVnQPCJ
	QKKTqWpcjGyGvgr4KmRbbh1ub28TY2noDMfu4qq9fi5XHiytMSEVZKhToqqNS94=
X-Google-Smtp-Source: AGHT+IHwzCxasTWecNI2BQg/1Mqv76qvz0pqMMUj9hgHTBodTuDhBkY00q2aX9YgUG43J9U17WwHFQ==
X-Received: by 2002:a17:906:a09:b0:a6e:f7bf:712e with SMTP id a640c23a62f3a-a6fab618973mr379689666b.27.1718906235388;
        Thu, 20 Jun 2024 10:57:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:14 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 00/10] Add audio support for LPC32XX CPUs
Date: Thu, 20 Jun 2024 19:56:31 +0200
Message-Id: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_185719_059938_6131035A 
X-CRM114-Status: GOOD (  15.92  )
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

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (10):
  dt-bindings: dma: pl08x: Add dma-cells description
  dt-bindings: dma: Add lpc32xx DMA mux binding
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing dma and i2s properties
  clk: lpc32xx: initialize regmap using parent syscon
  dmaengine: Add dma router for pl08x in LPC32XX SoC
  ARM: lpc32xx: Remove pl08x platform data in favor for device tree
  mtd: rawnand: lpx32xx: Request DMA channels using DT entries
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
  i2x: pnx: Use threaded irq to fix warning from del_timer_sync()

 .../devicetree/bindings/dma/arm-pl08x.yaml    |   7 +
 .../bindings/dma/nxp,lpc3220-dmamux.yaml      |  56 +++
 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  73 ++++
 MAINTAINERS                                   |  21 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |  53 ++-
 arch/arm/mach-lpc32xx/phy3250.c               |  54 ---
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/nxp/clk-lpc32xx.c                 |  10 +-
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/lpc32xx-dmamux.c                  | 195 +++++++++
 drivers/i2c/busses/i2c-pnx.c                  |   4 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |  10 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |  10 +-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 376 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  73 ++++
 19 files changed, 954 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 drivers/dma/lpc32xx-dmamux.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
