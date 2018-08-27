Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuBv2-0001iu-5s
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 07:26:40 +0000
Date: Mon, 27 Aug 2018 09:26:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon
 <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Message-ID: <20180827092612.38e8fc64@xps13>
In-Reply-To: <1535353301-1727-1-git-send-email-yamada.masahiro@socionext.com>
References: <1535353301-1727-1-git-send-email-yamada.masahiro@socionext.com>
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

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Mon, 27 Aug
2018 16:01:41 +0900:

> Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
> if maxchips is zero") gave a new meaning for calling nand_scan_ident()
> with maxchips=3D0.
>=20
> It is a special usage for some drivers such as docg4, but actually
> the Denali driver may pass maxchips=3D0 to nand_scan() when the driver
> is enabled but no NAND chip is found on the board for some reasons.
>=20
> If nand_scan_with_ids() is called with maxchips=3D0, nand_scan_ident()
> is skipped, then nand_set_defaults() is skipped as well.  Thus, the
> driver must set chip->controller beforehand.  Otherwise, nand_attach()
> causes NULL pointer dereference.
>=20
> In fact, the Denali controller knows the number of connected chips
> before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
> chip in that chip select.  Then, denali_reset_banks() sets the maxchips
> to the number of detected chips.  If no chip is found, maxchips is zero.
>=20
> In this case, there is no point for calling nand_scan() because we know
> it will fail for sure.  Let's make the probe function fail immediately.
>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
> Changes in v2:
>   - Return -ENODEV immediately if no chip was found on the board
>     for some reasons.
>     This is the smallest, and safest change for the fixes branch.
>     (I will investigate later if further cleanups are possible or not.)
>=20
>  drivers/mtd/nand/raw/denali.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index ca18612..67b2065 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1338,6 +1338,11 @@ int denali_init(struct denali_nand_info *denali)
> =20
>  	denali_enable_irq(denali);
>  	denali_reset_banks(denali);
> +	if (!denali->max_banks) {
> +		/* Error out earlier if no chip is found for some reasons. */
> +		ret =3D -ENODEV;
> +		goto disable_irq;
> +	}
> =20
>  	denali->active_bank =3D DENALI_INVALID_BANK;
> =20

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Boris, This is for you :)

Thanks,
Miqu=C3=A8l
