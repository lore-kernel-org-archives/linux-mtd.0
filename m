Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pundm-0005LA-Ki
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2011 15:07:04 +0000
Date: Wed, 2 Mar 2011 17:06:50 +0200
From: Baruch Siach <baruch@tkos.co.il>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd/mxc_nand: fix read past buffer end
Message-ID: <20110302150650.GE28548@jasper.tkos.co.il>
References: <2edd0d1419770540f85178a1f29cd80fccf11e88.1299077237.git.baruch@tkos.co.il>
	<20110302150235.GC29521@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20110302150235.GC29521@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Wed, Mar 02, 2011 at 04:02:35PM +0100, Sascha Hauer wrote:
> On Wed, Mar 02, 2011 at 04:47:55PM +0200, Baruch Siach wrote:
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  drivers/mtd/nand/mxc_nand.c |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> Looks good to me. Did you stumble upon this by accident or did something
> break? If yes, would be good to have it in the commit log.

I found it by looking at the code. This doesn't fix my actual problem (wrong 
oob read and/or write with flash of page size 4K+218).

> Otherwise:
> 
> Acked-by: Sascha hauer <s.hauer@pengutronix.de>

Thanks,
baruch

> > diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> > index 7b33811..466d7a9 100644
> > --- a/drivers/mtd/nand/mxc_nand.c
> > +++ b/drivers/mtd/nand/mxc_nand.c
> > @@ -641,9 +641,9 @@ static void mxc_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
> >  
> >  	n = min(n, len);
> >  
> > -	memcpy(buf, host->data_buf + col, len);
> > +	memcpy(buf, host->data_buf + col, n);
> >  
> > -	host->buf_start += len;
> > +	host->buf_start += n;
> >  }
> >  
> >  /* Used by the upper layer to verify the data in NAND Flash
> > -- 
> > 1.7.2.3

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
