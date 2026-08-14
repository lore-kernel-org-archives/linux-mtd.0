Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C593FC5CFC1
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AvYn/m1akTO3Ohl/E+5PbK9USHnXBPGIY4SC1P/gDwU=; b=A3yV2yVlX+rrfpIkps/RugfbTq
	dpZzpp67iC/PoZXR+oGyqPfqvxIgBLp72HzytN7oxsMSNhJd3ZGTiHjrHxVvNDH6SxNbZGX7GP8Nx
	mZJuNEDqIADYH5JTHhJeWVnuzv42DnaXEHeLYzOIjR0kUw/XZyX7w30sTuApbhMjWB+CTfO4vlJWm
	ZvYIECIoVM/Y4Hef+IPubtNC9i8aF6bJFYoHHHAEHi3UT7K44fMhgg0Xq2NX8WjhWWo137ToroN2G
	1aOZTd5YzSdFKugNRXvcK2U0QaPRDgTLLUsHkhq4GVYHNosJo0rLljtZHGVCi9eusMFa+2R3QLw/t
	GuCo0FEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoUW-00000002QlM-2aOw;
	Fri, 14 Aug 2026 09:46:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoUV-00000002Qkh-0puG;
	Fri, 14 Aug 2026 09:46:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 3742460204;
	Fri, 14 Aug 2026 09:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 629431F000E9;
	Fri, 14 Aug 2026 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700777;
	bh=c8go0naIWKd3/PsA6BqP8tKSZiqReUZtVsTy2qqALGo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=gVUYFQp23lNAsy6iyqd+FXHyYLArzLUo/3KapC138rM9Yb2m4uEVEcsP5Jt5iatfe
	 K4Iwve8/Fa77E9iyEz9z35s5AUWY6cPgSkTnsifVMo7wdd+qzqrz0Ul+LIbPUSvZtg
	 ML9aTuzp0//WMLM+n5dB3/4833i0ccqmQygMaV9WAbdwvNf6/CcYdrOgGw/PT5t5T8
	 O95k//sez/cEgxCRxKJwYEiTo2riyKTakkhrTQsPYKYhNlqrI3rx0sBcNYW78yPDvZ
	 rlpuiD+8hUiziP2e3YPToNOmx2k3Wu6L+DEygQIdYcacHnfvczB++IOHsZJrcmNb3c
	 DqDIZQUXL7DWA==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:46:14 +0200
Message-Id: <DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org>
Subject: Re: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6865687997976000704=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6865687997976000704==
Content-Type: multipart/signed;
 boundary=50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision between the JV and RV families. Both chips are
> very similar in practice, it is mostly a matter of electrical
> differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2 opcode
> (0x31). They also do not require the multi-die fixups which must remain
> assigned to the JV chips.
>
> Finally, since they share the IDs but not the names, we must hide the
> names using a fixup.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

With a comment below.

> ---
>  drivers/mtd/spi-nor/winbond.c | 56 +++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 583b1669270f..8c1cad9e21b4 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -146,6 +146,51 @@ static const struct spi_nor_fixups winbond_nor_multi=
_die_fixups =3D {
>  	.post_sfdp =3D winbond_nor_multi_die_post_sfdp_fixups,
>  };
> =20
> +static int winbond_nor_partname_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/*
> +	 * W25QxxRV parts re-use the JEDEC IDs of the JV family. Their name
> +	 * being a legacy field, it is kept for the already established JV part=
s
> +	 * but must not be exposed by the newer RV ones.
> +	 */
> +	nor->partname =3D NULL;
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups winbond_nor_partname_fixups =3D {
> +	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
> +};
> +
> +static bool is_w25qxxrv(const struct spi_nor *nor)
> +{
> +	struct sfdp_header *sfdp_h =3D (struct sfdp_header *)nor->sfdp->dwords;

nitpick, spi_nor_sfdp_get_header()?

> +
> +	/*
> +	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
> +	 *
> +	 * Chips are very similar, W25QxxRV brings mostly performance and power
> +	 * consumption improvements. The RV family does not require the multi
> +	 * die fixup.
> +	 *
> +	 * They can be distinguished based on their SFDP minor revision:
> +	 * W25QxxJV:        JESD216A, minor revision =3D=3D 05h
> +	 * W25Q512/01/02JV: JESD216B, minor revision =3D=3D 06h
> +	 * W25QxxRV:        JESD216F, minor revision >=3D 0Ah
> +	 */
> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
> +}
> +
> +static bool winbond_jv_match(const struct spi_nor *nor)
> +{
> +	return !nor->sfdp || !is_w25qxxrv(nor);

So how do we know if nor->sfdp is already there for a given fixup.
Without having looked at the code, there could potentially be fixups
before SFDP is parsed (and the nor->sfdp is populated), right? Might
be worth to be mentioned somewhere.

-michael

> +}
> +
> +static bool winbond_rv_match(const struct spi_nor *nor)
> +{
> +	return nor->sfdp && is_w25qxxrv(nor);
> +}
> +
>  static const struct flash_info winbond_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xef, 0x30, 0x10),
> @@ -552,9 +597,14 @@ static const struct spi_nor_fixup winbond_fixups[] =
=3D {
>  	{ .fixups =3D &winbond_nor_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x18), .fixups =3D &w25q128_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x19), .fixups =3D &w25q256_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x40, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x70, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x70, 0x22), .fixups =3D &winbond_nor_multi_die=
_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40), .match =3D winbond_rv_match,
> +	  .fixups =3D &winbond_nor_partname_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40, 0x21), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x21), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x22), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
>  };
> =20
>  const struct spi_nor_manufacturer spi_nor_winbond =3D {


--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7j5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h3/wGAwg4Tj0G8wcGSlgT/LlUmNDI1fg6+WjKA
+eC4wYj6pKbfGaEBzX+owo6DW5ZeHVt+AYDachmn8snBkpX+QIgr4L0Dp8ZUe4pq
QrKhbq9ypJjUct42m+7U1bNB25shIT66Y5U=
=d7n3
-----END PGP SIGNATURE-----

--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba--


--===============6865687997976000704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6865687997976000704==--

