Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEBECCD195
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Oct 2025 06:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+lV/PT6tjSCUNhMp5q2HliveQibgo79OvtMwfIZqIQ=; b=0DmePZUUdUJI2eUD9s2iqfSb1Y
	LnMN9cFGpJVrQrVtub7jG61faAuzY9O8TLhbDgVJLx/dCNtKvoVSWyo2d30bWouRTNCmBVROK3REY
	6JUKDpFlXbh8z2H8+7kj8ZyLCSOqFmiv1LB/mTiGCJdeIQrJ80ocYK3VNQFtZVXxZwyx9rz+VuraG
	ekx4FLvcseKo5EMV0CRZuj0B+7Q5IprrmUI7Lt/7uosCNIHuyUsRpIlnbObBvJeVyu7DCBWCMaUWY
	vmaJ95kyI2rwta9ELjqeA6vibzr2UMJNvIh9b6hQG/9f4emf7c4GT2EPM/6Ppdx9Xu7mbfiAO49+B
	58OfU//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eCT-00000006pKC-0rs6;
	Fri, 17 Oct 2025 06:44:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eCO-00000006pIr-2Kmy;
	Fri, 17 Oct 2025 06:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96EAF44D06;
	Fri, 17 Oct 2025 06:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A2FC4CEF9;
	Fri, 17 Oct 2025 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760683463;
	bh=7P4jh6kluLcdpaCNJenQWmykCB2CsHxYxuiH71O7f8U=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=MwccKLcYN/pX/zuOJmFiMxLkdXV91iDq/NMuWvu79+cX6Urmuqgrq3fyqMRBYVr3q
	 AVfb8urT5KUy8SWL1ZemxNKEqyEECzYsk0QQwieDtvUtJx7dcyOWmJohUwTtrmoCtT
	 FueWx3yXWx5n0coD0oVYd+ZC5Z+yqLxBzhnacTZN49Y3pFUIkHyMbtzUdFacaTRAWM
	 2OOtm0nhgIWXaoD31QaON754lNuzQFBMdySQr/gK0o60bHTgX7MXinI33Bxs3Razdw
	 B4IpHyXDtqSjuDf9fc/NcK3xod9LEjUP/V13okNO4riM7r+qWwsU78PuS3paMSsftZ
	 o33a16Pctc3yA==
Mime-Version: 1.0
Date: Fri, 17 Oct 2025 08:44:18 +0200
Message-Id: <DDKE72QORJS2.29XWZ4U0T0K4I@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25dn011
Cc: "Marcus Folkesson" <marcus.folkesson@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Simon Richter" <simon@sinic.eu>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017060529.21169-1-simon@sinic.eu>
In-Reply-To: <20251017060529.21169-1-simon@sinic.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_234424_620409_252DAB9B 
X-CRM114-Status: GOOD (  14.75  )
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
Content-Type: multipart/mixed; boundary="===============7983328783560254956=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7983328783560254956==
Content-Type: multipart/signed;
 boundary=4fee797e4721044d08e9601b3b5e8700f6c06056cbf5c56b70d2e0a6e636;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4fee797e4721044d08e9601b3b5e8700f6c06056cbf5c56b70d2e0a6e636
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Simon,

On Fri Oct 17, 2025 at 8:05 AM CEST, Simon Richter wrote:
> Add AT25DN011 with 1Mbit.
> Used on multiple custom boards and tested with this patch.

Could you add your testing to the next version of your patch (below
a "---" line). See also [1].

>
> Link: https://www.renesas.com/en/document/dst/at25dn011-datasheet?r=3D160=
8506

Newer flash and no SFDP :|

> Signed-off-by: Simon Richter <simon@sinic.eu>
> ---
>  drivers/mtd/spi-nor/atmel.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 82c592f0a1e1..0c2908bce0bc 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -171,6 +171,11 @@ static const struct flash_info atmel_nor_parts[] =3D=
 {
>  		.name =3D "at45db081d",
>  		.size =3D SZ_1M,
>  		.no_sfdp_flags =3D SECT_4K,
> +	}, {
> +		.id =3D SNOR_ID(0x1f, 0x42, 0x00),
> +		.name =3D "at25dn011",

No .name please, the ID is enough. We've deprecated the use of a
name.

> +		.size =3D SZ_128K,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ

missing trailing comma.

-michael

>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x42, 0x16),
>  		.name =3D "at25sl321",

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

--4fee797e4721044d08e9601b3b5e8700f6c06056cbf5c56b70d2e0a6e636
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPHlwxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gmLwF+JiHyu3n9XMBIhiXLnXajztj5wG7/MjHp
WunFdtYCZ+VyTvOPA/DytJuplHSgtXWHAX42m2HDy4l8RGIG/10nc2uLX0iousfN
vFX+Y4mQhWsB9wyr8iYxD9fVyGdi8tzbF0w=
=w87x
-----END PGP SIGNATURE-----

--4fee797e4721044d08e9601b3b5e8700f6c06056cbf5c56b70d2e0a6e636--


--===============7983328783560254956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7983328783560254956==--

