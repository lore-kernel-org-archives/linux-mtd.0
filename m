Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dUWzJ-0006X7-9R
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 11:36:27 +0000
Date: Mon, 10 Jul 2017 13:35:56 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org (open list:NAND
 FLASH SUBSYSTEM), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] mtd: nand: fix lack of oob layout when using no ecc
Message-ID: <20170710133556.23e48f54@bbrezillon>
In-Reply-To: <20170710103726.31858-1-miquel.raynal@free-electrons.com>
References: <20170710103726.31858-1-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 10 Jul 2017 12:37:26 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Fix nand core lack of OOB layout when:
> - the NFC driver does not provide any OOB layout,
> - ECC operations are disabled (using NAND_ECC_NONE).
> Using this configuration leads to a crash during the probe.
> 
> Add layout functions for small and large pages with mainly free bytes
> plus reserved space for bad block markers.
> 
> Check the configuration and eventually assign this OOB layout in
> nand_scan_tail().
> 
> Bad block markers position was extracted from the existing OOB layouts
> by assigning as free all the bytes marked as ECC.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 75 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index c5221795a1e8..28ff58e4385f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -53,7 +53,45 @@ static int nand_get_device(struct mtd_info *mtd, int new_state);
>  static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
>  			     struct mtd_oob_ops *ops);
>  
> -/* Define default oob placement schemes for large and small page devices */
> +/*
> + * Define default OOB placement schemes for:
> + *   - no ECC or software ECC
> + *   - small or large page devices
> + */
> +static int nand_ooblayout_ecc_sp_bbm_only(struct mtd_info *mtd, int section,
> +					  struct mtd_oob_region *oobregion)
> +{
> +	return -ERANGE;
> +}
> +
> +static int nand_ooblayout_free_sp_bbm_only(struct mtd_info *mtd, int section,
> +					   struct mtd_oob_region *oobregion)
> +{
> +	if (section > 1)
> +		return -ERANGE;
> +
> +	if (!section) {
> +		if (mtd->oobsize == 16) {
> +			oobregion->offset = 0;
> +			oobregion->length = 4;
> +		} else {
> +			oobregion->offset = 0;
> +			oobregion->length = 5;
> +		}
> +	} else {
> +		oobregion->offset = 6;
> +		oobregion->length = mtd->oobsize - oobregion->offset;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops nand_ooblayout_sp_bbm_only_ops = {
> +	.ecc = nand_ooblayout_ecc_sp_bbm_only,

Actually, you don't have to implement ->ecc() in this case, just leave
it to NULL, the core takes care of returning -ENOTSUPP in this case [1].

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/mtdcore.c#L1143
