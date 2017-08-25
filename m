Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dl5wA-0008V7-2g
 for linux-mtd@lists.infradead.org; Fri, 25 Aug 2017 04:09:39 +0000
Received: by mail-pg0-x241.google.com with SMTP id a7so2110174pgn.4
 for <linux-mtd@lists.infradead.org>; Thu, 24 Aug 2017 21:09:17 -0700 (PDT)
Date: Thu, 24 Aug 2017 21:09:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: atmel: Relax tADL_min constraint
Message-ID: <20170825040913.GA68252@google.com>
References: <20170823184501.7665-1-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170823184501.7665-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Aug 23, 2017 at 08:45:01PM +0200, Boris Brezillon wrote:
> Version 4 of the ONFI spec mandates that tADL be at least 400 nanoseconds,
> but, depending on the master clock rate, 400 ns may not fit in the tADL
> field of the SMC reg. We need to relax the check and accept the -ERANGE
> return code.
> 
> Note that previous versions of the ONFI spec had a lower tADL_min (100 or
> 200 ns). It's not clear why this timing constraint got increased but it
> seems most NANDs are fine with values lower than 400ns, so we should be
> safe.
> 
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/atmel/nand-controller.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
> index 2c8baa0c2c4e..ceec21bd30c4 100644
> --- a/drivers/mtd/nand/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/atmel/nand-controller.c
> @@ -1364,7 +1364,18 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
>  	ret = atmel_smc_cs_conf_set_timing(smcconf,
>  					   ATMEL_HSMC_TIMINGS_TADL_SHIFT,
>  					   ncycles);
> -	if (ret)
> +	/*
> +	 * Version 4 of the ONFI spec mandates that tADL be at least 400
> +	 * nanoseconds, but, depending on the master clock rate, 400 ns may not
> +	 * fit in the tADL field of the SMC reg. We need to relax the check and
> +	 * accept the -ERANGE return code.
> +	 *
> +	 * Note that previous versions of the ONFI spec had a lower tADL_min
> +	 * (100 or 200 ns). It's not clear why this timing constraint got
> +	 * increased but it seems most NANDs are fine with values lower than
> +	 * 400ns, so we should be safe.
> +	 */
> +	if (ret && ret != -ERANGE)
>  		return ret;

So I take it you're fine with falling back to this case, where you just
get the "max" (and "max" is not quite 400ns)?

        /*
         * Let's just put the maximum we can if the requested setting does
         * not fit in the register field.
         * We still return -ERANGE in case the caller cares.
         */

Could be nice if there was some kind of sanity check still (e.g., don't
allow 1ns when we requested 1000ns), but I'm not sure what that would
be.

Unless I hear screaming, I'll queue this up and send it out within a
day.

Brian

>  	ncycles = DIV_ROUND_UP(conf->timings.sdr.tAR_min, mckperiodps);
> -- 
> 2.11.0
> 
