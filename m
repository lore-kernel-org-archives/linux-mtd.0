Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48A4CD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VfPJPK56t97sIbsKw5h3tqYZxrtX/XLopHUe4GaGUY=; b=kQp7BRdI+EZcxHScnuabnaFXII
	fBjtUMIbRXbj6IVSlMRud7FpaQRU1k9YUu/fbsz/0sJVaDIMu2N4VjUcqRBIz0qbdzvVdt/dvQmFj
	C0lY/3DmriysTWwo/357QjNbg24EgoR3wUyLHuBAb+EvZ6jW4syE7QN1xJqdSCJJNgYMi8MLoaOJ5
	xDqcj+YW9rL8ddjJQPBGL5oTaRWPpzze4RsbNf9+SKEnJ/jUphkYmeyo1dEFqpRFMJi1YmOoZxOaw
	OUtx5QvZzMRTlqNiVkbGySOouAxTnT43qudWyOg3jEeO6qPQFNbp6KD2n66GN09nLucVS/5Ky9Hhf
	BSNS7EMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsklE-00000007X6B-1Lo9;
	Fri, 05 Apr 2024 14:41:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskl6-00000007X3z-2Cya
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 14:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1C9E2CE3634;
	Fri,  5 Apr 2024 14:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0203CC433F1;
	Fri,  5 Apr 2024 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712328093;
	bh=Btz/Hmez86EgZIrlgPrZQhuTuSmdGF/ahACcmo7T4Mg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=ceKEAO9UgifeYaKFh885NRTA4DS7/FeFKKR9QT7dkK3CHRKwAa217pcHGGBK1wM5B
	 PWe4e1byFUEtobZUDsRGGIZ7eyXWhFGJuvEh3aFxafYxb/A8JrKqq5vWt49qQ1plw7
	 l6SNs8m/5FcsN4oVBqULt8Z1F2+/v4gDk83WsOFH4Q27thtKChR5qSiCMdZvorsy4x
	 AND6dENTJMwSssXppAlY1MIp6VKYAwYz6fX0Nbgrk2soTM9T2hDW+EzZpvZZvomjh4
	 6EShp2Nk6PmavmEDN0f7ey5HV9Zankjufonefl/0S7JnmInABpjRIVKuwKblw97YZK
	 7rbEPHrqJhpZQ==
Date: Fri, 05 Apr 2024 16:41:29 +0200
Message-Id: <D0C9NCOMI27O.2VW2U3FNFTSPK@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Flavio Suligoi" <f.suligoi@asem.it>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb entry
X-Mailer: aerc 0.16.0
References: <20240405100104.480779-1-f.suligoi@asem.it>
 <20240405100104.480779-2-f.suligoi@asem.it>
In-Reply-To: <20240405100104.480779-2-f.suligoi@asem.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_074137_133241_030EA3E7 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Type: multipart/mixed; boundary="===============7744623161556918146=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7744623161556918146==
Content-Type: multipart/signed;
 boundary=acb6ba1a78e0ad4c2fe8ee2d551c5ffa69006074ac6e66ab85279d8ddadb;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--acb6ba1a78e0ad4c2fe8ee2d551c5ffa69006074ac6e66ab85279d8ddadb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Flavio,

On Fri Apr 5, 2024 at 12:01 PM CEST, Flavio Suligoi wrote:
> Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
> Memory.
> This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
> able to provide SFDP information.

Did you try the at25 driver if it will fit your usecase? Judging
from your last response, it sounds like it will do.

>
> Link: https://www.everspin.com/file/158244/download
>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/mtd/spi-nor/everspin.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspi=
n.c
> index 5f321e24ae7d..4741930ce9a8 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[] =
=3D {
>  		.size =3D SZ_512K,
>  		.sector_size =3D SZ_512K,
>  		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> +	}, {
> +		.id =3D SNOR_ID(0x6b, 0xbb, 0x13),
> +		.name =3D "em004lxb",
> +		.size =3D SZ_512K,
> +		.sector_size =3D SZ_512K,
> +		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK |

Will it also work without SPI_NOR_NO_ERASE? Also, the flash supports
fast read, so drop NO_FR. Also, please have a look at [1] for the
testing requirements.

Thanks.
-michael

> +			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
> +		.no_sfdp_flags =3D SPI_NOR_SKIP_SFDP,
>  	}
>  };
> =20

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--acb6ba1a78e0ad4c2fe8ee2d551c5ffa69006074ac6e66ab85279d8ddadb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhANmRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hh6wF/W6ehEKW1KipXS15k6n/JOHz5SNhKHN3B
vpilSYvkfW+/ZLMZBgGjNTKnOFlePmnOAYCVhLAxPiDYQ1p8FHwGOLNFEjYLw/Lu
GRDEhq8JnOuyKnFJMv9UO0OaGygMib3W9Xg=
=bbaR
-----END PGP SIGNATURE-----

--acb6ba1a78e0ad4c2fe8ee2d551c5ffa69006074ac6e66ab85279d8ddadb--


--===============7744623161556918146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7744623161556918146==--

