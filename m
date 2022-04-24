Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794DEC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Syq3ku/Ho61J8Dqz2+28NTtFNDnx3ygXzmAxT6/CLUc=; b=fpYlnri7whX2W6
	X8HYIwbulsIwsRY3iRr36bCeBnkIgLV4MeYvYUtdiY/Bp7fV6+kOZPDbO9/kuGf+vbOM4u+d4nFDr
	1egyjRtChZajYtbaTHmQriJMbHkCi2msguuaWbBUuaRD77tumP7qF4lQCKM2N0TyPX/kOQvmZkgQw
	3Ey8Doa0mP8BXuOlaThD4hRHYhEno/3/aqfDu0nvkxSpRfVSlxZ/obBQeOVHfuYcPp45qVwNeomkh
	SMO8DpHFUiX7mIKURhuYdUHkB8WA82FyTGw9Rl1Vj+V8fwZKHMJ1ggZO7Etnida7kQBgyfvHBvYPE
	RCtouPFs3nz8Od0WlwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niSt8-005eG8-U4; Sun, 24 Apr 2022 03:26:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niSsu-005eDY-Vy; Sun, 24 Apr 2022 03:26:06 +0000
Received: by mail-pf1-x431.google.com with SMTP id bo5so11757745pfb.4;
 Sat, 23 Apr 2022 20:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UCURloz2C/UUp8MZeMALDjrLA/KFc0+/kp+RUMTv8A=;
 b=e7dAhUbHWqmf05a424ZswtbRuWjNN+/xYyMq5h+QxYl4Pjy56rkIT0zIBKYtRZn7+Z
 t3cLpI6DrZd5jkAPSMf0ij261PrMwzcF66oAjRNekuTjK+Csrbb0OpuWFRY+HZH2hubv
 bgdUzno7JQ0XvqYW678vHTvJ9iQ1AgrZwP/iBTSb08QaYaiNu1324YZw3pLpGK70fVDz
 pvOIkxnSXap261IGlPKmDiiVxfJgUPh8QVf/F0D+EIHGeUTESeByXY+DdTodmli94wLg
 05cELBcqz5aBYTC+mTii7nMvffQpyvpvhX/oV6I2j8gYG0lKViuCPyvJ8pXFnz0xjDPB
 pbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6UCURloz2C/UUp8MZeMALDjrLA/KFc0+/kp+RUMTv8A=;
 b=wnQRKEZfw6V7AYJkr2Cgpb5LJ8ixA9HRb9eOIukhS9TPTGskYsztvSTm5fFHhxoDK7
 XxkOJjP+sj62xW/ey6SioE/czKewiExkSaPsiYcQIYNJIVje3ziLZGVQoZWD+B60mbUv
 iak7j7wEY3FQdMDC6qOyOWZELhtE+/EOhZul4xSB0YjCR8tDdPH1QPRhaj5NxFTyVo9l
 yy7Ce7DG5EhTeWon0n8E9vtmAtK/F6vQrvmRiQMJjm5mNXteXKJaBkbZEELtW3A7Xgcz
 wphWsXrFJlaoSohYYO3f5Z9zg3itjUGxf+59CYAHzejevAHKtnwTpdVN1K7YV/D6Ka1T
 88Ig==
X-Gm-Message-State: AOAM530kxw+BBipGG8ftp5j6iE2NEHg8N089V7Zb1KR94lDc6Jbqloyu
 aoq2h0C68e+d71/y2iakeAk=
X-Google-Smtp-Source: ABdhPJyjn3Vf81pjC8G66QDGXMDoAagvOs7RtZY0GfZrvLQRHAUWc6aOH2nuqQzVXk3hrGFLMo14LQ==
X-Received: by 2002:a63:e146:0:b0:39d:1b00:e475 with SMTP id
 h6-20020a63e146000000b0039d1b00e475mr10071390pgk.537.1650770763795; 
 Sat, 23 Apr 2022 20:26:03 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm5790724pgr.59.2022.04.23.20.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:26:02 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
Date: Sun, 24 Apr 2022 11:25:22 +0800
Message-Id: <20220424032527.673605-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_202605_097259_398144AD 
X-CRM114-Status: GOOD (  11.75  )
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

Mediatek has an extended version of their NAND Flash Interface which
has a SPI-NAND mode. In this mode, the controller can perform 1-bit
spi-mem ops for up-to 0xa0 bytes and typical SPI-NAND single, dual
and quad IO page cache ops with 2-byte address. Additionally, the
page cache ops can be performed with ECC and auto data formatting
using the ECC engine of the controller.

This patchset implements support of this mode as a separated SPI-MEM
driver with pipelined ECC engine.

Changes since v1:
 add a blank line between properties in dt binding doc
 rename ecc-engine to nand-ecc-engine for the generic properties
 fix warnings/errors from the CI

Changes since v2:
 use streamed DMA api to avoid an extra memory copy during read
 make ECC engine config a per-nand context
 take user-requested ECC strength into account

Change since v3:
 fix a missed ecc-engine rename in doc from v1

Changes since v4:
 fix typo: piplined -> pipelined
 fix missing OOB write in snfi driver
 print page format with dev_dbg instead
 replace uint*_t copied from vendor driver with u*

Changes since v5:
 add missing nfi mode register configuration in probe
 fix an off-by-one bug in mtk_snand_mac_io

Chuanhong Guo (5):
  mtd: nand: make mtk_ecc.c a separated module
  spi: add driver for MTK SPI NAND Flash Interface
  mtd: nand: mtk-ecc: also parse nand-ecc-engine if available
  spi: dt-bindings: add binding doc for spi-mtk-snfi
  arm64: dts: mediatek: add mtk-snfi for mt7622

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |   88 +
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   12 +
 drivers/mtd/nand/Kconfig                      |    7 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} |    8 +-
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
 drivers/spi/Kconfig                           |   10 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-mtk-snfi.c                    | 1470 +++++++++++++++++
 .../linux/mtd/nand-ecc-mtk.h                  |    0
 12 files changed, 1597 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
