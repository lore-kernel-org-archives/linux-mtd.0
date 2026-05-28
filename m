Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B21CD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 06:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+ZelUbgBTF3sf/zcbGRrZ2SknHRKPLC0f/SnSDqeXw=; b=qm3wtUzXvI7EoqgPn3V0C/qtmp
	E0dHOY6Hms6P/oFCIYrimK1f5y7vzRNKp5IMQEdviGn1F7G4x/0Nea1r7WqKY1nu4rhLpPrM7295/
	jNLeolYQHja9912P76PODkbhWa3fKpTLojp8ouqCNTAcng8LYlCynAdgcsOhvD5QSm9yQ2BdgRNkJ
	9yFic48cX6lLTfSzy0EmDJWJlj7IF/GgMwuHmaxTVDs2YaKnU1WKSBTpQUnhpLLdkrYUqJPfh7irz
	5fac68STVXBabw0gqG1lCD8UJi6YESvOpF7Q5ComiB7j4PWl26rzxAml5s22/OteRRzACljcI7T+i
	WswD9g0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUM8-00000005CBI-1jqw;
	Thu, 28 May 2026 06:36:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUM5-00000005CB3-37TP
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 06:36:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CAC06605D5;
	Thu, 28 May 2026 06:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0969C1F000E9;
	Thu, 28 May 2026 06:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779950192;
	bh=dheGGxgFA7HJYyjPJaeFe2U1ZhHbqmehz/qjJHcKIJI=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=l82MJ2GlxPn6ij/qiCsDvt5xgkWAoLjZl/Nc6NzV4WL1WXZbMhXvfmnEEMTY2UAL8
	 ckJDFo3FpRYLzaX2vl28GoqU8/WwQSLzd+nmIioJJdqyS8lUjBixOQdlJSKx6irH2J
	 /NlNVR8WOF8BDrqAw7+sshvJm+bgoLxi8hf94p3BdpcSGI6lrQiutlqJdz4ElDdfOX
	 Q+dY7ix5K9kHtKHeUlrZb0yX7YrTIrO9LzyfAHQ0copb/jiVPb6pPt8y3LY/6Q7E6Z
	 h1tf0WdhpOlVbwGkxTWTJ/T0RgEfYJj8oDtgo0G42wOpC+dQmv30e27WoZUQxAxs5J
	 rgVu38Iq63Duw==
Mime-Version: 1.0
Date: Thu, 28 May 2026 08:36:28 +0200
Message-Id: <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and
 MX25L12845G
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <alvinzhou@mxic.com.tw>, "Cheng Ming Lin" <chengminglin@mxic.com.tw>
X-Mailer: aerc 0.20.0
References: <20260528051751.1648246-1-linchengming884@gmail.com>
In-Reply-To: <20260528051751.1648246-1-linchengming884@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0679317297188601645=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0679317297188601645==
Content-Type: multipart/signed;
 boundary=246448d431d63ca955350059c67164a7fa372864f8fd507b34187c7d232c;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--246448d431d63ca955350059c67164a7fa372864f8fd507b34187c7d232c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 28, 2026 at 7:17 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> Add support for Macronix MX25L12833F and MX25L12845G.
>
> The SFDP tables for these flashes only declare 1-4-4 Page Program
> support in 4-byte address mode. However, since these parts operate
> in 3-byte address mode, the standard SFDP parsing does not automatically
> enable this capability. To address this, this patch introduces
> macronix_4pp3b_late_init_fixups() to explicitly enable the 1-4-4
> Page Program.
>
> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>

...

> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -83,6 +83,18 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
>  	return 0;
>  }
> =20
> +static int
> +macronix_4pp3b_late_init_fixups(struct spi_nor *nor)
> +{
> +	struct spi_nor_flash_parameter *params =3D nor->params;
> +
> +	params->hwcaps.mask |=3D SNOR_HWCAPS_PP_1_4_4;
> +	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
> +				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
> +
> +	return 0;
> +}
> +
>  static const struct spi_nor_fixups mx25l25635_fixups =3D {
>  	.post_bfpt =3D mx25l25635_post_bfpt_fixups,
>  	.post_sfdp =3D macronix_qpp4b_post_sfdp_fixups,
> @@ -96,6 +108,10 @@ static const struct spi_nor_fixups mx25l3255e_fixups =
=3D {
>  	.late_init =3D mx25l3255e_late_init_fixups,
>  };
> =20
> +static const struct spi_nor_fixups macronix_4pp3b_fixups =3D {
> +	.late_init =3D macronix_4pp3b_late_init_fixups,
> +};
> +
>  static const struct flash_info macronix_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x10),
> @@ -130,9 +146,10 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>  		.size =3D SZ_8M,
>  		.no_sfdp_flags =3D SECT_4K,
>  	}, {
> -		/* MX25L12805D */
> +		/* MX25L12805D, MX25L12833F, MX25L12845G */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x18),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
> +		.fixups =3D &macronix_4pp3b_fixups,

It looks like you're getting bitten by the ID reuse. You can't just
unconditionally add the quad PP because as far as I can see the=20
MX25L12805D [1] is just a standard single bit i/o flash and doesn't
support the 4PP.

-michael

[1] https://www.macronix.com/Lists/Datasheet/Attachments/8582/MX25L12805D,%=
203V,%20128Mb,%20v1.2.pdf

--246448d431d63ca955350059c67164a7fa372864f8fd507b34187c7d232c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahfibBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gPRQGAjl03oIqsBP5vbC4PtnCKam0IIBQHq4GQ
vMVo5TodbnqivTPnXDgRzWDQJn+0pBpmAYC8dsCBNc8abFTVyDkc5RoGwkyO5z8e
BH0ozpysvX2GuuKdrrul98JOzYeTaJlT2KQ=
=GBr5
-----END PGP SIGNATURE-----

--246448d431d63ca955350059c67164a7fa372864f8fd507b34187c7d232c--


--===============0679317297188601645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0679317297188601645==--

