Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8y3g-0003R9-Fm
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 16:32:05 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.130.28.92]) by VL-MR-MRZ20.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit))
	with ESMTP id <0LAN00GABF99PIE0@VL-MR-MRZ20.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 12:31:58 -0400 (EDT)
Date: Thu, 21 Oct 2010 12:32:02 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: Apply Numonyx Axcell P33/P30 workaround for
	Lock/Unlock bug.
In-reply-to: <1287656983.2932.14.camel@localhost>
Message-id: <alpine.LFD.2.00.1010211226120.2764@xanadu.home>
References: <1287498263-5561-1-git-send-email-phdm@macqel.be>
	<1287650398.2932.5.camel@localhost>
	<20101021093343.GA17631@frolo.macqel>
	<1287656983.2932.14.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Oct 2010, Artem Bityutskiy wrote:

> On Thu, 2010-10-21 at 11:33 +0200, Philippe De Muyter wrote:
> > On Thu, Oct 21, 2010 at 11:39:58AM +0300, Artem Bityutskiy wrote:
> > > On Tue, 2010-10-19 at 16:24 +0200, Philippe De Muyter wrote:
> > > > Some flash chips have a small but annoying bug, documented in
> > > >     "Numonyx Axcell P33/P30 256-Mbit Specification Update"
> > > > 
> > > >     It states :
> > > >     When customer uses [...] block unlock, the block lock status might
> > > >     be altered inadvertently. Lock status might be set to either 01h
> > > >     or 03h unexpectedly (00h as expected data), which leads to
> > > >     program/erase failure on certain blocks.
> > > > 
> > > >     A workaround is given, (summary : issue a "Read Lock Status" before
> > > >     the "Lock" or "Unlock" command) which I have applied and tested
> > > >     with success.
> > > > 
> > > > Signed-off-by: Philippe De Muyter <phdm@macqel.be>
> > > 
> > > Is this Numonyx-specific issue? Should there be some kind of "if
> > > (numonyx)" statement?
> > 
> > This is clearly a bug specific to some Numonyx flashes.
> > My chips have Manufacturer ID: 0x89, Device ID: 0x881B, but there are
> > other chips in the same family.  The errata
> > http://www.numonyx.com/Documents/Specification%20Updates/509003_P3X_65nm_3V_256Mbit_Discrete.pdf does not list the ManufacturerIDs/DeviceIDs of the affected
> > chips.
> 
> CCed Nicolas correctly.
> 
> Anyway, if this affects only subset of chips, it make sense to make this
> quirk conditional, because this might affect boot speed, e.g., if some
> systems unlock all blocks on boot-up.

That is probably quite unlikely to make a difference given that there is 
no result delay involved.

However, does the erratum workaround imply that the status actually has 
to be read?  In other words, can you simply issue CMD 90 without calling 
cfi_read_query()?


Nicolas
