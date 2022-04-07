Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0A3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ozsx/yBtLtk2nfNkO6UL7XGjaZMfh3aAELo/2rOBOWQ=; b=wzdoSWJjciSkCw
	wgxrrUzenyRk451Tw6cuEUig32HhKyQDcazYuNczq3plOEwhvlukWZ26RkgU+CtfMTdSU2zzspXMW
	bO+uiRrYBAzZE73iL84YmKdwrE2GgJdN4JW6GBz2HvJs5etG8BNdw3Z/5jDQfHu+IUR9mkAqeRxZ0
	+wnbPjQs7yJmXyBd2HcrDy17AJaanrSUzmQiyUBMBaOTmcD/JjfLsMxEzbU3xD57Rya8F1loiNAsh
	WXqUgR8rQPpSu7iTtvh5sLRRk8cB131dFpm2yVqPGEIAUIBMJgFseT4mJh29KMGKTBcKJ86YmBNA7
	H1qCBfm39BhUjeSSbnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncTjr-00CZPR-U8; Thu, 07 Apr 2022 15:07:59 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTjG-00CZ8R-2g; Thu, 07 Apr 2022 15:07:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id fu5so5877445pjb.1;
 Thu, 07 Apr 2022 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anaG2wq1Mp5aVsWCwB1yCAYKxx6n0K0dy0ebU/z/BNk=;
 b=JgdZwO6NbBVu0IQ1x8A0jVZWbvOBz/Afh33B9DvsLPLU1TFE8+CMSfpfLWTij4cJe2
 mk0TtAyKoo763iB5mZioA47at4pkFgZejD9Z54MXj5VD8oIqJdfQcyINnfJxHksySq8H
 Inr6qRsJ4B7gZ51Arnf4z0tHKFOZwbqCf7AGSWY3Bx8GosVH8uMFE3/5x3rECq/i2GN6
 DDW+78MGH/VdChM+8HqIn5OyWNlWKUHcaLiAhsi4jHlzwNKYZQ3UzACBP47G+CJxFINe
 yCFX/TotmccasIHPz76zQATG5nqfoJrgfOnOwY8Ge8qNQNHv0ve9YsIM0QJ4mrbar05X
 zYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anaG2wq1Mp5aVsWCwB1yCAYKxx6n0K0dy0ebU/z/BNk=;
 b=5YaZH51u7IhlQJzSbJhj+d8AGzZPwlsdSclSMv37ag6WdZ1MetQKsIZ9WsX3FjtfdO
 cqmq3QIQKO14Q12lM1qm1Ya1LlaWIXPDRuDMxoqUl+di2lDUgUZ5SVhi7ZyTO2SjwuYu
 qCjgzIqXrlOVC5bYpsYOPzQs9TlGeJeA42DqwzK7+tSReZRE0TegEbckZLX0PJribxj2
 S22UvGCmC421T6aJ8epVOJzCxfLgizso9wtp7Yiciu3OGoGcQvmDsJ81WCowL3LC5kcf
 YHAf8KoHsxlheK7W23Xl8GDfSMlktcHgLhUD/UDR490p8g04tc8zFqnb8aGpjwhe2rpp
 pang==
X-Gm-Message-State: AOAM533lZRp+JqtwdL3oC2FjXL8uVrl8oNXHriakLX3upUmndw3PqPVm
 lSr4xOrKL6xiNfB998rUs/P7X/P1X//rkOJLrPM=
X-Google-Smtp-Source: ABdhPJwonYPNnAMHSdSDX0TId9Tx03BErob+nv16vmF8mvYrT2IaMbND4jBqskaAVWnZGcA09z3Kww==
X-Received: by 2002:a17:90b:4a02:b0:1c6:c1a1:d65c with SMTP id
 kk2-20020a17090b4a0200b001c6c1a1d65cmr16454475pjb.97.1649344028136; 
 Thu, 07 Apr 2022 08:07:08 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm19329908pgo.88.2022.04.07.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:07:07 -0700 (PDT)
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
Subject: [PATCH v4 0/5] spi: add support for Mediatek SPI-NAND controller
Date: Thu,  7 Apr 2022 23:06:47 +0800
Message-Id: <20220407150652.21885-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_080722_153792_DD2AD5A0 
X-CRM114-Status: GOOD (  11.42  )
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

Change since v3:
 fix a missed ecc-engine rename in doc from v1

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
