Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NV5L-0003v0-LC
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 11:01:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: manningc2@actrix.gen.nz
In-Reply-To: <20030604095450.A129B4375@blood.actrix.co.nz>
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	 <20030604095450.A129B4375@blood.actrix.co.nz>
Message-Id: <1054720928.17921.208.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Jun 2003 11:02:09 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-04 at 10:57, Charles Manning wrote:
> Is there any discussion leading up to XIP? ie. Why? ... and why not!

Why? Because your hardware designer didn't realise that RAM is cheaper
than flash, and gave you more flash than you need and not enough RAM.
Hence you want to run stuff uncompressed and use up all that nice
expensive flash space, while retaining your precious RAM.

Or, more charitably, perhaps you _really_ care about power consumption
and observe that flash takes less power than RAM.

Why not? Because it's mutually exclusive with compression and there are
interesting performance issues.

> It scares me that this adds a potentially huge interrupt latency. Some NOR 
> devices need a good 20usec or so to get into erase suspend state. There are 
> many situations (eg ARM FIQs) where this would not be a nice thing to do.  
> Thus, mixing XIP with say a file system which might cause erases at 
> (relatively) arbitrary times needs to be done with great caution. Men with 
> red flags needed up front.

True. In practice it doesn't suck anywhere near as much as I expected it
to. Mount an empty flash as JFFS2, causing the whole thing to be erased
and cleanmarkers to be written, while flood-pinging... observe IRQ
latency really isn't that bad.

If you're doing pseudo-DMA tricks with FIQ, then of course you are going
to have problems, but that's not really the common case.

> The fundamental implementation seems quite simple and elegant.IMHO.

Good. My main concern was that there would be some platform where we
can't actually poll for interrupts like this, and we have to redirect
the IRQ vectors to somewhere in RAM, etc. I suppose that can still be
hidden behind xip_cli(), xip_sti() and xip_irqpending() though.


-- 
dwmw2
