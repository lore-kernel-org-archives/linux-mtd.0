Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgig3-0004fC-7D
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 00:21:52 +0000
Received: by padhy16 with SMTP id hy16so188021312pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 17:21:30 -0700 (PDT)
Date: Mon, 28 Sep 2015 17:21:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Roese <sr@denx.de>
Cc: linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: fsmc: Add BCH4 SW ECC support for SPEAr600
Message-ID: <20150929002127.GP31505@google.com>
References: <1441187581-12928-1-git-send-email-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441187581-12928-1-git-send-email-sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 11:53:01AM +0200, Stefan Roese wrote:
> This patch adds support for 4-bit ECC BCH4 for the SPEAr600 SoC. This can
> be used by boards equipped with a NAND chip that requires 4-bit ECC
> strength. The SPEAr600 HW ECC only supports 1-bit ECC strength.
> 
> To enable SW BCH4, you need to specify this in your nand controller
> DT node:
> 
> 	nand-ecc-mode = "soft_bch";

Please update the DT binding file, referring to nand.txt. Just specify
your additional restrictions (like, should be "soft_bch" or "hw").

Also please use nand-ecc-strength and nand-ecc-size; see below.

> Tested on a custom SPEAr600 board.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/fsmc_nand.c | 72 ++++++++++++++++++++++++++++++++------------
>  include/linux/mtd/fsmc.h     |  2 ++
>  2 files changed, 54 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 793872f..3e01288 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -29,9 +29,11 @@
>  #include <linux/types.h>
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/nand.h>
> +#include <linux/mtd/nand_bch.h>
>  #include <linux/mtd/nand_ecc.h>
>  #include <linux/platform_device.h>
>  #include <linux/of.h>
> +#include <linux/of_mtd.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
> @@ -908,6 +910,13 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
>  		}
>  		pdata->bank = val;
>  	}
> +
> +	ret = of_get_nand_ecc_mode(np);

Can you make use of nand_dt_init()? Just assign nand->flash_node.

> +	if (ret >= 0)
> +		pdata->ecc_mode = ret;
> +	else
> +		pdata->ecc_mode = NAND_ECC_HW;

To handle the default value, just make sure to set NAND_ECC_HW before
getting to nand_scan_ident().

> +
>  	return 0;
>  }
>  #else
> @@ -960,7 +969,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	host->data_va = devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(host->data_va))
>  		return PTR_ERR(host->data_va);
> -	
> +

Superfluous change? If you want to clean the whitespace, please send a
separate patch.

>  	host->data_pa = (dma_addr_t)res->start;
>  
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_addr");
> @@ -1023,7 +1032,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  	nand->cmd_ctrl = fsmc_cmd_ctrl;
>  	nand->chip_delay = 30;
>  
> -	nand->ecc.mode = NAND_ECC_HW;
> +	nand->ecc.mode = pdata->ecc_mode;
>  	nand->ecc.hwctl = fsmc_enable_hwecc;
>  	nand->ecc.size = 512;
>  	nand->options = pdata->options;
> @@ -1071,10 +1080,27 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  		nand->ecc.bytes = 13;
>  		nand->ecc.strength = 8;
>  	} else {
> -		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
> -		nand->ecc.correct = nand_correct_data;
> -		nand->ecc.bytes = 3;
> -		nand->ecc.strength = 1;
> +		switch (nand->ecc.mode) {
> +		case NAND_ECC_HW:
> +			dev_info(&pdev->dev, "Using 1-bit HW ECC scheme\n");
> +			nand->ecc.calculate = fsmc_read_hwecc_ecc1;
> +			nand->ecc.correct = nand_correct_data;
> +			nand->ecc.bytes = 3;
> +			nand->ecc.strength = 1;
> +			break;
> +
> +		case NAND_ECC_SOFT_BCH:
> +			dev_info(&pdev->dev, "Using 4-bit SW BCH ECC scheme\n");
> +			nand->ecc.calculate = nand_bch_calculate_ecc;
> +			nand->ecc.correct = nand_bch_correct_data;

You don't have to set these, as nand_scan_tail() will do it for you,
overriding any choice here.

> +			nand->ecc.bytes = 7;
> +			nand->ecc.strength = 4;

These should come from DT. If there are values you can't accept, then
you can reject them here. Or just let nand_dt_init() handle it for you.

> +			break;
> +
> +		default:
> +			dev_err(&pdev->dev, "Unsupported ECC mode!\n");
> +			goto err_scan_ident;
> +		}

You'll also want to move all these ECC decisions after nand_scan_ident()
(which calls nand_scan_ident()).

>  	}
>  
>  	/*
> @@ -1114,20 +1140,26 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
>  			BUG();
>  		}
>  	} else {
> -		switch (host->mtd.oobsize) {
> -		case 16:
> -			nand->ecc.layout = &fsmc_ecc1_16_layout;
> -			break;
> -		case 64:
> -			nand->ecc.layout = &fsmc_ecc1_64_layout;
> -			break;
> -		case 128:
> -			nand->ecc.layout = &fsmc_ecc1_128_layout;
> -			break;
> -		default:
> -			dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
> -				 mtd->oobsize);
> -			BUG();
> +		/*
> +		 * Don't set layout for BCH4 SW ECC. This will be
> +		 * generated later in nand_bch_init() later.
> +		 */
> +		if (nand->ecc.mode != NAND_ECC_SOFT_BCH) {
> +			switch (host->mtd.oobsize) {
> +			case 16:
> +				nand->ecc.layout = &fsmc_ecc1_16_layout;
> +				break;
> +			case 64:
> +				nand->ecc.layout = &fsmc_ecc1_64_layout;
> +				break;
> +			case 128:
> +				nand->ecc.layout = &fsmc_ecc1_128_layout;
> +				break;
> +			default:
> +				dev_warn(&pdev->dev, "No oob scheme defined for oobsize %d\n",
> +					 mtd->oobsize);
> +				BUG();

checkpatch justifiably complains about the use of BUG(). Though, since
it's not introduced here, I don't expect you to change it now. But it'd
be nice to remove that in a separate patch eventually. Of course, I
can't speak too much, as I should clean up nand_scan_tail(), which is
plagued by the same problem...

> +			}
>  		}
>  	}
>  
> diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
> index c8be32e..dfdbb16 100644
> --- a/include/linux/mtd/fsmc.h
> +++ b/include/linux/mtd/fsmc.h
> @@ -163,6 +163,8 @@ struct fsmc_nand_platform_data {
>  	/* priv structures for dma accesses */
>  	void			*read_dma_priv;
>  	void			*write_dma_priv;
> +
> +	int			ecc_mode;

You probably don't need to duplicate nand->ecc.mode here.

>  };
>  
>  extern int __init fsmc_nor_init(struct platform_device *pdev,
> -- 
> 2.5.1
> 

Brian
