Date: Fri, 30 Dec 2011 09:46:43 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] MTD/GPMI bugfix : reset the BCH module when it is not MX23
Message-ID: <20111230074643.GA3018@tarshish>
References: <1325215690-22209-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325215690-22209-1-git-send-email-b32955@freescale.com>
Cc: koen.beel.barco@gmail.com, w.sang@pengutronix.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Artem.Bityutskiy@intel.com, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org, LW@KARO-electronics.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Fri, Dec 30, 2011 at 11:28:10AM +0800, Huang Shijie wrote:
> In MX28, if we do not reset the BCH module. The BCH module may
> becomes unstable when the board reboots for several thousands times.
> This bug has been catched in customer's production.
> 
> The patch adds some comments, and fixes it now.
> 
> Also change gpmi_reset_block() to static.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---

[snip]

> -	ret = gpmi_reset_block(r->bch_regs, true);
> +	/* The bug only exits in mx23, the following chips fix it. */
> +	if (GPMI_IS_MX23(this))
> +		ret = gpmi_reset_block(r->bch_regs, true);
> +	else
> +		ret = gpmi_reset_block(r->bch_regs, false);

This can be shortened to:

    ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));

>  	if (ret)
>  		goto err_out;
>  
> -- 
> 1.7.0.4

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
