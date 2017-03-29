Date: Wed, 29 Mar 2017 21:36:08 +0200
From: Simon Baatz <gmbnomis@gmail.com>
To: Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 jason@lakedaemon.net, andrew@lunn.ch, dan.carpenter@oracle.com
Subject: Re: [PATCH v2 1/2] mtd: nand: orion: fix clk handling
Message-ID: <20170329193607.GA24737@gandalf>
References: <20170327180208.13414-1-gmbnomis@gmail.com>
 <20170327181949.isafnqsnxkzed5nv@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170327181949.isafnqsnxkzed5nv@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Uwe,

On Mon, Mar 27, 2017 at 08:19:49PM +0200, Uwe Kleine-K?nig wrote:
> Hello,
> 
> > @@ -145,15 +151,13 @@ static int __init orion_nand_probe(struct platform_device *pdev)
> >  	if (board->dev_ready)
> >  		nc->dev_ready = board->dev_ready;
> >  
> > -	platform_set_drvdata(pdev, mtd);
> > +	platform_set_drvdata(pdev, info);
> >  
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
> you could to the following here instead:
> 
> 	info->clk = devm_clk_get(&pdev->dev, NULL);
> 	if (IS_ERR(info->clk))
> 		/*
> 		 * We ignore all errors here, that's wrong but only for
> 		 * one commit.
> 		 */
> 		info->clk = NULL;
> 
> 	ret = clk_prepare_enable(info->clk);
> 	if (ret) ...
> 

Makes sense.  I don't think we should have such a comment, though. 
The patch description states what it fixes and the patch fixes
exactly that.  Moreover, I tagged this patch for stable (because of
the double free it fixes) and there might be no other commit.  (I
think the error handling problem is not severe enough for stable.  It
has been this way a couple of years and nobody seems to have
noticed.)


- Simon
