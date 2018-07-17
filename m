Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOhu-0005yg-Dx
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:03:56 +0000
Date: Tue, 17 Jul 2018 14:03:32 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 3/3] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180717140332.7f47f9da@bbrezillon>
In-Reply-To: <20180717095454.27935-4-miquel.raynal@bootlin.com>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-4-miquel.raynal@bootlin.com>
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

On Tue, 17 Jul 2018 11:54:54 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In order to remove the limitation that forbids dynamic allocation in
> nand_scan_ident(), we must create a path that will be the same for all
> controller drivers. The idea is to use nand_scan() instead of the widely
> implemented nand_scan_ident()/nand_scan_tail() couple. In order to

  ^ used

> achieve this, controller drivers will need to adjust some parameters
> between these two functions depending on the NAND chip wired on them.
> 
> For that, a hook called ->attach_chip() is created in the
> nand_controller structure. This structure may be referenced by two ways:

This is no longer true. Now ->attach_chip() is part of
nand_controller_ops, and nand_controller has a pointer to a
nand_controller_ops implementation.

> 1/ if the driver does not implement its own controller, the
>    chip->controller hook is not populated before nand_scan() so it
>    cannot be dereferenced: use chip->hwcontrol instead (which is
>    statically allocated and will be referenced later by chip->controller
>    anyway).

Not related to this patch, but I'd rename chip->hwcontrol into
chip->dummycontroller or something that clearly shows that this field
should only be used when the controller driver is dumb and can only
control a single chip.

> 2/ through chip->controller if the driver implements its own controller.
> 
> Another hook, ->detach_chip() is also introduced in order to clean the
> controller driver's potential allocations in case of failure of
> nand_scan_tail(). There is no need for the controller driver to call the
> ->detach_chip() hook directly upon error after a successful nand_scan().  
> In this situation, calling nand_release() as before is enough.
> 
> Both ->attac/detach_chip() hooks are located in a nand_controller_ops
> structure.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

The implementation looks good (one minor comment below, but you can
ignore it if you disagree), so once you've fixed the commit message you
can add

Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 21 +++++++++++++++++++--
>  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
>  2 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index e21f03ee3251..5e8278281ba8 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6710,11 +6710,23 @@ EXPORT_SYMBOL(nand_scan_tail);
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
> +	if (chip->controller->ops && chip->controller->ops->attach_chip) {
> +		ret = chip->controller->ops->attach_chip(chip);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret && chip->controller->ops && chip->controller->ops->detach_chip)
> +		chip->controller->ops->detach_chip(chip);

I'd recommend creating wrappers for detach/attach operations, just in case
you need to automate more things in there:

static int nand_attach(struct nand_chip *chip)
{
	if (chip->controller->ops && chip->controller->ops->attach_chip)
		return chip->controller->ops->attach_chip(chip);

	return 0;
}

static void nand_detach(struct nand_chip *chip)
{
	if (chip->controller->ops && chip->controller->ops->detach_chip)
		chip->controller->ops->detach_chip(chip);
}

> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan_with_ids);
> @@ -6742,7 +6754,12 @@ void nand_cleanup(struct nand_chip *chip)
>  
>  	/* Free manufacturer priv data. */
>  	nand_manufacturer_cleanup(chip);
> +
> +	/* Free controller specific allocations after chip identification */
> +	if (chip->controller->ops && chip->controller->ops->detach_chip)
> +		chip->controller->ops->detach_chip(chip);
>  }
> +
>  EXPORT_SYMBOL_GPL(nand_cleanup);
>  
>  /**
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index f5fb9caf6dca..d1f2267ae724 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -509,6 +509,19 @@ struct nand_id {
>  	int len;
>  };
>  
> +/**
> + * struct nand_controller_ops - Controller operations
> + *
> + * @attach_chip:	Callback that may be called between nand_detect() and

							    ^nand_scan_ident()?

> + *			nand_scan_tail() during nand_scan() (optional).
> + * @detach_chip:	Callback that may be called if nand_scan_tail() fails
> + *			(optional).
> + */
> +struct nand_controller_ops {
> +	int (*attach_chip)(struct nand_chip *chip);
> +	void (*detach_chip)(struct nand_chip *chip);
> +};
> +
>  /**
>   * struct nand_controller - Control structure for hardware controller
>   *                          shared among independent devices
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
> @@ -529,6 +544,7 @@ static inline void nand_controller_init(struct nand_controller *nfc)
>  	nfc->active = NULL;
>  	spin_lock_init(&nfc->lock);
>  	init_waitqueue_head(&nfc->wq);
> +	nfc->ops = NULL;
>  }
>  
>  /**
