Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuA05-0003te-N6
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 18:38:34 +0000
Date: Wed, 15 Apr 2009 19:38:06 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090415183806.GA8669@shareable.org>
References: <1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<20090415164416.GD4325@shareable.org>
	<alpine.LFD.2.00.0904151422170.6741@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904151422170.6741@xanadu.home>
Cc: Adrian Hunter <adrian.hunter@nokia.com>,
	Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> On Wed, 15 Apr 2009, Jamie Lokier wrote:
> 
> > Unrelated to this chip: I vaguely remember, aren't there some flash
> > chips which can do more than one block write in parallel, or a write
> > in parallel with an erase to a different block?
> 
> Some NOR flash parts can do a write _or_ an erase in one block while 
> performing any amount of reads in other blocks.  At least that's what we 
> support.  If some parts allow for concurrent writes we currently don't 
> support that.

I don't remember if it was NOR, NAND or something else, but I remember
reading about some flash which supports 1 concurrent write and 1
erase, and thinking "oh that's clever, it means you can do streaming
writes or rapid fsync/database commits without long pauses for erasing".

Of course you can do that with two flash chips side by side :-)

Can MTD and/or UBI join two chips to look like a single partition in
that way and avoid pauses for erase by writing to the other part?

Thanks,
-- Jamie
