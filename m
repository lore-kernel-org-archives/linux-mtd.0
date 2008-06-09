Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5ZqA-0004g6-5p
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 05:22:59 +0000
Date: Mon, 9 Jun 2008 07:21:28 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080609052125.GD13200@logfs.org>
References: <20080608121020.GA13200@logfs.org>
	<OF11291F86.B5413345-ON88257463.00023214-88257463.000FBA6F@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF11291F86.B5413345-ON88257463.00023214-88257463.000FBA6F@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 8 June 2008 19:51:47 -0700, Bruce_Leonard@selinc.com wrote:
> Jörn Engel <joern@logfs.org> wrote on 06/08/2008 05:10:20 AM:
> 
> Thanks so much for the feedback.  I think I get what you're saying, but 
> let me paraphrase it back to make sure.  My approach should be to make a 
> new interface that is 64-bit clean, using one or more functions (I'm not 
> sure I should shove ALL the functions that exist in mtd_info into a single 
> submit_fio(), but I don't know).  For my driver I should write the new 
> function(s) to be 64-bit clean and just use the new interface.  I can then 
> change the core code that impacts my specific case to take advantage of 
> the new interface (being carefull to make sure I don't break the old 
> interface).  Existing drivers can continue to use the existing interface 
> but will eventually migrate to the new interface.

Pretty much.

> If they can't be made 
> 64-bit clean for whatever reason, the new interface just becomes a wrapper 
> to the old functions.

Everything can be made 64bit clean.  The only reason against it is a
crufty driver for obsolete hardware that noone wants to touch with a 10'
pole.  So such plumbing is an indication of a social problem (laziness)
rather than a technical one. ;)

> Sooner or later everything will be on the new 
> interface and the old one can be removed.  Does that sound about right?

Yes.

> > +static int ram_submit_fio(struct mtd_info *mtd, struct fio *fio)
> > +{
> 
> I gather fio is something that's to be filled in each time ram_submit_fio 
> is called rather than being a static thing in mtd_info?  Sort of like 
> struct mtd_oob_ops in the NAND layer gets filled in based on what's being 
> called?

Yes.

> > +   int i, err = 0;
> > +   u32 ofs;
> > +   size_t *retlen;
> > +   const u_char *buf;
> > +   struct fio_vec *vec;
> > +
> > +   /* This driver cannot deal with device >32bit yet */
> > +   if (fio->fi_blockno * mtd->erasesize + fio->block_ofs + fio->fi_len
> > +         > 0xffffffff)
> > +      return -EIO;
> > +
> > +   ofs = fio->fi_blockno * mtd->erasesize + fio->block_ofs;
> > +
> > +   if (fio->fi_command == FI_ERASE) {
> > +      memset(mtd->priv + ofs, 0xff, fio->fi_len);
> > +      goto out;
> > +   }
> > +
> > +   for (i = 0; i < fio->fi_vcnt; i++) {
> > +      vec = fio->fi_io_vec + i;
> > +      buf = kmap_atomic(vec->fv_page, KM_USER0);
> > +      switch (fio->fi_command) {
> > +      case FI_READ:
> > +         err = ram_read(mtd, ofs, vec->fv_len, &retlen,
> > +               buf + vec->fv_offset);
> 
> I'm not famliar enough with block I/O to know what advantages or 
> disadvantages is has, but since all the upper layers already allocate a 
> buffer for putting date into or taking data out of, wouldn't it make more 
> sense/be simpler to just keep using it?  For example, mtd_read() in 
> mtdchar.c does a kmalloc to get a buffer that is then passed to 
> mtd->read().  Wouldn't it be simpler to just keep using that rather than 
> switching to struct page?  Or is there something that I'm missing that 
> struct page brings to the game?

Performance.  If you want the same path to deal with data from both
userspace and kernelspace, the only alternative would be memcpy, which
isn't exactly known to aid in benchmarks.

> > +         break;
> > +      case FI_WRITE:
> > +         err = ram_write(mtd, ofs, vec->fv_len, &retlen,
> > +               buf + vec->fv_offset);
> > +      default:
> > +         BUG();
> > +      }
> > +      kunmap_atomic(buf, KM_USER0);
> > +      ofs += vec->fv_len;
> > +      if (err)
> > +         goto out;
> > +   }
> > +out:
> > +   fio->fi_end_io(fio, err);
> 
> Not sure I follow the logic of the typedef here and what it is you're 
> trying to accomplish.

Asynchronous completion.  mtdram is a simple driver.  But if you have a
piece of hardware that actually takes time to do things, preferrably
with a dma engine and generating interrupts, you have to queue those
requests.

An even better example is a device consisting of four independent chips.
Here you want four independent queues.  When a new request comes in, you
decide which chip it belongs to and queue it for that chip.  If one chip
is busy and three are idle, one queue fills up and the odd request for
the other three is handled fairly quickly.  So io requests and io
completion are in a different order.

You may even want to have two queues per chip and always handle reads
before dealing with any writes or erases.

All this gives you extra performance.  It just doesn't matter much for
the stupid driver I used as an example.

> > +
> > +typedef void (fio_end_io_t) (struct fio *, int);
> > +/*

Or do you ask why I used a typedef instead of directly using the type in
struct fio?  No reason, really.  bio works that way and I simply copied
it for consistency.

> >  struct mtd_info {
> >     u_char type;
> >     u_int32_t flags;
> > -   u_int32_t size;    // Total size of the MTD
> > +   /*
> > +    * size is becoming redundant, as it can be calculated from
> > +    * no_eraseblocks * erasesize.  There is a fair chance it will die
> > +    * in the near future.  For flashes with variable erase sizes,
> > +    * no_eraseblocks signifies the "normal" size, so above calculation
> > +    * remains valid.
> > +    */
> 
> Which calculation are you refering to?

no_eraseblocks * erasesize

> > +   u_int64_t size;    // Total size of the MTD
> > +   u_int64_t no_eraseblocks;
> 
> In my original email I mentioned that I ran into a few problems makeing 
> size a 64-bit value.  Did you have any problems with it?

I didn't even compile. ;)

Basically, you could pick either of the approaches in your mail - the
result would be the same.  You need to work your way through every
single driver and every single user and fix things up.  All work and no
play.

If we are going through the trouble anyway, we might as well add
asynchronous stuff while at it.  Which I want, badly.  Plus, by having a
new function (or set of functions, doesn't matter), we can easily check
at runtime whether we're dealing with an old driver or a new one.

Jörn

-- 
Joern's library part 2:
http://www.art.net/~hopkins/Don/unix-haters/tirix/embarrassing-memo.html
