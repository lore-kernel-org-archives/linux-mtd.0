Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F2aO1-0006KN-Up
	for linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 15:40:07 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0ITR00N4BQQN3HG0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 27 Jan 2006 15:40:00 -0500 (EST)
Date: Fri, 27 Jan 2006 15:39:59 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
To: Jared Hulbert <jaredeh@gmail.com>
Message-id: <Pine.LNX.4.64.0601271532260.16649@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <625fc13d0601260948i555e2c77nca6590d5ba5baa6e@mail.gmail.com>
	<43DA3CDF.5050202@intel.com>
	<6934efce0601271115l5e18a03bs920237f09dfa2877@mail.gmail.com>
Cc: "Alexey, Korolev" <alexey.korolev@intel.com>,
	Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH] map drivers. DCACHE option for physmap and mphysmap
 drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Jan 2006, Jared Hulbert wrote:

> Flushing the caches back _could_ be a very bad thing, it could cause
> flash to do many bad things because you would be write arbitrary data
> back to the flash bus.  I'm not sure why it would machine check.  If
> your processor was configured properly I'm not sure why flushing would
> trigger burst writes to a memory not capable of bursting, but then
> hardware can have its mysterious ways.  Either way you would likely do
> bad things to the flash by flushing garbage back to it.  However, from
> a higher level look at it you should never be writing directly to the
> cached mapping of flash as only the mtd really knows about it and only
> uses it read.  Therefore the cachelines are always clean and don't get
> written back so it's not really a problem.

And this is _VERY_ fundamental.  That cached memory must _never_ be 
written to.  In fact, the memory protection could be set read-only as 
well for such mapping.  Hence it must never be written back.


Nicolas
