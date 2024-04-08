Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8E5C67861
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2024 12:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/PWml7M61ztBHEInVU/X9WXHBMa1Wy7uBb4YTmOnxk=; b=iZXA1n8wV6ZNngy7kTP5TZYbVO
	D5TRVS3elUJq37NYeeR4nfp0n5zpsRBqEz8K+AnrJvo9IefYD5StIisHDocWFtfPnPmKDYDnt/F0b
	BPa5rxKXs4/q3YrSEA5EcEK4/Xuo9krDQeNmRm5qLNJDQI+TZkLtClitU/f4HF0vnAGuCTsfj7QLd
	I+IZ9D03y3DKvft7Z/Dlg5k8xvQfU52EHEoqI8GR5zoTE9GEZq0+2006yzWccFXEvKO0/arqm3xQ9
	chlkfGmEDrdFC/2g0GcU8oWuNnGQjUnYGZcHjvrFNljjAHN27unRs1kyN8NvDFbFuzEPAPeupyF7o
	yiHy3lTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoV6-0000000FaoP-0MBu;
	Mon, 08 Apr 2024 12:53:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoV2-0000000Fao1-3Jak
	for linux-mtd@lists.infradead.org;
	Mon, 08 Apr 2024 12:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B35CCCE127A;
	Mon,  8 Apr 2024 12:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F702C433C7;
	Mon,  8 Apr 2024 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712580801;
	bh=Wtd8ZK2cR3vvLSCc3YtwjMM1osyRIYerQNAKj0tZepk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=qrRMfXCTvl5m8NvnJgG82D0fh3VrpcJ2OsrUChIMH7Tpv8uyENhmhHzWiJTVBN2jP
	 FCNwhXCpU1BiMVzBZWkBAmaSnfgvIPXdQW48/QbLREmsofY6X2J98i7YKZgwhBZ2Lu
	 cux9MGYgUv3WNeRefTJUFVEK/QWt3ntHBHeYtwDvXDZw66ds6atsHvB1fTtYLYL9lB
	 gUkmeq5SAg1kL6WWrtiCn72FhDFqeam/yrfdn8nlwSYysxbAfltrICF+oLl2LIskx5
	 zycp5LPRVVjC9GFGC0jbG+zil43pulqWbJLPvD/xRR8OvlL9NFILPzbs9fWymg+NM6
	 tX3wDrOCAJWCA==
Date: Mon, 08 Apr 2024 14:53:09 +0200
Message-Id: <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, <linux-mtd@lists.infradead.org>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
X-Mailer: aerc 0.16.0
References: <20240408124328.777375-1-hui.wang@canonical.com>
In-Reply-To: <20240408124328.777375-1-hui.wang@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_055325_053377_C87DF4C9 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Type: multipart/mixed; boundary="===============0173673026451904655=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0173673026451904655==
Content-Type: multipart/signed;
 boundary=ed6deb00cdf40193c0ddf9005fad2e3b8159ef6929977666e95873ae3912;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ed6deb00cdf40193c0ddf9005fad2e3b8159ef6929977666e95873ae3912
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Apr 8, 2024 at 2:43 PM CEST, Hui Wang wrote:
> It is 2Mbit F-RAM which is logically organized as 256K x 8.

Please have a look at drivers/misc/at25.c. I'm trying to get rid of
the NO_ERASE flag. This is more of an EEPROM like device. The at25
driver already have some kind of FRAM type support.

> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index 6cc237c24e07..5dc94926b2cb 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_parts[] =
=3D {
>  		.name =3D "s28hs02gt",
>  		.mfr_flags =3D USE_CLPEF,
>  		.fixups =3D &s28hx_t_fixups,
> +	}, {
> +		.id =3D SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),

This doesn't look like a JEDEC id. The datasheet says it is a 11bit
manufacturer id?

-michael

> +		.name =3D "cy15v102qsn",
> +		.size =3D SZ_256K,
> +		.sector_size =3D SZ_256K,
> +		.flags =3D SPI_NOR_NO_ERASE,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x40, 0x13),
>  		.name =3D "s25fl004k",


--ed6deb00cdf40193c0ddf9005fad2e3b8159ef6929977666e95873ae3912
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhPotxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ha7AGA7fpeXFvTnwXmSkjVDcFlwGld6g0f1wK6
XnUdVBwCIHS9hKu5hg0cBGezYZSnI3M9AX9r9pBp3rgdBCJNsu8fp1rgf6c6bAd0
xn9Ez+n4NEYViasxaqYlF17AewEmXyAE74Q=
=bfPr
-----END PGP SIGNATURE-----

--ed6deb00cdf40193c0ddf9005fad2e3b8159ef6929977666e95873ae3912--


--===============0173673026451904655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0173673026451904655==--

