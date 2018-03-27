Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0kZU-0002Km-43
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 09:07:14 +0000
Date: Tue, 27 Mar 2018 11:06:50 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 16/16] mtd: rawnand: s3c2410: enhance the probe
 function error path
Message-ID: <20180327110650.631da0b8@bbrezillon>
In-Reply-To: <20180321130157.9524-17-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
 <20180321130157.9524-17-miquel.raynal@bootlin.com>
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

On Wed, 21 Mar 2018 14:01:57 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Prepare the migration of the lpc32xx_slc driver to use nand_scan() by
> cleaning the error path in the probe function.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/s3c2410.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
> index b5bc5f106c09..1bc0458063d8 100644
> --- a/drivers/mtd/nand/raw/s3c2410.c
> +++ b/drivers/mtd/nand/raw/s3c2410.c
> @@ -124,13 +124,11 @@ struct s3c2410_nand_info;
>   * @chip: The NAND chip information.
>   * @set: The platform information supplied for this set of NAND chips.
>   * @info: Link back to the hardware information.
> - * @scan_res: The result from calling nand_scan_ident().
>  */
>  struct s3c2410_nand_mtd {
>  	struct nand_chip		chip;
>  	struct s3c2410_nand_set		*set;
>  	struct s3c2410_nand_info	*info;
> -	int				scan_res;
>  };
>  
>  enum s3c_cpu_type {
> @@ -1163,17 +1161,19 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
>  		mtd->dev.parent = &pdev->dev;
>  		s3c2410_nand_init_chip(info, nmtd, sets);
>  
> -		nmtd->scan_res = nand_scan_ident(mtd,
> -						 (sets) ? sets->nr_chips : 1,
> -						 NULL);
> +		err = nand_scan_ident(mtd, (sets) ? sets->nr_chips : 1, NULL);
> +		if (err)
> +			goto exit_error;
>  
> -		if (nmtd->scan_res == 0) {
> -			err = s3c2410_nand_update_chip(info, nmtd);
> -			if (err < 0)
> -				goto exit_error;
> -			nand_scan_tail(mtd);
> -			s3c2410_nand_add_partition(info, nmtd, sets);
> -		}
> +		err = s3c2410_nand_update_chip(info, nmtd);
> +		if (err < 0)
> +			goto exit_error;
> +
> +		err = nand_scan_tail(mtd);
> +		if (err)
> +			goto exit_error;
> +
> +		s3c2410_nand_add_partition(info, nmtd, sets);

Not related to this patch, but it seems this we're ignoring the return
value of s3c2410_nand_add_partition(). Don't know if this is
intentional.

And there's something even weirder: s3c2410_nand_add_partition() only
registers the MTD device if sets != NULL, so what's the point of
scanning the bus if we know we'll not register the NAND chips we find
there? Looks like this probe path is overly complex for no real reason.

Anyway, I'll take your patch since it tends to improve a bit the code.

>  
>  		if (sets != NULL)
>  			sets++;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
