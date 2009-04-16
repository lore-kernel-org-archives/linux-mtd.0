Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuZDs-0001Lx-QB
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 21:34:27 +0000
Date: Thu, 16 Apr 2009 22:34:00 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090416213400.GA10578@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<1239860798.3390.205.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1239860798.3390.205.camel@localhost.localdomain>
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Artem Bityutskiy wrote:
> On Wed, 2009-04-15 at 10:32 -0600, Eric Holmberg wrote:
> > Looking through the data sheet again, it looks like there is the concept
> > of a page for block writes in this particular NOR flash where a page
> > starts on any address evenly divisible by 0x20 (32-byte block).  The CFI
> > driver handles this when splitting up the blocks.
> > 
> > Here's the datasheet for reference:
> >  * http://www.spansion.com/datasheets/s29gl-p_00_a11_e.pdf?page=28
> > 
> > Thinking about it, this shouldn't affect the maximum possible corruption
> > count, since a fully-aligned write buffer is the worst case (a possible
> > of a <=64-byte corruption).  If the block is split between pages, then
> > 32-bytes would occur in the first write and 32-bytes in the second
> > write, so the maximum corruption would be <=32 bytes.

I didn't find any reference to 32 bytes or 16 words in the datasheet.
0x20 only appears once, in the sample code:

    /* NOTES: Write buffer programming limited to 16 words. */
    /*        All addresses to be written to the flash in   */
    /*        one operation must be within the same flash   */
    /*        page. A flash page begins at addresses        */
    /*        evenly divisible by 0x20.                     */

But notice the sample code also limits the write buffer to 16 words /
32 bytes, while the datasheet says the write buffer is 32 words / 64
bytes.  So it looks to me like the sample code is for another device
with smaller write buffer, and the "32-byte page" is spurious and not
really applicable to this device.

> 1. eraseblock
> 2. Min. I/O unit size, which is mtd->writesize in MTD, and
> ubi->min_io_size in UBI. This corresponds to NAND page, and 1 byte in
> NOR.

I guess 1 byte in NOR because you can overwrite a word to set the other byte?
Logically min_io_size should be 1 bit :-)

> 3. There are also sub-pages in case of NAND, but I consider them as a
> kind of hack. UBI does not expose information about them, and UBIFS does
> not use them.

UBI FAQ (http://www.linux-mtd.infradead.org/faq/ubi.html#L_find_min_io_size)

    UBI: physical eraseblock size:   131072 bytes (128 KiB)
    UBI: logical eraseblock size:    129024 bytes
    UBI: smallest flash I/O unit:    2048
    UBI: sub-page size:              512

    Note, if sup-page size was not printed, the flash is not NAND
    flash or NAND flash which does not have sub-pages.

UBI does not expose information about sub-pages?

Googling for "NAND sub-page" didn't help explain them much.  Can you
recommend a URL, just so I can understand NAND sub-pages?

> Now obviously, we need to extend this model. I would suggest to
> introduce a notion of "max. I/O size". It would be:
> 
> 1. 64-bytes in case of Eric's NOR. This would be taken from CFI info.
> 2. If we ever have a striping layer, which can interleave between 2 or
>    more chips, then max. I/O size will be N * ubi->min_io_size.
> 
> Thoughts?

0. It's more accurate to call it "max parallel write size".
   That NOR chip has a read page size too, which is different :-)

1. Alignment, or can we assume alignment is the same as its size?

2. If striping uses larger stripes (the same way as RAID uses 1MB
   stripes instead of 1 sector stripes), then this value needs to be
   max(N * strip_size, N * ubi->min_io_size), because the chip block
   writes done in parallel are not contiguous in the combined MTD.

3. 2 assumes that striping works like this:

       Start write at offset P to chip 0, chip 1, chip 2, chip 3.
       Wait for _all_ chips to finish.
       Start write at offset P+block_size to chip 0, chip 1, chip 2, chip 3.
       Wait for _all_ chips to finish.
       etc.

   But if striping is implemented in a more relaxed way to get higher
   performance, it will do this:

       Start write at offset P to chip 0, chip 1, chip 2, chip 3.
       Wait for any chip to finish.
       Start write at offset P+block_size on the chip which finished.
       Wait for any chip to finish.
       Start write at next block on the chip which finished.
       Wait for any chip to finish.
       etc.

   That makes the range of parallel writes, and so
   corruption-on-power-loss, even larger than max(N * strip_size, N *
   block_size).  The range is as large as the whole write, if one chip
   is writing much faster than the others, so it cannot be represented
   by a small number.

-- Jamie
