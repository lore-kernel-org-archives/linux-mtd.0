Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuC0f-00070p-9i
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 20:47:12 +0000
Date: Wed, 15 Apr 2009 21:46:56 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090415204656.GA10707@shareable.org>
References: <20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<20090415164416.GD4325@shareable.org>
	<alpine.LFD.2.00.0904151422170.6741@xanadu.home>
	<20090415183806.GA8669@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
	<alpine.LFD.2.00.0904151556000.6741@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0904151556000.6741@xanadu.home>
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
> > > Can MTD and/or UBI join two chips to look like a single partition in
> > > that way and avoid pauses for erase by writing to the other part?
> > 
> > The CONFIG_MTD_CONCAT option will join multiple chips together into a
> > single MTD device, but I haven't looked into the code to see if it
> > allows simultaneous operations on the separate chips.
> 
> It does.
> 
> > Nothing like RAID0 on flash :)
> 
> Well, the concat layer does not offer any kind of stripe management. I 
> think someone posted a set of patches a while ago to add such a 
> capability though.

If MTD concat write/erase operations can run in parallel, then the
powerfail-corruption-block that UBIFS is scanning for will be one
block per underlying device, not one block for the whole MTD.

That means a single number describing the powerfail-corruption-block
is not enough for MTD concat devices.

However provided they are distinct erase blocks, maybe this does not
affect UBIFS's classification of dead blocks.

If they are arranged as stripes, the MTD concat's overall
powerfail-corruption-block size must be set to the maximum of the
underlying MTD's value and the strip size.  Alignment is left as an
exercise...

-- Jamie
