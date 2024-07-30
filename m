Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2339FC3DA61
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2024 06:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVvuS+DIy86+tgI9kAFXtJpEP/0RHMIgt0zW/SStcbE=; b=32EUDGo0QMB0ShpO4v4Ryn14qi
	X1cPTIMVYcWEuFdQJCyq+JR5F99GxAK9bIeIvEVQ73N6ALZn8bAX5sWu/DNZ7XVZZDIcKLmJsQNZ3
	7ijfD58mIyr8n2lJ/kXPN3+FlKA5F2PS6X0y/yNCSZsUlPd1rw+7ssRgtMqahCi64pzKVQmGZC592
	f2cXGLSyzDLkFpMRzd/T9RbMn6VOvMjvJAzcIyFZX7PTKINzGSgFTF0259OPJWbgLdiahIb+4Fcs3
	6KP/8b3cBsPN2KFtvRnGAN5B6x+iYoX1g7aRLvWG1R+Ha1ihydStG66LvrkpCJe9V49Yn+TVSlQn9
	DCnqyEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYghW-0000000Du7U-2jR6;
	Tue, 30 Jul 2024 06:51:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYghS-0000000Du6w-480E
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jul 2024 06:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA8061D64;
	Tue, 30 Jul 2024 06:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093C1C32782;
	Tue, 30 Jul 2024 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722322269;
	bh=1WFcT64RSEjm7Ii66YeE3ETbzhdz0+SBx8kjGGmN/B8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=WjVTieLVyO13O1v5Q4hSk6J2fGOI1AN8W5V/uK8KClhZlqljIFaZMyM3mfNDejImh
	 AT6nhFEu9viOm0yXMJar0Qes3eeRoFBwMlcIqro81wZvtTG+beiohFmfU48yh+klCj
	 n6oXht/PuZARsL00DBtxCavGidXet1FvyNBO+QDtkadV4mRsGogmM0ZQN1oB3cms/Z
	 kCsjg8DP0165QhGR6qmy6HJglbQv21Z4JlXEeg+gC5Suabz43vhkdpxP8bY1YahQin
	 pp0DBoDoqsIFQ/y070rm0vJlZwNYU4jn9E+HBK6NJfNvvuhP+j8YVm42F9rCpBFybf
	 /9nqvVr3iUvRA==
Date: Tue, 30 Jul 2024 08:51:05 +0200
Message-Id: <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Richard Weinberger" <richard@nod.at>, "Tudor
 Ambarus" <tudor.ambarus@linaro.org>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Brian Norris" <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
In-Reply-To: <20240726185825.142733-1-computersforpeace@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_235111_113746_401AF004 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: multipart/mixed; boundary="===============0240998043687755836=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0240998043687755836==
Content-Type: multipart/signed;
 boundary=8174d0b0f781d51f8f766bb0a557a7d87b11217219900dbe638b81c96dfc;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8174d0b0f781d51f8f766bb0a557a7d87b11217219900dbe638b81c96dfc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jul 26, 2024 at 8:58 PM CEST, Brian Norris wrote:
> These flash chips are used on Google / TP-Link / ASUS OnHub devices, and
> OnHub devices are write-protected by default (same as any other
> ChromeOS/Chromebook system). I've referred to datasheets, and tested on
> OnHub devices.

Out of curiosity, there is also a hardware write protect switch
somehow, right? At least that's my understanding how verify boot
works.

>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

This looks good:
Reviewed-by: Michael Walle <mwalle@kernel.org>

But could you have a look whether this flash supports SFDP.
According to the datasheet it looks like it does. In that case,
could you please dump it according to:
https://docs.kernel.org/driver-api/mtd/spi-nor.html

Thanks,
-michael

> ---
>
>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron=
-st.c
> index 3c6499fdb712..e6bab2d00c92 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -436,6 +436,8 @@ static const struct flash_info st_nor_parts[] =3D {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x17),
>  		.name =3D "n25q064a",
>  		.size =3D SZ_8M,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +			 SPI_NOR_BP3_SR_BIT6,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_QUAD_READ,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x18),


--8174d0b0f781d51f8f766bb0a557a7d87b11217219900dbe638b81c96dfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZqiNWRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hyeQGA4/ZtgLhE6bvlVn3L9QYDW7xKRuKnWIUf
ciNmd6WMnsUZHW7N5UtlkVI30mL3AD7lAX4/eY/6fSnexk/cBYIkWEAf0NL69/gJ
z6MjfMTf+WD7OhTC6Ck2VyDgELNG+MRyHag=
=S/s3
-----END PGP SIGNATURE-----

--8174d0b0f781d51f8f766bb0a557a7d87b11217219900dbe638b81c96dfc--


--===============0240998043687755836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0240998043687755836==--

