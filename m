Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIbSe-0002G3-Os
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 13:57:26 +0000
Date: Wed, 7 Jun 2017 15:57:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v5 10/23] mtd: nand: denali: rework interrupt handling
Message-ID: <20170607155701.4bc89ad8@bbrezillon>
In-Reply-To: <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-11-git-send-email-yamada.masahiro@socionext.com>
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

On Wed,  7 Jun 2017 20:52:19 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:


> -/*
> - * This is the interrupt service routine. It handles all interrupts
> - * sent to this device. Note that on CE4100, this is a shared interrupt.
> - */
> -static irqreturn_t denali_isr(int irq, void *dev_id)
> +static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
> +				    uint32_t irq_mask)
>  {
> -	struct denali_nand_info *denali = dev_id;
> +	unsigned long time_left, flags;
>  	uint32_t irq_status;
> -	irqreturn_t result = IRQ_NONE;
>  
> -	spin_lock(&denali->irq_lock);
> +	spin_lock_irqsave(&denali->irq_lock, flags);
>  
> -	/* check to see if a valid NAND chip has been selected. */
> -	if (is_flash_bank_valid(denali->flash_bank)) {
> -		/*
> -		 * check to see if controller generated the interrupt,
> -		 * since this is a shared interrupt
> -		 */
> -		irq_status = denali_irq_detected(denali);
> -		if (irq_status != 0) {
> -			/* handle interrupt */
> -			/* first acknowledge it */
> -			clear_interrupt(denali, irq_status);
> -			/*
> -			 * store the status in the device context for someone
> -			 * to read
> -			 */
> -			denali->irq_status |= irq_status;
> -			/* notify anyone who cares that it happened */
> -			complete(&denali->complete);
> -			/* tell the OS that we've handled this */
> -			result = IRQ_HANDLED;
> -		}
> +	irq_status = denali->irq_status;
> +
> +	if (irq_mask & irq_status) {
> +		spin_unlock_irqrestore(&denali->irq_lock, flags);
> +		return irq_status;
>  	}
> -	spin_unlock(&denali->irq_lock);
> -	return result;
> +
> +	denali->irq_mask = irq_mask;
> +	reinit_completion(&denali->complete);

These 2 instructions should be done before calling
denali_wait_for_irq() (for example in denali_reset_irq()), otherwise
you might loose events if they happen between your irq_status read and
the reinit_completion() call. You should also clear existing interrupts
before launching your operation, otherwise you might wakeup on previous
events.

> +	spin_unlock_irqrestore(&denali->irq_lock, flags);
> +
> +	time_left = wait_for_completion_timeout(&denali->complete,
> +						msecs_to_jiffies(1000));
> +	if (!time_left) {
> +		dev_err(denali->dev, "timeout while waiting for irq 0x%x\n",
> +			denali->irq_mask);
> +		return 0;
> +	}
> +
> +	return denali->irq_status;
>  }
>  
