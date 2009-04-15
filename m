Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu8Dl-0008TQ-Dt
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 16:44:38 +0000
Date: Wed, 15 Apr 2009 17:44:16 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090415164416.GD4325@shareable.org>
References: <1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
Cc: Urs Muff <urs_muff@trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric Holmberg wrote:
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

Yes.  Another parameter could be exported by MTD: the max block
corruption alignment, 32 in this case.  Then UBIFS's scanner (or other
tools) could be a little more accurate.

I doubt if it's important to scan more accurately, but it would be a
good parameter to export from MTD anyway, while adding the other one,
just to describe the chip properly for tools, diagnostics etc.

Unrelated to this chip: I vaguely remember, aren't there some flash
chips which can do more than one block write in parallel, or a write
in parallel with an erase to a different block?

-- Jamie
