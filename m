Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189A4E63F3A
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+LhMOD5QmleY6C9ZonZDp57QlQDOnlDqK+C64L86PQ=; b=LwEsaGXVcn8xDBRcEiFLKlxozv
	GxnN3omGVIPm6RWK3ka5HniATS/0lLBfvBdsXBoXR0ObfX2hnXSJa3IExZtosJljsMBui6GWz8O4s
	HORaNxU60T2FuHPXBRJw+SC9E9/r8K30URIO+m3PJQoNNPpgnUgNSHvslg/ngRANzAOFn0odnVsYO
	8dSglhY2kmUwEoZDkp8Xda4F/57HuyT4OXlAyaOEnfPbanQFdYCdM9OvHqtUfu4vIvS5g9rgUPJnE
	S5jboOZv09SSik02wwZvWvjzB8sy/Q14evgsY0KWXVGZBb58d7EdfXYuqeDa/uMpg4pbdurJusDDk
	PObxSH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru1f-000000069aQ-3zt8;
	Mon, 16 Feb 2026 08:32:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vru1d-000000069ZB-1Rvt
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 08:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D2CD40ACB;
	Mon, 16 Feb 2026 08:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896D3C19424;
	Mon, 16 Feb 2026 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771230731;
	bh=9X0nEUB5rzAxyhqL1WMI5u45dpRCptwZKGM/Zcqyc7o=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=q87OTSS/XYOHbIdWENqgK+rSteugWjc4IxbyAm57ETuFi8X5Jp3dZ471risRCHDo1
	 8xifUwz9o+r38SkgRXKAy0VzjbxXjjSwlH6lguux5PUzCsZYKiAXuuYGTdvCH/Sff3
	 +akvvoObjxgfjUeiks2bz+QVvFvbM4i442GTefdqJg8umZpW9x8cM3DGVCVQaXVfMQ
	 bl4w3dMMqhGWrYoS9UBvlZPb3JLvNyeOo5+C+/whHjVaAu+eG+qdKnUSvL4mfmcS4g
	 TDlGKmb97fCYqTsfQGN1LuT7rmNKf3oQa/Hj8RimwxBz6/bT7ZbcYmLXMKR3VZknj9
	 HRlieUxdiWZpQ==
Mime-Version: 1.0
Date: Mon, 16 Feb 2026 09:32:06 +0100
Message-Id: <DGG8W2SIQXMZ.1ZQ6TN7S2LKTW@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: add support for Fudan Microelectronics
 FM25Q256
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cole Leavitt" <cole@unwrap.rs>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260214062002.17862-1-cole@unwrap.rs>
In-Reply-To: <20260214062002.17862-1-cole@unwrap.rs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_003213_428023_C3E31D25 
X-CRM114-Status: GOOD (  21.69  )
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
Content-Type: multipart/mixed; boundary="===============1119381945495440800=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1119381945495440800==
Content-Type: multipart/signed;
 boundary=d30bffce1857dd382e1f939adca20263e3ea0f0f57a14c26e18846cf0a7b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d30bffce1857dd382e1f939adca20263e3ea0f0f57a14c26e18846cf0a7b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sat Feb 14, 2026 at 7:20 AM CET, Cole Leavitt wrote:
> Add support for the Fudan Microelectronics FM25Q256 (JEDEC ID f7 f0 30),

So F7 (without continuation codes) is ZMD. Fudan Micro is 7F 7F 7F
7F 7F 7F 7F A1 or if you (wrongly) ignore the continuation codes A1.

That's also what's described in the datasheet, mentioned below. Do
you really have a Fudan Micro flash?

> a 256Mbit (32MB) SPI NOR flash chip. This chip is found on Lenovo
> ThinkPad P16 Gen 3 (Arrow Lake-S) platforms as the SPI flash backing
> the UEFI firmware.
>
> The chip supports 4K sector erase, dual read, and quad read modes.
>
> Without this patch, the kernel's spi-nor driver reports:
>   spi-nor spi0.0: unrecognized JEDEC id bytes: f7 f0 30

Do you use the latest kernel? Doesn't the flash provide SFDP? I've
looked at [1] (there is none for the 256Mbit variant) and that one
supports SFDP.

-michael

[1] https://eng.fmsh.com/nvm/FM25Q128_ds_eng.pdf

> and refuses to create an MTD device, preventing userspace tools from
> accessing the flash.
>
> Signed-off-by: Cole Leavitt <cole@unwrap.rs>
> ---
>  drivers/mtd/spi-nor/Makefile |  1 +
>  drivers/mtd/spi-nor/core.c   |  1 +
>  drivers/mtd/spi-nor/core.h   |  1 +
>  drivers/mtd/spi-nor/fudan.c  | 25 +++++++++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/fudan.c
>
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index 5dd9c35f6b6f..2c8b9b3e08bb 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -5,6 +5,7 @@ spi-nor-objs			+=3D atmel.o
>  spi-nor-objs			+=3D eon.o
>  spi-nor-objs			+=3D esmt.o
>  spi-nor-objs			+=3D everspin.o
> +spi-nor-objs			+=3D fudan.o
>  spi-nor-objs			+=3D gigadevice.o
>  spi-nor-objs			+=3D intel.o
>  spi-nor-objs			+=3D issi.o
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d3f8a78efd3b..395ff5c39883 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1944,6 +1944,7 @@ static const struct spi_nor_manufacturer *manufactu=
rers[] =3D {
>  	&spi_nor_eon,
>  	&spi_nor_esmt,
>  	&spi_nor_everspin,
> +	&spi_nor_fudan,
>  	&spi_nor_gigadevice,
>  	&spi_nor_intel,
>  	&spi_nor_issi,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 16b382d4f04f..be63273677c8 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -594,6 +594,7 @@ extern const struct spi_nor_manufacturer spi_nor_atme=
l;
>  extern const struct spi_nor_manufacturer spi_nor_eon;
>  extern const struct spi_nor_manufacturer spi_nor_esmt;
>  extern const struct spi_nor_manufacturer spi_nor_everspin;
> +extern const struct spi_nor_manufacturer spi_nor_fudan;
>  extern const struct spi_nor_manufacturer spi_nor_gigadevice;
>  extern const struct spi_nor_manufacturer spi_nor_intel;
>  extern const struct spi_nor_manufacturer spi_nor_issi;
> diff --git a/drivers/mtd/spi-nor/fudan.c b/drivers/mtd/spi-nor/fudan.c
> new file mode 100644
> index 000000000000..e9a4d3ed3cd0
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/fudan.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Fudan Microelectronics SPI NOR flash support.
> + *
> + * JEDEC manufacturer ID 0xf7.
> + */
> +
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static const struct flash_info fudan_nor_parts[] =3D {
> +	{
> +		.id =3D SNOR_ID(0xf7, 0xf0, 0x30),
> +		.name =3D "fm25q256",
> +		.size =3D SZ_32M,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	},
> +};
> +
> +const struct spi_nor_manufacturer spi_nor_fudan =3D {
> +	.name =3D "fudan",
> +	.parts =3D fudan_nor_parts,
> +	.nparts =3D ARRAY_SIZE(fudan_nor_parts),
> +};
>
> base-commit: 2687c848e57820651b9f69d30c4710f4219f7dbf


--d30bffce1857dd382e1f939adca20263e3ea0f0f57a14c26e18846cf0a7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaZLWBxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gwWQGAzWA6cwG8VFRs6lHDqFdctR07APzEYSqT
rgFEGXVEnoFoJ3CfhMAVq/X3dwR/L3ZSAYCTdC5TCEWbl1G0+wdsNP6liwANATHg
fYl136IXTmbyAK+YaCnDVMzFzI/vleyhM2I=
=c5v/
-----END PGP SIGNATURE-----

--d30bffce1857dd382e1f939adca20263e3ea0f0f57a14c26e18846cf0a7b--


--===============1119381945495440800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1119381945495440800==--

