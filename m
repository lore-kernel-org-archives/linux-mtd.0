Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePm6F-0006Rj-SN
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 09:16:15 +0000
Date: Fri, 15 Dec 2017 10:15:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: venkat.prashanth2498@gmail.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at,
 wboyer@gmail.com, linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com,
 david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 3/8] Drivers:MTD:Nand: remove the redefinition error
Message-ID: <20171215101540.4b0209c7@bbrezillon>
In-Reply-To: <1513310229-2867-1-git-send-email-venkat.prashanth2498@gmail.com>
References: <1513310229-2867-1-git-send-email-venkat.prashanth2498@gmail.com>
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

Hi Venkat,

On Fri, 15 Dec 2017 09:27:09 +0530
venkat.prashanth2498@gmail.com wrote:

> From: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>
>=20
> This is a patch to the omap_elm.c file which fixes the redefinition
> error in the function=E2=80=98elm_decode_bch_error_page=E2=80=99

You obviously don't know what you're doing. The symbol is not
redefined, it's just that we have a dummy implementation when
CONFIG_MTD_NAND_OMAP_BCH is disabled, which is perfectly valid,
since the omap_elm.c file is not compiled is this case.

And you also posted a patch without even trying to compile it, otherwise
you would have noticed that you're breaking the build when
CONFIG_MTD_NAND_OMAP_BCH is enabled.

So please, next time, think twice before sending this kind of 'fix'.

Thanks,

Boris

>=20
> Signed-off-by: Venkat Prashanth B U <venkat.prashanth2498@gmail.com>
> ---
>  drivers/mtd/nand/omap_elm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/omap_elm.c b/drivers/mtd/nand/omap_elm.c
> index 235ec79..06c24f3 100644
> --- a/drivers/mtd/nand/omap_elm.c
> +++ b/drivers/mtd/nand/omap_elm.c
> @@ -335,7 +335,7 @@ static void elm_error_correction(struct elm_info *inf=
o,
>  }
>=20
>  /**
> - * elm_decode_bch_error_page - Locate error position
> + * elm_decode_bch_err_pg - Locate error position
>   * @dev:	device pointer
>   * @ecc_calc:	calculated ECC bytes from GPMC
>   * @err_vec:	elm error vectors
> @@ -343,7 +343,7 @@ static void elm_error_correction(struct elm_info *inf=
o,
>   * Called with one or more error reported vectors & vectors with
>   * error reported is updated in err_vec[].error_reported
>   */
> -void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
> +void elm_decode_bch_err_pg(struct device *dev, u8 *ecc_calc,
>  		struct elm_errorvec *err_vec)
>  {
>  	struct elm_info *info =3D dev_get_drvdata(dev);
> @@ -368,7 +368,7 @@ void elm_decode_bch_error_page(struct device *dev, u8=
 *ecc_calc,
>  	elm_write_reg(info, ELM_IRQENABLE, reg_val & ~INTR_EN_PAGE_MASK);
>  	elm_error_correction(info, err_vec);
>  }
> -EXPORT_SYMBOL(elm_decode_bch_error_page);
> +EXPORT_SYMBOL(elm_decode_bch_err_pg);
>=20
>  static irqreturn_t elm_isr(int this_irq, void *dev_id)
>  {
> --
> 1.9.1
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
