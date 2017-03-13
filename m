Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnX34-0007pV-J6
 for linux-mtd@lists.infradead.org; Mon, 13 Mar 2017 20:58:38 +0000
Date: Mon, 13 Mar 2017 21:58:08 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Simon Baatz <gmbnomis@gmail.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 jason@lakedaemon.net, andrew@lunn.ch, richard@nod.at,
 linux-arm-kernel@lists.infradead.org, dan.carpenter@oracle.com
Subject: Re: [PATCH] mtd: nand: orion: fix clk handling
Message-ID: <20170313205808.tpov2l4cd7b7b54p@pengutronix.de>
References: <20170312213406.20987-1-gmbnomis@gmail.com>
 <20170313071241.y5ydl274t22awrys@pengutronix.de>
 <20170313204344.GA24471@gandalf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170313204344.GA24471@gandalf>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Simon,

On Mon, Mar 13, 2017 at 09:43:44PM +0100, Simon Baatz wrote:
> Hello Uwe,
> 
> On Mon, Mar 13, 2017 at 08:12:41AM +0100, Uwe Kleine-K?nig wrote:
> > Hello Simon,
> > 
> > On Sun, Mar 12, 2017 at 10:34:06PM +0100, Simon Baatz wrote:
> > > The clk handling in orion_nand.c had two problems:
> > > 
> > > - In the probe function, clk_put() was called for an enabled clock,
> > >   which violates the API (see documentation for clk_put() in
> > >   include/linux/clk.h)
> > > 
> > > - In the error path of the probe function, clk_put() could be called
> > >   twice for the same clock.
> > > 
> > > In order to clean this up, use the managed function devm_clk_get() and
> > > store the pointer to the clk in the driver data.
> 
> ...
> 
> > >  	/* Not all platforms can gate the clock, so it is not
> > >  	   an error if the clock does not exists. */
> > > -	clk = clk_get(&pdev->dev, NULL);
> > > -	if (!IS_ERR(clk)) {
> > > -		clk_prepare_enable(clk);
> > > -		clk_put(clk);
> > > -	}
> > > +	info->clk = devm_clk_get(&pdev->dev, NULL);
> > > +	if (!IS_ERR(info->clk))
> > > +		clk_prepare_enable(info->clk);
> > 
> > Orthogonal to your patch I suggest:
> > 
> > -	info->clk = devm_clk_get(&pdev->dev, NULL);
> > -	if (!IS_ERR(info->clk))
> > -		clk_prepare_enable(info->clk);
> > +	info->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > +	if (IS_ERR(info->clk)) {
> > +		ret = PTR_ERR(info->clk);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(...);
> > +		return ret;
> > +	}
> > 
> > to correct error handling.
> > (I didn't check if a plain return is right here, and also other users of
> > info->clk need adaption.)
> 
> Nice! However, I can't find a devm_clk_get_optional() anywhere(?) Is
> it in some upcoming patch?

Oh really. I was sure I already made use of it. Probably consfused it
with the gpio or regulator API which have such variants. (But be aware,
they are sematically different. If you look for a place to copy from
please stick to the gpio sematic.)

Then either send a patch creating clk_get_optional and friends, or only
ignore -ENODEV but propagate the other error values. (Maybe the most
rational path is to do both and switch the driver once clk_get_optional
is available.)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
