Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuBVl-0004rs-MF
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 20:15:16 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KI500LILS7GCUN1@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 16:14:05 -0400 (EDT)
Date: Wed, 15 Apr 2009 16:15:07 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
Subject: RE: UBIFS Corrupt during power failure
In-reply-to: <C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
Message-id: <alpine.LFD.2.00.0904151556000.6741@xanadu.home>
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
	<20090415183806.GA8669@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Jamie Lokier <jamie@shareable.org>, Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 15 Apr 2009, Eric Holmberg wrote:
> From: Jamie Lokier [mailto:jamie@shareable.org] 
> > I don't remember if it was NOR, NAND or something else, but I remember
> > reading about some flash which supports 1 concurrent write and 1
> > erase, and thinking "oh that's clever, it means you can do streaming
> > writes or rapid fsync/database commits without long pauses 
> > for erasing".
> 
> The evolution seems to be:
>  1. Allow erase / program suspend to do a read from a different PEB (the
> chip I'm using supports this)
>  2. Allow simultaneous read while either erasing or programming a
> different PEB
>  3. Allow parallel operations on different flash banks
>  4. Combine NOR and NAND onto the same chip

Most NOR chips do allow for #1 and we support it.

Recent Intel NOR parts allow for #2 and we support it.

It is already possible to do #3, whether you have multiple 
identical chips mapped 
contigously mapped, or through the MTD concat layer.

I think #4 is rather odd and unprobable.

> My understanding is that the parallel operations are only valid on
> different flash banks, where a flash bank could be thought of
> conceptually as a separate flash chip.  I'm no flash memory expert by
> any means, so I'm sure there are some other systems out there.

A single bank made of several contigous chips (and not the parallel chip 
arrangement often used to have a larger bus) already offers parallel 
operation possibilities, as long as parallel accesses have a 
sufficiently large offset between them to target different chips.

> > Of course you can do that with two flash chips side by side :-)

Beware.  The "two flash chips side by side" often means your chips are 
put in parallel on the bus, having one chip providing the lowest 16 
data bits, and the other chip providing the upper 16 bits.  This allows 
for a 2x read throughput, however this means that the erase block size 
is also doubled, while erase latency remains the same.

> > Can MTD and/or UBI join two chips to look like a single partition in
> > that way and avoid pauses for erase by writing to the other part?
> 
> The CONFIG_MTD_CONCAT option will join multiple chips together into a
> single MTD device, but I haven't looked into the code to see if it
> allows simultaneous operations on the separate chips.

It does.

> Nothing like RAID0 on flash :)

Well, the concat layer does not offer any kind of stripe management. I 
think someone posted a set of patches a while ago to add such a 
capability though.


Nicolas
