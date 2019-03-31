Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC49BC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 12:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 926032086C
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 12:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QwDvdLW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 926032086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS0DHgG1jtmosNhnLEC90t+Nt/bOx8SMRarA5QxM+2o=; b=QwDvdLW/lKYGcN
	WIwIAcuHF1iUCTTEaNRmGMkkcW0ybfL2vLgCsZskoFl4UyqQKgfhxn9C2cMtP2P8Z0e5K8bL1/hW6
	77lQ+Lpn3fes6FqmvofrAKhI4vHCmH4P1xynW+UhvS1KyVJiNed+saUGqLkD18uimcq0iQu+H1YV5
	Q15tdcEnEEwSrzfCTUtF66BKy3rSunUPAe+A34cOxaMmh4jwNIZMHHvvS0Mhp+SqOCUQ3nALj7Rdf
	LlaYVzDILH/2CSQ+WWUI1LpYj5A8yAtaM//nW0zTZY5bwS7pFY/TGgL+VFxlKyaTuxMy/rbBMDCNL
	6tqYFIOQWYc1yAB9H0ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAZIO-0006g9-Kt; Sun, 31 Mar 2019 12:10:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAZIF-0006UW-Fn; Sun, 31 Mar 2019 12:10:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB22126040B;
 Sun, 31 Mar 2019 13:10:28 +0100 (BST)
Date: Sun, 31 Mar 2019 14:10:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 10/36] mtd: nand: Introduce the ECC engine abstraction
Message-ID: <20190331141025.3a996561@collabora.com>
In-Reply-To: <20190304222841.13899-11-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
 <20190304222841.13899-11-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_051031_787910_FA73F367 
X-CRM114-Status: GOOD (  18.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh R <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 Mar 2019 23:28:15 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Create a generic ECC engine object.
> 
> Later the ecc/engine.c file will receive more generic code coming from
> the raw NAND specific part. This is a base to instantiate ECC engine
> objects.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/Kconfig                     |   1 +
>  drivers/mtd/nand/Makefile                    |   1 +
>  drivers/mtd/nand/ecc/Kconfig                 |   6 +
>  drivers/mtd/nand/ecc/Makefile                |   3 +
>  drivers/mtd/nand/ecc/engine.c                | 138 +++++++++++++++++++
>  drivers/mtd/nand/raw/atmel/nand-controller.c |   9 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   |  12 +-
>  drivers/mtd/nand/raw/marvell_nand.c          |   7 +-
>  drivers/mtd/nand/raw/mtk_nand.c              |   4 +-
>  drivers/mtd/nand/raw/nand_base.c             |  17 +--
>  drivers/mtd/nand/raw/nand_esmt.c             |  11 +-
>  drivers/mtd/nand/raw/nand_hynix.c            |  41 +++---
>  drivers/mtd/nand/raw/nand_jedec.c            |   4 +-
>  drivers/mtd/nand/raw/nand_micron.c           |  14 +-
>  drivers/mtd/nand/raw/nand_onfi.c             |   8 +-
>  drivers/mtd/nand/raw/nand_samsung.c          |  19 +--
>  drivers/mtd/nand/raw/nand_toshiba.c          |  11 +-
>  drivers/mtd/nand/raw/sunxi_nand.c            |   5 +-
>  drivers/mtd/nand/raw/tegra_nand.c            |   9 +-
>  drivers/mtd/nand/spi/core.c                  |   4 +-
>  drivers/mtd/nand/spi/macronix.c              |   6 +-
>  drivers/mtd/nand/spi/toshiba.c               |   6 +-

Can we please split that in 3 patches:

1/ introduce the ECC framework
2/ convert spi nand
3/ convert raw nand

>  include/linux/mtd/nand.h                     |  82 ++++++++++-
>  include/linux/mtd/spinand.h                  |   2 +-
>  24 files changed, 327 insertions(+), 93 deletions(-)
>  create mode 100644 drivers/mtd/nand/ecc/Kconfig
>  create mode 100644 drivers/mtd/nand/ecc/Makefile
>  create mode 100644 drivers/mtd/nand/ecc/engine.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index d2ef8b89568e..75d0bd18b818 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -6,5 +6,6 @@ config MTD_NAND_CORE
>  source "drivers/mtd/nand/onenand/Kconfig"
>  source "drivers/mtd/nand/raw/Kconfig"
>  source "drivers/mtd/nand/spi/Kconfig"
> +source "drivers/mtd/nand/ecc/Kconfig"
>  
>  endmenu
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 7ecd80c0a66e..9772e781534d 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
>  obj-y	+= onenand/
>  obj-y	+= raw/
>  obj-y	+= spi/
> +obj-y	+= ecc/
> diff --git a/drivers/mtd/nand/ecc/Kconfig b/drivers/mtd/nand/ecc/Kconfig
> new file mode 100644
> index 000000000000..01439f66ecbf
> --- /dev/null
> +++ b/drivers/mtd/nand/ecc/Kconfig
> @@ -0,0 +1,6 @@
> +menu "ECC engine support"
> +
> +config MTD_NAND_ECC
> +	tristate
> +

There's already an MTD_NAND_ECC symbol defined in
drivers/mtd/nand/raw/Kconfig, plus I don't think we want ecc/engine.c
to be compiled as a module, but instead be embedded in nand-core.ko.
Not to mention that the name, engine.ko, is probably too generic.

> +endmenu
> diff --git a/drivers/mtd/nand/ecc/Makefile b/drivers/mtd/nand/ecc/Makefile
> new file mode 100644
> index 000000000000..c7367f834d81
> --- /dev/null
> +++ b/drivers/mtd/nand/ecc/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTD_NAND_ECC)		+= engine.o


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
