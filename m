Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACCAC5478A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Feb 2024 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDUndOU1CJckpAWlz6c9y81YhL4zc4PClIKrmx+4/LI=; b=KB2dT0GyMZynXUQ4UmqCZDOtu7
	m/y2jEcEnp1pjfRjOCpnVSkHoDSpo8sAQUd1uO4HfhFWgykCz6F87MzvDm6SwYLXJN7CO0EVRPeI3
	rCEIl+8qqVLihAgxI1m8Y0YKKTYvbpU0W2BBAVi+wlXkAc8E1UnYHNgMPbFPqe/VC54YasCwx63c5
	UQY/RUkUaJODwA+D2Yud6o14qG53v2OPUtsi3q2YFjWwXft3XDeyxcc9P081eU8rt/yuDIfmhyo6J
	cBdEcFkHW+BnyMtE7wv41GHFycVflWXb47dSg7vlYKQtirQu+pDBmBqMam4hClmcRxd3aQUIi315W
	yFpFeWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz7m-00000009bf8-0WR0;
	Mon, 19 Feb 2024 08:35:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz7h-00000009bci-0uuV
	for linux-mtd@lists.infradead.org;
	Mon, 19 Feb 2024 08:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E2A3D60C34;
	Mon, 19 Feb 2024 08:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106B7C43390;
	Mon, 19 Feb 2024 08:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708331735;
	bh=RdRCgva74wgXOKhvd4pBIESMw8E3D4lI+/Xi9vwJuqM=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=jmNtypG4aG/ru4HdxZqsyRMkapDuDrpnhy9wgGGgBVaHozFG0l5g9mQdo+HQGgqqA
	 rWrQj/RLCaMML2chQ3+4WmnlCTYqYXsJ+b4xsUrZnPF31TZAOklpIvdjoXSgvmsrRh
	 pttsq958gzz7QjDBwIQrHucmrmNQH7s4/UhEUR8gwR/LudPjPn+2eelXqegDHeTr9n
	 MFVwkynGHsH3TE+WLY6kHMCOMchtXlSYYIYXKQ0bKhNGWJscNZ4Kb5q222mmTs5ADR
	 MWZH02xjSMFmXJ1eTWbBbOz5c414v9bpkHL8Ccm3Tlf7eTTjFlDYQH7zzKesBKqzdd
	 wEksk3Ub5eLlg==
Date: Mon, 19 Feb 2024 09:35:27 +0100
Message-Id: <CZ8X218EWPC9.25TO9O5C7VXQ9@kernel.org>
Cc: "David Bauer" <mail@david-bauer.net>
From: "Michael Walle" <mwalle@kernel.org>
To: "Christian Marangi" <ansuelsmth@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for BoHong bh25q128as
X-Mailer: aerc 0.16.0
References: <20240217122029.3278-1-ansuelsmth@gmail.com>
In-Reply-To: <20240217122029.3278-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_003537_375586_2C826E50 
X-CRM114-Status: GOOD (  23.03  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8047504214117905938=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8047504214117905938==
Content-Type: multipart/signed;
 boundary=b8f603d48c60b1f4f96ff961f5834ebd6fe8566e273b1df18547b9aca6e0;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--b8f603d48c60b1f4f96ff961f5834ebd6fe8566e273b1df18547b9aca6e0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Feb 17, 2024 at 1:20 PM CET, Christian Marangi wrote:
> From: David Bauer <mail@david-bauer.net>
>
> Add MTD support for the BoHong bh25q128as SPI NOR chip.
> The chip has 16MB of total capacity, divided into a total of 256
> sectors, each 64KB sized. The chip also supports 4KB sectors.
> Additionally, it supports dual and quad read modes.
>
> Datasheet is public and can be found here [1].

Last time it wasn't clear if this flash will support SFDP or not.
Could you please try to dump the SFDP again, see [1].


> Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.

Also per [1], you'd need to provide your test results.

> [1] https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf

Link: right above your SoB please.

> Signed-off-by: David Bauer <mail@david-bauer.net>
> [ reworked to new flash_info format ]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/bohong.c | 24 ++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  4 files changed, 27 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/bohong.c
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 5e68468b72fc..c8849cf5124f 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -2,6 +2,7 @@
> =20
>  spi-nor-objs			:=3D core.o sfdp.o swp.o otp.o sysfs.o
>  spi-nor-objs			+=3D atmel.o
> +spi-nor-objs			+=3D bohong.o
>  spi-nor-objs			+=3D eon.o
>  spi-nor-objs			+=3D esmt.o
>  spi-nor-objs			+=3D everspin.o
> diff --git a/drivers/mtd/spi-nor/bohong.c b/drivers/mtd/spi-nor/bohong.c
> new file mode 100644
> index 000000000000..26988c139262
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/bohong.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2005, Intec Automation Inc.
> + * Copyright (C) 2014, Freescale Semiconductor, Inc.

Please remove, there is nothing from the old code left here.

> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info bohong_parts[] =3D {
> +	{
> +		.id =3D SNOR_ID(0x68, 0x40, 0x18),
> +		.name =3D "bh25q128as",
No names anymore, please.

> +		.size =3D SZ_16M,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	},
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_bohong =3D {
> +	.name =3D "bohong",

This should be dropped, too. Otherwise looks good, if SFDP is not
supported.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

> +	.parts =3D bohong_parts,
> +	.nparts =3D ARRAY_SIZE(bohong_parts),
> +};
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 4129764fad8c..29c28ee683a1 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2037,6 +2037,7 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *no=
r)
> =20
>  static const struct spi_nor_manufacturer *manufacturers[] =3D {
>  	&spi_nor_atmel,
> +	&spi_nor_bohong,
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index d36c0e072954..c293568ae827 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -601,6 +601,7 @@ struct sfdp {
> =20
>  /* Manufacturer drivers. */
>  extern const struct spi_nor_manufacturer spi_nor_atmel;
> +extern const struct spi_nor_manufacturer spi_nor_bohong;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;


--b8f603d48c60b1f4f96ff961f5834ebd6fe8566e273b1df18547b9aca6e0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdMSzxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvsAMQEA3ixSPXqAJfCop2pxfyj0kdDFERTnDLg/
Q3ExoH80lRQA/1qrCPgE85Tw+hOX5dw+TEwZ6/IOQxD5QORv8VqZ1PwM
=zQXK
-----END PGP SIGNATURE-----

--b8f603d48c60b1f4f96ff961f5834ebd6fe8566e273b1df18547b9aca6e0--


--===============8047504214117905938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8047504214117905938==--

