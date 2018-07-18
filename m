Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffutp-0003qX-8S
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 22:26:23 +0000
Date: Thu, 19 Jul 2018 00:26:09 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180719002609.0d39b5cc@bbrezillon>
In-Reply-To: <20180718215056.1242-3-miquel.raynal@bootlin.com>
References: <20180718215056.1242-1-miquel.raynal@bootlin.com>
 <20180718215056.1242-3-miquel.raynal@bootlin.com>
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

On Wed, 18 Jul 2018 23:50:56 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> In order to remove the limitation that forbids dynamic allocation in
> nand_scan_ident(), we must create a path that will be the same for all
> controller drivers. The idea is to use nand_scan() instead of the widely
> used nand_scan_ident()/nand_scan_tail() couple. In order to achieve
> this, controller drivers will need to adjust some parameters between
> these two functions depending on the NAND chip wired on them.
> 

I'd reword a bit the following paragraphs.

"
This takes the form of two new hooks (->{attach,detach}_chip()) that are
placed in a new nand_controller_ops structure, which is then attached
to the nand_controller object at driver initialization time.
->attach_chip() is called between nand_scan_ident() and
nand_scan_tail(), and ->detach_chip() is called in the error path of
nand_scan() and in nand_cleanup().

Note that some NAND controller drivers don't have a dedicated
nand_controller object and instead rely on the default/dummy one
embedded in nand_chip. If you're in this case and still want to
initialize the controller ops, you'll have to manipulate
chip->dummy_controller directly.

Last but not least, it's worth mentioning that we plan to move some of
the controller related hooks placed in nand_chip into
nand_controller_ops to make the separation between NAND chip and NAND
controller methods clearer.
"

> For that, a hook called ->attach_chip() is created as part of the
> nand_controller_ops structure, itself embedded in the nand_controller
> structure. The later may be referenced by two ways:
> 1/ if the driver does not implement its own controller, the
>    chip->controller hook is not populated before nand_scan() so it
>    cannot be dereferenced: use chip->dummy_controller instead (which is
>    statically allocated and will be referenced later by chip->controller
>    anyway).
> 2/ through chip->controller if the driver implements its own controller.
> 
> Another hook, ->detach_chip() is also introduced in order to clean the
> controller driver's potential allocations in case of failure of
> nand_scan_tail(). There is no need for the controller driver to call the
> ->detach_chip() hook directly upon error after a successful nand_scan().  
> In this situation, calling nand_release() as before is enough.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 32 ++++++++++++++++++++++++++++++--
>  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
>  2 files changed, 46 insertions(+), 2 deletions(-)
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
> index eb5a053fd06b..d046b3a61205 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -509,6 +509,19 @@ struct nand_id {
>  	int len;
>  };
>  
> +/**
> + * struct nand_controller_ops - Controller operations

				   NAND controller operations

> + *
> + * @attach_chip:	Callback that may be called between nand_detect() and

				      ^ will

Just nitpicking, but I'm not a big fan of tab-based alignment, because
every time you add a new field whose name is longer than what you
initially planned, either you screw up the alignment, or you have to
re-align all other fields. If you just use a single space, at least
there's no alignment expectations to start with :-).

> + *			nand_scan_tail() during nand_scan() (optional).
> + * @detach_chip:	Callback that may be called if nand_scan_tail() fails

				      ^ will

And it's also called from nand_cleanup().

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

It's probably better to pass ops as a second argument here, or, if you
don't want to patch all drivers calling nand_controller_init() again,
create a nand_controller_init_with_ops() function and then turn
nand_controller_init() into a wrapper that calls
nand_controller_init_with_ops(nfc, NULL). 

>  	nfc->active = NULL;
>  	spin_lock_init(&nfc->lock);
>  	init_waitqueue_head(&nfc->wq);
> +	nfc->ops = NULL;
>  }
>  
>  /**
