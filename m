Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9hs-0004w9-K9
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 06:01:42 +0000
Date: Tue, 19 Jun 2018 08:01:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH v2 2/6] mtd: rawnand: add manufacturer fixup for
 ONFI parameter page
Message-ID: <20180619080110.633b9077@bbrezillon>
In-Reply-To: <20180619053125.16792-3-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
 <20180619053125.16792-3-chris.packham@alliedtelesis.co.nz>
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

On Tue, 19 Jun 2018 17:31:21 +1200
Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:

> This is called after the ONFI parameter page checksum is verified
> and allows us to override the contents of the parameter page.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
> Changes in v2:
> - New
> 
>  drivers/mtd/nand/raw/nand_base.c | 4 ++++
>  include/linux/mtd/rawnand.h      | 1 +
>  2 files changed, 5 insertions(+)
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
> index 3e8ec3b8a39c..6db42091ee5e 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -783,6 +783,7 @@ struct nand_manufacturer_ops {
>  	void (*detect)(struct nand_chip *chip);
>  	int (*init)(struct nand_chip *chip);
>  	void (*cleanup)(struct nand_chip *chip);
> +	void (*fixup_onfi_param_page)(struct nand_chip *chip, struct nand_onfi_params *p);
>  };
>  
>  /**
