Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3B9C369C4
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Apr 2025 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbJQvWCpjYUwNvewemWfxEDEF6Lf4wPuAwvIRfy5bio=; b=gGxik9EgkzR+WwG52meRFDc1RU
	ZrfKukAL4PClsspBuD1hiGfqBFrFQeZa6hPSnVwkKA3SnuQg9ZV/ChfvsCcgs08cfn0m/0moZ6eJ1
	mamUnax6FRgua25EKSjjirVhUuZPfYeywtEF0ZHSEVk6LVG+TQUW25tcU3tmd3A4GUwPTQjWKeXSm
	/SpRJQIbZYTzXJVUUp8DiRlpAdk8muaMdpuHX0e6k8MA9kzczzx8yTHpFaHNS1RuSvLKeJ7j2OoIb
	nFsxjVVlVfSXltth2FCf2ILGKtwQUtrRIhjT8+JTgjnLJrPvExMBhFv8mH9wtSgJldG6gvIVwDqof
	vg0AAXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51QU-00000009Pti-0iYx;
	Wed, 16 Apr 2025 11:59:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51QQ-00000009Pt0-1fhr
	for linux-mtd@lists.infradead.org;
	Wed, 16 Apr 2025 11:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EC2B5C5C63;
	Wed, 16 Apr 2025 11:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60881C4CEED;
	Wed, 16 Apr 2025 11:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744804769;
	bh=/uKCmU1Vz1ywvlNixmev4FFs84ywfczXR3E4cW/SJ1I=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ndE0hFjIfjZCKt/yrOn7BG2U2o4sTYSH4eSrFUwtspESakdH2in0pJVMarfwzWGxn
	 HukFRizMFg5mTKzxSCobGgs5+gmS3RSJJ4N9k+ylMrtBr43BdlOITZjj6F2mWVJQye
	 7wQGh57tX5OuPBzMFetrexFV97YCAwvitGv6USczYDmu47T5athiVlB0DiO60PZ94S
	 SFHD4n/AOQARE7u7GrzymnJdJFcY3vNnWR4TBTFYcFxsNZABwC/YZgfV1klw3fwDza
	 m0hKMuSZNBFhZXKBTnOVdQWDwhI3cxZ2kowGd+z9wbcUU6z1/XNZUrMIJjowlio3S+
	 CucKuujE0a7tw==
Date: Wed, 16 Apr 2025 13:59:24 +0200
Message-Id: <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org>
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
Cc: =?utf-8?b?U3plbnRlbmRyZWksIFRhbcOhcw==?= <szentendrei.tamas@prolan.hu>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250415180434.513405-1-csokas.bence@prolan.hu>
In-Reply-To: <20250415180434.513405-1-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_045930_528295_46334D50 
X-CRM114-Status: GOOD (  24.46  )
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
Content-Type: multipart/mixed; boundary="===============1746875950199545917=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1746875950199545917==
Content-Type: multipart/signed;
 boundary=6af618ae81b496f90345a50d55f9963d965d2fb226cee0b7dd26dd3b6e33;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6af618ae81b496f90345a50d55f9963d965d2fb226cee0b7dd26dd3b6e33
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Add MTD_SPI_NOR_PARANOID config option for verifying all written data to
> prevent silent bit errors to be undetected, at the cost of halving SPI
> bandwidth.

What is the use case for this? Why is it specific to SPI-NOR
flashes? Or should it rather be an MTD "feature". I'm not sure
whether this is the right way to do it, thus I'd love to hear more
about the background story to this.

> Co-developed-by: Szentendrei, Tam=C3=A1s <szentendrei.tamas@prolan.hu>
> Signed-off-by: Szentendrei, Tam=C3=A1s <szentendrei.tamas@prolan.hu>
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---
>  drivers/mtd/spi-nor/Kconfig | 10 ++++++++++
>  drivers/mtd/spi-nor/core.c  | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 24cd25de2b8b..425ea9a22424 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -68,6 +68,16 @@ config MTD_SPI_NOR_SWP_KEEP
> =20
>  endchoice
> =20
> +config MTD_SPI_NOR_PARANOID
> +	bool "Read back written data (paranoid mode)"

No kernel configs please. This doesn't scale. What if you have two
flashes and one should have this and one does not?

-michael

> +	help
> +	  This option makes the SPI NOR core read back all data on a write
> +	  and report an error if it doesn't match the written data. This can
> +	  safeguard against silent bit errors resulting from a faulty Flash,
> +	  controller oddities, bus noise etc.
> +
> +	  If you are unsure, select 'n'.
> +
>  source "drivers/mtd/spi-nor/controllers/Kconfig"
> =20
>  endif # MTD_SPI_NOR
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ac4b960101cc..ca05a6ec8afe 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2063,6 +2063,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff=
_t to, size_t len,
>  	size_t *retlen, const u_char *buf)
>  {
>  	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> +	u_char *verify_buf =3D NULL;
>  	size_t i;
>  	ssize_t ret;
>  	u32 page_size =3D nor->params->page_size;
> @@ -2073,6 +2074,14 @@ static int spi_nor_write(struct mtd_info *mtd, lof=
f_t to, size_t len,
>  	if (ret)
>  		return ret;
> =20
> +#if IS_ENABLED(CONFIG_MTD_SPI_NOR_PARANOID)
> +	verify_buf =3D devm_kmalloc(nor->dev, page_size, GFP_KERNEL);
> +	if (!verify_buf) {
> +		ret =3D -ENOMEM;
> +		goto write_err;
> +	}
> +#endif
> +
>  	for (i =3D 0; i < len; ) {
>  		ssize_t written;
>  		loff_t addr =3D to + i;
> @@ -2099,11 +2108,35 @@ static int spi_nor_write(struct mtd_info *mtd, lo=
ff_t to, size_t len,
>  		ret =3D spi_nor_wait_till_ready(nor);
>  		if (ret)
>  			goto write_err;
> +
> +#if IS_ENABLED(CONFIG_MTD_SPI_NOR_PARANOID)
> +		/* read back to make sure it's correct */
> +		ret =3D spi_nor_read_data(nor, addr, written, verify_buf);
> +		if (ret < 0)
> +			goto write_err;
> +		if (ret !=3D written) {
> +			/* We shouldn't see short reads */
> +			dev_err(nor->dev, "Verify failed, written %zd but only read %zd",
> +				written, ret);
> +			ret =3D -EIO;
> +			goto write_err;
> +		}
> +
> +		if (memcmp(verify_buf, buf + i, written)) {
> +			dev_err(nor->dev, "Verify failed, compare mismatch!");
> +			ret =3D -EIO;
> +			goto write_err;
> +		}
> +#endif
> +
> +		ret =3D 0;
> +
>  		*retlen +=3D written;
>  		i +=3D written;
>  	}
> =20
>  write_err:
> +	devm_kfree(nor->dev, verify_buf);
>  	spi_nor_unlock_and_unprep_pe(nor, to, len);
> =20
>  	return ret;
>
> base-commit: 834a4a689699090a406d1662b03affa8b155d025


--6af618ae81b496f90345a50d55f9963d965d2fb226cee0b7dd26dd3b6e33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ/+bnRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gTIwF/Zk06SOzJFI02yhhZml0QcjqB1i/yNmx8
NmXcG6KCP2Oayi6LOFM7AtPSviWNrXLJAX4jVdIcXHyWBxFPT6Qmq5LeBLUEVGqd
8BdHT9XbSYGQjyGRQH6vcXreRHcqoNT9wio=
=Dz4e
-----END PGP SIGNATURE-----

--6af618ae81b496f90345a50d55f9963d965d2fb226cee0b7dd26dd3b6e33--


--===============1746875950199545917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1746875950199545917==--

