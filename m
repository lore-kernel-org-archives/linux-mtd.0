Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E4CD1284
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Apr 2024 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30aKXS091B7yBwuZGlELyo6O0oWOveCTZDe/C1Zxt0A=; b=gw3APpT3Y6PZswdWUNG6Jxb48n
	mnmEkji1rk8DYlbiQqf082PeBdB57bmyI5oHZbHH0CbkVPALYm0WwNusolXEAakBZGugbXaLXjlVi
	2j7FKJCyuuSUc7U+lAzLU7ELJTMhGQr2l073WC1G8/hICxqFGsyZiKOSar1DMu83cJxf56CyncP0z
	ht/py+LphIFfuJSFfIY2S6rPcAbbNweuntyVhYt74PNq2fk4ekiBXvsgmzN+8m8fb3lC2mB/Zxy11
	tDqC8oUV4xRcXk7c0CD13GRmJKrtBaD+Oou/Q3T3l8p6peykijwdK6aUCqgzKykLvPU0BU/RWhy1K
	1C/P69FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZbh-0000000AGNo-3Hqq;
	Tue, 02 Apr 2024 08:35:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZbd-0000000AGMh-3NFe
	for linux-mtd@lists.infradead.org;
	Tue, 02 Apr 2024 08:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BD4C60F8D;
	Tue,  2 Apr 2024 08:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09764C433F1;
	Tue,  2 Apr 2024 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712046896;
	bh=7kWQsmRpXpQp3bKZs819yi3gZoHSA+71Gnw2aAmVD8Q=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=bfr3sTajNmvYKWQlCUAOLZDhOZDixacRj748vqrWjfjM0XS4/InLHeTeh2ikZ6d13
	 NUTKGQm4P31n041l8D5MMKx+41+Q5Lciqwy1rq1t/W+Wx5yZJdApWwpDy/tvw1y7MU
	 UgTTB3iDt1q7Vq6SLtgKLg2jZ50crK7SPj6YLO6Yasn87sun6XiVDGVmti69ZhdNzk
	 LNIRLNTFve5yE8tlAmLmp2nBq+bCYGsqOkydJ1g7HTrnIws30bbyLy0LQaPhO7CklW
	 SG5lQ/SiIKXiGx+KomnfjSc6KtFf4LQd4PihFEk8BuMJBpAaj1aTHSWc5gxIgfuKHk
	 bu2jpx34peFfg==
Date: Tue, 02 Apr 2024 10:34:52 +0200
Message-Id: <D09HZ0PN0QB9.2TJR29LQ2F570@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add support for mx25um51245g
Cc: <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Witold Sadowski" <wsadowski@marvell.com>, <linux-spi@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <broonie@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240328115225.1783-1-wsadowski@marvell.com>
In-Reply-To: <20240328115225.1783-1-wsadowski@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_013458_033556_F129ADD2 
X-CRM114-Status: GOOD (  14.78  )
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
Content-Type: multipart/mixed; boundary="===============8271302303802360711=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8271302303802360711==
Content-Type: multipart/signed;
 boundary=92633de13f80d4722cab62876e75f1f46a1ce5d8254bdf21234f6f54d746;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--92633de13f80d4722cab62876e75f1f46a1ce5d8254bdf21234f6f54d746
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

[+ linux-mtd ]

Hi,

On Thu Mar 28, 2024 at 12:52 PM CET, Witold Sadowski wrote:
> The Macronix mx25um51245g is a 1.8V, 512Mbit (64MB) device that
> supports x1, or x8 operation.
>
> Tested on Marvell Octeon SoC hardware with a Cadence xSPI controller.
>
> Signed-off-by: Witold Sadowski <wsadowski@marvell.com>

You haven't CC'ed the correct list, therefore it's unlikely this
will get a proper review/getting merged at all.

As Krzysztof already pointed out on another series of yours, please
read submitting-patches.rst.

For nor flash related submissions please also read:
https://docs.kernel.org/driver-api/mtd/spi-nor.html

> ---
>  drivers/mtd/spi-nor/macronix.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index ea6be95e75a5..f5fbdb7912e0 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -182,6 +182,12 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>  		.name =3D "mx25l3255e",
>  		.size =3D SZ_4M,
>  		.no_sfdp_flags =3D SECT_4K,
> +	}, {
> +                .id =3D SNOR_ID(0xc2, 0x80, 0x3a),

Wrong indentation?. Please use checkpatch.pl.

> +                .name =3D "mx25um51245g",

drop the name.

> +                .size =3D SZ_64M,

This is also autodetected. Drop it.

> +                .no_sfdp_flags =3D SECT_4K,

No "no_sfdp_flags" for SFDP capable flashes. Drop it.


> +                .fixup_flags =3D SPI_NOR_4B_OPCODES,

Doesn't the flash have proper a 4BAIT table?

-michael

--92633de13f80d4722cab62876e75f1f46a1ce5d8254bdf21234f6f54d746
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZgvDLRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jOzgF+KSOzHoPsP7oOG25ae5P4lNDk1qp6LWMv
Vx6iQft3Sn8zwAqBytHxaG7tzw/x0wHnAYDnH/uN4T9V/ZDc5xhO/0oHsFXQWxFt
fOsRGlwuKLLrxY3mTAs9UnSXSxXQ2GA+iKY=
=MbwG
-----END PGP SIGNATURE-----

--92633de13f80d4722cab62876e75f1f46a1ce5d8254bdf21234f6f54d746--


--===============8271302303802360711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8271302303802360711==--

