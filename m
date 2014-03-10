Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WN0NY-0006UC-8b
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 13:36:28 +0000
Date: Mon, 10 Mar 2014 10:35:50 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v6 1/4] mtd: devices: elm: check for hardware engine's
 design constrains
Message-ID: <20140310133550.GA5994@arch.cereza>
References: <1394197344-9468-1-git-send-email-pekon@ti.com>
 <1394197344-9468-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394197344-9468-2-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, avinashphilipk@gmail.com,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Pekon,

On Mar 07, Pekon Gupta wrote:
> ELM hardware engine is used by BCH ecc-schemes for detecting and locating
> ECC errors. This patch adds following checks as per ELM design constrains:
> 

s/constrains/constraints

>  - ELM internal buffers are of 1K,
>    So it cannot process data with ecc-step-size > 1K.
> 
>  - ELM engine can execute upto maximum of 8 threads in parallel,
>    So in *page-mode* (when complete page is processed in single iteration),
>    ELM cannot support ecc-steps > 8.
> 

Altough it's just a nitpick, I think you can work a bit on your explanations.
For instance, you start with a capital letter after a comma (1K, So it..).

And you have some incomplete sentences (This patch adds *the* following).

I'm not a native english speaker, so I know this can be hard! It's not a hard
requirement for the patch, but rather just a suggestion to improve your upstream
work.

I have a few comments below.

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

You are using dev_err on this function...

>  		return -ENODEV;
>  	}
> +	/* ELM cannot detect ECC errors for chunks > 1KB */
> +	if (ecc_step_size > (ELM_ECC_SIZE/2 + 1)) {
> +		pr_err("unsupported config ecc-size=%d", ecc_step_size);

... but then you use pr_err?

I think it's better to simply use dev_err() whenever possible as it carries
more information.

> +		return -EINVAL;
> +	}
> +	/* ELM support 8 error syndrome process */
> +	if (ecc_steps > ERROR_VECTOR_MAX) {
> +		pr_err("unsupported config ecc-step=%d", ecc_steps);

Ditto.

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

You're not using this values anywhere but in elm_config, at least in this
patch. I'd suggest that you remove the new field introduction here and
instead introduce it in the same patch you're using it.

Otherwise, you just confuse reviewers :)

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

Are you sure you need to initialize err here?

Thanks and sorry for reviewing this only now, after six rounds.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
