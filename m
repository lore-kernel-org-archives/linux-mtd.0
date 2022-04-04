Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D52C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 04:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r3p0PC6UFWRdL70ELdZVFFXIqCt78naRS2orhwn7X3s=; b=j14xY3pEV4Tseu
	UEFcM+3hv5ZojWCc97AwumqNx4xveAuQA75S1da7cJrnGLxjqjBAj4nmgqj1POnz5HM0V/jGqO1k5
	1yghxr9OZ01/wTbtCyUe2r5T16+9pJsUDxLD5p4hapdFT3DxlKmgPXAUowP8OgkM+gbgFM3uIqDho
	x49CgkmkZnavO6nRh8af1tw1DIR7WdL/JE/50qufoTxzABWUet1KjsvDXtiHcQKx7TnsPMcz0Rw1s
	WIxWcApQb5WCa87CGSarMeGEtHZT1xxCSXepiydGVXWyNm6Cqq6bVeEKwN7Gn1gVHtnabiY/usRuo
	Hy83vmG4i4Gub+Zvt/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDv7-00Cwmv-FG; Mon, 04 Apr 2022 04:02:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDuv-00Cwj3-8y; Mon, 04 Apr 2022 04:02:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id p8so7798692pfh.8;
 Sun, 03 Apr 2022 21:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gApwyK6UJMIHFi8j3HHI6lVYvVDscNhbn/b45ZD8vYw=;
 b=PpAMX76Z/yH5s5E86XWDfdb0tshq5E8aUG6vKlOuwz+RxiadMZC6gwVk8hp/IvSKdy
 pWDbVcIvhaAzCuy6MyDBJG2dxgKFmd2PUF157wQmlFwd1dygPQr7kpgfjuJPSZpZeV8W
 KJ8XB6IA9wYH8pFUDUrggUJW7xHL4Z3Jfto/zT/xPYv3oFpJgBXB6AOYoiNplFnNBxhi
 QjnpR9G8KK2BCcUi5zT0OooJ64wrDp1LHF79wrS/9T9wiMGZ5Lrpbk8fcfgAtt+rvBGB
 f/JIRwKjXsgZbcHHbbAEl/MMqr5KGQN35kxhWJzqNfO2wjz9Wqyu3wTfB+BG6AbwBbg9
 CU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gApwyK6UJMIHFi8j3HHI6lVYvVDscNhbn/b45ZD8vYw=;
 b=Nh9+/BomIWaQ8v5Un/4fBGTi4aqJ3eWaXnEvwlZBgFj+z/OSgCpYJXuFzHAoDUr2ub
 57Po597FJwY53rkaoV4PqEjdpsWe3Rb2rsLVMVTM/Rw0TAij6mjNWEbzR0nLFjHd0m3f
 pnEiPPRE1l/zpLNMc7q5AlEnLxsYvVDhIIFvKspmm4MMwG61Z8wPj5sLaCRVHqyVqs1m
 J81pE4Gh2xMewGs8penejvRMeV3OydBadU5uW83kyJfq2wUJHoB5sDm6xOrAm0TT8efm
 GjxlDVTrkCxcnuHbgNiyT11JD/SvaXEcxCcmVXZRmp/K3zrRvXYDoMbvws/y2n0deCNm
 3+CA==
X-Gm-Message-State: AOAM531jO8avKsfLIYfL1aRihi/YMyOKERTCa8SLnesTcgGh0LrNq63P
 iTLvsp1ThztE4c5pBWXuaMQ=
X-Google-Smtp-Source: ABdhPJzYjDiKmixeywLrVGsyvmxU0FRdWO7nMbcfY2jZXT0DudGOSkM6UFaGrSEgSvmTt6mXFmBOzQ==
X-Received: by 2002:aa7:88c2:0:b0:4fa:ba98:4f6f with SMTP id
 k2-20020aa788c2000000b004faba984f6fmr22013214pff.41.1649044928130; 
 Sun, 03 Apr 2022 21:02:08 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 j70-20020a638b49000000b003985b5ddaa1sm8756191pge.49.2022.04.03.21.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 21:02:07 -0700 (PDT)
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
Subject: [PATCH v2 0/5] spi: add support for Mediatek SPI-NAND controller
Date: Mon,  4 Apr 2022 12:01:48 +0800
Message-Id: <20220404040153.1509966-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_210213_375672_B302DF8C 
X-CRM114-Status: GOOD (  11.62  )
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

Chuanhong Guo (5):
  mtd: nand: make mtk_ecc.c a separated module
  spi: add driver for MTK SPI NAND Flash Interface
  mtd: nand: mtk-ecc: also parse nand-ecc-engine if available
  dt-bindings: spi: add binding doc for spi-mtk-snfi
  arm64: dts: mediatek: add mtk-snfi for mt7622

 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |   88 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   12 +
 drivers/mtd/nand/Kconfig                      |    7 +
 drivers/mtd/nand/Makefile                     |    1 +
 drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} |    8 +-
 drivers/mtd/nand/raw/Kconfig                  |    1 +
 drivers/mtd/nand/raw/Makefile                 |    2 +-
 drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
 drivers/spi/Kconfig                           |   10 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-mtk-snfi.c                    | 1351 +++++++++++++++++
 .../linux/mtd/nand-ecc-mtk.h                  |    0
 12 files changed, 1478 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
 rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
 create mode 100644 drivers/spi/spi-mtk-snfi.c
 rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
