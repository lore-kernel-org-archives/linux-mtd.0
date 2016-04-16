Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arLA9-00088x-G6
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2016 08:01:06 +0000
Date: Sat, 16 Apr 2016 10:00:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Frank
 Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 11/12] of: mtd: drop support for NAND_ECC_SOFT_BCH as
 "soft_bch" mapping
Message-ID: <20160416100043.4b89e2a9@bbrezillon>
In-Reply-To: <1460750052-16285-12-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-12-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 15 Apr 2016 21:54:11 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> There isn't any difference between handling NAND_ECC_SOFT and
> NAND_ECC_SOFT_BCH now. What matters is the new field called "algo".
> Please note we're keeping backward DT compatibility. We are still
> treating "soft_bch" value as the one setting Hamming algorithm, it's
> just handled in of_get_nand_ecc_algo now.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/of/of_mtd.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c

This series is getting rid of of_mtd{.c,.h}, so I'll move those changes
directly into nand_base.c when applying.

> index 15d056e..a70a38c 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -22,7 +22,6 @@ static const char *nand_ecc_modes[] =3D {
>  	[NAND_ECC_HW]		=3D "hw",
>  	[NAND_ECC_HW_SYNDROME]	=3D "hw_syndrome",
>  	[NAND_ECC_HW_OOB_FIRST]	=3D "hw_oob_first",
> -	[NAND_ECC_SOFT_BCH]	=3D "soft_bch",
>  };
> =20
>  /**
> @@ -45,6 +44,14 @@ int of_get_nand_ecc_mode(struct device_node *np)
>  		if (!strcasecmp(pm, nand_ecc_modes[i]))
>  			return i;
> =20
> +	/*
> +	 * For backward compatibility we support few obsoleted values that don't
> +	 * have their mappings into nand_ecc_modes_t anymore (they were merged
> +	 * with other enums).
> +	 */
> +	if (!strcasecmp(pm, "soft_bch"))
> +		return NAND_ECC_SOFT;
> +
>  	return -ENODEV;
>  }
>  EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
