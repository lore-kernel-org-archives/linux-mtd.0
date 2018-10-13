Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBCtz-0003OB-SN
 for linux-mtd@lists.infradead.org; Sat, 13 Oct 2018 05:55:53 +0000
Date: Sat, 13 Oct 2018 07:55:37 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: Provide helper for polling GPIO
 R/B pin
Message-ID: <20181013075537.291e145f@bbrezillon>
In-Reply-To: <20181012204101.26274-1-jmkrzyszt@gmail.com>
References: <20181003120028.9257-1-jmkrzyszt@gmail.com>
 <20181012204101.26274-1-jmkrzyszt@gmail.com>
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

Hi Janusz,

On Fri, 12 Oct 2018 22:41:00 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Each controller driver with access to NAND R/B pin over GPIO would have 
> to reimplement the polling loop otherwise.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
> Changelog:
> v2:
> New patch - v1 consisted of only one patch (the followning one)
> 
> 
>  drivers/mtd/nand/raw/nand_base.c | 38 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      | 10 ++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 05bd0779fe9b..ff1ac4a3c647 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -45,6 +45,9 @@
>  #include <linux/io.h>
>  #include <linux/mtd/partitions.h>
>  #include <linux/of.h>
> +#ifdef CONFIG_GPIOLIB
> +#include <linux/gpio/consumer.h>
> +#endif

The ifdef is not needed here, linux/gpio/consumer.h already has dummy
wrappers when CONFIG_GPIOLIB is not enabled.

>  
>  #include "internals.h"
>  
> @@ -531,6 +534,41 @@ int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms)
>  };
>  EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
>  
> +#ifdef CONFIG_GPIOLIB
> +/**
> + * nand_gpio_waitrdy - Poll R/B GPIO pin until ready
> + * @chip: NAND chip structure
> + * @gpiod: GPIO descriptor of R/B pin
> + * @timeout_ms: Timeout in ms
> + *
> + * Poll the R/B GPIO pin until it becomes ready. If that does not happen
> + * whitin the specified timeout, -ETIMEDOUT is returned.
> + *
> + * This helper is intended to be used when the controller has access to the
> + * NAND R/B pin over GPIO.
> + *
> + * Be aware that calling this helper from an ->exec_op() implementation means
> + * ->exec_op() must be re-entrant.

This is not true for this function: it does not call nand_exec_op().

> + *
> + * Return 0 if the R/B pin indicates chip is ready, a negative error otherwise.
> + */
> +int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
> +		      unsigned long timeout_ms)
> +{
> +	/* Wait until command is processed or timeout occurs */
> +	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
> +	do {
> +		if (gpiod_get_value_cansleep(gpiod))
> +			return 0;
> +
> +		cond_resched();
> +	} while	(time_before(jiffies, timeout_ms));

> +
> +	return gpiod_get_value_cansleep(gpiod) ? 0 : -ETIMEDOUT;
> +};
> +EXPORT_SYMBOL_GPL(nand_gpio_waitrdy);
> +#endif

Hm, I don't see any other helpers defined in #ifdef blocks though most
of them are optionals and are most of the time not used by drivers.
Let's keep things consistent (at the expense of embedding unused code
in nand.o) and remove the #ifdef here. If someone starts complaining
about the size of the rawnand core, we'll consider doing that.

> +
>  /**
>   * panic_nand_get_device - [GENERIC] Get chip for selected access
>   * @chip: the nand chip descriptor
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index e10b126e148f..09f0ed1345b1 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1346,4 +1346,14 @@ void nand_release(struct nand_chip *chip);
>   */
>  int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms);
>  
> +#ifdef CONFIG_GPIOLIB
> +struct gpio_desc;
> +/*
> + * External helper for controller drivers that have to implement the WAITRDY
> + * instruction and do have GPIO pin to check it.
> + */

You can drop this comment, this is already explained in the kerneldoc
header above the function def.

> +int nand_gpio_waitrdy(struct nand_chip *chip, struct gpio_desc *gpiod,
> +		      unsigned long timeout_ms);
> +#endif
> +
>  #endif /* __LINUX_MTD_RAWNAND_H */

Regards,

Boris
