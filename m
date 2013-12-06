Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vot35-0001hb-V8
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 10:54:20 +0000
Date: Fri, 6 Dec 2013 07:53:55 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Use info->use_dma to release DMA
 resources
Message-ID: <20131206105354.GA2511@localhost>
References: <1385470344-2542-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131127075819.GC13929@norris.computersforpeace.net>
 <20131127113405.GA2326@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131127113405.GA2326@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Wed, Nov 27, 2013 at 08:34:05AM -0300, Ezequiel Garcia wrote:
> On Tue, Nov 26, 2013 at 11:58:19PM -0800, Brian Norris wrote:
> > On Tue, Nov 26, 2013 at 09:52:24AM -0300, Ezequiel Garcia wrote:
> > > After the driver allocates all DMA resources, it sets "info->use_dma".
> > > Therefore, we need to check that variable to decide which resources
> > > needs to be freed, instead of the global use_dma variable.
> > > 
> > > Without this change, when the device probe fails, the driver will try
> > > to release unallocated DMA resources, with nasty results.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> > > ---
> > > This is minor fix, but a fix anyway, so it should be queued for stable.
> > > 
> > >  drivers/mtd/nand/pxa3xx_nand.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> > > index 97c3eb5..8f2104c 100644
> > > --- a/drivers/mtd/nand/pxa3xx_nand.c
> > > +++ b/drivers/mtd/nand/pxa3xx_nand.c
> > > @@ -1288,7 +1288,7 @@ static int pxa3xx_nand_init_buff(struct pxa3xx_nand_info *info)
> > >  static void pxa3xx_nand_free_buff(struct pxa3xx_nand_info *info)
> > >  {
> > >  	struct platform_device *pdev = info->pdev;
> > > -	if (use_dma) {
> > > +	if (info->use_dma) {
> > 
> > With this change, then the 'else' case will be executed and will kfree()
> > the data buffer that we didn't allocate?
> > 
> >   kfree(info->data_buff);
> > 
> > Fortunately kfree()'ing a NULL is a no-op.
> > 
> 
> No. The buffer is allocated at a very early stage in DMA and non-DMA modes.
> It's later reallocated, but in any case when pxa3xx_nand_free_buff()
> is called, the buffer can never be NULL.
> 
> The situation this commit fixes is that when the cleanup is called from
> the probe(), the DMA resources haven't been allocated yet and so the
> release must be kfree().
> 
> Remember we've recently changed this driver to work in non-DMA mode
> until the page size is correctly detected. Until then, info->use_dma is
> false.
> 
> > But this highlights some of the strangeness of the error handling in
> > this driver. It has an atypical style, in which the probe routine calls
> > the remove routine if it fails. Normally, the probe routine has teardown
> > carefully planned in stages, whereas the remove routine just does it all
> > in one go (since it can assume the device was fully initialized). (And
> > of course, the devm_* functions can help with simplifying some of
> > this...)
> > 
> 
> Yes, I know. The driver is very very old, and some parts of it need some
> love. However, the error handling is not so bad. When
> pxa3xx_nand_remove() is called, all resources are guaranteed to be
> allocated so it works like a full-fledged release.
> 
> I'm actually more annoyed by the fact there's two variables with the
> same name: use_dma, and info->use_dma.
> 
> > But I suppose this patch is correct as-is, and this issue could be
> > revisited later.
> > 
> > For my reference, have you actually seen this bug in practice? I'm not
> > sure how well this fits in the -stable rules, if it hasn't been observed
> > and tested appropriately.
> > 
> 
> Yes, I've seen this bug in practice, or otherwise wouldn't notice such small
> typo :-) The bug was triggered in PXA platforms, when the device cannot
> be identified (nand_scan fails).
> 
> It's a very rare condition, but it's a real bug. Is that enough for -stable?

Just a gentle ping, in case this one felt through the cracks.

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
