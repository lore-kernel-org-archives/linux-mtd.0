Date: Mon, 20 Feb 2017 13:35:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@atmel.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: tango: Enforce DMA direction type
Message-ID: <20170220133547.06c17a12@bbrezillon>
In-Reply-To: <aebe65d0-19c9-e1a7-b98a-c25ff616dad0@sigmadesigns.com>
References: <1486979107-15362-1-git-send-email-boris.brezillon@free-electrons.com>
 <aebe65d0-19c9-e1a7-b98a-c25ff616dad0@sigmadesigns.com>
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

On Mon, 20 Feb 2017 13:30:25 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

> On 13/02/2017 10:45, Boris Brezillon wrote:
> 
> > do_dma() use an integer to pass the DMA data direction information and
> > pass the same value to dmaengine_prep_slave_sg().
> > 
> > Currently, DMA_{FROM,TO}_DEVICE match DMA_{DEV_TO_MEM,MEM_TO_DEV}
> > definitions so it works fine, but assuming this will always be the case
> > is not safe.
> > 
> > Enforce enum dma_data_direction type in the function prototype and make
> > the enum dma_data_direction -> enum dma_transfer_direction conversion
> > explicit.
> > 
> > Reported-by: Richard Weinberger <richard@nod.at>
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/tango_nand.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> > index 4a5e948c62df..9a0e2f85d865 100644
> > --- a/drivers/mtd/nand/tango_nand.c
> > +++ b/drivers/mtd/nand/tango_nand.c
> > @@ -223,8 +223,8 @@ static void tango_dma_callback(void *arg)
> >  	complete(arg);
> >  }
> >  
> > -static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
> > -		  int len, int page)
> > +static int do_dma(struct tango_nfc *nfc, enum dma_data_direction dir, int cmd,
> > +		  const void *buf, int len, int page)
> >  {
> >  	void __iomem *addr = nfc->reg_base + NFC_STATUS;
> >  	struct dma_chan *chan = nfc->chan;
> > @@ -238,7 +238,10 @@ static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
> >  	if (dma_map_sg(chan->device->dev, &sg, 1, dir) != 1)
> >  		return -EIO;
> >  
> > -	desc = dmaengine_prep_slave_sg(chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
> > +	desc = dmaengine_prep_slave_sg(chan, &sg, 1,
> > +				       dir == DMA_FROM_DEVICE ?
> > +				       DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
> > +				       DMA_PREP_INTERRUPT);
> >  	if (!desc)
> >  		goto dma_unmap;
> >  
> >   
> 
> How about evaluating the ternary conditional into a temp var?

Works for me.

> 
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 4a5e948c62df..c3f145528f1d 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -231,6 +231,7 @@ static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
>         struct dma_async_tx_descriptor *desc;
>         struct scatterlist sg;
>         struct completion tx_done;
> +       int xdir = dir == DMA_TO_DEVICE ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
>         int err = -EIO;
>         u32 res, val;
>  
> @@ -238,7 +239,7 @@ static int do_dma(struct tango_nfc *nfc, int dir, int cmd, const void *buf,
>         if (dma_map_sg(chan->device->dev, &sg, 1, dir) != 1)
>                 return -EIO;
>  
> -       desc = dmaengine_prep_slave_sg(chan, &sg, 1, dir, DMA_PREP_INTERRUPT);
> +       desc = dmaengine_prep_slave_sg(chan, &sg, 1, xdir, DMA_PREP_INTERRUPT);
>         if (!desc)
>                 goto dma_unmap;
>  
