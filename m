Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3cVv-0008K2-RJ
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 07:07:26 +0000
Date: Wed, 4 Apr 2018 09:07:10 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Xidong Wang <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/1] mtd:nand:fix memory leak
Message-ID: <20180404090710.4f74b5b4@bbrezillon>
In-Reply-To: <20180404082807.0f211578@xps13>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13>
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

On Wed, 4 Apr 2018 08:28:07 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Xidong,
> 
> As part of a reorganization in the NAND subsystem, you should now
> prefix your commit title this way:
> 
>         mtd: rawnand: tango: fix memory leak
> 
> Not sure if this patch is candidate to cc:stable?
> 
> On Wed,  4 Apr 2018 11:05:51 +0800, Xidong Wang
> <wangxidong_97@163.com> wrote:
> 
> > In function tango_nand_probe(), the memory allocated by
> > clk_get() is not released on the normal path and
> > the error path that IS_ERR(nfc->chan) returns true.  
> 
> The fact that the error path returns true looks out of topic, can you
> remove it? Just saying that you fix a memory leak is enough I guess.
> 
> > This will result in a memory leak bug.
> > 
> > Signed-off-by: Xidong Wang <wangxidong_97@163.com>
> > ---
> >  drivers/mtd/nand/tango_nand.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> > index c5bee00b..8083459 100644
> > --- a/drivers/mtd/nand/tango_nand.c
> > +++ b/drivers/mtd/nand/tango_nand.c
> > @@ -648,12 +648,15 @@ static int tango_nand_probe(struct platform_device *pdev)
> >  		return PTR_ERR(clk);
> >  
> >  	nfc->chan = dma_request_chan(&pdev->dev, "rxtx");
> > -	if (IS_ERR(nfc->chan))
> > +	if (IS_ERR(nfc->chan)) {
> > +		clk_put(clk);
> >  		return PTR_ERR(nfc->chan);
> > +	}
> >  
> >  	platform_set_drvdata(pdev, nfc);
> >  	nand_hw_control_init(&nfc->hw);
> >  	nfc->freq_kHz = clk_get_rate(clk) / 1000;
> > +	clk_put(clk);  
> 
> If the clock is used only here, better do the frequency derivation
> right after the clock_get(), and follow with a clk_put()? This way you
> don't have to change the error path and 'related' actions remain
> grouped.

Hm, definitely not a good idea to release the reference you have on the
clk if the driver depends on it. I recommend using devm_clk_get() to
solve this leak.
