Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVXrs-0004ns-4Q
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 07:49:29 +0000
Date: Wed, 20 Jun 2018 09:49:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: add manufacturer fixup for ONFI
 parameter page
Message-ID: <20180620094906.261b04f5@bbrezillon>
In-Reply-To: <20180620050544.31549-3-chris.packham@alliedtelesis.co.nz>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
 <20180620050544.31549-3-chris.packham@alliedtelesis.co.nz>
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

On Wed, 20 Jun 2018 17:05:42 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> This is called after the ONFI parameter page checksum is verified
> and allows us to override the contents of the parameter page.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Ditto.

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - New
> Changes in v3:
> - Add doc comment and review from Boris
> 
>  drivers/mtd/nand/raw/nand_base.c | 4 ++++
>  include/linux/mtd/rawnand.h      | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 0cd3e216b95c..65250308c82d 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5172,6 +5172,10 @@ static int nand_flash_detect_onfi(struct nand_chip *chip)
>  		}
>  	}
>  
> +	if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
> +	    chip->manufacturer.desc->ops->fixup_onfi_param_page)
> +		chip->manufacturer.desc->ops->fixup_onfi_param_page(chip, p);
> +
>  	/* Check version */
>  	val = le16_to_cpu(p->revision);
>  	if (val & (1 << 5))
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 3e8ec3b8a39c..ef7e3b4e91ea 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -778,11 +778,14 @@ nand_get_sdr_timings(const struct nand_data_interface *conf)
>   *	  implementation) if any.
>   * @cleanup: the ->init() function may have allocated resources, ->cleanup()
>   *	     is here to let vendor specific code release those resources.
> + * @fixup_onfi_param_page: apply vendor specific fixups to the ONFI
> + *	parameter page. This is called after the checksum is verified.

Can you align the second line on the colon?

>   */
>  struct nand_manufacturer_ops {
>  	void (*detect)(struct nand_chip *chip);
>  	int (*init)(struct nand_chip *chip);
>  	void (*cleanup)(struct nand_chip *chip);
> +	void (*fixup_onfi_param_page)(struct nand_chip *chip, struct nand_onfi_params *p);
>  };
>  
>  /**
