Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZvbc-0004t4-K9
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 10:31:06 +0000
Date: Thu, 20 Dec 2018 11:30:50 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd: spinand: wait on erase success in spinand_markbad?
Message-ID: <20181220113050.7202bc22@bbrezillon>
In-Reply-To: <CAO1O6scbGZwf_ZiG66zQuoeXHKuHLgmNHz_TjKaJi84Y7xV-ng@mail.gmail.com>
References: <CAO1O6sd-JZBfGnAB7tOnsJeJSLXTguLHGdSEokOYq9n=bY5jPA@mail.gmail.com>
 <20181219195619.64f62b8e@bbrezillon>
 <CAO1O6scbGZwf_ZiG66zQuoeXHKuHLgmNHz_TjKaJi84Y7xV-ng@mail.gmail.com>
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

On Wed, 19 Dec 2018 20:54:33 +0100
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> Den ons 19 dec. 2018 kl 19:56 skrev Boris Brezillon <bbrezillon@kernel.org>:
> >
> > On Wed, 19 Dec 2018 14:27:51 +0100
> > Emil Lenngren <emil.lenngren@gmail.com> wrote:
> >  
> > > Hi,
> > >
> > > I was just reading the spinand driver and found this piece of code:
> > > static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
> > > {
> > >     struct spinand_device *spinand = nand_to_spinand(nand);
> > >     struct nand_page_io_req req = {
> > >         .pos = *pos,
> > >         .ooboffs = 0,
> > >         .ooblen = 2,
> > >         .oobbuf.out = spinand->oobbuf,
> > >     };
> > >     int ret;
> > >
> > >     /* Erase block before marking it bad. */
> > >     ret = spinand_select_target(spinand, pos->target);
> > >     if (ret)
> > >         return ret;
> > >
> > >     ret = spinand_write_enable_op(spinand);
> > >     if (ret)
> > >         return ret;
> > >
> > >     spinand_erase_op(spinand, pos);
> > >
> > >     memset(spinand->oobbuf, 0, 2);
> > >     return spinand_write_page(spinand, &req);
> > > }
> > >
> > > Shouldn't there be spinand_wait call after spinand_erase_op and before
> > > spinand_write_page?
> > >  
> >
> > Absolutely. Can you send a patch to fix that?
> >  
> 
> Sure, although I'm a bit unsure how the error handling should be done.
> In the u-boot version
> (https://github.com/u-boot/u-boot/blob/9e5c2a755a6ca5f3931de548f43101d0d18ac003/drivers/mtd/nand/spi/core.c#L718),
> if the spinand_erase_op spi transfer fails, the function quits without
> writing the bad block marker, while the linux version ignores the
> error. Is the intention that the bad block marker should be written
> regardless if the erase spi transfer fails or not, or is it just a
> mistake?

To be honest, I don't think the erase operation is needed (we just
want to write 0 in the BBM), so we don't really care if it fails, which
means Linux version is correct and u-boot is probably buggy. Note that
you're unlikely to hit a failure on the erase operation anyway, so
it's more a theoretical bug than a real one.
