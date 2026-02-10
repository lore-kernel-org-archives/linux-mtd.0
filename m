Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D672DEA3F13
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 07:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:To:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sg54FC9EPNGn15KJQTWrVrLhfoUye04voVfWtM+8UuY=; b=TFYFwLxoBGum5i5uAtnlEmnh0L
	Dyr1ND5pnZ+uIM4gkB+zHC+XpIoFt+A2ViPL3q2N2r+6JH5IX3L0Kgkdi1biCXHxVSADeRSTgGvlC
	IhonCpj0gFtFQrOhAOevZz/p8pWU7/ADPukz2zwQVYLbCMTuSjQ947KawOTz48BjckHmAHWb5gusA
	29D3orA5YG/oiue8LEtu2ezbHGQWe3YUvuJXItP3oARsAgg+81f4olNgB578Wln4vLHgOyOTdNaBQ
	xEnhxdxBRNtLNvAu0W2GPqgqxzWKFkoVGNwPnbNH2gv7lcJDvTU7aSPVP/UkHYn+8/S40wVG/Bmp8
	/BgvpAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiTl-0000000GeIz-2aHd;
	Tue, 10 Feb 2026 07:48:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiTj-0000000GeIZ-1wPR
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 07:48:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C87ED4375E;
	Tue, 10 Feb 2026 07:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7CDC116C6;
	Tue, 10 Feb 2026 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770709690;
	bh=MXFPlJA6Qs9kB2Uy1oaEijVuyB+24NhaEuXmK56DqaI=;
	h=Date:To:Subject:From:References:In-Reply-To:From;
	b=fBnYeDQNizst4nR0+9Oc63RxuwS+AfzsSV/uzB+TP+Nlp5KqSeD+HEWCAfZddsLUg
	 IGFN7rpf8mCEOmtEv0Uf20f14q4TgFedp22MLBL8d79zMKMxKTUd9qeKr9ZYd8V9v4
	 tdM4oeQBtDEnYhya+nNdtl+QV4dkGKBW4eYd1a0kakJFRgQ2glXNv0i+fSZuURKcoI
	 /N3lv1rrilyjlMGdehpsz087BLTKv94ZFrJ7o1bRN8ZALse8+mKxXwhibdwmzo9yMb
	 EPycBDv6cfJBq0bUFIVUVghYuHrgZ2vTihERqE2ZG/wyiiKkNeEiYp2vM/oOa206wA
	 MtUuk8V+SRAxw==
Mime-Version: 1.0
Date: Tue, 10 Feb 2026 08:48:06 +0100
Message-Id: <DGB4745HRCFI.1DRYTHXURWZJO@kernel.org>
To: "Eliav Farber" <farbere@amazon.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] mtd: spi-nor: winbond: Enable Dual and Quad support
 for w25q64jvm
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260208061919.30498-1-farbere@amazon.com>
 <20260208061919.30498-5-farbere@amazon.com>
In-Reply-To: <20260208061919.30498-5-farbere@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_234811_524512_BCC5CCA9 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: multipart/mixed; boundary="===============1025609429617798748=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1025609429617798748==
Content-Type: multipart/signed;
 boundary=3c8ded4c71382c56aaba51042a08ce113f5634ca0c90ad45bf1a96a83628;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3c8ded4c71382c56aaba51042a08ce113f5634ca0c90ad45bf1a96a83628
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 8, 2026 at 7:19 AM CET, Eliav Farber wrote:
> The w25q64jvm supports Dual and Quad SPI operations.
>
> Enable these capabilities by adding SPI_NOR_DUAL_READ and
> SPI_NOR_QUAD_READ to no_sfdp_flags.

Let me guess, you have a flash that actually has SFDP but it's not
parsed because the core (due to legacy reasons) skips it because
neither DUAL_READ nor QUAD_READ is set.

See also [1]. I'd prefer to always try to parse SFDP instead of
adding these legacy flags.

-michael

[1] https://lore.kernel.org/linux-mtd/DD10GE4EOCD7.CPTN7198QFUV@kernel.org/

>
> Reference:
> https://www.winbond.com/hq/support/documentation/levelOne.jsp?__locale=3D=
en&DocNo=3DDA00-W25Q64JV.1
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index eaa547d36aad..cb35ec6f110e 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -297,7 +297,7 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.name =3D "w25q64jvm",
>  		.size =3D SZ_8M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> -		.no_sfdp_flags =3D SECT_4K,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x70, 0x18),
>  		.name =3D "w25q128jv",


--3c8ded4c71382c56aaba51042a08ce113f5634ca0c90ad45bf1a96a83628
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYrithIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iJvwGAxfNw/Cb2P4VES0ONLfAqu8+DZOALtwj5
Msbyab1Mtwj1X4tnVw255AvW0b0TJEi1AXkBpQQ0T4lOHTOZhF13zwxO7M88xbOa
VcKVwYXd/mgBMg5XElSxBoyQCuponQaz9+s=
=LxE4
-----END PGP SIGNATURE-----

--3c8ded4c71382c56aaba51042a08ce113f5634ca0c90ad45bf1a96a83628--


--===============1025609429617798748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1025609429617798748==--

