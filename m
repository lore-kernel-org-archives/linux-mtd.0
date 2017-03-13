Date: Mon, 13 Mar 2017 21:43:44 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 jason@lakedaemon.net, andrew@lunn.ch, richard@nod.at,
 linux-arm-kernel@lists.infradead.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] mtd: nand: orion: fix clk handling
Message-ID: <20170313204344.GA24471@gandalf>
References: <20170312213406.20987-1-gmbnomis@gmail.com>
 <20170313071241.y5ydl274t22awrys@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170313071241.y5ydl274t22awrys@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Uwe,

On Mon, Mar 13, 2017 at 08:12:41AM +0100, Uwe Kleine-K?nig wrote:
> Hello Simon,
> 
> On Sun, Mar 12, 2017 at 10:34:06PM +0100, Simon Baatz wrote:
> > The clk handling in orion_nand.c had two problems:
> > 
> > - In the probe function, clk_put() was called for an enabled clock,
> >   which violates the API (see documentation for clk_put() in
> >   include/linux/clk.h)
> > 
> > - In the error path of the probe function, clk_put() could be called
> >   twice for the same clock.
> > 
> > In order to clean this up, use the managed function devm_clk_get() and
> > store the pointer to the clk in the driver data.

...

> >  	/* Not all platforms can gate the clock, so it is not
> >  	   an error if the clock does not exists. */
> > -	clk = clk_get(&pdev->dev, NULL);
> > -	if (!IS_ERR(clk)) {
> > -		clk_prepare_enable(clk);
> > -		clk_put(clk);
> > -	}
> > +	info->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (!IS_ERR(info->clk))
> > +		clk_prepare_enable(info->clk);
> 
> Orthogonal to your patch I suggest:
> 
> -	info->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (!IS_ERR(info->clk))
> -		clk_prepare_enable(info->clk);
> +	info->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(info->clk)) {
> +		ret = PTR_ERR(info->clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(...);
> +		return ret;
> +	}
> 
> to correct error handling.
> (I didn't check if a plain return is right here, and also other users of
> info->clk need adaption.)

Nice! However, I can't find a devm_clk_get_optional() anywhere(?) Is
it in some upcoming patch?


- Simon
