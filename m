Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fij26-0004iC-2k
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 16:22:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Jul 2018 18:22:10 +0200
From: Stefan Agner <stefan@agner.ch>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: add hooks that may be called during
 nand_scan()
In-Reply-To: <20180718231234.8534-3-miquel.raynal@bootlin.com>
References: <20180718231234.8534-1-miquel.raynal@bootlin.com>
 <20180718231234.8534-3-miquel.raynal@bootlin.com>
Message-ID: <cf9e65608733ecf1d0e3728e42df1acc@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 19.07.2018 01:12, Miquel Raynal wrote:
> In order to remove the limitation that forbids dynamic allocation in
> nand_scan_ident(), we must create a path that will be the same for all
> controller drivers. The idea is to use nand_scan() instead of the widely
> used nand_scan_ident()/nand_scan_tail() couple. In order to achieve
> this, controller drivers will need to adjust some parameters between
> these two functions depending on the NAND chip wired on them.
> 
> This takes the form of two new hooks (->{attach,detach}_chip()) that are
> placed in a new nand_controller_ops structure, which is then attached
> to the nand_controller object at driver initialization time.
> ->attach_chip() is called between nand_scan_ident() and
> nand_scan_tail(), and ->detach_chip() is called in the error path of
> nand_scan() and in nand_cleanup().
> 
> Note that some NAND controller drivers don't have a dedicated
> nand_controller object and instead rely on the default/dummy one
> embedded in nand_chip. If you're in this case and still want to
> initialize the controller ops, you'll have to manipulate
> chip->dummy_controller directly.
> 
> Last but not least, it's worth mentioning that we plan to move some of
> the controller related hooks placed in nand_chip into
> nand_controller_ops to make the separation between NAND chip and NAND
> controller methods clearer.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 32 ++++++++++++++++++++++++++++++--
>  include/linux/mtd/rawnand.h      | 15 +++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 0aef0299f4f2..a64a344bf7a9 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6697,6 +6697,20 @@ EXPORT_SYMBOL(nand_scan_tail);
>  	is_module_text_address((unsigned long)__builtin_return_address(0))
>  #endif
>  
> +static int nand_attach(struct nand_chip *chip)
> +{
> +	if (chip->controller->ops && chip->controller->ops->attach_chip)
> +		return chip->controller->ops->attach_chip(chip);
> +
> +	return 0;
> +}
> +
> +static void nand_detach(struct nand_chip *chip)
> +{
> +	if (chip->controller->ops && chip->controller->ops->detach_chip)
> +		chip->controller->ops->detach_chip(chip);
> +}
> +
>  /**
>   * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
>   * @mtd: MTD device structure
> @@ -6710,11 +6724,21 @@ EXPORT_SYMBOL(nand_scan_tail);
>  int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
>  		       struct nand_flash_dev *ids)
>  {
> +	struct nand_chip *chip = mtd_to_nand(mtd);
>  	int ret;
>  
>  	ret = nand_scan_ident(mtd, maxchips, ids);
> -	if (!ret)
> -		ret = nand_scan_tail(mtd);
> +	if (ret)
> +		return ret;
> +
> +	ret = nand_attach(chip);
> +	if (ret)
> +		return ret;
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret)
> +		nand_detach(chip);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_with_ids);
> @@ -6742,7 +6766,11 @@ void nand_cleanup(struct nand_chip *chip)
>  
>  	/* Free manufacturer priv data. */
>  	nand_manufacturer_cleanup(chip);
> +
> +	/* Free controller specific allocations after chip identification */
> +	nand_detach(chip);
>  }
> +
>  EXPORT_SYMBOL_GPL(nand_cleanup);
>  
>  /**
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index d1634bc0489b..0dfb65b2685c 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -509,6 +509,19 @@ struct nand_id {
>  	int len;
>  };
>  
> +/**
> + * struct nand_controller_ops - Controller operations
> + *
> + * @attach_chip: Callback that will be called between nand_detect() and
> + *		 nand_scan_tail() during nand_scan() (optional).
> + * @detach_chip: Callback that will be called from nand_cleanup() or if
> + *		 nand_scan_tail() fails (optional).

This documentation reads not very helpful to me.

It would be useful if it is written more from the driver developers
perspective, e.g. what those callbacks ideally are supposed to do...

--
Stefan

> + */
> +struct nand_controller_ops {
> +	int (*attach_chip)(struct nand_chip *chip);
> +	void (*detach_chip)(struct nand_chip *chip);
> +};
> +
>  /**
>   * struct nand_controller - Structure used to describe a NAND controller
>   *
> @@ -517,11 +530,13 @@ struct nand_id {
>   * @wq:			wait queue to sleep on if a NAND operation is in
>   *			progress used instead of the per chip wait queue
>   *			when a hw controller is available.
> + * @ops:		NAND controller operations.
>   */
>  struct nand_controller {
>  	spinlock_t lock;
>  	struct nand_chip *active;
>  	wait_queue_head_t wq;
> +	const struct nand_controller_ops *ops;
>  };
>  
>  static inline void nand_controller_init(struct nand_controller *nfc)
