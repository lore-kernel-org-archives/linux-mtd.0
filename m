Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D420C47258
	for <linux-mtd@archiver.kernel.org>; Sun, 21 Jan 2024 01:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWrSPpcIoWIu5m3YM4nn4TFLChpf2+7WJx05QR8Fmz8=; b=3xbFV0KtWJ3sC9+sNOYNuvT4u6
	D6zHdB0hHJCi3dgMmNv1SbfWIRgZT32IC4pXQnDi1UxXnb6Ak8W1FiqszqnuMZKpcaZBbg4Xqrs/3
	BQ7Wxj4Yjj2msCYjmxfVbO642CAX2tQJ90CX8l8b/jRgy0CJbqR142JOsczV5oGSLyqX32qAGBNsK
	15hfQ/8CvIlNsTQqN+XRtEa4HA3l5bculJiG6VMx39E3nu4qW63SBSmchphK9r3V/Bcc0P7PMNHJF
	AO9l3LFX7By3aB5J+j3ENwdqZTmRhNt4pf//n3uW6wbOR8glPJPHO0hS0GV+5GOeS8ZVyZYSABdMO
	ohmu/FcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMGI-008i2r-0H;
	Sun, 21 Jan 2024 01:04:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRMGF-008i2G-1e;
	Sun, 21 Jan 2024 01:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B3C860C69;
	Sun, 21 Jan 2024 01:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A34BC433C7;
	Sun, 21 Jan 2024 01:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705799069;
	bh=d3XsdJmOrPceBBoewmuW2GJNC71GNXagT5eGFvKkFyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVURKBzj+xJyBsvL4Hp5ZEf4Y1BburBTkn3HSSonkiyqUYQw910DdugQjvjVjupRr
	 QU2eExc7ZrjXtcVYPC3PyDhpVdfbub8Hat2hoZhtfeaSP8lALrVlVBs7BMR4uELmoC
	 mqsIPPcuon3uEX5ePlDtmPAU+jPi7v1EOIXLfbb85B/VKF5pNE/fD8kaKI69IyNUZQ
	 dkj5qxFhfvr5XbTT0MjEDVhtbqoptR73v7Bgz40vSEdtL1+PtzKzS1jIG0WdBXGMDK
	 jR+BUcv3NfWbVSkxP6jUV8FdsO1Lj87T9cIRYcsU9ql1TfdZ9bpTs6F4/8/EIZYlgJ
	 bekzpo8TMkTWA==
Date: Sun, 21 Jan 2024 01:04:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael@walle.cc, linux-mtd@lists.infradead.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
X-Cookie: You might have mail.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_170431_616515_5A40C5AF 
X-CRM114-Status: GOOD (  12.08  )
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
Content-Type: multipart/mixed; boundary="===============0500218183388607028=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0500218183388607028==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gbj27IA6g3j5b4VB"
Content-Disposition: inline


--gbj27IA6g3j5b4VB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2024 at 09:05:43AM -0800, Guenter Roeck wrote:

> FWIW, the problem is due to

> +#define SPI_CS_CNT_MAX 4

> in the offending patch, but apeed2400 FMC supports up to 5 SPI chip selec=
ts.
>=20
>  static const struct aspeed_spi_data ast2400_fmc_data =3D {
>         .max_cs        =3D 5,
> 	^^^^^^^^^^^^^^^^^^^
>         .hastype       =3D true,

> Limiting .max_cs to 4 or increasing SPI_CS_CNT_MAX to 5 fixes the problem,
> though of course I don't know if increasing SPI_CS_CNT_MAX has other side
> effects.

Yeah, I was coming to a similar conclusion myself - the limit is just
too low.  I can't see any problem with increasing it.

--gbj27IA6g3j5b4VB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWsbY8ACgkQJNaLcl1U
h9Cd8Af/avJ6OwNEUdXRf7+Y/ez1nlW4KmF435+5Krs7iC0gW1bASAqTgK1wW/vH
Qn1dkyXEXhJr6D0AXzIaOBKg3k6gmKJ9AL0kbeMeIMsxj5f/2BYI62z0B8nx7dZC
Y3fMiOxEqHxwU0eWCD2HuzN/GxHD7mrLi5VEFCE572HROza7PRt0jFfRyy7GAfaM
BIfHMtCRiq5SMmya80D0iKJ9aZgeI0bf/DmzRVDOQnjo6sG7uCSyzPp4Rg1Z6wk1
kottzJ+R1VHbzCngl404KHzG8SBHAXxYOVxf1HqiBzSgJ2/aa/asAsV0mHnoccn9
5wKmraNTPzlncfC6l1dz4k3QPdXH7g==
=vqew
-----END PGP SIGNATURE-----

--gbj27IA6g3j5b4VB--


--===============0500218183388607028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0500218183388607028==--

