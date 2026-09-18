Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1FEC982DC
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2026 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZ3QstVLhTfpJstjyCvOB3EWWoPdxudbIuQcxfQnTps=; b=zYBMXSCXwdP4W+pYsXi3TevVRR
	+CDXwIElYLEUOBQdNWQUGY29tHLZ1FrNtuv20y+ws2q2nsepaQd6JHKyOhln9n4ld9StWFZNSfGpi
	v6qYF1EvrzImhK7o3swzuSt4T7rOHq58g4KNypNkeLStaWP39JQI1DiBOWAfzN4r2vnDTrLlS/U1O
	UDnZ78VKFuhsWVJ/BC3NwBxhVxDptExqwUlcj5WZG8jTNOfYNbNvAtWRIQtmIG2gmir7v6PMox7Rj
	N8HNVJbwdOA1oslbzXMbHZavxmuhi4+DRv2QjvaAgIJINx9iDVjhHDllYo+g7nvKQx4rQLmJ6bknt
	XBga6Glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ucn-0000000Dtg9-2Wb0;
	Fri, 18 Sep 2026 09:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ucl-0000000Dtfk-0L4v
	for linux-mtd@lists.infradead.org;
	Fri, 18 Sep 2026 09:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id D3E9E43FE7;
	Fri, 18 Sep 2026 09:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3E89E1F00898;
	Fri, 18 Sep 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722674;
	bh=//A6nFUT1fgpq48JhsGCVi6sK5GUd9rpMaDF4/M8Wx0=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=Z1HBNKwNnL+VznfivuiwGM6M1Xcx0DfMoCACjps4yaIMqU7+cFoYA7IPC0wsSl3Q3
	 edGuJ0slgW2lnGD3+0B9vrjG7igsaf7/YAs/HD8Lvv3r4xzA+HAJ3BVkTf0SzFf+CC
	 VHtWuEaFQEh6l7Xm+kLSbjcLUfK5swVok5GZJF/c/fSqWymaKGB7wBub4qATvxD5nW
	 Zl5NuwQmrb+KX8JBTs+rQv/lEG2KWLjEc9gOXZGxrcokejQ9kUqlwMkZ6K9Rahom6z
	 edZpSL4lV7XQCx3QN8pc5tvJQog1WR3VSuT/9f4MdI1k0LlWDSKtJ7EBvkZDGMpyuZ
	 VyGTyuE3MGcnA==
Mime-Version: 1.0
Date: Fri, 18 Sep 2026 11:11:10 +0200
Message-Id: <DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
Subject: Re: [PATCH 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com> <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============8281996696989686002=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8281996696989686002==
Content-Type: multipart/signed;
 boundary=d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 9, 2026 at 5:25 PM CEST, Miquel Raynal wrote:
> There is an ID collision between chips of same density from the JW
> family (which it self conflicted with yet another family) with new PW
> parts. Chips are very similar in practice, it is mostly a matter of
> electrical differences (mostly power consumption being lower) as well as
> the addition of inline ECC capability for the higher devices (> 32Mb).
>
> Chips with ECC capability protect 16 bytes chunks are against single
> errors. In case a non-aligned write happens, ECC is locally disabled
> until the next erase.
>
> Another significant difference is that PW chips identify themselves as
> supporting the new SFDP (rev F) QER field which forces an alternate
> write SR2 opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 55 +++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index fbad9e408d7a..efa9de1f0f66 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -71,6 +71,41 @@ static bool winbond_rv_match(const struct spi_nor *nor=
)
>  	return nor->sfdp && is_w25qxxrv(nor);
>  }
> =20
> +static bool is_w25qxxpw(const struct spi_nor *nor)
> +{
> +	struct sfdp_header *sfdp_h =3D spi_nor_sfdp_get_header(nor);
> +
> +	/*
> +	 * W25QxxPW chips re-use the same ID as the W25QxxJW/NW family.
> +	 *
> +	 * Chips are very similar, W25QxxPW brings mostly performance and power
> +	 * consumption improvements. One key difference in behaviour is the
> +	 * automatic 16-byte based error correction.
> +	 *
> +	 * They can be distinguished based on their SFDP minor revision:
> +	 * W25QxxJW:       JESD216B, minor revision =3D=3D 06h
> +	 * W25Q51/01/02NW: JESD216B, minor revision =3D=3D 06h
> +	 * W25QxxPW:       JESD216F, minor revision >=3D 0Ah
> +	 */
> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
> +}
> +
> +static bool winbond_pw_match(const struct spi_nor *nor)
> +{
> +	return nor->sfdp && is_w25qxxpw(nor);
> +}
> +
> +static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
> +{
> +	const struct spi_nor_id *id =3D nor->info->id;
> +
> +	if (!winbond_pw_match(nor))
> +		return false;
> +
> +	/* W25Q33PW chips (id[2] =3D=3D 0x16) do not have built-in ECC support =
*/

The commit message mentions ECC is available for >=3D 32Mbit. Doesn't
align with this comment. Also about the 8MBit and 16Mbit ones?

"W25QxxPW chips smaller than 32MBit doesn't provide built-in ECC support"?

If you like I could rewrite it as I'll apply it. The rest of this
series looks good.

> +	return id->len =3D=3D 3 && id->bytes[2] >=3D 0x17;

Then this makes more sense.

-michael

> +}
> +
>  static int
>  w25q128_post_bfpt_fixups(struct spi_nor *nor,
>  			 const struct sfdp_parameter_header *bfpt_header,
> @@ -201,6 +236,22 @@ static const struct spi_nor_fixups winbond_nor_partn=
ame_fixups =3D {
>  	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
>  };
> =20
> +static int winbond_nor_ecc_configuration_post_sfdp_fixups(struct spi_nor=
 *nor)
> +{
> +	/*
> +	 * PW chips feature automatic error correction. Non 16-byte aligned
> +	 * writes work, but disable error correction on the region until next e=
rase.
> +	 */
> +	nor->params->writesize =3D 16;
> +	nor->params->flags |=3D SNOR_F_ECC;
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups winbond_nor_ecc_configuration_fixups =
=3D {
> +	.post_sfdp =3D winbond_nor_ecc_configuration_post_sfdp_fixups,
> +};
> +
>  static const struct flash_info winbond_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xef, 0x30, 0x10),
> @@ -622,6 +673,10 @@ static const struct spi_nor_fixup winbond_fixups[] =
=3D {
>  	  .fixups =3D &winbond_nor_multi_die_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x22), .match =3D winbond_jv_match,
>  	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x60), .match =3D winbond_pw_with_ecc_match,
> +	  .fixups =3D &winbond_nor_ecc_configuration_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x60), .match =3D winbond_pw_match,
> +	  .fixups =3D &winbond_nor_partname_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x70), .match =3D winbond_rv_match,
>  	  .fixups =3D &winbond_nor_partname_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x70, 0x18), .fixups =3D &w25q128_fixups },


--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaq0ALhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iveQGAuJyWeW0wXUfXFLHPDows5VvT5IWhUubH
H/e7kQt1ufblzGdN6udJUkpRU4G/pvlSAYDp8WCbbI2mwN0iGRXhVZM0XGIvj9fl
5A6hzQuU71gIBz32tfEKn5iIYfyL31ueuVU=
=xsj5
-----END PGP SIGNATURE-----

--d80592fc061c79ef1f409235a484d6b7475357f9ff155bde2579abd6de22--


--===============8281996696989686002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8281996696989686002==--

