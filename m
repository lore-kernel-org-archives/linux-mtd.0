Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JVz1h-00019Y-Gc
	for linux-mtd@lists.infradead.org; Mon, 03 Mar 2008 00:59:34 +0000
Date: Mon, 3 Mar 2008 00:59:31 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: Global changelogs about
Message-ID: <20080303005931.GA25082@shareable.org>
References: <1204238252.3435.21.camel@lisa.alm.archives.at>
	<20080228235048.GA24195@lazybastard.org>
	<1204274577.3408.25.camel@lisa.alm.archives.at>
	<20080229085748.GB16507@lazybastard.org>
	<20080302152136.GA10194@shareable.org>
	<20080302180601.GA22003@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080302180601.GA22003@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lennert Buytenhek wrote:
> On Sun, Mar 02, 2008 at 03:21:36PM +0000, Jamie Lokier wrote:
> 
> > (Alternatively, if anyone has forward-ported Sigma Designs ARM support
> > to 2.6 kernels, or would like to collaborate with me on that, I would
> > be _very_ interested...)
> 
> I don't have the hardware, but I can help.

You might have, but not know it, sitting near your TV (if you have one
of those archaic old things :-)  It's used in high-def media
player type devices.

> Are docs freely available?

Unfortunately there are no freely available docs that I'm aware of.
Even I don't have docs.

What I do have is GPL kernel code and patches, which can be published
in the usual way.

(Btw, all companies selling devices containing these chips running
Linux should provide the GPL kernel source or an offer of it.  Sigma
Designs themselves (the chip vendor) do provide it to their downstream
product makers, a README which indicates it is provided under GPL
terms, and I have confirmed with my upstream supplier that it is ok to
distribute.  But the consumer product makers and sellers that I'm
aware of don't seem to comply by passing it further along... making it
surprisingly hard to get from anyone.)

Unfortunately, the most interesting parts of this device (media
processing) are very well abstracted, so the kernel driver does
nothing more than pass along a few generic commands to that part.

So, the kernel source doesn't contain much that's interesting to
anyone not using these devices.  Just:

   - Serial port hacks.

   - Usual custom bits and pieces for the board, interrupts, etc.

   - PATA driver for the unusual Sigma Designs IDE interface and DMA
     engine.

   - Various drivers for other legacy things not used in current
     chips, e.g. their old ethernet interface.

   - Pass-through driver interfacing to binary blob to handle video,
     much of which runs on coprocessors on the same chip.

   - MTD modification which is necessary for correct erasing in
     cfd_cmdset_0002.c (which a bog standard CFI flash), and which
     surprises me that it's not in standard kernels, implying nobody
     else needs it.  (Note to self: talk about this sometime).

   - Parts of 2.5 MTD code back-ported, selectively.

   - I'm sure there's something else, but nothing to get excited by.

-- Jamie
