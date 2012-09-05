Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Kl2-0004xP-Ok
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 18:55:26 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
Date: Wed, 5 Sep 2012 20:55:18 +0200
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1346855725-31726-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201209052055.19123.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, b32955@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Using module_platform_driver() makes the code smaller and cleaner.

You did not document the dev_info() etc. addition, dunno if it's important or 
not.

Otherwise,

Reviewed-by: Marek Vasut <marex@denx.de>

> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> This patch depends on: "mtd: gpmi-nand: Improve logging style"
> 
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   29
> +++++++---------------------- 1 file changed, 7 insertions(+), 22
> deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 9493507..5999b15 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1651,6 +1651,8 @@ static int __devinit gpmi_nand_probe(struct
> platform_device *pdev) if (ret)
>  		goto exit_nfc_init;
> 
> +	dev_info(this->dev, "driver registered.\n");
> +
>  	return 0;
> 
>  exit_nfc_init:
> @@ -1658,10 +1660,12 @@ exit_nfc_init:
>  exit_acquire_resources:
>  	platform_set_drvdata(pdev, NULL);
>  	kfree(this);
> +	dev_err(this->dev, "driver registration failed: %d\n", ret);
> +
>  	return ret;
>  }
> 
> -static int __exit gpmi_nand_remove(struct platform_device *pdev)
> +static int __devexit gpmi_nand_remove(struct platform_device *pdev)
>  {
>  	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
> 
> @@ -1678,29 +1682,10 @@ static struct platform_driver gpmi_nand_driver = {
>  		.of_match_table = gpmi_nand_id_table,
>  	},
>  	.probe   = gpmi_nand_probe,
> -	.remove  = __exit_p(gpmi_nand_remove),
> +	.remove  = __devexit_p(gpmi_nand_remove),
>  	.id_table = gpmi_ids,
>  };
> -
> -static int __init gpmi_nand_init(void)
> -{
> -	int err;
> -
> -	err = platform_driver_register(&gpmi_nand_driver);
> -	if (err == 0)
> -		pr_info("driver registered.\n");
> -	else
> -		pr_err("driver registration failed.\n");
> -	return err;
> -}
> -
> -static void __exit gpmi_nand_exit(void)
> -{
> -	platform_driver_unregister(&gpmi_nand_driver);
> -}
> -
> -module_init(gpmi_nand_init);
> -module_exit(gpmi_nand_exit);
> +module_platform_driver(gpmi_nand_driver);
> 
>  MODULE_AUTHOR("Freescale Semiconductor, Inc.");
>  MODULE_DESCRIPTION("i.MX GPMI NAND Flash Controller Driver");

Best regards,
Marek Vasut
