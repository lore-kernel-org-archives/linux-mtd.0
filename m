Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F96C624A4
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UbN60HJQAZWo+hnHyYOnleDZHnGBFlXE1YouGl7hQxg=; b=B9S3k/dewxH7YTapQ1E8weIzJk
	/1nzIpElVkYHl86PUQKJNg1CbIVwi//uErgLmDGFs1fpc8O1Bctl3lLrqMdwndjSh6eOwsz5Qzv+Z
	7fHEolOpwNsC6Zvq6lWtXSmTV84SsqGpJjIMjB2ixIJJ5emGELArJsrDLh/EnO2U4yJm0kZpohqDp
	cDI7utOMxYNnxcndRpSMHbuR5aU/qGaLFcrakcXgm88x32WadOYjifSHQTnoCRjKVuIWih/SfAmN7
	ddza33R9zH2KyvhvbEhqtS6cQ+M2LqNnSN+cea+H/iip4C1zP3tzSQu1lK9VyqPKOgiOQQsUb3LwT
	pAfb0jZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11G5-00000009JEj-1gm3;
	Mon, 31 Aug 2026 12:37:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11G2-00000009JE5-0VCS
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 12:37:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 0E18F60219;
	Mon, 31 Aug 2026 12:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3338C1F000E9;
	Mon, 31 Aug 2026 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179820;
	bh=OOVncr/f4VG8zzLjULrj0DYaPhiNtz9Us9BQK+5A7RE=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=k+u9FIXm6xmN5F7UHqlVYnNFfd57RkHr6WFIMO9v7V6tgbCAyeIaxhTCtLD8tJk0A
	 MgzncDTZMoXsJ8dNvNGDGWpvjd3r0m9So+nL6aaWd0RD3YnxO76tKbB7QjaUyF7lAb
	 000S/il31mNJsblTWlo5OTaY/tDyQ9zWMxGDLjTXxHWpWL8zabEZtUaCasjv4hN1CP
	 czrFG5DRdtqPHb+kbSCv4u+aY65Hwrx2KOnRD88TKJtGd84cemj7FssTd8ZWWBBv29
	 ndP9VXWRRdT1pE3xouWALjrzfkqW5nNYR2TKCyf/eNvl3pKhVHa9LVffAMh4JBpAqQ
	 aWsqsaIGB+gEQ==
Mime-Version: 1.0
Date: Mon, 31 Aug 2026 14:36:49 +0200
Message-Id: <DL34U80UW849.3OYQBBTN7GRJ8@kernel.org>
To: <tjakobsen84@protonmail.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: allow the platform to supply write
 protection state
Cc: "Mika Westerberg" <mika.westerberg@linux.intel.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260831-spi-nor-platform-lock-v2-0-6cc75b909241@protonmail.com> <20260831-spi-nor-platform-lock-v2-1-6cc75b909241@protonmail.com>
In-Reply-To: <20260831-spi-nor-platform-lock-v2-1-6cc75b909241@protonmail.com>
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
Content-Type: multipart/mixed; boundary="===============2993464908902622035=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2993464908902622035==
Content-Type: multipart/signed;
 boundary=f0e586ea3a10e95359c0d4b96a8104e1d279536c0a9993139697a11d4ad4;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--f0e586ea3a10e95359c0d4b96a8104e1d279536c0a9993139697a11d4ad4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Aug 31, 2026 at 2:05 PM CEST, Tobias Jakobsen via B4 Relay wrote:
> From: Tobias Jakobsen <tjakobsen84@protonmail.com>
>
> Some flashes are write protected by the platform they are attached to
> rather than by their own block protection bits. An Intel PCH SPI
> controller programmed with protected range registers is one example: it
> refuses writes to a range regardless of what the chip's status register
> says, while the chip's block protection bits are typically left clear.
>
> MEMISLOCKED therefore either fails with -EOPNOTSUPP, or, once the chip
> gains SPI_NOR_HAS_LOCK, reports a range as unlocked while writes to it
> are in fact being refused.
>
> Let the platform supply an optional is_locked() callback in struct
> flash_platform_data, alongside the partitions it can already supply, and
> prefer it over the chip's own block protection bits. This is independent
> of SPI_NOR_HAS_LOCK, so an answer is also given for chips that have no
> block protection support of their own.
>
> lock() and unlock() return -EOPNOTSUPP, as platform enforced protection
> is not expected to be changed at runtime.
>
> Platforms that do not supply the callback are unaffected.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221927
> Assisted-by: LLM
> Signed-off-by: Tobias Jakobsen <tjakobsen84@protonmail.com>
> ---
>  drivers/mtd/spi-nor/core.c | 52 ++++++++++++++++++++++++++++++++++++++++=
++++--
>  include/linux/spi/flash.h  | 12 +++++++++++
>  2 files changed, 62 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cd..a5c37eea4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3001,6 +3001,50 @@ static void spi_nor_init_fixup_flags(struct spi_no=
r *nor)
>  		nor->flags |=3D SNOR_F_IO_MODE_EN_VOLATILE;
>  }
> =20
> +static int spi_nor_platform_lock(struct spi_nor *nor, loff_t ofs, u64 le=
n)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int spi_nor_platform_unlock(struct spi_nor *nor, loff_t ofs, u64 =
len)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int spi_nor_platform_is_locked(struct spi_nor *nor, loff_t ofs, u=
64 len)
> +{
> +	struct flash_platform_data *data =3D dev_get_platdata(nor->dev);
> +
> +	return data->is_locked(nor->spimem->spi, ofs, len);
> +}
> +
> +static const struct spi_nor_locking_ops spi_nor_platform_locking_ops =3D=
 {
> +	.lock =3D spi_nor_platform_lock,
> +	.unlock =3D spi_nor_platform_unlock,
> +	.is_locked =3D spi_nor_platform_is_locked,
> +};

If we can't unlock the flash, what's it's use then? Can't we just
clear the HAS_LOCK if there is an intel-spi driver?

> +
> +/**
> + * spi_nor_init_platform_locking_ops() - Use the platform supplied write
> + *	protection query, if there is one.
> + * @nor:	pointer to a 'struct spi_nor'
> + *
> + * Some flashes are write protected by the platform they are attached to=
 rather
> + * than by their own block protection bits, for example by an Intel PCH =
SPI
> + * controller programmed with protected range registers. In that case th=
e chip's
> + * block protection bits are typically left clear and say nothing about =
what is
> + * actually enforced, so prefer the platform supplied query when availab=
le.
> + */
> +static void spi_nor_init_platform_locking_ops(struct spi_nor *nor)
> +{
> +	struct flash_platform_data *data =3D dev_get_platdata(nor->dev);
> +
> +	if (!data || !data->is_locked || !nor->spimem)
> +		return;
> +
> +	nor->params->locking_ops =3D &spi_nor_platform_locking_ops;
> +}
> +
>  /**
>   * spi_nor_late_init_params() - Late initialization of default flash par=
ameters.
>   * @nor:	pointer to a 'struct spi_nor'
> @@ -3040,9 +3084,13 @@ static int spi_nor_late_init_params(struct spi_nor=
 *nor)
>  	spi_nor_init_fixup_flags(nor);
> =20
>  	/*
> -	 * NOR protection support. When locking_ops are not provided, we pick
> -	 * the default ones.
> +	 * NOR protection support. Platform enforced protection is preferred
> +	 * over the chip's own, as the chip is not necessarily aware of it.
> +	 * When locking_ops are not provided, we pick the default ones.
>  	 */

This doesn't work, does it? What if a flash already provide locking
ops?

-michael

> +	if (!nor->params->locking_ops)
> +		spi_nor_init_platform_locking_ops(nor);
> +
>  	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
>  		spi_nor_init_default_locking_ops(nor);
> =20
> diff --git a/include/linux/spi/flash.h b/include/linux/spi/flash.h
> index 2401a0887..f415e2c0b 100644
> --- a/include/linux/spi/flash.h
> +++ b/include/linux/spi/flash.h
> @@ -2,7 +2,10 @@
>  #ifndef LINUX_SPI_FLASH_H
>  #define LINUX_SPI_FLASH_H
> =20
> +#include <linux/types.h>
> +
>  struct mtd_partition;
> +struct spi_device;
> =20
>  /**
>   * struct flash_platform_data: board-specific flash data
> @@ -11,6 +14,13 @@ struct mtd_partition;
>   * @nr_parts: number of mtd_partitions for static partitioning
>   * @type: optional flash device type (e.g. m25p80 vs m25p64), for use
>   *	with chips that can't be queried for JEDEC or other IDs
> + * @is_locked: optional callback to query write protection enforced by t=
he
> + *	platform rather than by the flash chip itself, for example a SPI
> + *	controller that gates writes to a range of the flash. Returns 1 if
> + *	the whole range is protected, 0 if it is not, or a negative errno.
> + *	When supplied it takes precedence over the chip's own block
> + *	protection bits, which do not necessarily reflect what is actually
> + *	being enforced.
>   *
>   * Board init code (in arch/.../mach-xxx/board-yyy.c files) can
>   * provide information about SPI flash parts (such as DataFlash) to
> @@ -26,6 +36,8 @@ struct flash_platform_data {
> =20
>  	char		*type;
> =20
> +	int		(*is_locked)(struct spi_device *spi, loff_t ofs, u64 len);
> +
>  	/* we'll likely add more ... use JEDEC IDs, etc */
>  };
> =20


--f0e586ea3a10e95359c0d4b96a8104e1d279536c0a9993139697a11d4ad4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCapV1YhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gP6QF9E8qbsVLgqjAJh9RC0A0NC0hfm33elSN2
XzZWRRZ4eljrb+q6i+NqUsmaKQ9SPwhUAYDFMVNdCpsJ+MbKXt7cRUh1mHeFgiiX
l/AxToXZTnA14XtvZK6b7t5XzDKDgeXRrrk=
=WZHv
-----END PGP SIGNATURE-----

--f0e586ea3a10e95359c0d4b96a8104e1d279536c0a9993139697a11d4ad4--


--===============2993464908902622035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2993464908902622035==--

