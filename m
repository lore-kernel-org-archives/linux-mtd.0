Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F694CA0EE5
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiE7C2e4rOsqdsi80gU6zw0Dm9B5YijsoGvsQjG7/SE=; b=gv2Pvsw+yB4l2WqQPWxK2J518w
	hCQDtDgG9iwiyAFvcO2jDwrtTr6upa/vIerFWLoxqdV2jDs3tlcJB/GzTiEKdexK7Ik1kPM0d42hl
	qKemEAhhtAoFgFjlXzr26qrx5/eXs8sp56Bhtw4H/ONRHmqE6YkrnBs+u4UJm8KK+d4uDjYgfabWa
	k87Zdfgd4Mf0mMYijWN8HixDXdaAXtcQHhvGkwpi61hXvOt51aCIlTWbYGE2Ppah82O7k/bfcNrdB
	KdrWL18iLDlS2pm5Z4B/VUR0zfcQUROGlz1stq/YG5IdgjebslnvYNY9vcGbl1RXIdtIG0GbQrNr6
	IdpGr+tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvc8-000000051Yq-17Fr;
	Fri, 30 Aug 2024 07:00:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvc5-000000051Y8-03P6
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 07:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0985A43F14;
	Fri, 30 Aug 2024 06:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AA6C4CEC2;
	Fri, 30 Aug 2024 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725001203;
	bh=a0f2Jy1yD083mHkvQ7FHb/FwZAVvcLZHMIJomd6/J1Q=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=aKnAfFNnhqxjsSVtYhZa6tLIzUHH+lig/jgn02Ytht7fyv4BPcWvVDhI58qaXiKKr
	 DscAs+0gUiqS0fKgIq358on1Hu8kfwYxYax1xKbop8GfU5IZiuS4i3Dzmlk7xOzB0y
	 qx2Bi0nlRpmBmPyZ03rzG6mWxIaIaJeBOWhk/yOaYYIQNkZw4OuyJ/XhIxD6hcAFPe
	 q6mryDG9xe9kvge35DVYFUqy/vK7F+pzNzKh/7p6wgkelLWRipBFrXb7xLLDqnU8kt
	 NK2JuRPvkcqGSMXHIDOX/t5QJFCE3Pi8PpkUphQa5SCuqfcSfjFAU/dBb1CgxKJRcP
	 hWkPfbgv7Hujg==
Date: Fri, 30 Aug 2024 08:59:59 +0200
Message-Id: <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
In-Reply-To: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000005_146150_17F10A9D 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: multipart/mixed; boundary="===============8725142548550816670=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8725142548550816670==
Content-Type: multipart/signed;
 boundary=97bdceaecf9e9846c3df111f97009d5e4dae3b210ff7ca24b435d7fb1101;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--97bdceaecf9e9846c3df111f97009d5e4dae3b210ff7ca24b435d7fb1101
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>
> Infineon S28HS256T is 256Mb Octal SPI device which has same
> functionalities with 512Mb and 1Gb parts.
>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Datasheet can be found:
> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HL256T_256Mb_SEMPER_F=
lash_Octal_interface_1_8V_3-DataSheet-v02_00-EN.pdf?fileId=3D8ac78c8c8fc2dd=
9c018fc66787aa0657

As Link: tag above your SoB please.

..


> ---
>  drivers/mtd/spi-nor/spansion.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index 6cc237c24e07..1390fe6f811d 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -966,6 +966,11 @@ static const struct flash_info spansion_nor_parts[] =
=3D {
>  		.name =3D "s28hl01gt",
>  		.mfr_flags =3D USE_CLPEF,
>  		.fixups =3D &s28hx_t_fixups,
> +	}, {
> +		.id =3D SNOR_ID(0x34, 0x5b, 0x19),
> +		.name =3D "s28hs256t",

Skip the name, we don't use names for new flashes anymore.

With that fixed you can add
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> +		.mfr_flags =3D USE_CLPEF,
> +		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5b, 0x1a),
>  		.name =3D "s28hs512t",


--97bdceaecf9e9846c3df111f97009d5e4dae3b210ff7ca24b435d7fb1101
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtFt7xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/im8wGAwAWZSfjF6nVH/vORw+w5sASfJLe+v3bJ
dmbR2SE9tgNI8ibR7VK+UCbR/SQ4slBlAYCjCsSb8UXQT6j0eouK0uMCPD4HSuSB
xVvNP0heVfteHObiNJS1qszPFlShcjRgg3M=
=ihon
-----END PGP SIGNATURE-----

--97bdceaecf9e9846c3df111f97009d5e4dae3b210ff7ca24b435d7fb1101--


--===============8725142548550816670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8725142548550816670==--

