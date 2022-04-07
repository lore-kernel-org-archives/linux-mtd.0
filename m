Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820FFC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 18:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30aH2ReKV5+WFSAodjmd7F+k33POyFTY6Vg18hGos60=; b=RwocN/8bFAw3kQ
	Uv+FtnFEEI1Lmb6M2c+xq14UPQRIfcIvKILNpcvggl5YCdb82RizeMsfoGlwmgLkFStRj6D8XL1LF
	mzubejkrh88B6maUz2XVqMXFbWxSnLZCH7AkXnjDsRVduVN8juxGb4CEVOz3Z10UwcZiPMsTM9ppn
	B0GL5j/hv7ITDMYkny3Szbjxh3nEb92cBKjBGj+Ozwc7xgV+qS7lpsYQ6lE34q7KotsdwsORaGupc
	2RjTbdd1qtEO0gCXau6qQeOYBDQ7adeEjPP07WndbjAbtQ5FsPC1k82A2F9LTKqBX8rGpvNuvMUqf
	kF5of99zfLBsE2O7tW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncX5s-00DZ9I-8m; Thu, 07 Apr 2022 18:42:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncX5g-00DZ7l-Gy; Thu, 07 Apr 2022 18:42:46 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ncX4w-0001rM-SW; Thu, 07 Apr 2022 20:41:59 +0200
Date: Thu, 7 Apr 2022 19:41:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
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
 Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4 0/5] spi: add support for Mediatek SPI-NAND controller
Message-ID: <Yk8wctUzF7eWYOZD@makrotopia.org>
References: <20220407150652.21885-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407150652.21885-1-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_114244_585635_6B546CE7 
X-CRM114-Status: GOOD (  18.74  )
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

On Thu, Apr 07, 2022 at 11:06:47PM +0800, Chuanhong Guo wrote:
> Mediatek has an extended version of their NAND Flash Interface which
> has a SPI-NAND mode. In this mode, the controller can perform 1-bit
> spi-mem ops for up-to 0xa0 bytes and typical SPI-NAND single, dual
> and quad IO page cache ops with 2-byte address. Additionally, the
> page cache ops can be performed with ECC and auto data formatting
> using the ECC engine of the controller.
> 
> This patchset implements support of this mode as a separated SPI-MEM
> driver with piplined ECC engine.
              ^^^^^^^^
missing 'e':  pipelined

For the whole series:
Tested-by: Daniel Golle <daniel@makrotopia.org>

> 
> Changes since v1:
>  add a blank line between properties in dt binding doc
>  rename ecc-engine to nand-ecc-engine for the generic properties
>  fix warnings/errors from the CI
> 
> Changes since v2:
>  use streamed DMA api to avoid an extra memory copy during read
>  make ECC engine config a per-nand context
>  take user-requested ECC strength into account
> 
> Change since v3:
>  fix a missed ecc-engine rename in doc from v1
> 
> Chuanhong Guo (5):
>   mtd: nand: make mtk_ecc.c a separated module
>   spi: add driver for MTK SPI NAND Flash Interface
>   mtd: nand: mtk-ecc: also parse nand-ecc-engine if available
>   dt-bindings: spi: add binding doc for spi-mtk-snfi
>   arm64: dts: mediatek: add mtk-snfi for mt7622
> 
>  .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |   88 +
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   12 +
>  drivers/mtd/nand/Kconfig                      |    7 +
>  drivers/mtd/nand/Makefile                     |    1 +
>  drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} |    8 +-
>  drivers/mtd/nand/raw/Kconfig                  |    1 +
>  drivers/mtd/nand/raw/Makefile                 |    2 +-
>  drivers/mtd/nand/raw/mtk_nand.c               |    2 +-
>  drivers/spi/Kconfig                           |   10 +
>  drivers/spi/Makefile                          |    1 +
>  drivers/spi/spi-mtk-snfi.c                    | 1442 +++++++++++++++++
>  .../linux/mtd/nand-ecc-mtk.h                  |    0
>  12 files changed, 1569 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
>  rename drivers/mtd/nand/{raw/mtk_ecc.c => ecc-mtk.c} (98%)
>  create mode 100644 drivers/spi/spi-mtk-snfi.c
>  rename drivers/mtd/nand/raw/mtk_ecc.h => include/linux/mtd/nand-ecc-mtk.h (100%)
> 
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
