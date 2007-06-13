Received: from ozlabs.org ([203.10.76.45])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HyJYG-000816-Dv
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 23:29:48 -0400
Date: Wed, 13 Jun 2007 13:16:15 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Message-ID: <20070613031615.GC16148@localhost.localdomain>
References: <e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
	<466312C2.4090200@ru.mvista.com>
	<548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<1181228442.2785.60.camel@pmac.infradead.org>
	<18fbfbaf113ab76b602d279848d9b405@kernel.crashing.org>
	<20070612044459.GD4198@localhost.localdomain>
	<9e1a55ac71a2ecf5155d2fddf547025e@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e1a55ac71a2ecf5155d2fddf547025e@kernel.crashing.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2007 at 12:53:36PM +0200, Segher Boessenkool wrote:
> >> So I think the best thing to have would be
> >>
> >> 	compatible      "cfi-flash"
> >> 	bank-width      like you said
> >> 	device-width    width of a single flash device
> >> 	reg             complete address range of this thing
> >>
> >> and then the Linux OF CFI flash code / MTD code just keeps
> >> on probing devices from that address range until it has it
> >> filled.
> >>
> >> Sounds good / comments / anything I missed?
> >
> > Looks pretty sensible to me.
> 
> Great!
> 
> > Presumably the compatible property could
> > also have more specific entries for the particular chip type.
> 
> Yes, of course.
> 
> > Of course, Ebony has flash which is JEDEC rather than CFI probed, so I
> > have an interest in a binding for that, too.
> 
> For JEDEC flash, you probably want extra properties
> for manufacturing ID and chip ID.  Also, you need
> to describe the block sizes in some way (on CFI, this
> can be probed; on JEDEC, not).  Anything else?

Hrm.  At the moment it appears to work without supplying this
information for the Ebony flash...  I wonder if there are defaults in
the mtd layer or something.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
