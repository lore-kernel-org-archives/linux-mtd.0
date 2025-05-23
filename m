Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5010EC54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRXoTL/12mnPiU8AiL4Y5WtSRyS682oNuLFgLmP4TUU=; b=blL94pZewOKgajnjN03xrmOoJT
	Nr60iu2nhcLjusoFUWyIlsCkw5BF2SZXNW2xgyfHUFsXGDSFY9IEA3dpO8gKoFt/lj9fWtRt2YKer
	yn3o3GDBlWloQnr0tTJAO7p8SAkFD/DfJMtWJi95J/RBYL/P/Y7KvASfjY0FNMS0muSgS/B0hsSm5
	HIlHTZUl0zFQZnzTKRJEGAR/YWRDyfOjwbzFdlSvwGB7KHy22QQ3yEGZAkLlDy26oGFiXxsc+76ln
	U3HuLBEaC9nvYNa/1mAaHTwSbutyWtioPg7TbGhkpifynGTCE/PVJ3l6QyzGmu/bN/fgElvSEVwiD
	iuOJO6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQOZ-00000003gTK-0c2k;
	Fri, 23 May 2025 11:16:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQOW-00000003gSK-17wi;
	Fri, 23 May 2025 11:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 111884475A;
	Fri, 23 May 2025 11:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFBDC4CEE9;
	Fri, 23 May 2025 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747999014;
	bh=B/LXczBMwATATQAdxc5lRKz9Xr6ZFT04LNvWjtBMxkU=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=cxHPdvBe2B7S2ZMSHJgNTjL3niskBzJjgW2RKIktdRkiXOOXsgYaVYgz/y8IfZFJg
	 cpxIfXGjW1+p0BGT7XheLQnrlcgVyvIlwio4KdPxhCG7ECnZklvNOlabzR2uYDx2jZ
	 5ual7045iX2BvdMF88W8VIvAnIdoxr9nlned5tW8wAkgSEi7ESnw96okwxP2ZjOtfX
	 Tg8+4lEjUlcOOu835mjBeq7Z3rJ+BVwFhHBf0YW+t539i9z/ACoqPxvo+/Li216m9c
	 WWxB/Fyv8COc5sDmwWX0aMsTxW5R5Rim1sj9aSchy5nHOXCV49CXnbJIDnTh22flsl
	 OnO+m062AH1Gg==
Date: Fri, 23 May 2025 13:16:50 +0200
Message-Id: <DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <sophgo@lists.linux.dev>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <dlan@gentoo.org>, <ziyao@disroot.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Zixian Zeng" <sycamoremoon376@gmail.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Chen Wang"
 <unicorn_wang@outlook.com>, "Inochi Amaoto" <inochiama@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Longbin Li" <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
X-Mailer: aerc 0.16.0
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
 <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_041656_348072_CE9AF3AD 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: multipart/mixed; boundary="===============0816967248249887996=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0816967248249887996==
Content-Type: multipart/signed;
 boundary=a4437fa9bafb8d487087985596b0399ee9f18bc31a0f1c2284c38ec0a1e9;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--a4437fa9bafb8d487087985596b0399ee9f18bc31a0f1c2284c38ec0a1e9
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> Add GD25LB512ME SPI-NOR flash information

Please have a look at [1].

This flash supports SFDP, do you really need a new entry in the
flashdb? Could you try without it?

In any case, could you please dump the SFDP see [1], too.

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index ef1edd0add70e6ca501620798a779d621d6bb00d..223b2f598ecd651ce8df6789d=
fbaf938c534f94f 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -33,6 +33,15 @@ static const struct spi_nor_fixups gd25q256_fixups =3D=
 {
>  	.post_bfpt =3D gd25q256_post_bfpt,
>  };
> =20
> +static void gd25lb512me_default_init(struct spi_nor *nor)
> +{
> +	nor->params->quad_enable =3D spi_nor_sr1_bit6_quad_enable;

Should be automatically set, by SFDP.

> +}
> +
> +static const struct spi_nor_fixups gd25lb512me_fixups =3D {
> +	.default_init =3D gd25lb512me_default_init,
> +};
> +
>  static const struct flash_info gigadevice_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xc8, 0x40, 0x15),
> @@ -82,6 +91,14 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  		.size =3D SZ_16M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +	}, {
> +		.id =3D SNOR_ID(0xc8, 0x67, 0x1a),
> +		.name =3D "gd25lb512me",

No name,

> +		.size =3D SZ_64M,
> +		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_QUAD_READ,
No, no_sfdp_flags, as this flash supports SFDP.

> +		.fixups =3D &gd25lb512me_fixups,
> +		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  	},
>  };
> =20

-michael

--a4437fa9bafb8d487087985596b0399ee9f18bc31a0f1c2284c38ec0a1e9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaDBZIxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hOXgGA5IPK+ocEhmNsajncGUWdZqEDgOAiOPNY
CQW2nV3PFOOnnsYFRw7BDqyotkT0/9LqAYDBeTthHnuuXXJT8EiGX7W7fi4j+3e8
tqMR/EiYNuB4aDB+iAsc1btzQhSq0gwCl/E=
=Cu9o
-----END PGP SIGNATURE-----

--a4437fa9bafb8d487087985596b0399ee9f18bc31a0f1c2284c38ec0a1e9--


--===============0816967248249887996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0816967248249887996==--

