Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ciptc-0002Is-8b
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 22:05:27 +0000
Date: Tue, 28 Feb 2017 23:05:01 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-mtd@lists.infradead.org, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@atmel.com
Subject: Re: [PATCH V4, 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp()
 prototype
Message-ID: <20170228230501.370ef2bb@bbrezillon>
In-Reply-To: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
References: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
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

On Tue, 28 Feb 2017 11:55:25 -0500
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Changing brcmnand_set_wp() prototype in prepration for refactoring the nand
> write protect logic to add flash status byte check for the protection bit.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 42ebd73..c7c4efe 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -765,11 +765,14 @@ enum {
>  	CS_SELECT_AUTO_DEVICE_ID_CFG		= BIT(30),
>  };
>  
> -static inline void brcmnand_set_wp(struct brcmnand_controller *ctrl, bool en)
> +static int brcmnand_set_wp(struct brcmnand_host *host, int en)
>  {
> +	struct brcmnand_controller *ctrl = host->ctrl;
>  	u32 val = en ? CS_SELECT_NAND_WP : 0;
>  
>  	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_SELECT, CS_SELECT_NAND_WP, 0, val);
> +
> +	return 0;
>  }
>  
>  /***********************************************************************
> @@ -1029,7 +1032,7 @@ static void brcmnand_wp(struct mtd_info *mtd, int wp)
>  			dev_dbg(ctrl->dev, "WP %s\n", wp ? "on" : "off");
>  			old_wp = wp;
>  		}
> -		brcmnand_set_wp(ctrl, wp);
> +		brcmnand_set_wp(host, wp);
>  	}
>  }
>  
> @@ -2462,14 +2465,6 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  	/* Disable XOR addressing */
>  	brcmnand_rmw_reg(ctrl, BRCMNAND_CS_XOR, 0xff, 0, 0);
>  
> -	if (ctrl->features & BRCMNAND_HAS_WP) {
> -		/* Permanently disable write protection */
> -		if (wp_on == 2)
> -			brcmnand_set_wp(ctrl, false);
> -	} else {
> -		wp_on = 0;
> -	}
> -

	if (!(ctrl->features & BRCMNAND_HAS_WP))
		wp_on = 0;

>  	/* IRQ */
>  	ctrl->irq = platform_get_irq(pdev, 0);
>  	if ((int)ctrl->irq < 0) {
> @@ -2522,6 +2517,18 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>  			}
>  
>  			list_add_tail(&host->node, &ctrl->host_list);
> +
> +			if (ctrl->features & BRCMNAND_HAS_WP) {
> +				/* Permanently disable write protection */
> +				if (wp_on == 2) {
> +					ret = brcmnand_set_wp(host, false);
> +					if (ret)
> +						goto err;
> +				}
> +			} else {
> +				wp_on = 0;
> +			}
> +

			/* Permanently disable write protection */
			if (wp_on == 2) {
				ret = brcmnand_set_wp(host, false);
				if (ret)
					goto err;
			}


>  		}
>  	}
>  
