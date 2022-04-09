Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636FEC433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vs0IGACMt4w6uOMQJ4LLNJXkRXAhSf26FAH+6BLpNTQ=; b=flf3TM7pGvtdaC
	0Jt4UzVsBNVc3NKhqLy+U62kxbSzeOlacMR2N4syQg1ixyBnm7j5/KEjUVs23/E3f1++QbmqncyeE
	uHJ0QrBB5P1Wuk4joZCU4JXoYVq2Q3+qbo/mtGsY3e+bSzyl4MHgP10p+ra0u74gJEv5LgdsvLjy2
	BpOUTabYLo08JTUaXnWSqHyCaX8k4a41GvpUIe1raTx92pXJ2LUnjFizs2pZjEvTKmzCNt+CYDMCn
	5le/mmXfY7JE0YbmefducVuaOxoCU+XC1eJ7DXzgoH5XhjC6WkD0hYreWnVBey2sls3v16pULZSh0
	bZeux6w8N+m6LVqmUAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd9tq-0031LY-74; Sat, 09 Apr 2022 12:09:06 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd9td-0031Hs-4j; Sat, 09 Apr 2022 12:08:54 +0000
Received: by mail-pg1-x535.google.com with SMTP id q19so10051151pgm.6;
 Sat, 09 Apr 2022 05:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1j0gO9uErjvVk6RFrnXJ0zAPni0/cjOQMUjki6bRDRg=;
 b=mCSJBLn4hULqdHwXSIn5cP9LqjNa2EQaAWPHDXyuE/W5KN/qe9UZ8gHmIu5GOVhTsy
 m3JP12oNdzMTZ1H1J+Nz2QxCRy9Z4faoeMefncI2RN/BQmzLKekRz8jwNaGh25PfQcqO
 nZValEQj20WCFkP9dU5FRzjDwrXthMLFrsxmuLMACSToOXfXuRpIBjwkq0N8RZd2OB7q
 KMuslyp//ga4sGAJOMWbqU4rebSj+HhA2vfCHG7KPqwpHitCvc3QGCO4/gB85Xg1I+2j
 R0ZN64N7TMIm4eUpuomUlk/aKFWtUPlnlmydmCKUULDaLLxho3M/k8HREp0jBGJj4+4v
 B5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1j0gO9uErjvVk6RFrnXJ0zAPni0/cjOQMUjki6bRDRg=;
 b=pJ14pPZdUaT9RT44TrxHD10NE0UE37A16DsBg/T0pz9+qk4XQQsmV9C4HfDhMw5KLc
 JBUFX2/dSo++3UTai//wSZN36TuobeikacHhE0WldHfLO5pG/t9vQHLuyXfIVP2yTpsR
 PANT854B7eKhvH1MjFvo+zY6V2YD0pjg9+NGEpqMy+4Va7Ib4DYN21la/P2t7LsTRIqG
 ksQ1XxBYLHmL61ii4PlMfKQW/Jdbh1Khc4PwvNVg8ze7bEP4AuVuPqjYXmUTVXHxXAQF
 hCLXBFl34w2+w7uNjBWlvx+xOx0xZn7yi0Q2IhEgc9lSfXqJ4VmG5fxH6GElavOAHyVK
 rZ3Q==
X-Gm-Message-State: AOAM5307lI4PVHFWINmMvENziVrrSEZ0HcR82E9o8nVnL68S1IVH06LL
 wqNFr4YBoOVBHufsjrrW7jbhKC4fYbmU0+3/7dKcfw==
X-Google-Smtp-Source: ABdhPJwCZw8vGM09uQH5mJqKTLKRtwCEU2MBeZ0r24DF3GM09731Jt5dyH3YhCVUk1ohUfhdih4umw==
X-Received: by 2002:a63:3e0c:0:b0:398:2829:58cd with SMTP id
 l12-20020a633e0c000000b00398282958cdmr19434793pga.464.1649506131992; 
 Sat, 09 Apr 2022 05:08:51 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 a85-20020a621a58000000b0050569a135besm8307357pfa.201.2022.04.09.05.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:08:51 -0700 (PDT)
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
Subject: [PATCH v5 0/5] spi: add support for Mediatek SPI-NAND controller
Date: Sat,  9 Apr 2022 20:08:14 +0800
Message-Id: <20220409120819.3124209-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_050853_220559_4AED8F2F 
X-CRM114-Status: GOOD (  11.67  )
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
 drivers/spi/spi-mtk-snfi.c                    | 1467 +++++++++++++++++
 .../linux/mtd/nand-ecc-mtk.h                  |    0
 12 files changed, 1594 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
