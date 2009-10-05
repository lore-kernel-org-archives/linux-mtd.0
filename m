Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MuiuO-0007Uh-Pn
	for linux-mtd@lists.infradead.org; Mon, 05 Oct 2009 08:27:10 +0000
Subject: Re: [PATCH, Repost]: NAND: Add panic_write for NAND flashes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091001141250.2f2fa9e4@marrow.netinsight.se>
References: <20091001141250.2f2fa9e4@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 05 Oct 2009 11:26:54 +0300
Message-Id: <1254731214.3359.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-01 at 14:12 +0200, Simon Kagstrom wrote:
> Hello,
> 
> This is a quick and dirty patch to add panic_write for NAND flashes.
> The patch seems to work OK on my CRIS board running a 2.6.26 kernel
> with a ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB 3,3V 8-bit).
> Also compile tested on a fresh x86 MTD git clone.
> 
> If you find it useful feel free to apply it, otherwise >/dev/null.

Yes, I think it is useful. Few nit-picks below.

> +/**
> + * panic_nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
> + * @mtd:	MTD device structure
> + * @timeo:	Timeout
> + *
> + * Helper function for nand_wait_ready used when needing to wait in interrupt
> + * context.
> + */
> +static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	int i;
> +
> +	/* Give the device 400 ms to get ready?	 */
> +	for (i = 0; i < timeo; i++) {
> +		if (chip->dev_ready(mtd))
> +			break;
> +		touch_softlockup_watchdog();
> +		mdelay(1);
> +	}
> +}

The time-out is a parameter, so the above comment about 400 ms is wrong.

>  /*
>   * Wait for the ready pin, after a command
>   * The timeout is catched later.
> @@ -437,6 +459,10 @@ void nand_wait_ready(struct mtd_info *mtd)
>  	struct nand_chip *chip = mtd->priv;
>  	unsigned long timeo = jiffies + 2;
>  
> +	/* 400ms timeout?  */
> +	if (in_interrupt())
> +		return panic_nand_wait_ready(mtd, 400);

How about:

if (in_interrupt() || oops_in_progress)

Also, why a question mark in the comment? Would be better to add a note
why 400, or you prefer to ask the reader :-)))
 
>  /**
> + * panic_nand_get_device - [GENERIC] Get chip for selected access
> + * @chip:	the nand chip descriptor
> + * @mtd:	MTD device structure
> + * @new_state:	the state which is requested
> + *
> + * Used when in panic, no locks are taken.
> + */
> +static void
> +panic_nand_get_device(struct nand_chip *chip,
> +		      struct mtd_info *mtd, int new_state)
> +{
> +	/* Hardware controller shared among independend devices */
> +	chip->controller->active = chip;
> +	chip->state = new_state;
> +}

A little inconsistent. Better format this like:

static void panic_nand_get_device(struct nand_chip *chip, truct mtd_info
*mtd,
                                  int new_state)


> +
> +/**
>   * nand_get_device - [GENERIC] Get chip for selected access
>   * @chip:	the nand chip descriptor
>   * @mtd:	MTD device structure
> @@ -710,6 +753,32 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
>  }
>  
>  /**
> + * panic_nand_wait - [GENERIC]  wait until the command is done
> + * @mtd:	MTD device structure
> + * @chip:	NAND chip structure
> + * @timeo:	Timeout
> + *
> + * Wait for command done. This is a helper function for nand_wait used when
> + * we are in interrupt context. May happen when in panic and trying to write
> + * an oops trough mtdoops.
> + */
> +static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
> +			    unsigned long timeo)
> +{
> +	int i;
> +	for (i = 0; i < timeo; i++) {
> +		if (chip->dev_ready) {
> +			if (chip->dev_ready(mtd))
> +				break;
> +		} else {
> +			if (chip->read_byte(mtd) & NAND_STATUS_READY)
> +				break;
> +		}
> +		mdelay(1);
> +        }
> +}
> +
> +/**
>   * nand_wait - [DEFAULT]  wait until the command is done
>   * @mtd:	MTD device structure
>   * @chip:	NAND chip structure
> @@ -740,15 +809,19 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	else
>  		chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>  
> -	while (time_before(jiffies, timeo)) {
> -		if (chip->dev_ready) {
> -			if (chip->dev_ready(mtd))
> -				break;
> -		} else {
> -			if (chip->read_byte(mtd) & NAND_STATUS_READY)
> -				break;
> +	if (in_interrupt())
> +		panic_nand_wait(mtd, chip, timeo);

if (in_interrupt() || oops_in_progress)

?

> +	else {
> +		while (time_before(jiffies, timeo)) {
> +			if (chip->dev_ready) {
> +				if (chip->dev_ready(mtd))
> +					break;
> +			} else {
> +				if (chip->read_byte(mtd) & NAND_STATUS_READY)
> +					break;
> +			}
> +			cond_resched();
>  		}
> -		cond_resched();
>  	}
>  	led_trigger_event(nand_led_trigger, LED_OFF);

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
