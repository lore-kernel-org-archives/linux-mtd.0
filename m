Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0jTN-0000Jm-LB
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 07:56:51 +0000
Date: Tue, 27 Mar 2018 09:56:37 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu
 <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2 06/16] mtd: rawnand: fsl_elbc: fix probe function
 error path
Message-ID: <20180327095637.2662b531@bbrezillon>
In-Reply-To: <20180321130157.9524-7-miquel.raynal@bootlin.com>
References: <20180321130157.9524-1-miquel.raynal@bootlin.com>
 <20180321130157.9524-7-miquel.raynal@bootlin.com>
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

On Wed, 21 Mar 2018 14:01:47 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> An error after nand_scan_tail() should trigger a nand_cleanup().
> The helper mtd_device_parse_register() returns an error code that should
> be checked and nand_cleanup() called accordingly.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/fsl_elbc_nand.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsl_elbc_nand.c b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> index d28df991c73c..7a7cb60ec93c 100644
> --- a/drivers/mtd/nand/raw/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/raw/fsl_elbc_nand.c
> @@ -926,15 +926,20 @@ static int fsl_elbc_nand_probe(struct platform_device *pdev)
>  
>  	/* First look for RedBoot table or partitions on the command
>  	 * line, these take precedence over device tree information */
> -	mtd_device_parse_register(mtd, part_probe_types, NULL,
> -				  NULL, 0);
> +	ret = mtd_device_parse_register(mtd, part_probe_types, NULL, NULL, 0);
> +	if (ret)
> +		goto cleanup_nand;
>  
>  	pr_info("eLBC NAND device at 0x%llx, bank %d\n",
>  		(unsigned long long)res.start, priv->bank);
> +
>  	return 0;
>  
> +cleanup_nand:
> +	nand_cleanup(&priv->chip);
>  err:
>  	fsl_elbc_chip_remove(priv);

fsl_elbc_chip_remove() is already calling nand_release() (which
contains a call to nand_cleanup()), so we might experience double-free
issues if some of the fields are not re-initialized to NULL.

> +
>  	return ret;
>  }
>  



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
