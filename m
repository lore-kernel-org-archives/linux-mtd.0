Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF5DC43458
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBimCtEgatkOolHkFQFQandgp9m9mlArJKQmwM1h4vU=; b=uPCCDI+fS0xZm72dgy4bwMC58Z
	8+ITCX8g2qnBWb78PHVdAzi+my0nUkjuknILeNzyhveOAmlaYlWI3OgroBW7tnzvi4jZLtpgBiMZY
	2iJXynfdoL1AvXr1vEL4DJqZkLEYa7iks9q8oVkTtYZvCuZElbNCuutIf3b5P9o9wBlY/NEZJ6Uym
	sMHBSAsiH/W+d0gb1VtzCM9li75BigyoyMcdKDg6+YSvE+X9k1230bE0B294cGNBBosH/eB1c7RLU
	Q4rxwQmnNcu7kEP21SytWS4Nv6BkxyRDGMGsW/X1HG2YiiE0w9cPzf97SFXC3YC3CXy1/5IoF6uLo
	l2BB1plA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk2s-0000000Ch8Z-2rvK;
	Mon, 06 Jul 2026 14:11:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgk2r-0000000Ch8K-0ViK
	for linux-mtd@lists.infradead.org;
	Mon, 06 Jul 2026 14:11:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 59148600AE;
	Mon,  6 Jul 2026 14:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 818FF1F00A3A;
	Mon,  6 Jul 2026 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783347096;
	bh=W8QV8kvJjkxCwR3MSqw3G3bV4GcXffALD1cjWerdLe8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=lmTMELfJ5iK1xg1SfTUM8N8t83IZvU2ACy2WczPZ59hdKnCrb8MJN99RnWbmHJ+Wv
	 QNWQM9gJS5oIcNVw5yfE/K99yHZdNCka/CqqoQak0VIpJZYarbOJjBdyQ2NamBBBf6
	 aZ26DqjId08FRv2/5/xAZdvI17YIid5YekwoKuqkwgj6gCh+J26A++SLHCZC4kTCRd
	 Rr/GaZ010tQhP2Y6DCqzpuEYaIcxRBUqwT9bGKGzrWmE08Eu9YI3HBxT2a9C+Etb5V
	 sv0RXlhItpRs/3hTJZevnr5a60iRA9YoO/hsY/e5aXFEJQyUKjjEAHPBLCnjsYYIq5
	 Fyy9dlMpP7i3A==
Mime-Version: 1.0
Date: Mon, 06 Jul 2026 16:11:31 +0200
Message-Id: <DJRJS82LPRIZ.2NG59E6DSDTHM@kernel.org>
Subject: Re: [PATCH 04/30] mtd: spi-nor: winbond: Make the RDCR fixup
 Winbond wide
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-4-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-4-87e5d3122244@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============3238486322841258839=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3238486322841258839==
Content-Type: multipart/signed;
 boundary=21eeddeb0a9ddf49b4373809d5661e8d3a3b1d319a61f6774eadf0e7e8fa;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--21eeddeb0a9ddf49b4373809d5661e8d3a3b1d319a61f6774eadf0e7e8fa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
> The top level paragraph of the QER field in the JESD216B mentions:
>
> "In this standard, [...]  Status register 2 refers to the byte read
> using instruction 35h. Status register 2 is the second byte transferred
> in a Write Status (01h) command. [...]"
>
> Value 100b, named in Linux BFPT_DWORD15_QER_SR2_BIT1_NO_RD, does not
> mention anything about reads and only brings details about writes.
>
> This has been interpreted in the spi-nor core by the absence of read
> capability, but there is no explicit reason for that, except that there
> were probably some very old chips which didn't support command 35h.

I agree. But making it a vendor default we always have to have an
entry. So if this is really for all winbond chips, we shall do a
catch all entry (like in macronix.c).

> All quad capable Winbond chips carry a CMP SWP bit in SR2. SR2 is
> readable with command 35h. In practice, all Winbond families but the
> W25X family have support for this feature, so re-enable it Winbond-wide
> in a late vendor fixup, except for the {EF, 30, xx} family.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

> ---
>  drivers/mtd/spi-nor/winbond.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index b4088fc5fde9..4300f0419f13 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -73,26 +73,6 @@ static const struct spi_nor_fixups w25q256_fixups =3D =
{
>  	.post_bfpt =3D w25q256_post_bfpt_fixups,
>  };
> =20
> -static int
> -winbond_rdcr_post_bfpt_fixup(struct spi_nor *nor,
> -			     const struct sfdp_parameter_header *bfpt_header,
> -			     const struct sfdp_bfpt *bfpt)
> -{
> -	/*
> -	 * W25H02NW, unlike its W25H512NW nor W25H01NW cousins, improperly sets
> -	 * the QE BFPT configuration bits, indicating a non readable CR. This i=
s
> -	 * both incorrect and impractical, as the chip features a CMP bit for i=
ts
> -	 * locking scheme that lays in the Control Register, and needs to be re=
ad.
> -	 */
> -	nor->flags &=3D ~SNOR_F_NO_READ_CR;
> -
> -	return 0;
> -}
> -
> -static const struct spi_nor_fixups winbond_rdcr_fixup =3D {
> -	.post_bfpt =3D winbond_rdcr_post_bfpt_fixup,
> -};
> -
>  /**
>   * winbond_nor_select_die() - Set active die.
>   * @nor:	pointer to 'struct spi_nor'.
> @@ -305,7 +285,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x60, 0x21),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_rdcr_fixup,
>  	}, {
>  		/* W25Q16JV-M */
>  		.id =3D SNOR_ID(0xef, 0x70, 0x15),
> @@ -381,7 +360,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x80, 0x22),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_rdcr_fixup,
>  	}, {
>  		/* W25H512NW-M */
>  		.id =3D SNOR_ID(0xef, 0xa0, 0x20),
> @@ -397,7 +375,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0xa0, 0x22),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_rdcr_fixup,
>  	},
>  };
> =20
> @@ -490,6 +467,20 @@ static int winbond_nor_late_init(struct spi_nor *nor=
)
>  	 */
>  	params->set_4byte_addr_mode =3D winbond_nor_set_4byte_addr_mode;
> =20
> +	/*
> +	 * All W25Q/W25H chips do set the BFPT_DWORD15_QER_SR2_BIT1_NO_RD bit i=
n
> +	 * their SFDP tables. The historical spi-nor assumption in this case ha=
s
> +	 * been to declare CR reads as unsupported, whereas the Jedec
> +	 * specification doesn't clearly state that. In practice, all these
> +	 * chips do support reading back the CR, which is needed for SWP suppor=
t,
> +	 * so make sure that capability remains enabled (needed for SWP).
> +	 * In practice, only exclude the old W25X family (JEDEC ID: EF 30 xx)
> +	 * which actually does not support this feature.
> +	 */
> +	if (nor->info->id->bytes[0] =3D=3D 0xef &&
> +	    nor->info->id->bytes[1] > 0x30)
> +		nor->flags &=3D ~SNOR_F_NO_READ_CR;

This is somewhat hard to read and the byte[0] is redundant here.
Maybe you can come up with some macro magic sugar :)

-michael

> +
>  	return 0;
>  }
> =20


--21eeddeb0a9ddf49b4373809d5661e8d3a3b1d319a61f6774eadf0e7e8fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaku3lBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hCXAGAoZmvhEM6qMZ5vdRHgIVkynetqQv0q6Qq
3aItZxX50e7fDCEFfzr4nbzxI3I26f69AYDW3bCClH49wrHqxF9kZ2f0F2OxH/Ez
b1PnDcEE7Y7PUCjZyTBOKiZD/PQlRYLjf0I=
=fZHX
-----END PGP SIGNATURE-----

--21eeddeb0a9ddf49b4373809d5661e8d3a3b1d319a61f6774eadf0e7e8fa--


--===============3238486322841258839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3238486322841258839==--

