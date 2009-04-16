Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuKR2-0002ty-O9
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 05:47:10 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Apr 2009 08:46:38 +0300
Message-Id: <1239860798.3390.205.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Urs Muff <urs_muff@Trimble.com>,
	Jamie Lokier <jamie@shareable.org>, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-15 at 10:32 -0600, Eric Holmberg wrote:
> > Is this really different from NAND and it's page writes?
> > Do the CFI block writes have to be aligned (to 64 bytes) offset, or
> > can the 64 bytes start at any word position?
> 
> Looking through the data sheet again, it looks like there is the concept
> of a page for block writes in this particular NOR flash where a page
> starts on any address evenly divisible by 0x20 (32-byte block).  The CFI
> driver handles this when splitting up the blocks.
> 
> Here's the datasheet for reference:
>  * http://www.spansion.com/datasheets/s29gl-p_00_a11_e.pdf?page=28
> 
> Thinking about it, this shouldn't affect the maximum possible corruption
> count, since a fully-aligned write buffer is the worst case (a possible
> of a <=64-byte corruption).  If the block is split between pages, then
> 32-bytes would occur in the first write and 32-bytes in the second
> write, so the maximum corruption would be <=32 bytes.
> 
> Does this match with your thoughts?

No sure. I'm thinking how to extend the MTD device model. Jamie already
suggested this. At the moment we have:

1. eraseblock
2. Min. I/O unit size, which is mtd->writesize in MTD, and
ubi->min_io_size in UBI. This corresponds to NAND page, and 1 byte in
NOR.
3. There are also sub-pages in case of NAND, but I consider them as a
kind of hack. UBI does not expose information about them, and UBIFS does
not use them.

Now obviously, we need to extend this model. I would suggest to
introduce a notion of "max. I/O size". It would be:

1. 64-bytes in case of Eric's NOR. This would be taken from CFI info.
2. If we ever have a striping layer, which can interleave between 2 or
   more chips, then max. I/O size will be N * ubi->min_io_size.

Thoughts?

> P.S.  I'm working on applying the latest patches and running a
> corruption test where I limit the write-buffer size of 8 bytes.  So far,
> so good.

Right. I think I even know which commit fixed that "orphan nodes are
treated as superblock" bug:

http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commit;h=e7e59cefd76778583ebc6d9b1ebc249feaba1d15

But I strongly suggest to take all patches. We are not very interested
to dig old code base, should something go wrong.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
