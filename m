Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZp7n-0003l4-RW
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 23:50:00 +0000
Received: by pacex6 with SMTP id ex6so24131043pac.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2015 16:49:39 -0700 (PDT)
Date: Wed, 9 Sep 2015 16:49:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alex Smith <alex.smith@imgtec.com>
Cc: linux-mtd@lists.infradead.org, Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Niklas Cassel <niklass@axis.com>
Subject: Re: [PATCH v5 1/4] mtd: nand: increase ready wait timeout and report
 timeouts
Message-ID: <20150909234936.GB11487@google.com>
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-2-git-send-email-alex.smith@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441703453-2838-2-git-send-email-alex.smith@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Niklas

On Tue, Sep 08, 2015 at 10:10:50AM +0100, Alex Smith wrote:
> If nand_wait_ready() times out, this is silently ignored, and its
> caller will then proceed to read from/write to the chip before it is
> ready. This can potentially result in corruption with no indication as
> to why.
> 
> While a 20ms timeout seems like it should be plenty enough, certain
> behaviour can cause it to timeout much earlier than expected. The
> situation which prompted this change was that CPU 0, which is
> responsible for updating jiffies, was holding interrupts disabled
> for a fairly long time while writing to the console during a printk,
> causing several jiffies updates to be delayed. If CPU 1 happens to
> enter the timeout loop in nand_wait_ready() just before CPU 0 re-
> enables interrupts and updates jiffies, CPU 1 will immediately time
> out when the delayed jiffies updates are made. The result of this is
> that nand_wait_ready() actually waits less time than the NAND chip
> would normally take to be ready, and then read_page() proceeds to
> read out bad data from the chip.
> 
> The situation described above may seem unlikely, but in fact it can be
> reproduced almost every boot on the MIPS Creator Ci20.
> 
> Debugging this was made more difficult by the misleading comment above
> nand_wait_ready() stating "The timeout is caught later" - no timeout
> was ever reported, leading me away from the real source of the problem.
> 
> Therefore, this patch increases the timeout to 200ms. This should be
> enough to cover cases where jiffies updates get delayed. Additionally,
> add a pr_warn() when a timeout does occur so that it is easier to
> pinpoint any problems in future caused by the chip not becoming ready.

Did you examine other solutions? I've seen patches for hrtimer support
previously:

http://patchwork.ozlabs.org/patch/160333/
http://patchwork.ozlabs.org/patch/431066/

A few things have been cleaned up since then, so some of the initial
objections to the hrtimer patch don't make sense anymore, I believe.

Anyway, I think just increasing the timeout looks OK to me (as long as
we never have a 200ms jiffies jump... can this happen??), so hrtimer may
be over-engineering. I just want to make sure both options have been
considered before officially choosing one over the other.

Brian

> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> v4 -> v5:
>  - Remove spurious change.
>  - Add Ezequiel's Reviewed-by.
> 
> v3 -> v4:
>  - New patch to fix issue encountered in external Ci20 3.18 kernel
>    branch which also applies upstream.
> ---
>  drivers/mtd/nand/nand_base.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ceb68ca8277a..07b831b94e5c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -543,11 +543,16 @@ static void panic_nand_wait_ready(struct mtd_info *mtd, unsigned long timeo)
>  	}
>  }
>  
> -/* Wait for the ready pin, after a command. The timeout is caught later. */
> +/**
> + * nand_wait_ready - [GENERIC] Wait for the ready pin after commands.
> + * @mtd: MTD device structure
> + *
> + * Wait for the ready pin after a command, and warn if a timeout occurs.
> + */
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip = mtd->priv;
> -	unsigned long timeo = jiffies + msecs_to_jiffies(20);
> +	unsigned long timeo = jiffies + msecs_to_jiffies(200);
>  
>  	/* 400ms timeout */
>  	if (in_interrupt() || oops_in_progress)
> @@ -557,9 +562,12 @@ void nand_wait_ready(struct mtd_info *mtd)
>  	/* Wait until command is processed or timeout occurs */
>  	do {
>  		if (chip->dev_ready(mtd))
> -			break;
> +			goto out;
>  		touch_softlockup_watchdog();
>  	} while (time_before(jiffies, timeo));
> +
> +	pr_warn("timeout while waiting for chip to become ready\n");
> +out:
>  	led_trigger_event(nand_led_trigger, LED_OFF);
>  }
>  EXPORT_SYMBOL_GPL(nand_wait_ready);
> -- 
> 2.5.0
> 
