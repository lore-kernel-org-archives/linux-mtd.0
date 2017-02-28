Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cimSw-0003M7-BA
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 18:25:40 +0000
Received: by mail-wm0-x241.google.com with SMTP id u63so3691642wmu.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 10:25:16 -0800 (PST)
Subject: Re: [PATCH V4, 1/2] mtd: nand: brcmnand: Change brcmnand_set_wp()
 prototype
To: Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org
References: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at, cyrille.pitchen@atmel.com
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <08fbd1bb-6e3b-40c4-e1ff-c1edebee625a@gmail.com>
Date: Tue, 28 Feb 2017 19:25:13 +0100
MIME-Version: 1.0
In-Reply-To: <1488300926-3517-1-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/28/2017 05:55 PM, Kamal Dasu wrote:
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

Would it be worth it to move this into separate function ? Or maybe make
brcmnand_set_wp() check for BRCMNAND_HAS_WP and only set the WP
if the controller is actually capable of that ? I think that might make
the code readability a bit better ...

>  		}
>  	}
>  
> 


-- 
Best regards,
Marek Vasut
