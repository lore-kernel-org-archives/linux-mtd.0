Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LujsG-0001KI-R3
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 08:56:57 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090416213400.GA10578@shareable.org>
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
	<20090416213400.GA10578@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 11:56:33 +0300
Message-Id: <1239958593.3390.293.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie, thanks for feedback!

On Thu, 2009-04-16 at 22:34 +0100, Jamie Lokier wrote:
> > 1. eraseblock
> > 2. Min. I/O unit size, which is mtd->writesize in MTD, and
> > ubi->min_io_size in UBI. This corresponds to NAND page, and 1 byte in
> > NOR.
> 
> I guess 1 byte in NOR because you can overwrite a word to set the other byte?
> Logically min_io_size should be 1 bit :-)
> 
> > 3. There are also sub-pages in case of NAND, but I consider them as a
> > kind of hack. UBI does not expose information about them, and UBIFS does
> > not use them.
> 
> UBI FAQ (http://www.linux-mtd.infradead.org/faq/ubi.html#L_find_min_io_size)
> 
>     UBI: physical eraseblock size:   131072 bytes (128 KiB)
>     UBI: logical eraseblock size:    129024 bytes
>     UBI: smallest flash I/O unit:    2048
>     UBI: sub-page size:              512
> 
>     Note, if sup-page size was not printed, the flash is not NAND
>     flash or NAND flash which does not have sub-pages.
> 
> UBI does not expose information about sub-pages?

It prints about them, just for info. But the UBI "front-ent" API
does not contain sub-page info.

> Googling for "NAND sub-page" didn't help explain them much.  Can you
> recommend a URL, just so I can understand NAND sub-pages?

There is info at the MTD web site. But for your convenience, I've
also added this:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_subpage

> > Now obviously, we need to extend this model. I would suggest to
> > introduce a notion of "max. I/O size". It would be:
> > 
> > 1. 64-bytes in case of Eric's NOR. This would be taken from CFI info.
> > 2. If we ever have a striping layer, which can interleave between 2 or
> >    more chips, then max. I/O size will be N * ubi->min_io_size.
> > 
> > Thoughts?
> 
> 0. It's more accurate to call it "max parallel write size".
>    That NOR chip has a read page size too, which is different :-)
> 
> 1. Alignment, or can we assume alignment is the same as its size?

Yes, I think so.

> 2. If striping uses larger stripes (the same way as RAID uses 1MB
>    stripes instead of 1 sector stripes), then this value needs to be
>    max(N * strip_size, N * ubi->min_io_size), because the chip block
>    writes done in parallel are not contiguous in the combined MTD.

OK.

> 
> 3. 2 assumes that striping works like this:
> 
>        Start write at offset P to chip 0, chip 1, chip 2, chip 3.
>        Wait for _all_ chips to finish.
>        Start write at offset P+block_size to chip 0, chip 1, chip 2, chip 3.
>        Wait for _all_ chips to finish.
>        etc.

Right.

>    But if striping is implemented in a more relaxed way to get higher
>    performance, it will do this:
> 
>        Start write at offset P to chip 0, chip 1, chip 2, chip 3.
>        Wait for any chip to finish.
>        Start write at offset P+block_size on the chip which finished.
>        Wait for any chip to finish.
>        Start write at next block on the chip which finished.
>        Wait for any chip to finish.
>        etc.

Yeah...

>    That makes the range of parallel writes, and so
>    corruption-on-power-loss, even larger than max(N * strip_size, N *
>    block_size).  The range is as large as the whole write, if one chip
>    is writing much faster than the others, so it cannot be represented
>    by a small number.

Then I guess we should just introduce mtd->max_corruption ? This would
mean maximum amount of bytes corruption may span in vase of power cuts?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
