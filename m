Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffPGW-0001Tk-Nq
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:39:42 +0000
Date: Tue, 17 Jul 2018 14:39:18 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: remove stale comment in mtd_oob_ops structure
Message-ID: <20180717143918.55de1494@bbrezillon>
In-Reply-To: <20180717143405.25d1ad85@xps13>
References: <20180714123234.16127-1-miquel.raynal@bootlin.com>
 <20180717142524.434972e6@bbrezillon>
 <20180717143405.25d1ad85@xps13>
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

On Tue, 17 Jul 2018 14:34:05 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
> 14:25:24 +0200:
> 
> > On Sat, 14 Jul 2018 14:32:34 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > A comment in the kernel doc of the mtd_oob_ops structure tells that it
> > > is not possible to write more than one page with OOB. This was
> > > probably true at some time in the past but today it is entirely wrong.
> > > 
> > > As one can see for instance in the nand_do_write_ops() helper available
> > > in the NAND core, this implementation called by mtd->_write_oob()
> > > simply loops over the pages until everything has been written.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  include/linux/mtd/mtd.h | 4 ----
> > >  1 file changed, 4 deletions(-)
> > > 
> > > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > > index a86c4fa93115..59578aab277a 100644
> > > --- a/include/linux/mtd/mtd.h
> > > +++ b/include/linux/mtd/mtd.h
> > > @@ -66,10 +66,6 @@ struct mtd_erase_region_info {
> > >   *		mode = MTD_OPS_PLACE_OOB or MTD_OPS_RAW)
> > >   * @datbuf:	data buffer - if NULL only oob data are read/written
> > >   * @oobbuf:	oob data buffer
> > > - *
> > > - * Note, it is allowed to read more than one OOB area at one go, but not write.
> > > - * The interface assumes that the OOB write requests program only one page's
> > > - * OOB area.    
> > 
> > Hm, I wouldn't be so prompt at nuking this comment since some
> > implementations (like onenand) really have this limitation. How about  
> 
> Didn't know/see.
> 
> > adjusting the comment to reflect the fact that this limitation is
> > implementation dependent?
> > 
> > "
> > Note, some MTD drivers do not allow you to write more than one OOB area
> > at one go. If you try to do that on such an MTD device, -EINVAL will be
> > returned. If you want to make your implementation portable on all kind
> > of MTD devices you should split the write request into several
> > sub-requests when the request crosses a page boundary.
> > "  
> 
> Fine by me.
> 
> However, for a future work, I would think that it's something that we
> should handle at MTD level (or even in the onenand driver), not at user
> level, and simplify the ABI.

I definitely agree with that.
