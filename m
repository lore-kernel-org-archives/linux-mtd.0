Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C4BC433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JtskTFvnpIZev5nlZjufKb4dxvEvrVyjQYuWY1S8CqA=; b=mQNfsyv4pqKkeF
	aZdaO6x4d1JFfMPeX6pEklvpacSkwwlJkpbXJ3zbTWe/lSl8EeL0h4Mj/unq3HnyKwDx0KZSEH3X0
	ASmqjzIb3f/fF93T1Zdw4/KOWbvqB/9hCOvIevWIAKY0yTPfM+vHRXEamzCJclu6UZjalO3QvEAw5
	BctOxacvrx1s3qQ2NvKLra7BKPMKipeJK8B87n27iWhc7om9rWi5xquQnsbhsweLo5ssGERgMaFPC
	yO9HECFKeskQqnMWpPn/IncOhgE5kIr3dOvruR/hXob/yvbSPXFl0jxLlRbh5Lr+ErxbO8nGSNNMz
	9lnmNTEHcjBXn/tVfpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb02O-00BPze-Bl; Sun, 03 Apr 2022 13:13:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb029-00BPwi-CD; Sun, 03 Apr 2022 13:12:49 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 ku13-20020a17090b218d00b001ca8fcd3adeso661965pjb.2; 
 Sun, 03 Apr 2022 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jxz5zWvm2g9eSY2ODGL8ove3tyAWCdoJG2idJFSxyD8=;
 b=XRJ6YJ9vdPpPa6TXlJFJxQGQeLPpk74MPpPWZ5pMZSuZfi2E0jGyTJ4wtvpnslPTi1
 77FmR0bZ/iGqrzcoszYTMBg7Pn/hbh7hqU7ZaR0lU5E7Tmb0KUivvCzotlGf31cSINEN
 zh2J89pAtJEMbCiYHSkSaIzv/Dtftx29GUl4hFhk++bjUVRlLJLH7xwbEBd6P8uh698g
 zSsNZxN3NVGMMLV0M70MYuti2rc3fuTzlVsJVDMRbLq+1MxVxVh43MkAd9hzrMGXpl3c
 BbTT1dosqQGjSjR1uUNatmE43fbNHOf968n3jK3OdSPjUp9vjG1e3zhcKVICGGso+395
 +Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jxz5zWvm2g9eSY2ODGL8ove3tyAWCdoJG2idJFSxyD8=;
 b=T3qRJTtiBr48uwNzjFOaRUwchOxutCLk0KPq8gJqbYXVjLXnyk4JMYhvuh/xM6lo2J
 N/UeU9Hy/CdpZtTNTDFb7J1kSC0qyxLm26Tn7sMYMfJUbPvs4Ti5/GnG3VpJLD8t6CKM
 maTl1Fc7T+F+xhqvLMTx5HQPemyza89fQfxxewKh3dmJEdO7ECH+MpZebOQ4eah7+5yg
 7XtZ0ysvka8ktGMfuslYVZBYDgF0HUQ2WkPBsycJD0zF+3FDJA7xYv3jhge+yUrMyUR7
 4AUDBZRfqnqnOGqQzx1fngGfQoZ9Hwr8MvtEdoFlrkBo/zGDA9qltSSwXAH4WVcliD28
 juww==
X-Gm-Message-State: AOAM530m61J+0HswOZum41EmyUu4JG/N5v3k2ylnFwzFR0Y/n40MXWGs
 d43eUjff1yYj1STb6rxyW+QkpqCKhCbPZ++42uQ=
X-Google-Smtp-Source: ABdhPJz4ktVUPNppjfKX08ecvx5yuvB1psaY3bDDN0bXA48PEm7jKzKza3v5JFQBEkaWP/eZ2kgIJQ==
X-Received: by 2002:a17:90b:3b91:b0:1ca:5f81:da1e with SMTP id
 pc17-20020a17090b3b9100b001ca5f81da1emr6897040pjb.182.1648991563494; 
 Sun, 03 Apr 2022 06:12:43 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 x123-20020a623181000000b004fdf99d25f6sm1554857pfx.80.2022.04.03.06.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:12:42 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@lists.infradead.org
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
 linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH 0/4] spi: add support for Mediatek SPI-NAND controller
Date: Sun,  3 Apr 2022 21:11:50 +0800
Message-Id: <20220403131154.1267887-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061245_457270_30934CD5 
X-CRM114-Status: GOOD (  11.55  )
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
