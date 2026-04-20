Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B68F36C51
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2026 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHtYGN0lAnz4C31hLORNETibzNbVs5tlnGWpvekw1oI=; b=ToL1tcbsVbvEry9uyFEQSUapHP
	ELR+tv9TuVG2hAxcxL/eWS/RjnksO7XMT0SZw792gIXHc4otMlEJ8UXaEcmdqOtZeD8zoMCICWna3
	JkMxP+NiRXY926+PYozmgI9ve/uPu34SS7CwjIoN6jSilr7ymVKGGFLVkXoK050iGIJka4uY7jMh4
	zYKKUAbNZ/hpkwlsIjKdT0EKxqUwpN2xGj/lKK3HJ3peFJ+tRGglVXz6nwfhUU08sq1mG5NCH6tJG
	7j9AtnPcOtx8eWnFd/Bl/kEWwm9A0+rjpI2XeZziWMgsBPNxjtYHf/Pjm/1URC66tv1/tpIKk7fkO
	uebeQZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjVl-00000006ZMp-0RPN;
	Mon, 20 Apr 2026 07:57:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjVi-00000006ZMS-3ivQ
	for linux-mtd@lists.infradead.org;
	Mon, 20 Apr 2026 07:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04CF260055;
	Mon, 20 Apr 2026 07:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1876DC19425;
	Mon, 20 Apr 2026 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776671857;
	bh=wZ05Hm/1dyxpzWq56J2q/l3jEulKGa6cD1wP+dC7+Jk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=dsuwx8hLw5o5t1ep/qxH+h07JWWU0PVHT9+LZqa4O1152TKrmd/g/fIrQBjymw2gm
	 FzwxnkSGKdxbYdSB6V75B+ubljvFIpRPBRG+hDXM/QjK0+Hrz5MrA7V7Gi9xQXzcyM
	 Tmz+izdH5JJOpYdJe9HYoG1D2AGJdnYV1jIVnfEDyS9CoPSICYQ/tJGdJqX2QXnc1D
	 a4NGd70/cQweP1i4imnOB5WXSnW2L/2kYT9vkI7pm1oQO1nL1vE2OZ0AxDOM35Ndg4
	 dSePmkRNy5vxtMNMh5xgIc/ApHRsM4DYL9TKpRgZzct8HoFZr+eIw75NY/XaEDZoNc
	 fCEt4RSsthjJw==
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 09:57:33 +0200
Message-Id: <DHXTLXWEPUDM.2LSB322E4R3ZZ@kernel.org>
Subject: Re: [PATCH] [v3] mtd: spi-nor: gigadevice: Add support for
 GD25LQ255E
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Weimin Wu" <wuweimin@huaqin.corp-partner.google.com>,
 <takahiro.kuwano@infineon.com>
X-Mailer: aerc 0.20.0
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
In-Reply-To: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com>
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
Content-Type: multipart/mixed; boundary="===============4057993207956825191=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4057993207956825191==
Content-Type: multipart/signed;
 boundary=8ef09dc299672162dc5c2ad12a4111d6dab31ba45813e91b6d3d7bc6bb06;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8ef09dc299672162dc5c2ad12a4111d6dab31ba45813e91b6d3d7bc6bb06
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Apr 18, 2026 at 10:42 AM CEST, Weimin Wu wrote:
> Add support for the GigaDevice GD25LQ255E (JEDEC ID c8 60 19),
> a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.
>
> The chip supports 4K sector erase, dual read, and quad read modes.
>
> Link: https://download.gigadevice.com/Datasheet/DS-00562-GD25LQ255E-Rev1.=
2.pdf

Please move the Link: tag above your SoB line.

..

> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index ef1edd0ad..22a430798 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -82,6 +82,10 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  		.size =3D SZ_16M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		/* gd25lb256 */
> +		.id =3D SNOR_ID(0xc8, 0x60, 0x19),
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB | SPI_N=
OR_TB_SR_BIT6,

Reviewed-by: Michael Walle <mwalle@kernel.org>

It looks like the gd25q256 is also missing the 4BIT_BP flag. Could
you add second patch fixing that one, please?

FWIW, the GigaDevice datasheets are super confusing, sometimes there
are 5 BP bits, where the last one is the TB, sometimes there are 4
BP and 1 TB but only 3 BP bits are used..

-michael

--8ef09dc299672162dc5c2ad12a4111d6dab31ba45813e91b6d3d7bc6bb06
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeXcbRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i5NQGA3Tce+qeEnML4Zob3FKS6UiVhb1SPt3Mk
f/KK8Ic8LSfYH/vf/3c9rYZXp5oa772xAX0b+QYqm55uzZ3Ab1NWT11lIoc5EUBt
4uWZcyTErcaOFORiTjiDmM3KR0pT3MLoRiM=
=kHZw
-----END PGP SIGNATURE-----

--8ef09dc299672162dc5c2ad12a4111d6dab31ba45813e91b6d3d7bc6bb06--


--===============4057993207956825191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4057993207956825191==--

