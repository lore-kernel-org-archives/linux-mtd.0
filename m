Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F886C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yCz0nFNeuXZKZorsWwt8GNSlKADQqeiMjd6KjbxJqeQ=; b=AK9c+tk/dVkXTR
	4dxPs1yQNyVDe3/Hs68DMF3mysblQmAdDEl8scv7qB1JNlb9MEm02PePigEyo88O+OV0MHL+1G+Si
	byJ4/BUo7rp0f096AxXZJg0pHtK+q9TvIAw/hv1/1CB0XnzJG13Pn0SdQNSxIkNweS0zXNGl0+zoR
	dhIE9l4eFeOv3M5BEIlo+Hi9P0vyC4OxUfKCNmrJCGhldN9fARzOf6FV0x+5fl9IAf34woZiqogST
	B801AZMyqrR7NZlkIM4seYsOGawkbS0U8Ip/5e/jpmVrxEhXWB1922y4HfElgnyYI6zDRVaH1Zz7/
	vhgLesIn9M4VitmwZYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMbe-00F3IG-TD; Mon, 04 Apr 2022 13:18:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMbQ-00F3Eq-6Q; Mon, 04 Apr 2022 13:18:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y6so8140380plg.2;
 Mon, 04 Apr 2022 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6wcbV+qJGrMn7chZuaCccqMghdB+FEyb/f7TqVjzMk=;
 b=aPDmaa4VmUBVfevUhfa9oVsp9CXA/Q6oNxYCswggZjwUuiXHlNu7DGmtf7XOYLWAxQ
 IhJQvynczeaTU6zBL0v1laZwoZmc0eTwzyZ2QhygoS6m9dbyv/YcUbnHiexERAZo+1Qv
 x2tEavU50K9Aa8syMgokT8FH+h52wA4keUoyQiGa5eca60nICYYjpzMXKeD211DJTNaJ
 hgLEYypsvxYWPwCmMIMPYvo+qc/wtI9Snap09lbl6rSnSJi1b3s4uWSgBvEbECBr5tcb
 KyNtgDi7cYT47/nRtnwqxgz58M+jrlP4fTkYKw4gekrU1RHYf99BhxzNVWllCbGbyapY
 GxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6wcbV+qJGrMn7chZuaCccqMghdB+FEyb/f7TqVjzMk=;
 b=2LlxJJl9cFQMkjYwgYbiOMhR5UCoxk/iRJ96QpudelZrib9wGGs14Dt6fy8YBVnT1N
 BiQMVf+8oUgVrWL5ikJIRzs9+bWNwqkkpx6ONoOL32EYp72uFDwHg0O2fOkt8Z2MAbbC
 lrpZvbwHI8lqgFsyu8syoV/eCqz1wqf+eO3eX42s4a+acEzoKyLViiXsdIOKCeFksus7
 Brmj1mAQy4WoO8jw5QDzY1fY3k/Yih+j9oH5gzJ0JmrZHAMIBOrzpfhKgFyN9/3ViI2P
 /GPvPSLmZeSsfyn11ngArKxCydW2rYEwozgYGvvs4+s4Dp73HVvJeVM/etVMDer0Loao
 a9yg==
X-Gm-Message-State: AOAM532aLRKmGl0ejFBkwSIZMt4L6wIB+VDcX/ptwNV1cdu/Wj9h7+bs
 IGfZrMXHX9kfnQUoFwa3KP0=
X-Google-Smtp-Source: ABdhPJyTtpgK1M4MzanXxpNHJL0/070QGds3fteDAO/EzkIiBE6QFiBT6V69ppxh8X3ZPaIktCqz+g==
X-Received: by 2002:a17:90a:5913:b0:1c7:2b71:65d8 with SMTP id
 k19-20020a17090a591300b001c72b7165d8mr26285607pji.87.1649078319326; 
 Mon, 04 Apr 2022 06:18:39 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm12475705pfj.43.2022.04.04.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:18:38 -0700 (PDT)
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
Subject: [PATCH v3 0/5] spi: add support for Mediatek SPI-NAND controller
Date: Mon,  4 Apr 2022 21:18:13 +0800
Message-Id: <20220404131818.1817794-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061840_278083_7A59A347 
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
driver with piplined ECC engine.

Changes since v1:
 add a blank line between properties in dt binding doc
 rename ecc-engine to nand-ecc-engine for the generic properties
 fix warnings/errors from the CI

Changes since v2:
 use streamed DMA api to avoid an extra memory copy during read
 make ECC engine config a per-nand context
 take user-requested ECC strength into account

Chuanhong Guo (5):
  mtd: nand: make mtk_ecc.c a separated module
  spi: add driver for MTK SPI NAND Flash Interface
  mtd: nand: mtk-ecc: also parse nand-ecc-engine if available
  dt-bindings: spi: add binding doc for spi-mtk-snfi
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
 drivers/spi/spi-mtk-snfi.c                    | 1442 +++++++++++++++++
 .../linux/mtd/nand-ecc-mtk.h                  |    0
 12 files changed, 1569 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
