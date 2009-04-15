Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu7g1-0000QL-It
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 16:09:47 +0000
Date: Wed, 15 Apr 2009 17:09:21 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090415160921.GA4325@shareable.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
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
> > On Tue, 2009-04-14 at 19:00 +0100, Jamie Lokier wrote:
> > > Artem Bityutskiy wrote:
> > > So it would be correct for UBIFS to know that writes of N > 64(*)
> > > bytes may be broken into blocks, with corruption distributed
> > > anywhere within each of those blocks, but not more than one block.
> > 
> > I though the corruption will be inside the last block, because they
> > are written sequentially.
> 
> Both are correct.  The corruption will be in the last block written to
> the physical flash, but if the original UBIFS block write size is >
> FLASH_MAX_BLOCK_WRITE_SIZE, then the MTD CFI driver will split it into
> multiple smaller blocks.  The CFI code appears to write out the split
> blocks sequentially from lowest address to highest address, but the
> actual physical flash chip doesn't always write the flash words out
> sequentially.

We all have the same idea, that's good :-)

> So, if we assume that the MTD CFI driver will always split blocks into
> write-buffer sized blocks and write them sequentially (this is how the
> code is currently written), then the maximum corruption due to an
> interrupted write will be FLASH_MAX_BLOCK_WRITE_SIZE (which is 64 bytes
> for my case).

Is this really different from NAND and it's page writes?

Do the CFI block writes have to be aligned (to 64 bytes) offset, or
can the 64 bytes start at any word position?

> I'll take a look at what is involved in exporting the two values.

Good plan :-)

-- Jamie
