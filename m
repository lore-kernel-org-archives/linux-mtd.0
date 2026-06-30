Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36794C43458
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2026 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/8GSRtsu6PgO1ylgVgWHtWGLG0Fo+ERECbzUjxnF40=; b=XTO6HqfLuca+xU
	Ltkd7hIsV5TZ7CAbbq2dMtWcRqmBp21Z5ezlTlGkF3gWNDHgJun0Y7cprcVBLsc8MrKS0W92a2j3s
	HvePD/MXIsYFah5N3ikbxQ4WjoAZURKEQpyVrCSXzJP+D+P/mU5zP35MFBcjFQ9hpYMErymcsFQx7
	8RdgvQuhHaiv2jb7YKLWUWWNFoHTq0g/4/pzWk2xc/ysqeX7lrB8mK0Hho3AbPvuj8Wxxjkw3apf1
	aWE294FytAFnFQUzI4KydNGXxlrnpVWlxYgy8+FPen52QX/QRtIgnhztO8z2sdlL/ZFGuyyMygV10
	TG/3XHBrVEDnrpzRJSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDj-0000000GBIM-3sm0;
	Tue, 30 Jun 2026 07:49:27 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTDK-0000000GAUV-1OFJ
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jun 2026 07:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1782805742; x=1814341742;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dcnt9lzdlqbvPaR7FDK/tVDQKGChQFXHNrMgRqCMaI8=;
  b=DBrsfqUKr7vBclHFF5w50Qjgj/G5ThvI37wDUaub+X8naYwzIbSO6PIr
   1c5sztJt/0LDDauCc4N+p9FKDsLQuzVkwzoTmBo/TasvIj2SfHNtXyjI3
   KL6dGfHXW3z+rcXAqVuRdYj+eYt631hvDmqHZ6ThoP5kjisuGLt+kLrIk
   8=;
X-CSE-ConnectionGUID: g5tqf6d2RWGO7klcxCR+/w==
X-CSE-MsgGUID: 0k12SdbyTEyHUwETx+pzQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="99117429"
X-IronPort-AV: E=Sophos;i="6.24,233,1774306800"; 
   d="scan'208";a="99117429"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 09:47:57 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 30 Jun
 2026 09:47:57 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.043; Tue, 30 Jun 2026 09:47:57 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <ronan.dalton@alliedtelesis.co.nz>, <pratyush@kernel.org>,
	<mwalle@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<chris.packham@alliedtelesis.co.nz>, <aryan.srivastava@alliedtelesis.co.nz>
Subject: RE: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Topic: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT
 support"
Thread-Index: AQHdBRKBdcAN9mfv+k6bdaeZDwvjfLZWt11Q
Date: Tue, 30 Jun 2026 07:47:56 +0000
Message-ID: <858120735ba04d77a422adbc37135ecd@infineon.com>
References: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_004902_791558_B9046FD9 
X-CRM114-Status: GOOD (  22.42  )
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

Hi,

> This reverts commit d9cd5c9a6fe26d544551cfaa94fb0abc50c0b895.
> 
> The commit that removed support for this chip claimed that the at25
> driver was the correct driver to use for this chip. However, the at25
> driver exposes the chip as an NVMEM device, not a MTD device, so it's
> not a suitable replacement for users that want to mount a file system
> over the chip.
> 

What file system do you use?
The size of FRAM chips (hundreds of KB) sounds too small for file
systems.

> Revert the change that removed support for the MB85RS1MT FRAM chip.
> 
> Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - No changes
> 
>  drivers/mtd/spi-nor/Makefile  |  1 +
>  drivers/mtd/spi-nor/core.c    |  1 +
>  drivers/mtd/spi-nor/core.h    |  1 +
>  drivers/mtd/spi-nor/fujitsu.c | 21 +++++++++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/fujitsu.c
> 
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 5dd9c35f6b6f..9216a5a29a2b 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -5,6 +5,7 @@ spi-nor-objs                    += atmel.o
>  spi-nor-objs                   += eon.o
>  spi-nor-objs                   += esmt.o
>  spi-nor-objs                   += everspin.o
> +spi-nor-objs                   += fujitsu.o
>  spi-nor-objs                   += gigadevice.o
>  spi-nor-objs                   += intel.o
>  spi-nor-objs                   += issi.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd0..d5ebbfd3fa7f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2009,6 +2009,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
>         &spi_nor_eon,
>         &spi_nor_esmt,
>         &spi_nor_everspin,
> +       &spi_nor_fujitsu,
>         &spi_nor_gigadevice,
>         &spi_nor_intel,
>         &spi_nor_issi,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index ba2d1a862c9d..a4d906e6d07d 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -606,6 +606,7 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;
> +extern const struct spi_nor_manufacturer spi_nor_fujitsu;
>  extern const struct spi_nor_manufacturer spi_nor_gigadevice;
>  extern const struct spi_nor_manufacturer spi_nor_intel;
>  extern const struct spi_nor_manufacturer spi_nor_issi;
> diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
> new file mode 100644
> index 000000000000..69cffc5c73ef
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/fujitsu.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info fujitsu_nor_parts[] = {
> +       /* Fujitsu */
> +       { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
> +               FLAGS(SPI_NOR_NO_ERASE) },
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_fujitsu = {
> +       .name = "fujitsu",
> +       .parts = fujitsu_nor_parts,
> +       .nparts = ARRAY_SIZE(fujitsu_nor_parts),
> +};
> --
> 2.54.0

Thanks,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
