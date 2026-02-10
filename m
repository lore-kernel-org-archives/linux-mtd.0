Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC7EA3F16
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13AJOE0eDS7+FKUyv1onkfl23IxVVYT6ja8Z2dyu7k8=; b=0/Y3nxDI+dPJlVctB21k6uzDh8
	zeygWmWptnj4GysMg1H+Zo5J2OWiyQLt/sc/fIL17zsxyaHH4GvKn2UWpoBHK7zokeW1EmWt3kZrO
	2FavVSufMkrhiF7u9ivIXLTZZbBN8I4E5sg5+/yndjYkbxbTbGPjdM2q9O0i6Cj19IniYTLpba6t9
	bqO8nfmsHvYVHsR146zAk4L04Kz7QKKwENqlSdMYOQ1mSpnoYNnyWgvvqZnegZz0LN6zvDJXhJltM
	Y+juR3Pu2DjYEnVRyL1jpGvFTi5J1s2LpxA0dZPD8KE0KnAGzL7eYoKHpmjPuGODFb1B/Oz3sijTU
	oM8ObOQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiLM-0000000Gdu2-3X6i;
	Tue, 10 Feb 2026 07:39:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiLL-0000000Gdtp-2Sqs
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 07:39:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9024560127;
	Tue, 10 Feb 2026 07:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B66C116C6;
	Tue, 10 Feb 2026 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770709170;
	bh=z093pnh67AfbpYd+5vpxkY6GK2njPW/AKX08iLs8yqA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=BhhQvkaBuQpi6XrhZ+YxbozOKNlYY0JrmGP9tUMzthseWcjCFtNf8SI92LVpqbe14
	 M6hroyq1iflKRpGomhR8RpdvaHMIOGXwoVVp85ed6CsY3BxDfaDY1NYti0WK72WEQN
	 nUt++xBXGB/02dKYLj/AKUv3d/DPiiYK5NfJ22I+FqikR5YkAGJgltC1Z+z9KHLIjs
	 3+vsVrskCNBzd1GNBhgkaVxdYYpu5IUHEoDkxHdvkOKuCFZ0X3vQxhkZD3Z0Oesvnk
	 m6FFr21t4NOs035YIMXH9V+mAzHmxI2v/92iRurA8EctIDXeHBn9iPZ/pBQl8uiOSK
	 YW1YPnl7uC1nA==
Mime-Version: 1.0
Date: Tue, 10 Feb 2026 08:39:26 +0100
Message-Id: <DGB40H7072NN.1ZWESIMFMBI20@kernel.org>
Subject: Re: [PATCH 2/4] mtd: spi-nor: winbond: Fix locking support for
 w25q256jw
From: "Michael Walle" <mwalle@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260208061919.30498-1-farbere@amazon.com>
 <20260208061919.30498-3-farbere@amazon.com>
In-Reply-To: <20260208061919.30498-3-farbere@amazon.com>
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
Content-Type: multipart/mixed; boundary="===============7685353099663330346=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7685353099663330346==
Content-Type: multipart/signed;
 boundary=328e4e3fda3be62569361b6e87eedf66813880e36d88c012b54c06fdb6ed;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--328e4e3fda3be62569361b6e87eedf66813880e36d88c012b54c06fdb6ed
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 8, 2026 at 7:19 AM CET, Eliav Farber wrote:
> The Winbond w25q256jw device:
>  - Supports lock/unlock via SR.
>  - Has Top/Bottom (TB) protect bit.
>  - Uses Status Register bit 6 as the Top/Bottom (TB) protect bit.
>  - Supports four Block Protect (BP) bits.
>
> Update the flash parameters by enabling SPI_NOR_HAS_LOCK, SPI_NOR_HAS_TB,
> SPI_NOR_TB_SR_BIT6 and SPI_NOR_4BIT_BP. Without these flags, the locking
> configuration is incorrect.
>
> Reference:
> https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=3D=
en&DocNo=3DDA00-W25Q256JW.1
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 55f1209936d5..6d325da121b4 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -274,6 +274,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x60, 0x19),
>  		.name =3D "w25q256jw",
>  		.size =3D SZ_32M,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SP=
I_NOR_4BIT_BP,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x60, 0x20),

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--328e4e3fda3be62569361b6e87eedf66813880e36d88c012b54c06fdb6ed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYrgrhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jw3gF/X5Eh/fDiPFqPcl3dDXHUNrJob6Uhoern
dl6BlgR9K+kjWXItYIKNZfJYHf69fY2NAX9RIHQzJRgTP1Q3UlYW5tQvl+p+klko
wH24NinJEtwS3WkuFX00qU7OBLld0mSdg/0=
=KoNL
-----END PGP SIGNATURE-----

--328e4e3fda3be62569361b6e87eedf66813880e36d88c012b54c06fdb6ed--


--===============7685353099663330346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7685353099663330346==--

