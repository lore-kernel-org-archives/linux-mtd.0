Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF6C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JtskTFvnpIZev5nlZjufKb4dxvEvrVyjQYuWY1S8CqA=; b=jIEoBTEwveRWsK
	tFcv3vTaWzTK/XQSeA/dZxK0sfLj3B2oEWWv6fOpiG3ZdNJcP40i4ztCaOZkiCqPSi7LAm8yLzU2k
	2TYqXfoL5KjLJz6Jhvcd/gFps251kIwrk2dc9S5y/hcP4QF6IZMIGdaKDYVfPbxmJtMsjrUjjb+Us
	xqH9szyK1xUK4P21nwPBdO0g+69HxBLdQNra44l/7mFbBK1yezjhGAAeJctbm7YYZ9LD41Vc0RqG/
	QtT4NYoprT9Jo65Pd8+SNWCjmW3SDuhTICGDFpfTU6XOiSoHwbFyqqpfGtzKd8HExb2DjwmHRSat8
	NDdnNuak0o48JTzTGYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb06K-00BRp2-Lm; Sun, 03 Apr 2022 13:17:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb04V-00BR1n-NY; Sun, 03 Apr 2022 13:15:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b15so6577719pfm.5;
 Sun, 03 Apr 2022 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jxz5zWvm2g9eSY2ODGL8ove3tyAWCdoJG2idJFSxyD8=;
 b=o2H/4QWzTk/zNdBkAUSDEK4pO6GMHLV//IJnAHYHpdyUybgQQZgi7qFJXyhyUR7+db
 Y9tddAp1MFrXWbS5WUOMSE7LJjuM9zcrEzKJXyEDheMTvDsTjUco0eKvkA0EPaWGz8TA
 B3DNmeG/YQLokQj2vHCib8QWXkJbw9eAQTg5/Db67tGhgAtwpO1gIcVPm2VOcyDa93C4
 ic+SVUVROHAk/DT8jLhwzRrs4S03HwhApTdLw7Bevc37BlAiAsHwjWCrx5bwEPlcJe5i
 O3fAhg0dJIZ/Pxwo8jrqjp6sZgSIMD3xN6JE+UTztaxvyBan+b+/ACEKWnkdwYBFpihg
 ndgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jxz5zWvm2g9eSY2ODGL8ove3tyAWCdoJG2idJFSxyD8=;
 b=NfZkvSDmm04lZZbCIedKFBtOEj99VxJsJiPEJC3hIhTIxossBXLr3FW/ugRIk7mH34
 WoGD/Iwn8FOr0k3lcFoYWxdqfcFKIwx8JlNRrPl+ZB3C6InEtf+O8ODyBfhdgwB0S7PL
 H8wdVELurkDv39jVXcq3iguvVEOjgpuP0mUxyTjNngk21X3w5qPBanbDAq7rm7sg8cMS
 mN64qKDmpzFba6TvySSJNLiShKrw00+QzPQpFO4xv3aCNfjUCvgex1GaN6tuOgq0rJHC
 wSF1PkbcJBQjPsKj9uxvTQ2CQ1NQr9KYUjdXRothV5WYaPn0vKLHZ78Yjtt7NXB7vLbs
 Uj/w==
X-Gm-Message-State: AOAM530nZ+q7fXFoH3oslIhG3N0QhnnHXB1d91csl9LoVh5qI8gD/lZL
 BxjihjaOE+Ig7rhqrduqjuA=
X-Google-Smtp-Source: ABdhPJzWXuOL0I4hTgBoXGcaIi+ysreVyogC03sWojHMYAn2qrmBGC1IWl1JiGOF2weJ4Zhz0DD9IA==
X-Received: by 2002:a05:6a00:10c8:b0:4fa:81cc:c86e with SMTP id
 d8-20020a056a0010c800b004fa81ccc86emr19028675pfu.23.1648991710505; 
 Sun, 03 Apr 2022 06:15:10 -0700 (PDT)
Received: from guoguo-omen.lan ([2001:250:3000:7000:7978:d40d:86ff:591d])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm9272416pfu.35.2022.04.03.06.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:15:10 -0700 (PDT)
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
Subject: [PATCH resend 0/4] spi: add support for Mediatek SPI-NAND controller
Date: Sun,  3 Apr 2022 21:14:49 +0800
Message-Id: <20220403131453.1269229-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061511_844352_F5CAE9A9 
X-CRM114-Status: GOOD (  11.23  )
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

Chuanhong Guo (4):
  mtd: nand: make mtk_ecc.c a separated module
  spi: add driver for MTK SPI NAND Flash Interface
  dt-bindings: spi: add binding doc for spi-mtk-snfi
  arm64: dts: mediatek: add dt node for MTK SNFI

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |   87 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   12 +
 drivers/mtd/nand/Kconfig                      |    7 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} |    3 +-
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
 drivers/spi/Kconfig                           |   10 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-mtk-snfi.c                    | 1356 +++++++++++++++++
 .../linux/mtd/nand-ecc-mtk.h                  |    0
 12 files changed, 1478 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (99%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
