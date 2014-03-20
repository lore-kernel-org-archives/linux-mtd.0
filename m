Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQabE-00033P-5S
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 10:53:25 +0000
Received: by mail-pd0-f171.google.com with SMTP id r10so760282pdi.2
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 03:53:02 -0700 (PDT)
Date: Thu, 20 Mar 2014 03:52:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v5 1/4] mtd: devices: elm: check for hardware engine's
 design constrains
Message-ID: <20140320105259.GM31517@norris-Latitude-E6410>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
 <1393845563-7800-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393845563-7800-2-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 03, 2014 at 04:49:20PM +0530, Pekon Gupta wrote:
> ELM hardware engine is used by BCH ecc-schemes for detecting and locating
> ECC errors. This patch adds following checks as per ELM design constrains:

s/constrains/constraints/

> 
>  - ELM internal buffers are of 1K,
>    So it cannot process data with ecc-step-size > 1K.
> 
>  - ELM engine can execute upto maximum of 8 threads in parallel,
>    So in *page-mode* (when complete page is processed in single iteration),
>    ELM cannot support ecc-steps > 8.
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c         | 19 ++++++++++++++++++-
>  drivers/mtd/nand/omap2.c          |  9 ++++++---
>  include/linux/platform_data/elm.h |  3 ++-
>  3 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index f160d2c..7fda50f 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -84,6 +84,9 @@ struct elm_info {
>  	struct list_head list;
>  	enum bch_ecc bch_type;
>  	struct elm_registers elm_regs;
> +	int ecc_steps;
> +	int ecc_step_size;
> +	int ecc_step_bytes;

I'm not sure 'ecc_step_bytes' is the right name. It sounds too similar
to 'ecc_step_size', when in fact it means "ECC syndrome bytes per step",
right? Maybe just 'ecc_syndrome_size'?

>  };
>  
>  static LIST_HEAD(elm_devices);
> @@ -103,7 +106,8 @@ static u32 elm_read_reg(struct elm_info *info, int offset)
>   * @dev:	ELM device
>   * @bch_type:	Type of BCH ecc
>   */
> -int elm_config(struct device *dev, enum bch_ecc bch_type)
> +int elm_config(struct device *dev, enum bch_ecc bch_type,
> +	int ecc_steps, int ecc_step_size, int ecc_step_bytes)
>  {
>  	u32 reg_val;
>  	struct elm_info *info = dev_get_drvdata(dev);
> @@ -112,10 +116,23 @@ int elm_config(struct device *dev, enum bch_ecc bch_type)
>  		dev_err(dev, "Unable to configure elm - device not probed?\n");
>  		return -ENODEV;
>  	}
> +	/* ELM cannot detect ECC errors for chunks > 1KB */
> +	if (ecc_step_size > (ELM_ECC_SIZE/2 + 1)) {

Please add a space around the divide operator:

	if (ecc_step_size > (ELM_ECC_SIZE / 2 + 1)) {

> +		pr_err("unsupported config ecc-size=%d", ecc_step_size);

You're missing "\n" in your format string.

> +		return -EINVAL;
> +	}
> +	/* ELM support 8 error syndrome process */
> +	if (ecc_steps > ERROR_VECTOR_MAX) {
> +		pr_err("unsupported config ecc-step=%d", ecc_steps);

Also missing "\n" here.

> +		return -EINVAL;
> +	}
>  
>  	reg_val = (bch_type & ECC_BCH_LEVEL_MASK) | (ELM_ECC_SIZE << 16);
>  	elm_write_reg(info, ELM_LOCATION_CONFIG, reg_val);
>  	info->bch_type = bch_type;
> +	info->ecc_steps		= ecc_steps;
> +	info->ecc_step_size	= ecc_step_size;
> +	info->ecc_step_bytes	= ecc_step_bytes;
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 5ce2097..369aee7 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1546,6 +1546,8 @@ static int is_elm_present(struct omap_nand_info *info,
>  			struct device_node *elm_node, enum bch_ecc bch_type)
>  {
>  	struct platform_device *pdev;
> +	struct nand_ecc_ctrl *ecc = &info->nand.ecc;
> +	int err = 0;
>  	/* check whether elm-id is passed via DT */
>  	if (!elm_node) {
>  		pr_err("nand: error: ELM DT node not found\n");
> @@ -1559,9 +1561,10 @@ static int is_elm_present(struct omap_nand_info *info,
>  	}
>  	/* ELM module available, now configure it */
>  	info->elm_dev = &pdev->dev;
> -	if (elm_config(info->elm_dev, bch_type))
> -		return -ENODEV;
> -	return 0;
> +	err = elm_config(info->elm_dev, bch_type,
> +		(info->mtd.writesize / ecc->size), ecc->size, ecc->bytes);

Isn't info->mtd.writesize / ecc->size the same as just ecc->steps?

> +
> +	return err;
>  }
>  #endif /* CONFIG_MTD_NAND_ECC_BCH */
>  
> diff --git a/include/linux/platform_data/elm.h b/include/linux/platform_data/elm.h
> index bf0a83b..b824ff3 100644
> --- a/include/linux/platform_data/elm.h
> +++ b/include/linux/platform_data/elm.h
> @@ -50,5 +50,6 @@ struct elm_errorvec {
>  
>  void elm_decode_bch_error_page(struct device *dev, u8 *ecc_calc,
>  		struct elm_errorvec *err_vec);
> -int elm_config(struct device *dev, enum bch_ecc bch_type);
> +int elm_config(struct device *dev, enum bch_ecc bch_type,
> +	int ecc_steps, int ecc_step_size, int ecc_step_bytes);
>  #endif /* __ELM_H */

Brian
