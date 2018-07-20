Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgOpG-0003uq-9o
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 06:23:40 +0000
Date: Fri, 20 Jul 2018 08:23:25 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: jz4740: Use the proper format specifier
 to print chipnr
Message-ID: <20180720082325.5d7ae688@bbrezillon>
In-Reply-To: <20180720145628.6cd61fc6@canb.auug.org.au>
References: <20180719073720.19887-1-boris.brezillon@bootlin.com>
 <20180719231156.2d3c53ee@xps13>
 <20180720145628.6cd61fc6@canb.auug.org.au>
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

On Fri, 20 Jul 2018 14:56:28 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Thu, 19 Jul 2018 23:11:56 +0200 Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
> > 09:37:20 +0200:
> >   
> > > In jz_nand_detect_bank(), chipnr is a size_t argument. Use %zu instead
> > > of %i when printing it.
> > > 
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/jz4740_nand.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
> > > index 1f7aff04ad8a..9bb8a89e09f9 100644
> > > --- a/drivers/mtd/nand/raw/jz4740_nand.c
> > > +++ b/drivers/mtd/nand/raw/jz4740_nand.c
> > > @@ -355,7 +355,7 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
> > >  		mtd->size += chip->chipsize;
> > >  	}
> > >  
> > > -	dev_info(&pdev->dev, "Found chip %i on bank %i\n", chipnr, bank);
> > > +	dev_info(&pdev->dev, "Found chip %zu on bank %i\n", chipnr, bank);
> > >  	return 0;
> > >  
> > >  notfound_id:    
> > 
> > Applied to nand/next.  
> 
> It might be a better fix to ask why chipnr is a size_t at all ... it is
> only used as an index, so should probably be int ...

I considered this option, and then I had a look at the rest of the file
and found a few other places where size_t could be replaced by an
unsigned int, so I just gave up on this solution and went for the
one-liner changing the format specifier :-).
